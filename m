Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BF8D5B864
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 18:28:09 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1576.1765823288891945875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 10:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FkGUdmKt;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88a2b99d8c5so16474156d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765823288; x=1766428088; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vRnaab2KVo9Bp7nFLoCPSWthg7QdVxNVYF6dJS7PNMk=;
        b=FkGUdmKtnn5JGEOLjuuGSayLYBg49icQVFE1Lz5Ui2VE0hHH6TbNrQPQIu/F5OpSgB
         tLScJJSzOB9ORqJ0aBOluN9AyJf/2M1/i1C3Ru7cxeQ97D5FeEyes6IuLy4aiU1CRlU5
         ImLI4MOZ+yO1aB1oitmwtMyvWGJevdhmP4VIYJogTdY5aCi9y9nRO8EYT6FieL4odIo9
         IoM7TJnldkBJP6rw3Tty+1/Cc0CwbSpjSEVzV0cXS3Fby+Pa3jzxs7UBQ3v0odjnsMBL
         ZNzPLVK1joRsu0lm4K42IUn0EgxHiEcsp6VgBOLoYdA7acshhAxAo+yCPqY5hq2lwPyI
         0i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765823288; x=1766428088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRnaab2KVo9Bp7nFLoCPSWthg7QdVxNVYF6dJS7PNMk=;
        b=d/n7WWJepmWdnm9X+8NW45dX+eTSuBmQXwIpw+TVglh6yXZ3EKMToqRyr6jKzMQMLM
         AoG23MWpCLyy96ZkAPWBSvnTGv7GVDtNZL/fRTAqRkydgoYgv8mac3FGSY71AF9KyoDF
         EldSec8mmUdJcGfHvuEHVuJiHgIQAaXqtLeAAbZBXZLP0C8GmBut8HkZHP+u/053H8/M
         BjVewhlHBp+IDSRtb7wXIVMKeL2Yy/5IkSpjR3orAdkYUr7Gn7tpuZhPT9irHs4rItxv
         sZMIGW5EYCJ0hVVakXeWxc7SA8WEVYlrJ8o2YyQrFsKRmGD4OfwdYmsbrBQkIpYpOj8r
         Q39g==
X-Gm-Message-State: AOJu0YwXsIznCCNom+zFmLvW8f/gLKESBRiqAmy7cwLwR+hUeRDbapBi
	aohSoJSnGqdcBcxoBPFKnyBXPv4ZAPhgvl642BjMSfOzTZWupPs0XGOQwpPoxxaOXnLAp3K9rDP
	mZa8u/NM8Rm9D0y8qRWLXPULZt7H/HRs=
X-Gm-Gg: AY/fxX5ov3P4ziXuU0eEGDOPRMczg015UQ7Z2ALZY1NqM3DmJgiV+fftYZYjp/S9u57
	g4H6tr0/yd5TvGu8OhE2eNvvJGGaFHD4eyu4J7IG1pT2PZ0i5CtGl6DPtyJTteUP29kxoi+OPAc
	o80iR/h23tO7SxytSTf55w8HPZRk79rXLT0niV6tUmumISCOFxBUdSmOStBQyek69KYjJOy60W1
	bXfAYAUyvKw5/vQ6VXR2vXCSYGLYXZVDfWfmD+L5aw/g+gYf4SVJYqCLcaO0JVD525lYA==
X-Google-Smtp-Source: AGHT+IEtlMWlbXnF4Oj0jbzp7f/ZuUV4mkecsFVxmAs5RMgeGUzyewrUVxIQe8tHbhSY7Y/+kLVT2VPWD6nl2ih+YGs=
X-Received: by 2002:a05:6214:2c0c:b0:882:3f45:c828 with SMTP id
 6a1803df08f44-8887e131683mr182189576d6.36.1765823287768; Mon, 15 Dec 2025
 10:28:07 -0800 (PST)
MIME-Version: 1.0
References: <20251211175547.3944470-1-ross.burton@arm.com> <20251211175547.3944470-6-ross.burton@arm.com>
In-Reply-To: <20251211175547.3944470-6-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Dec 2025 19:27:56 +0100
X-Gm-Features: AQt7F2pmrWxK6_7-QRPhvXKXNOeiG2_r8tLA0DjxNHhnsM7zm5QzkFu_tnqUOy0
Message-ID: <CANNYZj-E8zQVQpcFZfyCRViWM75xJq=zxVB0wTZsd7PBu5mJig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 6/8] classes/meson: no need to export STAGING_DIR_HOST
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 18:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227752

On Thu, 11 Dec 2025 at 18:56, Ross Burton via lists.openembedded.org
<ross.burton=arm.com@lists.openembedded.org> wrote:
> -# Needed to set up qemu wrapper below
> -export STAGING_DIR_HOST
...
> -    qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
> +    qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_LIBDIR}','${STAGING_BASELIBDIR}'])}"
>      cat > ${WORKDIR}/meson-qemuwrapper << EOF

I didn't want to take time in the patch review, but I went and checked
how this export appeared in the first place. It happened in 2016, when
using qemu to run target binaries was introtroduced to enable
cross-built gobject introspection:

https://git.openembedded.org/openembedded-core/commit/?id=c54c5fc63c05d416f3733a742fc94f7a169adc8b

I think Alex-2016 simply didn't realize that bitbake can substitute
its own variables in shell functions directly, and everything in there
must be 'exported' into the shell and deferred until shell runs the
script. And then the proven-to-work wrapper code was mindlessly copy
pasted around to places like gtk-doc or meson. So similar cleanups can
probably happen in gtk-doc class and g-i recipe as well.

Alex

