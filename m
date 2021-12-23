Return-Path: <jupiter.hce@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A09C433FE
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 10:29:32 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web08.31030.1640255371679447359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 02:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JyBkbv/b;
 spf=pass (domain: gmail.com, ip: 209.85.221.170,
 mailfrom: jupiter.hce@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id b77so2938560vka.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 02:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=MgkmWlINq6SZ6FIG+lENBKk+MMEI8PdC0Rc6dfgEe7Y=;
        b=JyBkbv/bOwQcvK4/jeIKuNy/8+81hfHeauJb4APyT5b5v5tXMcYYaSgVlj/p5CzHjN
         Yr5wiBcG4+Jbp12XR6Eypmk1Ex1Zjto1XEfrCFUoJgC+EeNI1WNXCc9WSgEmGYft2AMA
         1vQ2NX/5wsrNj36yxLF1u0M+hwrWsvY4GwFLif9dGakuVrimoJIdjTfBQeXYhy9NEBTQ
         aCxvm27Da+AVcxMoucGTU37dwsFfV76e6KwpOQZ4ccQwJoSXBH8j/nOIpE5nSULtxROX
         OC0wJFHWX0/WcijeZA51IZ+BPMG3RCvbCVzJkXf9aKsHZ3q32xHeNG2GinyWSrGphyov
         frXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=MgkmWlINq6SZ6FIG+lENBKk+MMEI8PdC0Rc6dfgEe7Y=;
        b=PovU09jaZVTaU4g5U6KhEWsS7pG//0xHfO5DpLyQJlPD5+flU37hV2OsNc4PxJmXkK
         VMBLzlTadzwyL4Gm3SPhj5NC1sK884sAtFenUfiEewqAZ2V+FFNIrNjszAHrPEtOpnj8
         3a8AwVBlXHgZZ2YWvQT1toKtyxDVo/Jl9+F06LsT0iuEqxuEXtThOHhJvRSNvURzVX3i
         FZ/UZ3iXaxXo0iNrmMz+rEMPmHBs50GZdOm5IPoSB3lYiEFiCZbel5e99QwsUJ3R1wqo
         NAjNOcwLhVpToLSL1TOZhjHaAwx8V/BPJrmojwyrEkNGPqveDFuK8ahc6/yHXct4E0k5
         ig0g==
X-Gm-Message-State: AOAM531ss4dLduOGM6Cy5ihXV1zekU5LJH75TXunVg0rANs01Af+m5Dt
	+s+a1MluLxXeu7R1ksS3B8TCkGQC5hr+lCNPLMgN3iWe
X-Google-Smtp-Source: 
 ABdhPJwxkI296UtwANBdwj18OKzRxZ8RIjpfY3BCWNQE0y9QDruZf8AOswYQSjnE7r7etHebykJGUWEc72Ru8aZ8IWE=
X-Received: by 2002:a05:6122:218b:: with SMTP id
 j11mr476144vkd.11.1640255370786;
 Thu, 23 Dec 2021 02:29:30 -0800 (PST)
MIME-Version: 1.0
From: Jupiter <jupiter.hce@gmail.com>
Date: Thu, 23 Dec 2021 21:28:55 +1100
Message-ID: 
 <CAA=hcWSFfUY8rh4WCvqNmbDPOO2=BMH5CUA9ZkEXuKit+3LK6Q@mail.gmail.com>
Subject: Where to define udev to load kernel modules in boot?
To: yocto <yocto@lists.yoctoproject.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 10:29:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159973

Hi,

I built an OE/Yocto IoT device to include kernel modules of usb_wwan,
usbserial, mwifiex_sdio, mwifiex etc, there is one udev from
meta-freescale/recipes-core/udev/udev-rules-imx/10-imx.rules

# ls /etc/udev/rules.d
10-imx.rules       touchscreen.rules

My device does not have a touchscreen so that touchscreen.rules should
not be there. The 10-imx.rules does not define any kernel modules
usb_wwan, usbserial, mwifiex_sdio, mwifiex, the device does not have
video or any input

# cat /etc/udev/rules.d/10-imx.rules
KERNEL=="mc13783_connectiv*",  NAME="mc13783_connectivity"
# Anyone has readonly permission to IIM device file
KERNEL=="mxc_iim",  MODE="0444", SYMLINK+="mxc_mem"
KERNEL=="mxs_viim", MODE="0444", SYMLINK+="mxc_mem"
KERNEL=="mxc_ipu",  MODE="0666"
KERNEL=="mxc_vpu",  MODE="0666"
SUBSYSTEM=="video", MODE="0660"
KERNEL=="fb[0-9]",  MODE="0660", GROUP="video"
KERNEL=="gsl_kmod", MODE="0660", GROUP="video"
KERNEL=="galcore",  MODE="0660", GROUP="video"

How can I define udev in recipes to make the system to load kernel
modules of usb_wwan, usbserial, mwifiex_sdio, mwifiex in boot?

Thank you.

Kind regards,

- jh

