Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC926E65F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 13:57:09 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20160408135709637_0484
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Apr 2016 13:57:09 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=37416 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1aoWvh-0003qq-2Y for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2016 09:58:33 -0400
Date: Fri, 8 Apr 2016 09:57:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1604080942280.11776@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: does a normal OE kernel build negate the ability to generate a local version string?
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
X-List-Received-Date: Fri, 08 Apr 2016 13:57:11 -0000
Content-Type: text/plain; charset=US-ASCII


  i was just playing with wind river linux 8 and trying to figure out
why i couldn't generate a local version string that contained the git
commit ID, so i zipped over to oe-core to see how it was done there,
and it seems to be the same way, so can someone clarify that my
understanding here is correct?

  normally, if i want to add the git commit ID ("-gxxxxxxxx") to the
kernel version string so it's available via "uname", i'm used to
selecting the kernel config option CONFIG_LOCALVERSION_AUTO, which
uses:

 $ git rev-parse --verify HEAD

to extract the first 8 characters of the commit ID. so i selected that
option, but wasn't getting that string.

  poking around further, i saw this in scripts/setlocalversion:

scm_version()
{
        local short
        short=false

        cd "$srctree"
        if test -e .scmversion; then
                cat .scmversion
                return
        fi
        ... snip ...

so if the file ".scmversion" exists, its contents are used instead.
now *i* never set that file, but lo and behold, in the kernel source
tree, there it was, empty, which explains why i wasn't getting any
local version string.

  and where did that empty .scmversion file come from? i see this in
kernel.bbclass:

kernel_do_configure() {
        # fixes extra + in /lib/modules/2.6.37+
        # $ scripts/setlocalversion . => +
        # $ make kernelversion => 2.6.37
        # $ make kernelrelease => 2.6.37+
        touch ${B}/.scmversion ${S}/.scmversion    <---- there
        ... snip ...

which clearly appears to touch that empty file. is that deliberate? is
this an explicit decision by this bbclass file to prevent people from
generating that local version string? am i reading all this correctly?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


