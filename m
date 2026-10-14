Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30587CC6B1D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:56:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9634.1791971803876256259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VG7+/jcy;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so31115285e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 02:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791971802; x=1792576602; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NiKqSTCSWEe5KEXyJN0brjHP/YvuFQJoA+Sr4bP4XU=;
        b=VG7+/jcyDU+D2+4KKT4dRbN8tXP6ZfJ2u2vZmValAuZTwW7ooDwvkbfea+BzJf1Jz3
         vjDgx5GIeRwWVmK0QxbbVYwINqn/JQMjZ653VVdOextHaStsKJTOq1pvUx2KbM6F5lDt
         Tlo0Z5F95W2RAKQ+JFkH3LTbY4DT7dQ+2Mbps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971802; x=1792576602;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8NiKqSTCSWEe5KEXyJN0brjHP/YvuFQJoA+Sr4bP4XU=;
        b=A5vq3kXCLti5tnhE6N3NN4i9bnnFUjdwEjnEdEbWXG3FuUuPeg58HXaNnhWnRENIXM
         qDEV0LxT6/q/DKitVWckAqVneJRXZQ/ai8FI/3GMxNkGtuH0+O5zdzQCx27UFjcUq7Mt
         daOnVDZ0WDtHv/T8jjPCun/O1d4tqEPKYj8dsvhbKC1ClJvP2V95OW1/nR1fmPGZKYy7
         LVgmMW6d5SS+eJKJunYsj28a4rUp/T8GgsHVjot519MCr1Slo7KT4yKrzNIJc9UU5FsQ
         XAdvc1A6gIgwgvDkCq47h/zk2pYpgqz+8rbYez/n+KTWaPu4NL4vqfFjh4yyyRMl1AWi
         V9Vw==
X-Forwarded-Encrypted: i=1; AKwUvByh8S1d2d+NgtEKy/d1YDGY2+UOohWAebGXUWaVfwY4X/msRg1Name6td2s/juvo9uZNp1ULs3Cz1QBUWP1+KkD3g==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLu0vWEIwiLLZADWNgqdjjwNkXN6G+6fxRhGVwRIUCJSlLAl0nF
	5d+yWK0Nj08wmgXWCXKoaQ/48ngp5QlIOxXJb0ZDCONn0Ht5hbxMmDvBppZPVMGH8pA=
X-Gm-Gg: AYBFou3vIfV1Aga5YdyUY9pd1GBS8+wKLqIMKFzH0DPNtm/nkLwneBjioZqBPn5YkSM
	2YclwnJ87APyG/W2K3AHcyfxnba5KqyPIvq3Ke7+tF3O3skM11pSkeZ5BpVQT2Cj2CRURWSbp/J
	WwfzvLkZNGpTT4qRVGx32AoZ37eCCUgLFI0pODG8pAPKgw1jJshvjENCZgXhjLoJWqs8R/XN1WH
	BzugFgbrCWZiM6skAjjz92wjWLa7XKpM494vH/c/EdGH2ZkyuTwqqQnP1ys4pL4hpGjJqyncWGP
	RJn/liiyLc9dOig7IJuJu4lbREkWMdSmorMKcpu2iK52ytFnEQmuAoEhMKfS6hcI7GFqYufgjPc
	28/+BKuLqcCHUGBOKRksMLFMBLcsR6h1cWoCS0rzp5mwoa3PIONrThlVuIW0+t8zrUMP4L3P93W
	HTmK1tkeFY2GoOvd5ySUAa6v5nwY/iQuYBxOUptRbGjhUVAsUz5XsG+om+o9bZ//pqptFjLCYJ+
	DttXKvk2oyBca3GkOgjS8sW35/Tsx3wJZWSeWJW/5YxKT8g8i/ugdizviY=
X-Received: by 2002:a05:600c:6207:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-4a18e4aff66mr293671755e9.18.1791971801874;
        Wed, 14 Oct 2026 02:56:41 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm436696955e9.4.2026.10.14.02.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:56:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 11:56:41 +0200
Message-Id: <DM4GZKPENPVJ.3SEPU48GQQGGI@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCHv2 1/6] bind: fix for CVE-2026-10723
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261012043822.12852-1-hprajapati@mvista.com>
In-Reply-To: <20261012043822.12852-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 09:56:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247752

Hello,

