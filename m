Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825A3FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 15:19:35 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15609.1777389569744242368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 08:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GnMY+XWl;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48896199cbaso114010695e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 08:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777389568; x=1777994368; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVbpgNEdRk1g4WHbc5CoLjakoTX8p19C4H5GB8/mXtQ=;
        b=GnMY+XWlffqQyfl1o8OhGH1MZOXEtVkkOTNtcref1igbyyvNI0TyKm41fm65DL6kBY
         GKm0r6wHiocT8XdN4xVzHNjRXB0zmJYKfxTurPHg5czpcmlf/vyHwTZ9wLEMGEYqmjhC
         hVCw990yOTFQbHFKaM/2uZ3bQx5MlpYG9CjX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777389568; x=1777994368;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVbpgNEdRk1g4WHbc5CoLjakoTX8p19C4H5GB8/mXtQ=;
        b=fZ6/gTf890WbcTrX8eHxr4NjtXf4JmeD43grVosWtpEmWvmrzOT4B2oz3x3SXLuuFl
         F/sVkcemZmvlmLLt1InRsHpmtYrT4+R3PdNx2kfdp5xyUz2c7MyadaFRFW69mjB2T/kW
         fEJfF4fSEoMDwErbjVkv49ENM7GdjEYTw1vCnchbXmITG/IShah+SUhW2Lav/zITVLHk
         bGPQeTT1ckz8G9SN1Fmp2KaVSt5Bns7YCYHFY3G98/z+KqdlIaVQgJmEkqeNUT89iAEQ
         KrfqJQRu9YtAt3s9UzNh5jy8yMbJCa0miRRTLrUIuHU6MC2rLAt/wL7oDt5MdTpJzYJg
         3Z8g==
X-Forwarded-Encrypted: i=1; AFNElJ/mXu7Mbh+6Pe8gnCXkpNWv0Qxr7vBRuum6IbmxP0CgB4dHFQIJh+741x/Cq/lCqY/8iMd4XNC5ODVcIHduS3pYDQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyPRVF6IGbfD0DCDcfD2ebUg6kBDqJJ00Mac3qiBIWBmvZESx3W
	E/uXwIaAjnAT299hppvrt/72SYWRrDxW4n0GqQCNjDdBkK2dNvSmKgG0R4+wzQKOzkQ=
X-Gm-Gg: AeBDiev/ORFBf1Kc0S25h2Sz7S0hNRJzgV/2M4Ai1RC92DBYYsvbjveFidt5BCUPMav
	ryu8P3fActE7ixv+O05dt0E6oltXAhKIWTBJQ58oavW4a5zWeKne/lRsND5JlQEkaIuZGBQ0Da1
	f1wYCotA4/XP2QyRrRHTQoo0ahZ3z5Irk5rDuIemrn6yQYp1yjHScM4G5BJ6taYglCfyskWORnG
	67gOw5ZvOPLHiYmsmk4a8s05lrsC5yu1psbSsBGNh9LMEzSMpTzFSeMALXXDXh+J7JhiVAgA2wP
	zGycN1iDT6OfrZgrk+4eyYKhhWD/+PZDhDUUrHbUDF5CZmuZ2IpdNc/AN4E9WRaWX5S+JWTTQy2
	HqVotK3zK+65hDl32MXbApTkwUKE0cZ8Lx8GiSzRi3ErYc1J1coV+P8TLtvmnt4o0fJEA+UTlcK
	09xVFWPQPSWn+KiSZlckiWjEqPcJo1emSa55uNMtLYcm5kSvs8h28T8G1PpCTeUa0B19x4M68Gy
	mm6PkLV/jVZzBOXbXWDTAAVGlrJCzn3sNPWQLcXZ8fOW7DPBc01X+Oh+xeHxIt64gWyxHyPAqPn
	K1i0EcoNQcPt
