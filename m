Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 027DD772D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 17:57:56 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161219175748935_0685;
	Mon, 19 Dec 2016 09:57:48 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=45500 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cJ2By-0002Iw-Bj; Mon, 19 Dec 2016 12:57:42 -0500
Date: Mon, 19 Dec 2016 12:56:20 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <CABcZAN=X+O23y=utG3iBvsdPNo1g9qM7H2JAT1PUpt-R=AYCBg@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1612191246350.4848@localhost.localdomain>
References: <alpine.LFD.2.20.1612190527590.8267@localhost.localdomain>
	<CABcZANnv7=zxZ7MNT4kDPKxScTYkJa44qAxt5Lvfc-L4=-Kb0A@mail.gmail.com>
	<CABcZAN=X+O23y=utG3iBvsdPNo1g9qM7H2JAT1PUpt-R=AYCBg@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: a few questions about "COMPATIBLE_MACHINE" variable
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
X-List-Received-Date: Mon, 19 Dec 2016 17:57:57 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-1808913449-1482170182=:4848"

--8323328-1808913449-1482170182=:4848
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


On Mon, 19 Dec 2016, Christopher Larson wrote:

> On Mon, Dec 19, 2016 at 8:17 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>         as a starting point, COMPATIBLE_MACHINE is processed on a
>       per-recipe basis, and if it has no value, then there is no
>       machine restriction being applied to that recipe, correct?
>       that's based on this snippet from base.bbclass:
>
>         need_machine = d.getVar('COMPATIBLE_MACHINE')
>         if need_machine:
>             import re
>             compat_machines = (d.getVar('MACHINEOVERRIDES') or "").split(":")
>             for m in compat_machines:
>                 if re.match(need_machine, m):
>                     break
>             else:
>                 raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" %
>       d.getVar('MACHINE'))
>
>       so far, so good?
>
>         next, the documentation describes the value of that variable
>       as a regular expression, so the values are processed as RE
>       patterns, but some of the actual uses are confusing. from
>       poky/meta/recipes-kernel/linux:
>
>       $ grep -r COMPATIBLE_MACHINE *
>       linux-dummy.bb:#COMPATIBLE_MACHINE = "your_machine"
>       linux-yocto_4.1.bb:COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>       linux-yocto_4.4.bb:COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>       linux-yocto_4.8.bb:COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>       linux-yocto-dev.bb:COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64)"
>       linux-yocto-rt_4.1.bb:COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
>       linux-yocto-rt_4.4.bb:COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
>       linux-yocto-rt_4.8.bb:COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
>       linux-yocto-tiny_4.1.bb:COMPATIBLE_MACHINE = "(qemux86$)"
>       linux-yocto-tiny_4.4.bb:COMPATIBLE_MACHINE = "(qemux86$)"
>       linux-yocto-tiny_4.8.bb:COMPATIBLE_MACHINE = "(qemux86$)"
>       $
>
>         first, what is best practice -- to use parentheses or not?
>       i'm assuming it makes no difference, but it does seem
>       inconsistent and could cause some confusion.
>
> They’re not needed in a case like this. 

i suspected as much. still, would consistency dictate using
parentheses or not? just a style thing.

>       next, if the possibilities in a list are REs, what is the
>       point of explicitly listing, say, "qemuarm|qemuarm64"? would
>       not the RE "qemuarm" subsume the more explicit "qemuarm64"?
>       same for the other architectures. (one could suggest that that
>       entire line could be shortened to "... = (^qemu)".)
>
> Just qemu would potentially match future qemu machines which aren’t
> actually supported, so I don’t think that would be appropriate. It’d
> match too much.

  i realized that, i was just being technical. :-) in any event, as it
is, it would *still* match too much, anything starting with
"qemuarm", for example.

>         the above seems pretty clear since the following lines would appear
>       to say that *only* the qemux86 is compatible:
>
>         linux-yocto-tiny_4.1.bb:COMPATIBLE_MACHINE = "(qemux86$)"
>         linux-yocto-tiny_4.4.bb:COMPATIBLE_MACHINE = "(qemux86$)"
>         linux-yocto-tiny_4.8.bb:COMPATIBLE_MACHINE = "(qemux86$)"
>
>       which suggests the following passage from the YP kernel dev manual is
>       a bit misleading:
>
>         "You must change it to match a list of the machines that your new
>         recipe supports. For example, to support the qemux86 and qemux86-64
>         machines, use the following form:
>
>              COMPATIBLE_MACHINE = "qemux86|qemux86-64"
>
>       and if all this is true, then if you're introducing a new machine, to
>       be magnificently pedantic, one should not use:
>
>         COMPATIBLE_MACHINE_machinename = "machinename"
>
>       but
>
>         COMPATIBLE_MACHINE_machinename = "^machinename$"
>
>       just to play it safe. am i reading all this correctly?
>
>
> Yes, that’s correct, though we need the trailing $ but not the
> leading ^, as it’s using re.match, not re.search — meaning it only
> matches at the beginning of the string, it doesn’t search the string
> to find a match.

  ah, quite right, i had forgotten that. again, in any event, both the
code and documentation could probably be tweaked to make all of this
more obvious.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-1808913449-1482170182=:4848--
