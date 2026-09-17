Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0542C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:56:29 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43150.1789660583185613631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 08:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gX2n2RSP;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso7219105e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 08:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789660581; x=1790265381; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sETZiWy10F0nuvjEvMLYTCzhk+vQZ56OwbfC5uuqxus=;
        b=gX2n2RSPmXwGkgtAzigmdhjuCChF58jzbNA1ITPbeiX3WcdFrHmS3eRoUeWJgDP0v0
         Fe6v6T/5urFlzh5N3V0RCzO/MHQJm+WecK3ZVdmlR60k2CgdLSAMQ+8JfBrx42QRvIjM
         cFfWojRF2KDPMkqgB+5x+imBOznEDY4M78/4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789660581; x=1790265381;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sETZiWy10F0nuvjEvMLYTCzhk+vQZ56OwbfC5uuqxus=;
        b=vXD+0CemeIdGT/h1GObjrnupwdVgv0akJuNG5v55ccqoTguNt0rc/em81eHdrPaP5i
         2AJoU9RRI/a1yIQZE/4clxjnxe+dRu2FSSzpBKHBY/PCm1pQ4ZUzWT0772WOwLoBOpX9
         MG5ZC5i2NK9ZoMYbX+xbvqI6UnIfLcWkozIqF23ErDnxvamAbVDWfjUhxavS04Swn20t
         sE/t30Xd0hpyOj1wpIhDu/Y+onkV1+kmQYxzmMGy3irsSELx442DKalHMKMETUkWJ0v4
         7LUeFuueqmcJdk6q4bIjp8hpLRHMsVPeilI80p2lXGhb5BW2qBkuQ5hf2Zzes8IIq4zr
         4itA==
X-Forwarded-Encrypted: i=1; AKwUvBwh/w76YL9+A1rzW3Z9qdVfwVT9kd209o2nlcBd95/KV34cPf/JeZgNvxi6uN3NfB7wTPa3V+bBEGs3vzD016WkfQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++nUo3xMpg5vYS2DR8pTsiaBsEzcKa7RLAugQuvDGWEAENg9Xzgi
	qJusCLVvNZdyJAwlDeyNsUWDYlmE65r3C2GsA7v6z1mxwsiCJyBnk16aVpiTMrGXoHY=
X-Gm-Gg: AYBFou0POvPZaKQOwlTahd8syVAULutK1A4+bLAWxtS3auSWiCSvkEvVqVqjnmkQJYY
	UdTPeL6oD6134A1OasGyUiuTakQOh84pNynv8IWDiW4D783ziowlwy9K6zxWsFm8x4Wd9ojEwsL
	P7H+1+xqVDZX438GDi79EuAXaOc7rugaFLwEEgKroxZWA4ZNnvIF7REjUj4uhMp4+tGDQc8iEkb
	sge8w+4apYzJTmZn6k15ktZYmZqfbgOcCHHaCu0g/gTpT5rwsA7vV0RMxAFITa9MZ9xPwttVMgB
	arMW7kmGTpeHi1La7CsCFBYKFU+16ys2fvGvC6I0ehILUe9ulnIGgZma0XIdnqlexPD4Xbs5nBK
	6UUuuTkIZxhREjGUzYP1Q/QpwCESuqEKNPUBiPhYPMIiWyMUp5rDoYT1GiSWVJvPHSsGVlMzaGq
	n3Tm7gybEdvZbgzncFQ2suASxtdlUHJ+c0ll6m9JWutkxLjrg4KD5ap/8CAo+Ngolt6+1cw5jbx
	t3IFJJTsaHAGvP7i6BH4uZ10pswIlmsX1Y7/gP3MgbrY9Ufc01I9jpSwC+PvjU=
X-Received: by 2002:a05:600c:3487:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49eb7326671mr144494175e9.10.1789660581370;
        Thu, 17 Sep 2026 08:56:21 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbbcf5277sm99769835e9.3.2026.09.17.08.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 08:56:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 17:56:20 +0200
Message-Id: <DLHPQ8PAW642.3MGFURAL0DTPK@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] python3-pip: set CVE_STATUS for
 CVE-2018-20225
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260907082218.2177656-1-hthakar@cisco.com>
In-Reply-To: <20260907082218.2177656-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246077

On Mon Sep 7, 2026 at 10:22 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> Analysis:
> - NVD marks CVE-2018-20225 as disputed. [1]
> - pip searches all configured package indexes without priority and select=
s
>   the highest matching version. --extra-index-url adds an equal-priority
>   package source. [2]
> - Exploitation requires use of --extra-index-url and an attacker-publishe=
d,
>   higher-version package with the name of a private package. [1]
> - Upstream closed the related report as not planned, and Red Hat classifi=
ed
>   the issue as WONTFIX because this behavior is intentional. [3][4]
> - Record the disputed status; no source patch is available.
>
> Reference:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2018-20225
> [2] https://pip.pypa.io/en/stable/cli/pip_install/
> [3] https://github.com/pypa/pip/issues/12874
> [4] https://bugzilla.redhat.com/show_bug.cgi?id=3D1835736
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  meta/recipes-devtools/python/python3-pip_26.0.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3-pip_26.0.1.bb b/meta/re=
cipes-devtools/python/python3-pip_26.0.1.bb
> index 1a2cbc397a..46fa63e6a6 100644
> --- a/meta/recipes-devtools/python/python3-pip_26.0.1.bb
> +++ b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
> @@ -34,6 +34,8 @@ SRC_URI[sha256sum] =3D "c4037d8a277c89b320abe636d59f91e=
6d0922d08a05b60e85e53b29661
> =20
>  CVE_PRODUCT =3D "pypa:pip"
> =20
> +CVE_STATUS[CVE-2018-20225] =3D "disputed: Exploitation requires use of -=
-extra-index-url with a private package not present on the primary public i=
ndex; pip intentionally selects the highest version across configured index=
es"
> +
>  do_install:append(){
>  	# pip vendors distlib which ships Windows launcher templates (*.exe).
>  	# Keep them only when building for a Windows (mingw) host.

Hello,

We have decided to upgrade sbom-cve-check on wrynose. This upgrade
include the feature of globally ignoring all disputed CVEs.

I've taken the upgrade in my current series so this patch becomes
redundant and I've dropped it, sorry.

Thanks!
--=20
Yoann Congal
Smile ECS


