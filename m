Return-Path: <adrian.freihofer@neratec.com>
X-Greylist: delayed 414 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Nov 2014 07:43:41 UTC
Received: from mail.neratec.com (mail.neratec.com [46.140.151.2])
	by mail.openembedded.org (Postfix) with ESMTP id EE01265CC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 07:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.neratec.com (Postfix) with ESMTP id E12499A4484
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 08:36:46 +0100 (CET)
Received: from mail.neratec.com ([127.0.0.1])
	by localhost (mail.neratec.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Wd6YwyIRwNqM
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 08:36:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.neratec.com (Postfix) with ESMTP id 5E9309A4482
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 08:36:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at neratec.com
Received: from mail.neratec.com ([127.0.0.1])
	by localhost (mail.neratec.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fUgFKlMrKTCT
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 08:36:46 +0100 (CET)
Received: from chl500346.localnet (unknown [192.168.11.188])
	by mail.neratec.com (Postfix) with ESMTPS id 3B6DC9A447E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 08:36:46 +0100 (CET)
From: Adrian Freihofer <adrian.freihofer@neratec.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Nov 2014 22:57:02 +0100
Message-ID: <4426580.xeKXhTzLUy@chl500346>
Organization: Neratec Solutions AG
User-Agent: KMail/4.13.3 (Linux/3.13.0-39-generic; KDE/4.13.3; x86_64; ; )
In-Reply-To: <loom.20141107T110211-131@post.gmane.org>
References: <1415088547.4530.142.camel@intel.com>
	<9989828.c0GAiu1EUm@chl500346>
	<loom.20141107T110211-131@post.gmane.org>
MIME-Version: 1.0
Subject: Re: runqemu + dhcp server
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
X-List-Received-Date: Tue, 11 Nov 2014 07:43:47 -0000
Content-Type: multipart/alternative; boundary="nextPart1647375.PWZnvDbIpo"
Content-Transfer-Encoding: 7Bit

--nextPart1647375.PWZnvDbIpo
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 07 November 2014 10.12:02 Patrick Ohly wrote:
> Adrian Freihofer <adrian.freihofer@...> writes:
> > Personally I would prefer a slightly different implementation.
> > I consider the 192.168.7.2 network interface as development, debugging
> > and testing interface which should just work.
> 
> Agreed, and it doesn't work at the moment when the image has an Ethernet
> configuration mechanism that wasn't adapted to use the ip kernel parameter. 
> What you are proposing goes beyond just fixing that. I don't have any strong
> opinion about the right way forward.
> 
> > By the way, where does your solution make use of the DHCP server?
> 
> When Connman starts up, it finds eth0 and obtains an IP address for it via
> DHCP. Without the DHCP server, the guest ends up without an IP address. I
> have not checked if the ip parameter was ever used.
> 
> Note that this is what the default Tizen Connman config does, not what Poky
> would do when building and installing Connman. The whole point was the
> ability to use production images without special tweaks. 
> 
> > The 
> > eth0 IP configuration is assigned by kernel boot parameters in
> > runqemu-internal. If this configuration gets changed later on the NFS 
> > rootfs will break...
> 
> I haven't tried NFS rootfs. My hope is that it would still work because the
> ip parameter and the DHCP server assign the same IP address and thus nothing
> changes inside the guest when switching from one to the other.
> 
I see, the patch you are working on will provide just another option to get eth0 configured. This would definitely be an improvement.
Did you ever run the automated image tests? If I remember correctly the image tests are somehow related to the current implementation of the network configuration. At least the tests require a hostname starting with "qemu" and probably they run from NFS rootfs.
Would be nice, if you get the DHCP based network configuration fulfilling these requirements. An alternative approach is implemented in systemd networkd. I guess it does not touch interfaces which are already configured e.g. by kernel boot parameters. This could be done in connman as well. It would allow you to run the productive image in qemu.-- 

--------------------
Neratec Solutions AG
Postfach 83, CH-8608 Bubikon, Switzerland

adrian.freihofer@neratec.com
Direct: +41 55 253 2083
Office: +41 55 253 2000
www.neratec.com[1]

--------
[1] www.neratec.com

--nextPart1647375.PWZnvDbIpo
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="us-ascii"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html><head><meta name="qrichtext" content="1" /><style type="text/css">
p, li { white-space: pre-wrap; }
</style></head><body style=" font-family:'Ubuntu'; font-size:9pt; font-weight:400; font-style:normal;">
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">On Friday 07 November 2014 10.12:02 Patrick Ohly wrote:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Adrian Freihofer &lt;adrian.freihofer@...&gt; writes:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Personally I would prefer a slightly different implementation.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; I consider the 192.168.7.2 network interface as development, debugging</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; and testing interface which should just work.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Agreed, and it doesn't work at the moment when the image has an Ethernet</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; configuration mechanism that wasn't adapted to use the ip kernel parameter. </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; What you are proposing goes beyond just fixing that. I don't have any strong</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; opinion about the right way forward.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; By the way, where does your solution make use of the DHCP server?</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; When Connman starts up, it finds eth0 and obtains an IP address for it via</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; DHCP. Without the DHCP server, the guest ends up without an IP address. I</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; have not checked if the ip parameter was ever used.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Note that this is what the default Tizen Connman config does, not what Poky</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; would do when building and installing Connman. The whole point was the</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; ability to use production images without special tweaks. </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; The </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; eth0 IP configuration is assigned by kernel boot parameters in</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; runqemu-internal. If this configuration gets changed later on the NFS </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; rootfs will break...</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; I haven't tried NFS rootfs. My hope is that it would still work because the</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; ip parameter and the DHCP server assign the same IP address and thus nothing</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; changes inside the guest when switching from one to the other.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">I see, the patch you are working on will provide just another option to get eth0 configured. This would definitely be an improvement.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Did you ever run the automated image tests? If I remember correctly the image tests are somehow related to the current implementation of the network configuration. At least the tests require a hostname starting with &quot;qemu&quot; and probably they run from NFS rootfs.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Would be nice, if you get the DHCP based network configuration fulfilling these requirements. An alternative approach is implemented in systemd networkd. I guess it does not touch interfaces which are already configured e.g. by kernel boot parameters. This could be done in connman as well. It would allow you to run the productive image in qemu.<br />-- </p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<hr />
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Neratec Solutions AG</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Postfach 83, CH-8608 Bubikon, Switzerland</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">adrian.freihofer@neratec.com</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Direct: +41 55 253 2083</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Office: +41 55 253 2000</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><a href="www.neratec.com"><span style=" text-decoration: underline; color:#0057ae;">www.neratec.com</span></a></p></body></html>

--nextPart1647375.PWZnvDbIpo--
