Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8CCE6748D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 11:10:20 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78203.1766401807863529743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 03:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IOS3Y0DF;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b2ea2b9631so385216485a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 03:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766401807; x=1767006607; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IXIWjFyqXI2UOcnUL3LbaXXRfbpzX1L6sX0wtabW73U=;
        b=IOS3Y0DFl7fEPkUIj9Ufm4l19TEnaL2gNKIAFr/saxqbJojvCE8vpbipb0+wWLJ4dt
         26OGMZPi8T57DOE4DXxq3Ql6URYL7fP9qCCiqXK62DFXq6FyenmrZSx/keRb797xTHED
         VjL8DPttuCA2pdkb2Q86SZmQE4f3ToouwQj++wIazCPS16+JfeafhiEyh5f0BBZg50ZZ
         AoPLqAHEbBXr5QoQF3lajXsdVMEtNLRcJYAN3LiETCSLJKezMvv9nxO1SK97b+zBQPh0
         jdESaSqBYs4IVPSXM+Gfzuzb1iU/KLjiW0Cg2AUqPd7Rr2nIu8AJEdKL3vuWOYk/AJnH
         O4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766401807; x=1767006607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXIWjFyqXI2UOcnUL3LbaXXRfbpzX1L6sX0wtabW73U=;
        b=dJ2mu3wn5/oa9q3kLMOmX0edYOaS4Di9iiENSC7lHLJZ7RhY/pORNEgjosL33irbZv
         3fZy+s9X3pZGI32Th8xjEpG3qA547DQBA+28HlxsIdvRAPGtq1oPTb0WnISDc0hJJysY
         tnwdeeibnVF2xPRJxhmu8VL6idRwCTcbUzcHH166Ft/M1WCBGpWCqhaUUCCpCSiQWRRv
         Mad6ePxnBrf/7uDRV6+CEZuTSSqxl6rDSvmco4rKRp++Er31okdfOJoVc7HzQxMevEN+
         64Rs26J7S3mOzcvmCnI8DeG/HN0GQ030drABRPDqHNAbh/p/KJ8Kd+D9avq3mOHAXFN3
         VwmQ==
X-Gm-Message-State: AOJu0YyK6CJ7PNR2DvLOYGfvDnJaRy3yY60A/L/1c7r9bXGJSrxbmq1s
	Hs/RwD5dz3d/WpogBADxme44wLqiCfyGADKsJM9JYrrIa8FvSK4xCumT8KJIbt3hOFBXLeAAbP0
	L8TwnJyjEXtUL1SKd7SjHEm/MDDdb0WdR1w==
X-Gm-Gg: AY/fxX7OXJGNA9CAxE0FwOWqPx2QU1DAN0LoNiOIgS6xZfuC/enzgGNs4nJy/aiPuQD
	w8AJMNcKZuSB5psKIm947dg/IhyeUdWYay21hkkgkX6PMJmpwRZybxCrrroXPFL8HH0gemSPb9r
	45zpHAh6hAyoI4UwMlnY8vVd8WxUyhuvgqj5LRLPUZjKEBsgIEz+5PlhW501F8vuHTKZCS71B8I
	8XnE+QnoGAo+zPKrpxx/Ez/mEUyI2RVgEAc+ufMTsRXlQF/c/TfFTl/6tzYHRpXFSRCW62rB7VM
	LGfNNovFpp33eB5l6FXAKNVtj3eo1QxS/M1Xy2G3
X-Google-Smtp-Source: AGHT+IFdWLqsNswM/dCf7H87sjDtf+jJQCAil2E/aoT+SFYGJIHbdSHVD0xIih3vnp75C+BUTvKzxWNVYWNGqnlY39M=
X-Received: by 2002:a05:620a:319e:b0:8b2:7754:f492 with SMTP id
 af79cd13be357-8c090020cb2mr1641294085a.81.1766401806726; Mon, 22 Dec 2025
 03:10:06 -0800 (PST)
MIME-Version: 1.0
References: <20251222091356.1093337-1-changqing.li@windriver.com>
In-Reply-To: <20251222091356.1093337-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Dec 2025 12:09:55 +0100
X-Gm-Features: AQt7F2p-P4kEJQjRr18fY3muHpPyjV8FVizJM-zN9AvTWQVC_0970A6EESxYGLo
Message-ID: <CANNYZj-BHgRk3yja0hr3AabwZXwB0biFXMQQ73mxua=yAufH1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu-system-native: disable libkeyutils
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 11:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228293

On Mon, 22 Dec 2025 at 10:14, Changqing Li via lists.openembedded.org
<changqing.li=windriver.com@lists.openembedded.org> wrote:
> -EXTRA_OECONF:append = " --target-list=${@get_qemu_system_target_list(d)}"
> +EXTRA_OECONF:append = " --target-list=${@get_qemu_system_target_list(d)} --disable-libkeyutils"
>
>  PACKAGECONFIG ??= "fdt alsa kvm pie slirp png pixman sdl \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \

It's better to add a PACKAGECONFIG for this. It will be disabled by
default then.

Alex