On Mon Oct 12, 2026 at 6:38 AM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Pick patch from [1], [2] & [3] also mentioned at Debian report in [4]
>
> [1] https://github.com/isc-projects/bind9/commit/c9cb6a5e24e43489cf3fd4d4=
cc2193b6a74499cb
> [2] https://github.com/isc-projects/bind9/commit/35e3d49d2222c13786a06021=
c7ed583d2a656e51
> [3] https://github.com/isc-projects/bind9/commit/833dd3b230b92596074e8da1=
5b12298f46c939f2
> [4] https://security-tracker.debian.org/tracker/CVE-2026-10723
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../bind/bind/CVE-2026-10723-01.patch         |  70 +++
>  .../bind/bind/CVE-2026-10723-02.patch         | 496 ++++++++++++++++++
>  .../bind/bind/CVE-2026-10723-03.patch         | 310 +++++++++++
>  .../recipes-connectivity/bind/bind_9.18.49.bb |   3 +
>  4 files changed, 879 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-10723-01=
.patch
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-10723-02=
.patch
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-10723-03=
.patch
>
> diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-10723-02.patch =
b/meta/recipes-connectivity/bind/bind/CVE-2026-10723-02.patch
> new file mode 100644
> index 0000000000..b2ecf1a669
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/CVE-2026-10723-02.patch
> @@ -0,0 +1,496 @@
> +From: Alessio Podda <alessio@isc.org>
> +Date: Wed, 3 Jun 2026 10:42:43 +0200
> +Subject: Reproducer for #5874 NSEC3 impersonation
> +
> +LLM generated.
> +
> +(cherry picked from commit f3e2eb333be3ac636f745aa13cfb8d9ee8af87d8)
> +
> +Origin: https://github.com/isc-projects/bind9/commit/35e3d49d2222c13786a=
06021c7ed583d2a656e51
> +Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-202=
6-10723
> +Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE=
-2026-10723
> +
> +CVE: CVE-2026-10723
> +Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/=
35e3d49d2222c13786a06021c7ed583d2a656e51]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + .../ans1/ans.py}                                   |   8 +-
> + .../repro_5874_nsec3_parent/ns2/named.conf.j2      |  35 +++
> + bin/tests/system/repro_5874_nsec3_parent/server.py | 249 ++++++++++++++=
+++++++
> + .../tests_repro_5874_nsec3_parent.py               | 144 ++++++++++++
> + 4 files changed, 433 insertions(+), 3 deletions(-)
> + copy bin/tests/system/{glue/setup.sh =3D> repro_5874_nsec3_parent/ans1/=
ans.py} (83%)
> + create mode 100644 bin/tests/system/repro_5874_nsec3_parent/ns2/named.c=
onf.j2
> + create mode 100644 bin/tests/system/repro_5874_nsec3_parent/server.py
> + create mode 100644 bin/tests/system/repro_5874_nsec3_parent/tests_repro=
_5874_nsec3_parent.py
> +
> +diff --git a/bin/tests/system/glue/setup.sh b/bin/tests/system/repro_587=
4_nsec3_parent/ans1/ans.py
> +similarity index 83%
> +copy from bin/tests/system/glue/setup.sh
> +copy to bin/tests/system/repro_5874_nsec3_parent/ans1/ans.py
> +index 82240a7..614f26a 100644
> +--- a/bin/tests/system/glue/setup.sh
> ++++ b/bin/tests/system/repro_5874_nsec3_parent/ans1/ans.py
> +@@ -1,4 +1,4 @@
> +-#!/bin/sh
> ++#!/usr/bin/python3
> +=20
> + # Copyright (C) Internet Systems Consortium, Inc. ("ISC")
> + #
> +@@ -11,6 +11,8 @@
> + # See the COPYRIGHT file distributed with this work for additional
> + # information regarding copyright ownership.
> +=20
> +-. ../conf.sh
> ++from server import main
> +=20
> +-copy_setports ns1/named.conf.in ns1/named.conf
> ++
> ++if __name__ =3D=3D "__main__":
> ++    main()

The above change does not look right to me (and is not in the upstream
patch).

But, before sending a v3: This series looks like patches from
the 9.18 branch.
Do you know when the 9.18.51 is expected?
Is there a reason to rush/backport these patches instead of waiting for
the release (like we usually do for bind)?

Regards,
--=20
Yoann Congal
Smile ECS


