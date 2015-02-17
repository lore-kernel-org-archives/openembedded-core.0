Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1AED4606E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 16:24:20 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id y19so36768621wgg.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 08:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:reply-to:cc:subject:date:message-id:organization:user-agent
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=ewPUntwfrj/Eqn7uPpttlCVkAeZN6gccM0UGIf3RbwU=;
	b=vcrr83iP7jf8Tp2zQ/95rMUdTPr/gjPakSypEdnrNd+WZwLV4JBwYDhYcAEwZfwv6f
	yp2JF+Wn08arSxFhERywXgCsj4QKDPzQ3S+J9GWU3V10Fq/iIlExoudMgV+Uy/ALrl+i
	zv/zMDXr+B0ktJndN7LhSGapZeu2/QdIwjwKNKXg+crpfXGqyhJIj6QFMm9Cntkwz7Ay
	ifc3sT5anYlxgDRMRWopEyv+DFKlXwF8CI7f6OjtR1WzqWpm+Lv7Nb8oxUo9EzAOqYpG
	q5499GemVBRwLx5yGTxhg0fDLn/ESTbcAq9d/KehM84qAKg6HOlsoHTlRNIk9VsdhyiG
	JHig==
X-Received: by 10.180.99.137 with SMTP id eq9mr58563410wib.34.1424190258511;
	Tue, 17 Feb 2015 08:24:18 -0800 (PST)
Received: from chl500346.localnet (mail.neratec.com. [46.140.151.2])
	by mx.google.com with ESMTPSA id r3sm23808309wjw.7.2015.02.17.08.24.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Feb 2015 08:24:17 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Tue, 17 Feb 2015 17:24:16 +0100
Message-ID: <2671198.a3zQcKXCEa@chl500346>
Organization: Privat
User-Agent: KMail/4.13.3 (Linux/3.13.0-45-generic; KDE/4.13.3; x86_64; ; )
In-Reply-To: <1424169254.549.9.camel@intel.com>
References: <1415088547.4530.142.camel@intel.com>
	<4426580.xeKXhTzLUy@chl500346> <1424169254.549.9.camel@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: runqemu + dhcp server
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: adrian.freihofer@gmail.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Feb 2015 16:24:22 -0000
Content-Type: multipart/alternative; boundary="nextPart6223347.KiHr3jiybd"
Content-Transfer-Encoding: 7Bit

--nextPart6223347.KiHr3jiybd
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 17 February 2015 11.34:14 you wrote:
> On Mon, 2014-11-10 at 22:57 +0100, Adrian Freihofer wrote:
> > > I haven't tried NFS rootfs. My hope is that it would still work because the
> > > ip parameter and the DHCP server assign the same IP address and thus nothing
> > > changes inside the guest when switching from one to the other.
> > > 
> > 
> > I see, the patch you are working on will provide just another option
> > to get eth0 configured. This would definitely be an improvement.
> 
> I had to put this aside for a while, but I'm still interested in getting
> this merged.
> 
> > Did you ever run the automated image tests? If I remember correctly
> > the image tests are somehow related to the current implementation of
> > the network configuration. At least the tests require a hostname
> > starting with "qemu" and probably they run from NFS rootfs.
> 
> Where do I find more information about these tests, in particular how to
> run them?
On 2014-05-29 I got the following hint from Saul Wold:
"You can try the sanity testing locally by setting IMAGETEST in local.conf (please look at local.conf for details)."
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=6356)[1]
> 
> http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#testing-packages-with-ptest describes how to add tests to an image, but leaves it open how one invokes ptest-runner. What you describe sounds like a mechanism built on top of that which automatically boots up a machine and captures the output of ptest-runner.
> 
> > Would be nice, if you get the DHCP based network configuration
> > fulfilling these requirements. An alternative approach is implemented
> > in systemd networkd. I guess it does not touch interfaces which are
> > already configured e.g. by kernel boot parameters. This could be done
> > in connman as well. It would allow you to run the productive image in
> > qemu.
> 
> There might be also other improvements. For example, I just booted a
> core-image-minimal with systemd as init with runqemu. eth0 is
> configured, but /etc/resolv.conf is missing, so ptests like the one for
> wget fail because www.google.com cannot be resolved.
> 
> This was without the DHCP server patches. My expectation is that
> bringing up eth0 with DHCP-supplied information about DNS servers would
> have created (or could be made to create) resolv.conf.
> 
> 


--------
[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=6356

--nextPart6223347.KiHr3jiybd
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="us-ascii"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html><head><meta name="qrichtext" content="1" /><style type="text/css">
p, li { white-space: pre-wrap; }
</style></head><body style=" font-family:'Ubuntu'; font-size:9pt; font-weight:400; font-style:normal;">
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">On Tuesday 17 February 2015 11.34:14 you wrote:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; On Mon, 2014-11-10 at 22:57 +0100, Adrian Freihofer wrote:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; &gt; I haven't tried NFS rootfs. My hope is that it would still work because the</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; &gt; ip parameter and the DHCP server assign the same IP address and thus nothing</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; &gt; changes inside the guest when switching from one to the other.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; &gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; I see, the patch you are working on will provide just another option</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; to get eth0 configured. This would definitely be an improvement.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; I had to put this aside for a while, but I'm still interested in getting</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; this merged.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Did you ever run the automated image tests? If I remember correctly</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; the image tests are somehow related to the current implementation of</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; the network configuration. At least the tests require a hostname</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; starting with &quot;qemu&quot; and probably they run from NFS rootfs.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Where do I find more information about these tests, in particular how to</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; run them?</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">On 2014-05-29 I got the following hint from Saul Wold:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><a name="comment_text_2"></a><span style=" font-family:'monospace'; font-size:small; color:#000000; background-color:#ffffff;">&quot;Y</span><span style=" font-family:'monospace'; font-size:small; color:#000000; background-color:#ffffff;">ou can try the sanity testing locally by setting IMAGETEST in local.conf (please look at local.conf for details).&quot;</span></p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><span style=" font-family:'monospace'; font-size:small; color:#000000; background-color:#ffffff;">(</span><a href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=6356"><span style=" font-family:'monospace'; font-size:small; text-decoration: underline; color:#0057ae; background-color:#ffffff;">https://bugzilla.yoctoproject.org/show_bug.cgi?id=6356)</span></a></p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#testing-packages-with-ptest describes how to add tests to an image, but leaves it open how one invokes ptest-runner. What you describe sounds like a mechanism built on top of that which automatically boots up a machine and captures the output of ptest-runner.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Would be nice, if you get the DHCP based network configuration</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; fulfilling these requirements. An alternative approach is implemented</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; in systemd networkd. I guess it does not touch interfaces which are</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; already configured e.g. by kernel boot parameters. This could be done</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; in connman as well. It would allow you to run the productive image in</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; qemu.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; There might be also other improvements. For example, I just booted a</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; core-image-minimal with systemd as init with runqemu. eth0 is</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; configured, but /etc/resolv.conf is missing, so ptests like the one for</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; wget fail because www.google.com cannot be resolved.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; This was without the DHCP server patches. My expectation is that</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; bringing up eth0 with DHCP-supplied information about DNS servers would</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; have created (or could be made to create) resolv.conf.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p></body></html>

--nextPart6223347.KiHr3jiybd--
