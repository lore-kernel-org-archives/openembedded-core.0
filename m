Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D92F46C5F
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 06:59:46 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75395.1775545178297697393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 23:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Mv/A6PmZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so4099922f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 23:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775545177; x=1776149977; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwGa52XgLBIpgGpEIvreLQbhV+teZ5pVzDLyC5TFiWg=;
        b=Mv/A6PmZYsYWeJxa27z7wTPlBRuD4sRRHTFe8zX9IGiAlGGlVvO2KysD3gGEaoCPnI
         3cDOQlflgo9opqpMp79ebbwy9QPuAI1vxfyzAXnYavMiaiwbHhU+ARZ0VuIZZ/Hu1BqK
         zbqspAMpi3aou5yjHo2dcQ+Mg3PrH25tw5Hck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775545177; x=1776149977;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gwGa52XgLBIpgGpEIvreLQbhV+teZ5pVzDLyC5TFiWg=;
        b=EFyH9HOfIqDheeaAaRQenpOmJV514hjfwbzz/Qcq6WgMVXhGHwfhONG11SchBX/DZD
         e0FQd0use28D3yN08RrOed/B9L1+dbqHC2y99O6L1qFWTD7KcnXv7FhXluycHl8OUaWA
         JghTXZjzbjEkqUOBVj62gbCG5ieoObjIwagxYEJcE7KhQgkQBAcFycG5sYG0ZFOaQlWb
         nIPMPLrBH6zIWbTOwQLaXv5a9u2ApppVo6SoOW7a7mWI8tTVly0B+57pM5/nSKru7sGh
         hE4RZy3S8SV0sXZUYo1MioJ/4hpA2LAYVOmZLYYCCoXL+4mOkX8dhbYW1pXBe0riy2/i
         Usvg==
X-Forwarded-Encrypted: i=1; AJvYcCURixkbx5LulZcnkRnx+lm/qM7vCHkLEB5tOHoo8Ew9+4XyoJ9B+rU6GVxtsDrlnfRFObMYutVct+H2yzGZq4oEmg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyXLjaKmMGdSA2Q462w75zcUpj/kyUm25SQddk20mo2NwCfegHE
	peet9nx8BGQfz0tjoqdvuAsi9vFMRfnK1Inp5nEB/gUzMHLk+t1BS0TLb8kAcqIdpj8GmzBVx4h
	2u+KdMDs=
X-Gm-Gg: AeBDievhOxkb7xQXmUu/+uIPlmQhgaC9Zat6rlK2/HkhZ5IoKucKecTM/+KoP2o7Tj7
	/zGroXafUCDBsfiG9TjJGBXAPTJ0L2vcyaPkH9uuiFtgWcKk39XP5hZmyWFfWtw3Mmw8jDSVcGV
	HI5Un1cx9ai+oVutuIU7nJUr7ZXQveKV2TujdUPI1I0B1Ju/kZ4Fg7cV0qWmD0ihvGpmevPak88
	PdqIS1st3LefVCFdT7mQfW83PQ8Rr6IOY1uAvUCX8bzk3q0keJs0NJnwRfwDFATrZGTJko2fmEk
	md57dMJkGvl4B6mtli2Pqtq6rUGG5okoxDlf+o69eoJ+Yg6YthX/AU0RrergdrNLs0VVWj2ARWB
	WowHEowRKSBoKzwoR2Y2UdvARLgSF4sukzd4Vv2MSguE9y2rM8YE2QRHAF4vgOOoublc9SloE0M
	0RVjPe/iZD1OYSELaaukHkZX8N0EnSHMUljCE/LfvaT8hVLv+qn0BaIKV2cybXQCg/DLiQfepUk
	iGiym6rEe/jlYc=
X-Received: by 2002:a05:6000:144a:b0:439:b55d:b0e5 with SMTP id ffacd0b85a97d-43d292cd508mr23709811f8f.28.1775545176448;
        Mon, 06 Apr 2026 23:59:36 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f52easm48848310f8f.36.2026.04.06.23.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 23:59:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 08:59:35 +0200
Message-Id: <DHMQ8H95DDPG.3DA7OTQLFVV9X@smile.fr>
Subject: Re: [OE-core] [kirkstone][PATCH] ncurses: fix for CVE-2025-69720
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260407054403.21041-1-hprajapati@mvista.com>
In-Reply-To: <20260407054403.21041-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 06:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234703

