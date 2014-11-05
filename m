Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id AB4C165D4F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 10:30:01 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id h11so11937462wiw.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Nov 2014 02:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:reply-to:subject:date:message-id:organization:user-agent
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=KHncFovuV7sXzfBR2/E8ZmhamJYtOerCMrr1UFQ825Y=;
	b=1EYzKv/CZmTZLoRRDa3bgp5yXUS1NZpWkJ5pGftUU5lLuzu03KjKv0oouN7aRjczQz
	etj7v3NPrx+9GTKSMGIlwpWB+/8tFK95J+TZsa0LS4K/FyIKAO/b8cyRMvjxdvmRGQ/V
	R3Z40FIuYGzZ8mL8PTlLVbSG54RBPDigtJT5Ro8DCc251gp02qr8wphtDpq2y5RaYZwl
	SqNSlgVzGU+0Z0XZoquSPoMiP3tXt/AOtIG/XPUL2M8dzdcfyr9pM6eb438uyuXUGz6I
	piwL85TIM1qVgRlhIJxMXaNsETflLg4lAAvq2q6W4EXVZHv61r8kazTma2AZQWFXigIQ
	DCZg==
X-Received: by 10.194.206.36 with SMTP id ll4mr64084019wjc.21.1415183401415;
	Wed, 05 Nov 2014 02:30:01 -0800 (PST)
Received: from chl500346.localnet (mail.neratec.com. [46.140.151.2])
	by mx.google.com with ESMTPSA id gy4sm4064072wib.11.2014.11.05.02.30.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Nov 2014 02:30:00 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 05 Nov 2014 11:29:58 +0100
Message-ID: <9989828.c0GAiu1EUm@chl500346>
Organization: Privat
User-Agent: KMail/4.13.3 (Linux/3.13.0-39-generic; KDE/4.13.3; x86_64; ; )
In-Reply-To: <1415088547.4530.142.camel@intel.com>
References: <1415088547.4530.142.camel@intel.com>
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 05 Nov 2014 10:30:06 -0000
Content-Type: multipart/alternative; boundary="nextPart10909774.VhpLcFbfaS"
Content-Transfer-Encoding: 7Bit

--nextPart10909774.VhpLcFbfaS
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello Patrick

