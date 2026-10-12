Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCA1CA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 16:28:08 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17492.1791822479802688432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 09:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fyp0knle;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso11152955e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 09:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791822478; x=1792427278; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dSB+DzMks166lMmieRxMia/AwJ6q9SkjPtbVHxW5jlk=;
        b=Fyp0knleyhZs1KCVNRVL/lc1ZghcFsPghxU69sbMJzoY9YXcwY0DySpF3ZdM4PVBtw
         cO5RFivpSkkLxfboAL0A2KFyK4FAkVsYJ9u6S/qWExO5SnNV2pEMlZtDpaXDWG9816Zv
         FTf9VNjBx4sdVAePIUSe0qblxseXmGg0YCh0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822478; x=1792427278;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSB+DzMks166lMmieRxMia/AwJ6q9SkjPtbVHxW5jlk=;
        b=f7qcjctT21z3qBn6YRaGKVCPG+uEMBTEKJPR3I/BImexrJcvzMvA+L3VMKaFBhCBDm
         QNgH6IMk/qMn+HPpem0q15LnCOzamTt7UFtw62/jzr24ggv47DZzdU6gXTqnltZsZpCu
         tvsZ4y/iK7DTTAqyRdWgnrPa5HfecJPueMs0WwC6zl0zhcJl6DZj5fTB932LLHfxE0lF
         +Lz2wfaa8uY2OkZSHCqQRmorSddAPBollx6mOq39GZKSX8igmzp9kTaX5SeTbnBg/huf
         WFD4/DtQEg6D3Y0z0tH8Gg9m80VgCJgYkbFXg5ycZyxq0CJ55IRhw1XBglm0qiJupFXu
         OJog==
X-Forwarded-Encrypted: i=1; AKwUvBw55YxvfarG7/rZ3dtW6ASqd/Y6Zl4lIn5cKuA2oZ0LgyyKgqV4yaCTt2f2rhs758MbvogTaa0rUxYiK/4r4COldw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJLUko6//WKHfti3A/a0Pm6VwyKqt18ZNFaUos13+9rhztKzgQ0
	nknpJ2RXH/t9uIPvEYKjhqqSzcX0qY9NuD3LdT+RiK4vtihJBkH6RW4loSHDv+kZcuE=
X-Gm-Gg: AYBFou0SQ9DNiOiY2fYgMyPyvfItom+S+I6DCg2sCf4c7nT0GfF/pnaIYPzQIsV3RAV
	2JB9f2N9SURRunj3YR2oX7ysLJebzHM1iV6ZLtDyQyfFouKzkmUlYoKUIVhPrCLxXNQ9+y+JObN
	v5JZ6wHkED6jNrlvo6uooTmRX54fk7tpbcQb6mS7IiQAcxaHk0SOvugRbIDCXCb9s7ieYdVOzJk
	uquZVROECdJvzJHnTgtr8KJXURGdUVW8EGOOEuMtDsINbHp9pPzwmHOYKwakrgFEQ0hUoIBeCF7
	YnH8V+Q+J/hPSZ5WYPD5TkldOxAiuRGx6UxXcZlnfl9uAKEYjN/zGXMrPA4czAjzPMPJu6zSW4M
	KsJbOczbgIwthIcSP3TbcwHwis143huU3O2Yw3xVoOXin6umxc95voWQwml9kfsv4rZtYt6KQ0l
	X5dCBlg0CH3/tjQGix6jPOu9uQUJawQ0mZzCeM4OHKzTi6xvu6TOY0+KxCmS4B5F+cemLHexNxy
	6LVUnw95orSXAy4i8IyVvJthoZueYNoxeOSMqm0ri4y7jeVQO90FMav5cs5
X-Received: by 2002:a05:600c:3b0a:b0:4a1:779c:dc8e with SMTP id 5b1f17b1804b1-4a18e4a01b7mr196711835e9.10.1791822477668;
        Mon, 12 Oct 2026 09:27:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bea:bbc9:478:7c02? ([2001:8b0:aba:5f3c:7bea:bbc9:478:7c02])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm430992115e9.9.2026.10.12.09.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:27:56 -0700 (PDT)
Message-ID: <61ddef022463353447681c6d77033fadfe47f753.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] testimage: excluding TESTIMAGE_AUTO from
 initramfs images
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jose.quaresma@oss.qualcomm.com, openembedded-core@lists.openembedded.org
Date: Mon, 12 Oct 2026 17:27:55 +0100
In-Reply-To: <20261009200155.1040688-1-jose.quaresma@oss.qualcomm.com>
References: <20261009200155.1040688-1-jose.quaresma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 16:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247670

On Fri, 2026-10-09 at 21:01 +0100, Jose Quaresma via lists.openembedded.org=
 wrote:
> When TESTIMAGE_AUTO is enabled, the testimage task is automatically
> executed for all images.
> However, this is not the desired behavior for initramfs images,
> so it is necessary to disable TESTIMAGE_AUTO in these cases.
>=20
> Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> ---
> =C2=A0meta/classes-recipe/testimage.bbclass | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
> index 419ad6dcb0..f21c87487f 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -520,6 +520,7 @@ def package_extraction(d, test_suites):
> =C2=A0testimage_main[vardepsexclude] +=3D "BB_ORIGENV DATETIME"
> =C2=A0
> =C2=A0python () {
> -=C2=A0=C2=A0=C2=A0 if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "Fa=
lse"):
> +=C2=A0=C2=A0=C2=A0 if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "Fa=
lse") and \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.getVar('IMAGE_FSTYPES') !=3D d.getVar('=
INITRAMFS_FSTYPES'):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.addtask("testim=
age", "do_build", "do_image_complete", d)
> =C2=A0}

This looks a bit fragile as an image might use the same type as the
initramfs.

Could we just force TESTIMAGE_AUTO off in some of the initramfs
specific classes/code?

Cheers,

Richard