On Tue Apr 7, 2026 at 7:44 AM CEST, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Pick relevant part of snapshot commit 20251213, see [1].
>
> That has:
> add a limit-check in infocmp -i option (report/example by Yixuan Cao).
>
> [1] https://invisible-island.net/ncurses/NEWS.html#index-t20251213
>
> References:
> 1. https://github.com/Cao-Wuhui/CVE-2025-69720
> 2. https://nvd.nist.gov/vuln/detail/CVE-2025-69720
> 3. https://access.redhat.com/errata/RHSA-2026:5913
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---

Hello,

Sorry, but this might come too late for kirkstone.
See "End of kirkstone LTS support"
https://lore.kernel.org/yocto/DH8I3C005I7I.EAFAABGT2FJL@smile.fr/T/#u
I will try to include it but no promises.

Regards,

>  .../ncurses/files/CVE-2025-69720.patch        | 42 +++++++++++++++++++
>  .../ncurses/ncurses_6.3+20220423.bb           |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-69720.patch
>
> diff --git a/meta/recipes-core/ncurses/files/CVE-2025-69720.patch b/meta/=
recipes-core/ncurses/files/CVE-2025-69720.patch
> new file mode 100644
> index 0000000000..d570b2007a
> --- /dev/null
> +++ b/meta/recipes-core/ncurses/files/CVE-2025-69720.patch
> @@ -0,0 +1,42 @@
> +From 6f6db0e8fd14e40096a0ee6f8bdf32dedbd3fc9e Mon Sep 17 00:00:00 2001
> +From: Hitendra Prajapati <hprajapati@mvista.com>
> +Date: Mon, 6 Apr 2026 18:08:09 +0530
> +Subject: [PATCH] add limit-check in infocmp
> +
> +origin : https://invisible-island.net/archives/ncurses/6.5/ncurses-6.5-2=
0251213.patch.gz
> +Refer: https://github.com/Cao-Wuhui/CVE-2025-69720
> +patch by : Thomas E. Dickey <dickey@invisible-island.net>
> +
> +CVE: CVE-2025-69720
> +Upstream-Status: Backport [https://github.com/ThomasDickey/ncurses-snaps=
hots/commit/6f6db0e8fd14e40096a0ee6f8bdf32dedbd3fc9e]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + progs/infocmp.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/progs/infocmp.c b/progs/infocmp.c
> +index 0ee0b958..538aca5a 100644
> +--- a/progs/infocmp.c
> ++++ b/progs/infocmp.c
> +@@ -816,7 +816,7 @@ lookup_params(const assoc * table, char *dst, char *=
src)
> + static void
> + analyze_string(const char *name, const char *cap, TERMTYPE2 *tp)
> + {
> +-    char buf2[MAX_TERMINFO_LENGTH];
> ++    char buf2[MAX_TERMINFO_LENGTH + 1];
> +     const char *sp;
> +     const assoc *ap;
> +     int tp_lines =3D tp->Numbers[2];
> +@@ -846,7 +846,8 @@ analyze_string(const char *name, const char *cap, TE=
RMTYPE2 *tp)
> + 	    if (VALID_STRING(cp) &&
> + 		cp[0] !=3D '\0' &&
> + 		cp !=3D cap) {
> +-		len =3D strlen(cp);
> ++		if ((len =3D strlen(cp)) > MAX_TERMINFO_LENGTH)
> ++		    len =3D MAX_TERMINFO_LENGTH;
> + 		_nc_STRNCPY(buf2, sp, len);
> + 		buf2[len] =3D '\0';
> +=20
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb b/meta/rec=
ipes-core/ncurses/ncurses_6.3+20220423.bb
> index 68a845f27c..15ea2756cd 100644
> --- a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
> +++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
> @@ -7,6 +7,7 @@ SRC_URI +=3D "file://0001-tic-hang.patch \
>             file://CVE-2023-50495.patch \
>             file://CVE-2023-45918.patch \
>             file://CVE-2025-6141.patch \
> +           file://CVE-2025-69720.patch \
>             "
>  # commit id corresponds to the revision in package version
>  SRCREV =3D "a0bc708bc6954b5d3c0a38d92b683c3ec3135260"


--=20
Yoann Congal
Smile ECS


