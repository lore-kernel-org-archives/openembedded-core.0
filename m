Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93A7CD98E3
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 01:11:27 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.7026.1696986679236628930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 18:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=ZR14C7lA;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.98] (cpe-173-175-175-24.elp.res.rr.com [173.175.175.24])
	by linux.microsoft.com (Postfix) with ESMTPSA id 715D820B74C0;
	Tue, 10 Oct 2023 18:11:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 715D820B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1696986678;
	bh=yBl525h9wFf3OfTnPoAI5bnVjLrsYZj58mgF96EXiP8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ZR14C7lALVLDGOKB19bcuadN4H+iJ8wfyn/jlN791HYyHwB6fhRaXvXtg0PQHsvxu
	 fRUU+HZZQwXhLgix4yp2RauVVy/MRqIk5dVJAEjAuC4WZbEb5GF32Fn4eho1kdaLwM
	 UGieTVUING0GPUMc5bXtJ27ARwGgM9G8YIkqCsN0=
Content-Type: multipart/alternative;
 boundary="------------T1DKJZzUnjP9YLNWvhM4Vpfx"
Message-ID: <8f92775b-e01e-4505-9fba-252ddd1a8315@linux.microsoft.com>
Date: Tue, 10 Oct 2023 19:11:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] qemux86/qemuarm: Drop kernel version
 overrides
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20231006113641.3248432-1-richard.purdie@linuxfoundation.org>
 <20231006113641.3248432-2-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
In-Reply-To: <20231006113641.3248432-2-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 01:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188939

This is a multi-part message in MIME format.
--------------T1DKJZzUnjP9YLNWvhM4Vpfx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/23 05:36, Richard Purdie wrote:
> Drop the version overrides for the kernel for the x86 and arm machines
> so we can go back to following the distro versions. The reasons for
> these versions is mostly historical at this point as the issues were
> resolved.
>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
>   meta/conf/machine/include/x86/x86-base.inc | 1 -
>   meta/conf/machine/qemuarm.conf             | 4 ----
>   meta/conf/machine/qemuarmv5.conf           | 1 -
>   3 files changed, 6 deletions(-)
>
> diff --git a/meta/conf/machine/include/x86/x86-base.inc b/meta/conf/machine/include/x86/x86-base.inc
> index 050c20af70c..fc6c39148db 100644
> --- a/meta/conf/machine/include/x86/x86-base.inc
> +++ b/meta/conf/machine/include/x86/x86-base.inc
> @@ -18,7 +18,6 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
>   # kernel-related variables
>   #
>   PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
> -PREFERRED_VERSION_linux-yocto ??= "6.4%"
>   
>   #
>   # XSERVER subcomponents, used to build the XSERVER variable
> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
> index 04216cdc2e0..881733eb2da 100644
> --- a/meta/conf/machine/qemuarm.conf
> +++ b/meta/conf/machine/qemuarm.conf
> @@ -28,8 +28,4 @@ QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio
>   QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
>   QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1  -device virtconsole,chardev=virtcon"
>   
> -# 6.4 causes Xorg to fail to read the virtio framebuffer so stick with 6.1 until
> -# that is resolved.
> -PREFERRED_VERSION_linux-yocto ??= "6.1%"
> -
>   KMACHINE:qemuarm = "qemuarma15"
> diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
> index deb4869c0aa..f0a86f1e4c7 100644
> --- a/meta/conf/machine/qemuarmv5.conf
> +++ b/meta/conf/machine/qemuarmv5.conf
> @@ -16,5 +16,4 @@ QB_GRAPHICS = "-device virtio-gpu-pci"
>   QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
>   QB_DTB ="${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', 
> '4.7', '', 'zImage-versatile-pb.dtb', d)}"
>   

Removing this bit results in the above line causing an ExpansionError, since
PREFERRED_VERSION_linux-yocto isnt defined anywhere anymore (if not using poky.conf)

What would be the right approach to solve this issue?, Should QB_DTB be depending on such variable?

Cheers,
Alejandro


> -PREFERRED_VERSION_linux-yocto ??= "6.4%"
>   KMACHINE:qemuarmv5 = "arm-versatile-926ejs"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188762):https://lists.openembedded.org/g/openembedded-core/message/188762
> Mute This Topic:https://lists.openembedded.org/mt/101795562/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [alhe@linux.microsoft.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------T1DKJZzUnjP9YLNWvhM4Vpfx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/6/23 05:36, Richard Purdie wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:20231006113641.3248432-2-richard.purdie@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">Drop the version overrides for the kernel for the x86 and arm machines
so we can go back to following the distro versions. The reasons for
these versions is mostly historical at this point as the issues were
resolved.

Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
---
 meta/conf/machine/include/x86/x86-base.inc | 1 -
 meta/conf/machine/qemuarm.conf             | 4 ----
 meta/conf/machine/qemuarmv5.conf           | 1 -
 3 files changed, 6 deletions(-)

diff --git a/meta/conf/machine/include/x86/x86-base.inc b/meta/conf/machine/include/x86/x86-base.inc
index 050c20af70c..fc6c39148db 100644
--- a/meta/conf/machine/include/x86/x86-base.inc
+++ b/meta/conf/machine/include/x86/x86-base.inc
@@ -18,7 +18,6 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "6.4%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 04216cdc2e0..881733eb2da 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -28,8 +28,4 @@ QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
 QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,<a class="moz-txt-link-abbreviated" href="mailto:port=@PORT@,host=127.0.0.1">port=@PORT@,host=127.0.0.1</a> -device virtconsole,chardev=virtcon"
 
-# 6.4 causes Xorg to fail to read the virtio framebuffer so stick with 6.1 until
-# that is resolved.
-PREFERRED_VERSION_linux-yocto ??= "6.1%"
-
 KMACHINE:qemuarm = "qemuarma15"
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index deb4869c0aa..f0a86f1e4c7 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -16,5 +16,4 @@ QB_GRAPHICS = "-device virtio-gpu-pci"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
 QB_DTB = <a class="moz-txt-link-rfc2396E" href="mailto:${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto','4.7','','zImage-versatile-pb.dtb',d)}">"${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"</a>
 </pre>
    </blockquote>
    <pre>Removing this bit results in the above line causing an ExpansionError, since
PREFERRED_VERSION_linux-yocto isnt defined anywhere anymore (if not using poky.conf)

What would be the right approach to solve this issue?, Should QB_DTB be depending on such variable?

Cheers,
Alejandro
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:20231006113641.3248432-2-richard.purdie@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">
-PREFERRED_VERSION_linux-yocto ??= "6.4%"
 KMACHINE:qemuarmv5 = "arm-versatile-926ejs"
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#188762): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/188762">https://lists.openembedded.org/g/openembedded-core/message/188762</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/101795562/4354175">https://lists.openembedded.org/mt/101795562/4354175</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------T1DKJZzUnjP9YLNWvhM4Vpfx--

