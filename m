Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98079C624D7
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 10:10:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4453.1788430229201098664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 03:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xm9X8nMP;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so13876475e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788430227; x=1789035027; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3Roj1SlJvkRbvSeMYu1vSP/0kB/tUdpzFFaR7JHSWk=;
        b=xm9X8nMPccsbp8MalQMXVAhHScS3ADQ/aDwqb43lUUTxeARPLcDsidse+zhACPNVA7
         Bi4V7olFhNquG1KX7Ia8bl1Fy8GxcqI1CHxYxnXPWgmb5m1tp6kgpGno/oP2MnWi4dOm
         dHKxRkFaZaFIlP8Fdoa2rjrF046v+DI/bilGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788430227; x=1789035027;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n3Roj1SlJvkRbvSeMYu1vSP/0kB/tUdpzFFaR7JHSWk=;
        b=QMeQ8FjHV8sp2APBEHgHygqVVXZCutriOtxvFDfD3yW/WT3K4vfr7/IcPWbc+9H3ZO
         hn1j91MsNfmcdykGyABmLcNoZ5aiaed6xsK9rXmiIiOKOayw2T2YDj8HxcbSIvsIG1/O
         qbZOD9wr4OmVyKhNhZ+QsKeCUxDedISVfAhzLGssiXvrk9wGpIzZQWPITz05TA1ncFD6
         W2fHQJBqRe+cxVOiaWeK9a3+DNEgIeXd3Br61GrQRogiuxrFFYruUEqiqKPzElsNMpib
         AOoXkztdZvGD5ZnRyaKufvunXxDhhJ8eHzolpp5fYHYjUOd2BwrMlzXygYt51R/tYFD4
         vv1A==
X-Forwarded-Encrypted: i=1; AKwUvBz0o3kX6PHHgh2er/eq2KkZA9QHlIQJuDvmazEJlLluDV6Hw0CN7UIoFp0iZwS41vPqjS9B0PvK9E+njH5c59o3Xw==@lists.openembedded.org
X-Gm-Message-State: AFuF++lX8CFnoQoWx4+zaP0pTkWI70guKaeyo2FNWFnr83x3rPNEYG2a
	6WpQNKtpre75NudSzaPqVuyIN8qwEHzGy374v1a8Tq87FMv8UTUXoBvN10jrVXdXZvM=
X-Gm-Gg: AYBFou2ZvBvIHZ58wyssEKM7bRaXnX0hY6yjgvnQpEZc6cFIXGpnLPtywkNajx/RGeg
	1gUueKP9X84pGo3C1RjpCFDkvuqEM5hJ59bBlaw3OeaErZqVueDL252tY89mg4hEe5t7Ye2z4In
	H7VN1VQVsaVMClwQ3SYgvKqyqPQLvRgeu2e3S7kLMHhq4B0sTCioDYcY0rECH6lAjJgxFAxStVw
	ZIGfA12VpP+0iGrQ642ZAqJRtwqH244Udql5aPx5sH0wvb4aiAfJ4RHchX11RFJZ6q50jD2EvFU
	4SSaJbkeA/deKwF8l6n/EQBflmdSlrEVxjk0KLDZtyOdnlsfuwniPFC/4ZOJuAf4eqI/ErEgxj+
	rRx5sFlBb/EZoVaXW0mngE5/f8ZJpH1RkaiCtsOo9bp6BQv9pBoMnmsBxcUOStIG/0nfESQMLRi
	31oZUdYuy18xk/ZZcu4Hk73eRfz3iSz0wG9THAlw+qcUjniLbq0L17Q04kLsvvHuGbUI52QbsOV
	b4hzt2vK+U4QyD/0C+x5zTJxc9ao2IivogBiE4ZXfjzNShfFB4=
X-Received: by 2002:a05:600c:3b11:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49ce5843baemr185362375e9.13.1788430227476;
        Thu, 03 Sep 2026 03:10:27 -0700 (PDT)
Received: from localhost (2a01cb001331aa00939d825f00cb3861.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:939d:825f:cb:3861])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6158e9sm58418145e9.12.2026.09.03.03.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:10:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 12:10:26 +0200
Message-Id: <DL5LLRYT9621.2Z7YQDJVEHKEO@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] libssh2: fix CVE-2026-58051
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <Ghanshyam.BanaitSanjay@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260903100655.2460077-1-Ghanshyam.BanaitSanjay@windriver.com>
In-Reply-To: <20260903100655.2460077-1-Ghanshyam.BanaitSanjay@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 10:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245025

On Thu Sep 3, 2026 at 12:06 PM CEST, Ghanshyam Banait via lists.openembedde=
d.org wrote:
> libssh2 through 1.11.1 grows its publickey list with SSH2_REALLOC but doe=
s not zero-initialize new entries before parsing populates them,
> so a parse failure reaching the cleanup path leaves libssh2_publickey_lis=
t_free operating on an uninitialized entry.
> A malicious SSH server offering the publickey subsystem can use a malform=
ed response to make cleanup free an uninitialized,
> attacker-influenceable attrs pointer in a connecting libssh2 client.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2026-58051
>
> Backport the patch to fix CVE-2026-58051.
> https://github.com/libssh2/libssh2/commit/a9758da45a52bc8c630ec9493804d0c=
6ea30b24a
>
> Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
> ---
>  .../libssh2/libssh2/CVE-2026-58051.patch      | 34 +++++++++++++++++++
>  .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58051.p=
atch

Hello,

There is already a pending patch for this CVE on wrynose:
https://patchwork.yoctoproject.org/project/oe-core/patch/20260820055749.137=
8475-1-hthakar@cisco.com/

Maybe you can help reviewing it?

Thanks!
--=20
Yoann Congal
Smile ECS


