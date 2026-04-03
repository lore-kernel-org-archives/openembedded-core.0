Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B275CE88D71
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 22:30:24 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6486.1775255416775181455
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 15:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=esIL8mh9;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a29e6110so1987905e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 15:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775255415; x=1775860215; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tP21YTskPmkjyFYzVMwDopisDIhfqNSeRG60S/2F9Vs=;
        b=esIL8mh9Sh64JBl8SgNGuEw66zf8j9AudHYRTXlHRZCOU43HebH0LGDKuEDUUXlydm
         W83T6mBSfhOKpYVFSThKOsFopQSV4WHcEDgJ5XdZK4kxkwiJjrejofvW53R247DiMsVR
         fRQVhKsQVGznyUorkR9cJQpruT6H1dN6v7HCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255415; x=1775860215;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tP21YTskPmkjyFYzVMwDopisDIhfqNSeRG60S/2F9Vs=;
        b=N7jQDxsbn1aWjOgCLfgH//WanK4o7DBFK8mUNLZhXS3tWyH0GpldL349qBoJe/y1dL
         mmsUcWop51sVfjsZjRbsq8N9tYVwMxIjWsWrfB88Ess2xV9jo+gOGmNaY19VPSytO/J+
         /3tVtWKLRskVt7CFKQ9n8OvNel6wWh4Ib4NctOFwTzNl/nk49Xz41D+IV4YWjn/cRIF7
         2bvsxUoMzAlNOEUMu/GUxTCFqLxP/EPZ7ofQIEc4i8FF3eMGh0677VonnQj32Q0l+k0R
         STiAss4D2lEtQLNF5c5ag3m2YktiFxaoBXwK3le9yqxZT6KTng4eXhY8qL7c23t+dn/9
         a9QQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3QHmfTMBF5l9D8FbS5110S/o6WRGntPzluXIAQ2DFyizFY8mOmUaa34GUn6TZL1EWJkDx8wIJEW1fs+7ykLKD+Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxaLH6O27yr2T9R8SvQLsZZ8yfUVgGvRdGreMB1yZKT+EElluTc
	Spq8bjMZqBlyCNdupA63wPrjyqBBIdvW39OyqA5Zr+FHL3IFl9ZB7s39AWlioorW7rEhhCaESzR
	sFlwcjKg=
X-Gm-Gg: ATEYQzynl7i7zURxfzRdGCktDOn7lMZSvNC/uJKqXMJdGL8ZH7s1ttrzRV7+fQtbu3i
	hh0s+M5fq5J5CuPAW491a6q2f1idGEwhmtWGyNXbah1qjrHEu0AyaFQezKx/fhPvWBuCQUAi6Sa
	6qv0NcWluvidFAIgj1eV9TBHQvFjW9dqLrVr2y5V2ikCcsRCbLG2BMuNvt82hUfrmTJtvFgGBd8
	QjAXzAs66kdcFBoCMODXIC1KDeXEAyJk1wDDX8AEv6/tqusLvVp+Zi581PoFmXv4gSpi62h89Sl
	lG0wb0KgolruqIHFy7NjAkI8q3aAY6irUAb6pTj0AKNRLBeSjjildVdseHVaaO3Vp8VAjjU0AtH
	0mMN++I8MdPjQls33UXJYqhUE3zeEBMfdTH1f2pedannkYmedQWJHjGiW6zk1cJg2old7jehVjQ
	z1bvJuYyTAriSL8+PLsODF8XCf+F0hfk61/vvuPn/0Mfab5O6votyb55VTBs51hksiGJrSoOsLk
	jD94Tg+toTZco8=
X-Received: by 2002:a05:600c:a598:b0:485:3a27:a961 with SMTP id 5b1f17b1804b1-48899e946dfmr38994445e9.0.1775255414974;
        Fri, 03 Apr 2026 15:30:14 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899ecce11sm27561465e9.35.2026.04.03.15.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 15:30:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 00:30:14 +0200
Message-Id: <DHJVIUMTOGZ1.2CMOBAOOGBVUA@smile.fr>
Subject: Re: [OE-core] [kirkstone][PATCH] vim: Fix CVE-2026-33412
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260402035801.53200-1-hprajapati@mvista.com>
In-Reply-To: <20260402035801.53200-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 22:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234605

On Thu Apr 2, 2026 at 5:58 AM CEST, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Pick patch from [1] also mentioned in NVD report with [2]
> [1] https://github.com/vim/vim/commit/645ed6597d1ea896c712cd7ddbb6edee795=
77e9a
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-33412
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---

Hello,

As far as I can tell, this CVE applies to whinlatter and master.
Since this is the end of kirkstone soon, I'll take it into the reviews
series but can only merge it if there is a patch sent for this CVE in
those branches.

Regards,

>  .../vim/files/CVE-2026-33412.patch            | 61 +++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-33412.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-33412.patch
> new file mode 100644
> index 0000000000..62daa308b5
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-33412.patch
> @@ -0,0 +1,61 @@
> +From 645ed6597d1ea896c712cd7ddbb6edee79577e9a Mon Sep 17 00:00:00 2001
> +From: pyllyukko <pyllyukko@maimed.org>
> +Date: Thu, 19 Mar 2026 19:58:05 +0000
> +Subject: [PATCH] patch 9.2.0202: [security]: command injection via newli=
ne in
> + glob()
> +
> +Problem:  The glob() function on Unix-like systems does not escape
> +          newline characters when expanding wildcards. A maliciously
> +          crafted string containing '\n' can be used as a command
> +          separator to execute arbitrary shell commands via
> +          mch_expand_wildcards(). This depends on the user's 'shell'
> +          setting.
> +Solution: Add the newline character ('\n') to the SHELL_SPECIAL
> +          definition to ensure it is properly escaped before being
> +          passed to the shell (pyllyukko).
> +
> +closes: #19746
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-w5jw-f54h-x46c
> +
> +Signed-off-by: pyllyukko <pyllyukko@maimed.org>
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +CVE: CVE-2026-33412
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/645ed6597d1=
ea896c712cd7ddbb6edee79577e9a]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/os_unix.c | 2 +-
> + src/version.c | 2 ++
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/os_unix.c b/src/os_unix.c
> +index cf195e62e1..d767956b1a 100644
> +--- a/src/os_unix.c
> ++++ b/src/os_unix.c
> +@@ -7106,7 +7106,7 @@ mch_expandpath(
> + # define SEEK_END 2
> + #endif
> +=20
> +-#define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|"
> ++# define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|\n"
> +=20
> +     int
> + mch_expand_wildcards(
> +diff --git a/src/version.c b/src/version.c
> +index 4f3912aedd..712a3e637c 100644
> +--- a/src/version.c
> ++++ b/src/version.c
> +@@ -724,6 +724,8 @@ static char *(features[]) =3D
> +=20
> + static int included_patches[] =3D
> + {   /* Add new patch number below this line */
> ++/**/
> ++    1684,
> + /**/
> +     1683,
> + /**/
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index 289f31be70..fc9b4db055 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -16,6 +16,7 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
>             file://disable_acl_header_check.patch \
>             file://0001-src-Makefile-improve-reproducibility.patch \
>             file://no-path-adjust.patch \
> +           file://CVE-2026-33412.patch \
>             "
> =20
>  PV .=3D ".1683"


--=20
Yoann Congal
Smile ECS


