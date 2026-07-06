Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D12C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 13:20:29 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150872.1783344028131386012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 06:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vRgSDIjs;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1542973f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 06:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783344026; x=1783948826; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdvgwOILKz42QanSPFvXNRcEYlFh1t5HKnsxbZqgqUs=;
        b=vRgSDIjsebZbQwzPYfgIbq5GN+/QYnua2I1IKluz76CwvAZNoxPBj05h0X8Hiu/x8U
         I580LgsgTmBKd8BO/PFfzkctwAWbndaLlftTFnf4CT5WoSWM0P72PmwpP9c1qm2Hhbqi
         Zv2laC2Lb5EMjkuoU5mDlhkJMhW7oc5X/cegc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344026; x=1783948826;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pdvgwOILKz42QanSPFvXNRcEYlFh1t5HKnsxbZqgqUs=;
        b=FlTT8LsChfFl33gkvDBFEM3Vo/N4EEFtXrAL+jdVy1jfKXND9wkG/F0j6fNmLzuoL4
         F+cdwE0Bj7w5/zjhaMQB82WsuPEmWn3sHn2PoxLKxufv6fLHaEReUpHMoyzw1c8iC736
         cGwmSClSC9W9MOCWVBy4LKikfpFRLr1b2ny84mZUazbBxnRBGiVrsl5wa0xYzslqV1yz
         gaHDZrtRm5w7+XgE0Txv7Z64ybW1bUj7GgDBNeew+U8aH8Vr6coat/vq/yO/42EVSDl/
         DN01UgZhLJtY0kIIZ0twvWhf8UDaB9SgZOmz2Pc4evXwBRm2ldv1a8F2EBpcH1wQgipr
         LpKg==
X-Forwarded-Encrypted: i=1; AHgh+RomN2PH8MhSk0Q5CVYMTTranhR1csk5Y8HYbhWrpKJgEyyUNXmfySqv8FeCKXPWOKtLp78f9tkhyxszNScWFwudTQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxQHv3pw2FiB1EzbBV0PQuaB03vPQRkY5ddLLtXcxaxWtVDB+G/
	THnRz3aZDtJSzAZ6fAfZOq+T7hsThtvP+ZGq+jAAStlUeje3yyArzgSfAmrEl3ci1H8=
X-Gm-Gg: AfdE7ckXA3f0fPJKifPUqvw1+KDMNl7VI5mDVJwmF8GMry0y4GzzT3lHdAkMT4269Da
	4h87yao58yLH83HCBDXwZUv9XvnnfVP9p5kG6/TON+rZLVEjte034gtAB+vSR/n3+YISSwcaHTu
	mjOAZxh/yCXslE5K8sIw31h1XLhU7iBjd/g+Ybvy4gxCvyqfUWc9em3kl6EP2d1olN+6RgER+NR
	da6zTAPikU5y7vajcFv15G8SVGSW0dTQDYeWmEn74N0t5NXtrTqypierhpzB9h6WZJDGHsFb3AO
	9xxOt0rSBGv0LnWa35oHPGCNShPBZYAfTPd9FUApVZsQtMBboD1nZT48tsIer+cU76amCC6M0az
	VH53vMXRe9IdERy1mf73E65q47mJZu9j30xs+jg7iYGz9HANoGhwEs8WgGEjLwXecK9Fz/7/q6j
	Tk5TF2N96zP2K9fKQ=
X-Received: by 2002:adf:f9cd:0:b0:470:7fdf:61fa with SMTP id ffacd0b85a97d-47de668ac7emr130945f8f.38.1783344026217;
        Mon, 06 Jul 2026 06:20:26 -0700 (PDT)
Received: from localhost ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6da9sm24065439f8f.12.2026.07.06.06.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:20:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 15:20:23 +0200
Message-Id: <DJRIP2MOK9AQ.GHTBXXIPNQ3N@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] libcap: Fix CVE-2026-4878
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Bruno VERNAY" <bruno.vernay@se.com>
To: <hsimeliere.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260520091430.3075624-1-hsimeliere.opensource@witekio.com>
In-Reply-To: <20260520091430.3075624-1-hsimeliere.opensource@witekio.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 13:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240268

On Wed May 20, 2026 at 11:14 AM CEST, Hugo Simeliere via lists.openembedded=
.org wrote:
> From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witeki=
o.com>
>
> Pick patch from [1] as mentioned in Debian report in [2].
>
> [1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=3D28=
6ace1259992bd0c5d9016715833f2e148ac596
> [2] https://security-tracker.debian.org/tracker/CVE-2026-4878
>
> Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource=
@witekio.com>
> Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
> ---
>  .../libcap/files/CVE-2026-4878.patch          | 164 ++++++++++++++++++
>  meta/recipes-support/libcap/libcap_2.69.bb    |   1 +
>  2 files changed, 165 insertions(+)
>  create mode 100644 meta/recipes-support/libcap/files/CVE-2026-4878.patch

Hello,

As far as I can tell, this patch is needed on wrynose.
Can you send a patch for it so I can accept this patch on scarthgap?

Thanks!
--=20
Yoann Congal
Smile ECS


