Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAF1C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:40:20 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31905.1788777615745338845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VO7/tAUc;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4843e397f74so4305187f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 03:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788777614; x=1789382414; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kGs/gh8747ZyFrLs916n0de5N4yjaWiTS9yh4msid2Q=;
        b=VO7/tAUcfK8w9l07H3Fdfje+9ziYy/kehAQMDIisZikibiifZ3Ug7tOyuzyggxsNdn
         caRu9on7BqeDZmaadxr2CRsGG0gmNtLdwIPIgGTJrGepgh5rJyREBO5lUOsMFPanuYQb
         7U/i61LsLg0IRd5Mp8UHsuzQhTViHVwKOTjRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777614; x=1789382414;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kGs/gh8747ZyFrLs916n0de5N4yjaWiTS9yh4msid2Q=;
        b=jnX6FNkbRAjM5vmzvGj+sup+bG0vR13czgl7mHGwewc/Y3yRlJZvUQKU4PQAY/pMO+
         c08Y45+GcYnJ+uTRtSnx2KWgicG6gHeJW2vfqTOgszZD2s5lUkV6UucB/8LRXNJW7WOP
         h3PDHq77uiz6QbtISo6MlA+z5pXh7ZtCWpFH2qk5VElhLH5+sDrqf9CykSbuCbFz+LYt
         a7PUdLtipf0tvc23Nc7xp66gEou9ak63YEZDD5a5nLvjnEY0vlT/5Vx0srSAyj3eMICn
         56ImCbWyda4s1A3Gm+kwOuFsatpd6qBWzOBzjV6pElBMabwR5SvtPODdwSaRUTCqtHrG
         hL4g==
X-Forwarded-Encrypted: i=1; AKwUvBzTSVHC8K8jreY67fFif84B9ZiPurRTFCDrX2b5ceBo+Q54BMnaKVKKCSXFmgO+M+MqmaDeGCC4J5NQR9+NrefxnA==@lists.openembedded.org
X-Gm-Message-State: AFuF++mBEgcU4Ox+1SP3Py6HKOmLkkvXBrHgz0DnKpYP4jj2EXoBOdSX
	khgD6ituJ50J9pt2xnGt1tXuZUqYthtiflmEFLHe0q5UIVg2f8/qW+A/xehNuyItn/c=
X-Gm-Gg: AYBFou14V0byaqwoayobDkCKh0InUN1GbWfa7/P5mwtRxUCT8uLOn2qTzQqSG+L0RSn
	I3QjgYvJgyMHViTSI3bfBPFW59bYMR2/XehUKGYTGDFvQcxPvx0WCxjay/taWi1vU8CL+fenGya
	6n5mHBDF11e6gFvBzdkX7mE7obWMXeLsrCuzKHZ0o35SkluxUdbizoRDEXxTQcQxw0C5cq6D66u
	LFdP1333sb5ejPqJTCJyf5qAunUUVqgnAmpH4LyWcHoXPO4fGbsFiAsxmFlS+lwY73IjvSxeDLT
	J3zZ043U13RhSA9gLoQYMdCFUkuucRZqxooYq957zhu96d509i/tct7zL3MaZxcd5FfZU17lxOo
	Vif5ewT5pFPdeBbWT2fYkch/Jel/3m5qxHdwAy/bGjMTeET4IODyyuP/KWIH9y2xMVSnFzpXxgu
	D50rj27Ql29hgVZgD8YhnRM1SX4eYi2gapOihi7qFcTS8nekAPvUEoYvynB3Y2ibba1i7M+0Abb
	1gJ1nm7W/2F/JZk2FkgsYV/J+EfVhYXduuUBTdQ4ilfISwx3Vxh
X-Received: by 2002:a05:6000:1ac8:b0:482:dd86:348 with SMTP id ffacd0b85a97d-4857e4ce5d4mr33221862f8f.4.1788777613839;
        Mon, 07 Sep 2026 03:40:13 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm28597723f8f.30.2026.09.07.03.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:40:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 12:40:13 +0200
Message-Id: <DL90QQZIGVTP.1YO4O1VQB1WOL@smile.fr>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] python3-pip: set status for
 CVE-2018-20225
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
X-Mailer: aerc 0.20.0
References: <20260907082127.471223-1-hthakar@cisco.com>
In-Reply-To: <20260907082127.471223-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 10:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245245

On Mon Sep 7, 2026 at 10:21 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> CVE-2018-20225 describes pip selecting the highest-version candidate
> across configured package indexes. Exploitation requires use of
> --extra-index-url with a private package absent from the public index,
> allowing an attacker to publish that package with an arbitrary version.
>
> Commit [1] documents the dependency-confusion risk and recommends using
> --index-url for private packages. It does not change pip's candidate-
> selection behavior. This change records the CVE as disputed.
>
> [1] https://github.com/pypa/pip/commit/fe2721893636aa15ef04d02e9beb52f7fe=
9a0d27
> [2] https://nvd.nist.gov/vuln/detail/CVE-2018-20225
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  meta/recipes-devtools/python/python3-pip_24.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/reci=
pes-devtools/python/python3-pip_24.0.bb
> index 1b6281c81f..7107b1c8df 100644
> --- a/meta/recipes-devtools/python/python3-pip_24.0.bb
> +++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
> @@ -43,6 +43,7 @@ do_install:append() {
>  }
> =20
>  CVE_PRODUCT =3D "pypa:pip"
> +CVE_STATUS[CVE-2018-20225] =3D "disputed: Exploitation requires use of -=
-extra-index-url with a private package not present on the primary public i=
ndex; pip intentionally selects the highest version across configured index=
es"
> =20
>  do_install:append(){
>  	# pip vendors distlib which ships Windows launcher templates (*.exe).

Hello,

You sent this patch for both wrynose and scarthgap:
* [OE-core][scarthgap][PATCH] python3-pip: set status for CVE-2018-20225
  https://lore.kernel.org/openembedded-core/20260907082127.471223-1-hthakar=
@cisco.com/T/#u
* [OE-core][wrynose][PATCH] python3-pip: set CVE_STATUS for CVE-2018-20225
  https://lore.kernel.org/openembedded-core/20260907082218.2177656-1-hthaka=
r@cisco.com/T/#u

... but these are not similar: title and commit message changed (diff
content looks similar).

During reviews, I often get identical patches between wrynose and
scarthgap and I can, then, review both at the same time which helps me
decrease the patch queue length.
If you modify patches between wrynose and scarthgap (apart from normal
backporting modification), then, I have to review both separately.

So, this is not a strict rule but it would help me if the
wrynose/scarthgap patches were as similar as possible.

Also, the fact that the work was done twice *differently* looks like
agentic/LLM output (I think a human would copy-paste, at least). If
that's the case, remember that you have to mark it as such.

Thanks & regards,
--=20
Yoann Congal
Smile ECS