Personally I would prefer a slightly different implementation. I consider the 192.168.7.2 network interface as development, debugging and testing interface which should just work. This interface has to be ignored by NetworkManager / connman and so on otherwise things like NFS rootfs or image tests break. But I agree that the current poky implementation does not fit well for people who develop other connectivity solutions e.g. a network interfaces configured by DHCP. Things can become quite difficult if eth0 is used as 192.168.7.2 development interface in qemu but gets a DHCP based IP configuration on the productive image.
To address this I started to run qemu with more than one emulated network interface. (Some time ago I posted a patch which fixes two blockers to start qemu with more than one emulated NIC: YOCTO #6356.[1])
Note: On the target device there are some simple udev rules which assign reasonable names to the different network interfaces. This simplifies many use cases a lot. The applied network configuration just depends on the available interfaces which is what connman and latest NetworkManager support perfectly. The 192.168.7.2 interface configuration assigned by the kernel gets never touched.
On the development host I use a project specific implementation for the runqemu-gen-tapdevs script. It does not only create the tap devices as the original does. It creates different virtual networks which are connected to the additional interfaces emulated by qemu. On one of these networks there is a dhcp server running. The dhcp server is managed by the runqemu-gen-tapdevs script. On the long term we could have different implementations of the runqemu-gen-tapdevs script. For example one which creates two tap devices per qemu instance. One tap device is used for the 192.168.7.x network and the other tap device is part of a bridge where a dhcp server runs on and IP forwarding allows to connect to the Internet.
With current poky implementation this is not really possible. Virtual devices are always connected to the Internet. The default route is set to 192.168.7.1 and IP forwarding on the host is configured for emulated interfaces automagically. I assume this is what most people need and it should remain the default behavior of course. But it would be nice to have an option to start qemu with host connectivity only. Meaning IP forwarding is not started for 192.168.7.x networks and the default route is not assigned via kernel boot parameter.
By the way, where does your solution make use of the DHCP server? The eth0 IP configuration is assigned by kernel boot parameters in runqemu-internal. If this configuration gets changed later on the NFS rootfs will break...

Sorry for the long mail. Here is a summary of my proposal:
- Add patch _YOCTO #6356._
- Change runqemu scripts to provide a host-only connectivity option (Basically just skip some lines of code in runqemu-ifup)
- Provide a runqemu-gen-tapdevs variant which creates two tap devs per quemu instance (connect all qemu instances via bridge?)
- Start the DHCP server by runqemu-gen-tapdevs (on tap devs or on a bridge)
- If bridged: Enable IP forwarding for the bridge
- run qemu like: runqemu ... qemuparams="-net nic,model=virtio... -net tap, ..." to emulate two NICs

I would like to publish the generic parts of my solution when ready. 

Regards,
Adrian


On Tuesday 04 November 2014 09.09:07 Patrick Ohly wrote:
> Hello!
> 
> Recently I built a custom image which depended on a DHCP server to
> configure Ethernet. runqemu with tap for networking doesn't provide one
> at the moment, so ssh logins did not work.
> 
> Instead of customizing images for runqemu, I think it would be better to
> adapt runqemu and uses images as on the target device. Attached two
> patches which work for me. Is that of interest for inclusion upstream?
> 
> I suppose more work is needed, in particular around how to enable or
> disable this feature. Patching the .bb files also leads to a (to me)
> strange QA error. See the comments in the patches for details.
> 
> 



--------------------
Adrian Freihofer
Gschwaderweg 29
8610 Uster
043 497 84 01

--------
[1] http://patchwork.openembedded.org/patch/74397/

--nextPart10909774.VhpLcFbfaS
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="us-ascii"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html><head><meta name="qrichtext" content="1" /><style type="text/css">
p, li { white-space: pre-wrap; }
</style></head><body style=" font-family:'Ubuntu'; font-size:9pt; font-weight:400; font-style:normal;">
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Hello Patrick</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Personally I would prefer a slightly different implementation. I consider the 192.168.7.2 network interface as development, debugging and testing interface which should just work. This interface has to be ignored by NetworkManager / connman and so on otherwise things like NFS rootfs or image tests break. But I agree that the current poky implementation does not fit well for people who develop other connectivity solutions e.g. a network interfaces configured by DHCP. Things can become quite difficult if eth0 is used as 192.168.7.2 development interface in qemu but gets a DHCP based IP configuration on the productive image.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">To address this I started to run qemu with more than one emulated network interface. (Some time ago I posted a patch which fixes two blockers to start qemu with more than one emulated NIC: <a href="http://patchwork.openembedded.org/patch/74397/"><span style=" text-decoration: underline; color:#0057ae;">YOCTO #6356.</span></a>)</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Note: On the target device there are some simple udev rules which assign reasonable names to the different network interfaces. This simplifies many use cases a lot. The applied network configuration just depends on the available interfaces which is what connman and latest NetworkManager support perfectly. The 192.168.7.2 interface configuration assigned by the kernel gets never touched.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">On the development host I use a project specific implementation for the runqemu-gen-tapdevs script. It does not only create the tap devices as the original does. It creates different virtual networks which are connected to the additional interfaces emulated by qemu. On one of these networks there is a dhcp server running. The dhcp server is managed by the runqemu-gen-tapdevs script. On the long term we could have different implementations of the runqemu-gen-tapdevs script. For example one which creates two tap devices per qemu instance. One tap device is used for the 192.168.7.x network and the other tap device is part of a bridge where a dhcp server runs on and IP forwarding allows to connect to the Internet.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">With current poky implementation this is not really possible. Virtual devices are always connected to the Internet. The default route is set to 192.168.7.1 and IP forwarding on the host is configured for emulated interfaces automagically. I assume this is what most people need and it should remain the default behavior of course. But it would be nice to have an option to start qemu with host connectivity only. Meaning IP forwarding is not started for 192.168.7.x networks and the default route is not assigned via kernel boot parameter.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">By the way, where does your solution make use of the DHCP server? The eth0 IP configuration is assigned by kernel boot parameters in runqemu-internal. If this configuration gets changed later on the NFS rootfs will break...</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Sorry for the long mail. Here is a summary of my proposal:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">- Add patch <a href="http://patchwork.openembedded.org/patch/74397/"><span style=" text-decoration: underline; color:#0057ae;">YOCTO #6356.</span></a></p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">- Change runqemu scripts to provide a host-only connectivity option (Basically just skip some lines of code in runqemu-ifup)</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">- Provide a runqemu-gen-tapdevs variant which creates two tap devs per quemu instance (connect all qemu instances via bridge?)</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">- Start the DHCP server by runqemu-gen-tapdevs (on tap devs or on a bridge)</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">- If bridged: Enable IP forwarding for the bridge</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">- run qemu like: runqemu ... qemuparams=&quot;-net nic,model=virtio... -net tap, ...&quot; to emulate two NICs</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">I would like to publish the generic parts of my solution when ready. </p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Regards,</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Adrian</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">On Tuesday 04 November 2014 09.09:07 Patrick Ohly wrote:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Hello!</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Recently I built a custom image which depended on a DHCP server to</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; configure Ethernet. runqemu with tap for networking doesn't provide one</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; at the moment, so ssh logins did not work.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Instead of customizing images for runqemu, I think it would be better to</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; adapt runqemu and uses images as on the target device. Attached two</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; patches which work for me. Is that of interest for inclusion upstream?</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; I suppose more work is needed, in particular around how to enable or</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; disable this feature. Patching the .bb files also leads to a (to me)</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; strange QA error. See the comments in the patches for details.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br />-- </p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<hr />
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Adrian Freihofer</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Gschwaderweg 29</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">8610 Uster</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">043 497 84 01</p></body></html>

--nextPart10909774.VhpLcFbfaS--
