Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F516D216AC
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 14:16:06 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.14722.1729001757754960609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 07:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gmtFpW5U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-430576ff251so47527655e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 07:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729001756; x=1729606556; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/vz9Am3izZo/zaiMQXh1HybNEt1N1i8Mq82y3J9GsME=;
        b=gmtFpW5UFslIOetqKeNUyQm4nnZpVlbXCA2wTYlGRGwJJv/IpiKwz0qyeenWWMgqMF
         ZEIcINxAQW1So6gJIV3eDdH6LnIHMnbMnWp9q8zd+q+Xqtb+B80Bo7qX8lyunXlLy+gT
         hBKFvveVbNzkblQOQWU+I24VujJLqyA01n23A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729001756; x=1729606556;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/vz9Am3izZo/zaiMQXh1HybNEt1N1i8Mq82y3J9GsME=;
        b=VkKqQ4A/VpsGTdVcs2PdXW/vEsJ6mIHXHms6asSCvUOn7p8eeITpJlO/zEsi7T806C
         Dsox78PMoO6vEfMG6AsrJcO3iXLwPc3R9YqmiF3XK54j+5pN4ebpuvkab8t25PqnoFfq
         kfI/QV+LfWLCnwZlt98JQsBvNaaSSMZ8sXaXmuEjjyKyTPCqOI7nkvafRbHHRnwbsY0F
         V4x6X28NvokkMuiOxEV3pP3MMpi+s74BlNQRf7IGWyOZsGv8Elad+F55gKTnTkxRileg
         B8mDqFvQWdVqwwq3JSaQN6i9F44kQTWH7XNU4zg/w5uFwuHas0ZekehOYBmgZTKNtS1M
         RCCg==
X-Gm-Message-State: AOJu0Yzse/Rr/jMnFo8BvInuTGpXnpXcj2rqRgwaLyOzYb/tCxqjOlJZ
	OmGcg0iBhE9SMPxrzEyqFfRreLnN5a3OzmtFDJcyWk+OtFwOMc9XZeNn0RU39o4=
X-Google-Smtp-Source: AGHT+IF3oD90suK4rmyYXCHl9edd+VLawiPzqG+0zFs8w3TCOqK1rCthsksrQW0zLtdcNk0M8bpDSQ==
X-Received: by 2002:adf:fe4b:0:b0:374:baeb:2ec with SMTP id ffacd0b85a97d-37d5519e501mr11295412f8f.19.1729001754341;
        Tue, 15 Oct 2024 07:15:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:28fa:e6b1:dce2:85c9? ([2001:8b0:aba:5f3c:28fa:e6b1:dce2:85c9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf82b1sm1703009f8f.72.2024.10.15.07.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 07:15:53 -0700 (PDT)
Message-ID: <453e16e5f843492aa7aac45e0311046729e4155b.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/6] linux-yocto-dev: conditionally add coreutils to
 depends
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2024 15:15:52 +0100
In-Reply-To: <88eada332f5d3d00baf9f2cedf63460d80356032.1728912923.git.bruce.ashfield@gmail.com>
References: <cover.1728912923.git.bruce.ashfield@gmail.com>
	 <88eada332f5d3d00baf9f2cedf63460d80356032.1728912923.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 14:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205918

On Mon, 2024-10-14 at 09:45 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> 6.11+ uses truncate as part of the build. While truncate has been
> added to HOSTTOOLS in oe-core master, it still is possible to
> build a kernel recipe newer than 6.11+ on a release that doesn't
> have the HOSTTOOLS tweak.
>=20
> We can test for truncate and condtionally add the dependency.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
> =C2=A0meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-=
kernel/linux/linux-yocto-dev.bb
> index 292897ce43..752d108bd8 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -44,6 +44,10 @@ PACKAGECONFIG[dt-validation] =3D ",,python3-dtschema-n=
ative"
> =C2=A0# we need the wrappers if validation isn't in the packageconfig
> =C2=A0DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation'=
, '', 'python3-dtschema-wrapper-native', d)}"
> =C2=A0
> +# 6.11+ uses truncate in the build, so we need to either have it in host=
 tools, or
> +# build it ourselves
> +DEPENDS +=3D "${@bb.utils.contains('HOSTTOOLS', 'truncate', '', 'coreuti=
ls-native', d)}"
> +
> =C2=A0COMPATIBLE_MACHINE =3D "^(qemuarmv5|qemuarm|qemuarm64|qemux86|qemup=
pc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64|qemuloongarch64)$=
"
> =C2=A0
> =C2=A0KERNEL_DEVICETREE:qemuarmv5 =3D "arm/versatile-pb.dtb"

This is for master so truncate should always be in HOSTTOOLS? I don't
understand why we need this there?

Cheers,

Richard


