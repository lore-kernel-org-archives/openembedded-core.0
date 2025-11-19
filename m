Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EBDCF2599
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 07:55:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1932.1763538923765566843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 23:55:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=DxVX4jPu;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7902C4E41798
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 07:55:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EC1E60720;
	Wed, 19 Nov 2025 07:55:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB5441037173E;
	Wed, 19 Nov 2025 08:55:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763538920; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Go96WD4oWrOsRcnHQPMzXadW8S3EzRorZD/4tCdzCv0=;
	b=DxVX4jPu8v0JI5+JSU/Oznh4Tar9lZToHKKw5B4w6mfjZDu0y6m9ydi/jhtI6H3adNrucj
	Vywlm87ui0aoCbmqFR9yaQfjSPQYR+mRzCRBZ6ONgg5b/SZlUZ0R8WwaiHi1wUMG12KVgv
	8+ujtDpJMTJzwSUebr9RX/vwdYT4HkpQKSxEgwKvnlACIM4Ght6d3SfguaW79OP8AAP80z
	iE8Pp/CWS02N7SXsAPBw4BM16XdoZOFydxgoUj77PR9JjQskB5raCdVWvisQMRT3940Lqe
	p0lmYg/hJOhP2dItcTExOP22k1uN/q6ic8RsTLP4aeCMsblrAO66FOzp/Fl6gg==
Date: Wed, 19 Nov 2025 08:55:17 +0100
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Peter Marko <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com
Subject: Re: [OE-core][scarthgap][PATCH] spdx30: fix cve status for patch
 files in VEX
Message-ID: <khthpxww2cjk6utwcpmffkdgmj6oyadefjm6ik7x6cscdj7edk@vvpy5klvpgui>
References: <20251118120839.603554-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118120839.603554-1-peter.marko@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 07:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226542

On Tue, Nov 18, 2025 at 01:08:39PM +0100, Peter Marko wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> This commit fixes commit 08595b39b46ef2bf3a928d4528292ee31a990c98
> which adapts vex creation between function create_spdx where all change=
s
> were backported and funtion get_patched_cves where changes were not
> backported.
>
> CVE patches were previously ignored as they cannot be decoded from
> CVE_STATUS variables and each caused a warning like:
> WARNING: ncurses-native-6.4-r0 do_create_spdx: Skipping CVE-2023-50495 =
=E2=80=94 missing or unknown CVE status
>
> Master branch uses fix-file-included for CVE patches however since
> cve-check-map.conf was not part of spdx-3.0 backport, closest one
> available (backported-patch) was implemented.
>

Hi Peter,

I tested it and this looks good to me, it fixes the missing/unknown CVE
status warnings.

Thanks for preparing the patch.

Greetings,
Kamel

> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 6b0aa137c4..8115088ab8 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -503,7 +503,13 @@ def create_spdx(d):
>      if include_vex !=3D "none":
>          patched_cves =3D oe.cve_check.get_patched_cves(d)
>          for cve_id in patched_cves:
> -            mapping, detail, description =3D oe.cve_check.decode_cve_s=
tatus(d, cve_id)
> +            # decode_cve_status is decoding CVE_STATUS, so patch files=
 need to be hardcoded
> +            if cve_id in (d.getVarFlags("CVE_STATUS") or {}):
> +                mapping, detail, description =3D oe.cve_check.decode_c=
ve_status(d, cve_id)
> +            else:
> +                mapping =3D "Patched"
> +                detail =3D "backported-patch"  # fix-file-included is =
not available in scarthgap
> +                description =3D None
>
>              if not mapping or not detail:
>                  bb.warn(f"Skipping {cve_id} =E2=80=94 missing or unkno=
wn CVE status")

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

