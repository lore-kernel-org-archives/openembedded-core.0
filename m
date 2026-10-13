Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A446CC6B12
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 20:10:39 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7104.1791922231972265048
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 13:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=b9ZPj1Gk;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso2136522f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 13:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791922230; x=1792527030; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CL6lj5wBmvmXu2usvh+9+kfcBMTg4blBO/uxOah8uhA=;
        b=b9ZPj1Gkrcr/tmiTxox8gWliSSEBPqj+vOCJX6f5oElYKT8rJCeUNT33v66KH+B9PL
         EncvKFmFKtFn+ya5LqLVqHkF2RnjVCjSb3eWAuavHgwvmYUshlhYiUrGFEUmMfOsyxXE
         CkRjCRJN9dEj2tF0BGU+c3l+TM5ZKnIIz/Sfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922230; x=1792527030;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CL6lj5wBmvmXu2usvh+9+kfcBMTg4blBO/uxOah8uhA=;
        b=T6yDlGswmJQvyarNXPIFILqCtUqm+qAEU1xKwWOqbw5tBlkuVbNvGkgwRE2gdL9h9D
         j2aFL4nfv8BjVP51eYW/7hli48HsHTgaDS7GYnXFjXK92mUxsjy2rVEdrFPHH2Rwab3/
         P7dY98cqqaWl6vxvEdzWsf4sWNYF+t7WDOeuCcyqq/aRRsR4+yaH7QmVjso1zu9EY5h6
         9WqrP6ROCMTiVPB9j2eq2Z6xAOnM3GiWqTZLH78a8cjmLCmMyyXuQ2lz9Xy2OHJUsG5O
         VEsybDuNCgtF+WA9qKF8gtltj09bLBjn7dVokSt1igvpInNKCNYSpX0PZJsHcJR3pPdt
         bBzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuiEOT0ep/bAbOUa2dkxOQFQ6GV5JdsqG9tA9NU0eHiK+v9yp9LG4smt93FOYse5lpt+Bf5abiIqvEyYMvhUTa7A==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKpGoHavFWGr8cESSyc0Wj7f4ILxwE6j4XCwLFCOuDYLmLvKyqf
	DrDCu+Myobu++z1ODzY3qooUk9h7F324CWVFazCT3HcAHQy48AJXNdB3nVa6FD5a/bU=
X-Gm-Gg: AYBFou03u6nxFWkSLYsD+9+E7rLFEeMLx1EMgwgyCphHbrIMtN4i38uK8T7FS01WdXx
	tw/LdFtx6uVsNhzDQpS9Otiqme1QB/CEOaRkdgWv9gG1JXUnKeTDsFjODmtCDoryDCVVNtxOHo+
	JUHwygPjDfYD2Y1fNNccktLV2/ujpoqr5nU3Os9PaKex0gfABUUcBLV3YXB5VbWLr+25qPbdB5C
	3Rgf+W0/3eo7s0nq6l8C9SYKxEPsYH/aBXjZLjne3OhHEsXSvplCa2Ks5/K8k0x2EgDm+OANgiX
	cP2N9o+Cf6UMuK50en8I83hGm5YC/XiDiqNvV+jfaPP8Db0P7EppM4nXK5uE8E2gSnm/rqfO7G1
	+mvQIl+dol1Z4V7G1H3G1dH7MgjrxzBlNWd0gPu623t0ut/85YEOoCbodVZJ9G4X5ECvhtoQPcy
	+t5V5pnkKbCYecFEJYZR8cusyMFfGd5b3xdU1PvGii8b93w1CyT8tbpnPQxsYVal5SQ6BztZj6A
	tU2pwC49N+x3FZ7OZLrdqBd16ksnDrS0GgYenklJuV61bAQUln7yEDIjsMrPg==
X-Received: by 2002:a05:6000:1ac5:b0:487:91e:d8ed with SMTP id ffacd0b85a97d-48dba784ca9mr26725957f8f.2.1791922229951;
        Tue, 13 Oct 2026 13:10:29 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0967acasm5795260f8f.2.2026.10.13.13.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:10:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 22:10:29 +0200
Message-Id: <DM3ZEZORCSRZ.27QK3IA59S0GQ@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 5/8] curl: fix CVE-2026-8927
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <devanshp@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261007112403.486499-1-devanshp@cisco.com>
 <20261007112403.486499-5-devanshp@cisco.com>
In-Reply-To: <20261007112403.486499-5-devanshp@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 20:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247738

Hello,

On Wed Oct 7, 2026 at 1:24 PM CEST, Devansh Patel via lists.openembedded.or=
g wrote:
> From: Devansh Patel <devanshp@cisco.com>
>
> This patch applies the upstream fix as referenced in [3], using the
> commits shown in [1] and [2].
>
> [1] https://github.com/curl/curl/commit/1968b32afd8e41fbb87f8911d15c552c6=
b705385
> [2] https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57=
aacb567
> [3] https://curl.se/docs/CVE-2026-8927.html
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  .../curl/curl/CVE-2026-8927-dependent.patch   |  41 ++
>  .../curl/curl/CVE-2026-8927.patch             | 378 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
>  3 files changed, 421 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927-dependen=
t.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-8927.patch
> +diff --git a/tests/libtest/lib1647.c b/tests/libtest/lib1647.c
> +new file mode 100644
> +index 0000000000..16dc9d711c
> +--- /dev/null
> ++++ b/tests/libtest/lib1647.c
> ++/*
> ++ * argv1 =3D the first URL
> ++ * argv2 =3D URL2
> ++ * argv3 =3D credentials 1
> ++ * argv4 =3D credentials 2
> ++ */
> ++
> ++#include "test.h"
> ++#include "testutil.h"
> ++
> ++/* this is meant to pick up the proxy from the environment variable */
> ++static CURLcode init1647(CURL *curl, const char *url, const char *userp=
wd)
> ++{
> ++  CURLcode res =3D CURLE_OK;

Hello,

This patch contains changed code from the upstream patch. For exemple,
result -> res. This might seen minor but it might hide more problematic
changes.

Can you check by comparing with upstream patch that the diff is minimal?

Thanks!
--=20
Yoann Congal
Smile ECS