X-Received: by 2002:a05:600c:a013:b0:48a:563c:c8e0 with SMTP id 5b1f17b1804b1-48a77ad5a89mr58780935e9.1.1777389568007;
        Tue, 28 Apr 2026 08:19:28 -0700 (PDT)
Received: from localhost (2a02-8440-750d-af80-c14f-081a-27a2-598d.rev.sfr.net. [2a02:8440:750d:af80:c14f:81a:27a2:598d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a774c3ddfsm49049465e9.2.2026.04.28.08.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 08:19:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 17:19:26 +0200
Message-Id: <DI4W0MH446S5.1PZMW524MSN7V@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] rsync: fix for CVE-2026-41035
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260424084956.214345-1-hprajapati@mvista.com>
In-Reply-To: <20260424084956.214345-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 15:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236067

On Fri Apr 24, 2026 at 10:49 AM CEST, Hitendra Prajapati via lists.openembe=
dded.org wrote:
> Pick patch from [1] also mentioned at Debian report in [2]
>
> [1] https://github.com/RsyncProject/rsync/commit/bb0a8118c2d2ab01140bac5e=
4e327e5e1ef90c9c
> [2] https://security-tracker.debian.org/tracker/CVE-2026-41035
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-41035
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../rsync/files/CVE-2026-41035.patch          | 39 +++++++++++++++++++
>  meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-41035.patc=
h
>
> diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch b/met=
a/recipes-devtools/rsync/files/CVE-2026-41035.patch
> new file mode 100644
> index 0000000000..66b1b93672
> --- /dev/null
> +++ b/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
> @@ -0,0 +1,39 @@
> +From bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c Mon Sep 17 00:00:00 2001
> +From: Andrew Tridgell <andrew@tridgell.net>
> +Date: Wed, 22 Apr 2026 09:57:45 +1000
> +Subject: [PATCH] xattrs: fixed count in qsort
> +
> +this fixes the count passed to the sort of the xattr list. This issue
> +was reported here:
> +
> +https://www.openwall.com/lists/oss-security/2026/04/16/2
> +
> +the bug is not exploitable due to the fork-per-connection design of
> +rsync, the attack is the equivalent of the user closing the socket
> +themselves.
> +
> +CVE: CVE-2026-41035
> +Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/=
bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + xattrs.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/xattrs.c b/xattrs.c
> +index 26e50a6..65166ee 100644
> +--- a/xattrs.c
> ++++ b/xattrs.c
> +@@ -860,8 +860,8 @@ void receive_xattr(int f, struct file_struct *file)
> + 		rxa->num =3D num;
> + 	}
> +=20
> +-	if (need_sort && count > 1)
> +-		qsort(temp_xattr.items, count, sizeof (rsync_xa), rsync_xal_compare_n=
ames);
> ++	if (need_sort && temp_xattr.count > 1)
> ++		qsort(temp_xattr.items, temp_xattr.count, sizeof (rsync_xa), rsync_xa=
l_compare_names);
> +=20
> + 	ndx =3D rsync_xal_store(&temp_xattr); /* adds item to rsync_xal_l */
> +=20
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-de=
vtools/rsync/rsync_3.2.7.bb
> index 14beafb681..2a1c3d9d56 100644
> --- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
> +++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
> @@ -28,6 +28,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/=
${BP}.tar.gz \
>             file://CVE-2024-12088.patch \
>             file://CVE-2024-12747.patch \
>             file://CVE-2025-10158.patch \
> +           file://CVE-2026-41035.patch \
>             "
>  SRC_URI[sha256sum] =3D "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e4=
88fb2dc41346f2bb"
> =20
Hi Hitendra,

Since this fix has been merged into the rsync v3.4.2, and openembedded-core=
=20
master branch use currently rsync v3.4.1, I cannot accept this directly for=
=20
scarthgap yet because of the "master-first" policy we follow.=20

Could you please submit a backport for the master branch first?
Once received, I can move forward with this backport for scarthgap.

Thanks,
Regards.

--=20
Fabien Thomas
Smile ECS


