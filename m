Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 622 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 17 Oct 2016 12:09:22 UTC
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id DE2D371A03
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 12:09:22 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161017115840842_0685
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 04:58:40 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=28573 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bw6Ys-0001C5-MJ for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2016 07:58:34 -0400
Date: Mon, 17 Oct 2016 07:57:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610170751190.7117@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: SERIAL_CONSOLE versus SERIAL_CONSOLES?
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
X-List-Received-Date: Mon, 17 Oct 2016 12:09:24 -0000
Content-Type: text/plain; charset=US-ASCII


  i am well aware that if one wants to define a single serial console,
then using the SERIAL_CONSOLE variable will work just fine, as in:

SERIAL_CONSOLE ?= "115200 ttyS0"

and if you want to define multiple possible consoles, use:

SERIAL_CONSOLES = "115200;ttyAMA0 115200;ttyAMA1"

  however, i just noticed in the default bitbake.conf:

SERIAL_CONSOLE ??= ""
SERIAL_CONSOLES ??= "${@d.getVar('SERIAL_CONSOLE', True).replace(' ', ';')}"

where SERIAL_CONSOLES is defined in terms of SERIAL_CONSOLE, which
suggests to me that, really, it's SERIAL_CONSOLES that will be used
for further configuration, is that right?

  for instance, i see in
meta/recipes-core/systemd/systemd-serialgetty.bb, the test:

  do_install() {
        if [ ! -z "${SERIAL_CONSOLES}" ] ; then
                default_baudrate=`echo "${SERIAL_CONSOLES}" | sed 's/\;.*//'

wherein, once upon a time, i would have thought, "hey, i'm not
assigning anything to SERIAL_CONSOLES so that doesn't apply to me."
when, of course, it *does* apply now that i read things properly.

  so is it a fair statement that, pedantically, i might as well just
define everything in terms of SERIAL_CONSOLES and think that way?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


