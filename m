Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 6B30077269
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 15:18:29 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161219151829132_0685
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 07:18:29 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=29719 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cIzhn-0003H1-6Y for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2016 10:18:23 -0500
Date: Mon, 19 Dec 2016 10:17:01 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1612190527590.8267@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: a few questions about "COMPATIBLE_MACHINE" variable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Dec 2016 15:18:30 -0000
Content-Type: text/plain; charset=US-ASCII


  as a starting point, COMPATIBLE_MACHINE is processed on a per-recipe
basis, and if it has no value, then there is no machine restriction
being applied to that recipe, correct? that's based on this snippet
from base.bbclass:

  need_machine = d.getVar('COMPATIBLE_MACHINE')
  if need_machine:
      import re
      compat_machines = (d.getVar('MACHINEOVERRIDES') or "").split(":")
      for m in compat_machines:
          if re.match(need_machine, m):
              break
      else:
          raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE'))

so far, so good?

  next, the documentation describes the value of that variable as a
regular expression, so the values are processed as RE patterns, but
some of the actual uses are confusing. from
poky/meta/recipes-kernel/linux:

$ grep -r COMPATIBLE_MACHINE *
linux-dummy.bb:#COMPATIBLE_MACHINE = "your_machine"
linux-yocto_4.1.bb:COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
linux-yocto_4.4.bb:COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
linux-yocto_4.8.bb:COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
linux-yocto-dev.bb:COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64)"
linux-yocto-rt_4.1.bb:COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
linux-yocto-rt_4.4.bb:COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
linux-yocto-rt_4.8.bb:COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
linux-yocto-tiny_4.1.bb:COMPATIBLE_MACHINE = "(qemux86$)"
linux-yocto-tiny_4.4.bb:COMPATIBLE_MACHINE = "(qemux86$)"
linux-yocto-tiny_4.8.bb:COMPATIBLE_MACHINE = "(qemux86$)"
$

  first, what is best practice -- to use parentheses or not? i'm
assuming it makes no difference, but it does seem inconsistent and
could cause some confusion.

  next, if the possibilities in a list are REs, what is the point of
explicitly listing, say, "qemuarm|qemuarm64"? would not the RE
"qemuarm" subsume the more explicit "qemuarm64"? same for the other
architectures. (one could suggest that that entire line could be
shortened to "... = (^qemu)".)

  the above seems pretty clear since the following lines would appear
to say that *only* the qemux86 is compatible:

  linux-yocto-tiny_4.1.bb:COMPATIBLE_MACHINE = "(qemux86$)"
  linux-yocto-tiny_4.4.bb:COMPATIBLE_MACHINE = "(qemux86$)"
  linux-yocto-tiny_4.8.bb:COMPATIBLE_MACHINE = "(qemux86$)"

which suggests the following passage from the YP kernel dev manual is
a bit misleading:

  "You must change it to match a list of the machines that your new
  recipe supports. For example, to support the qemux86 and qemux86-64
  machines, use the following form:

       COMPATIBLE_MACHINE = "qemux86|qemux86-64"

and if all this is true, then if you're introducing a new machine, to
be magnificently pedantic, one should not use:

  COMPATIBLE_MACHINE_machinename = "machinename"

but

  COMPATIBLE_MACHINE_machinename = "^machinename$"

just to play it safe. am i reading all this correctly?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


