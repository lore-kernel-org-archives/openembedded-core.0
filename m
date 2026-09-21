Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF95C982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 12:38:23 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47822.1789994292969187297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 05:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RRLyeHnV;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d8239so20971495e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 05:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789994291; x=1790599091; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9YhBrBNaCxMK0tS4Noh6UAase96snriSSoLTdTdmf9o=;
        b=RRLyeHnV690SuDVxz3rE8cU22wBgTYmalFIHgKqTztXwyKEwNC6FvVCsb5sBaw8tXC
         xcvGX/hBAOekhzaMMtcqsdEhrILDcxQwLBtLvNL7Uv8RhGsnMbBNqWdpNMpxY5XQeWnR
         OPA/VVF288gZijb5u+6DiJB8mvM55DeDs7ngg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994291; x=1790599091;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YhBrBNaCxMK0tS4Noh6UAase96snriSSoLTdTdmf9o=;
        b=gCrwhiSD4UqzCoUObPxEna0sMb4d1lYqcLBt+pdsrSreHo+x5Gi3wvA4a0DfJYOZ2M
         TTaldW+EEGLXkIiOcgjiBWv1F/g1pV8zKSSp5vsrecwnDPtmTZpPZruiwlXF9bkZdM1R
         DoCDVBi6634jVGk2opk4lVhjOAAS+otPHzx8AdbcDJiTU9lYbLKD/QlebgHGs1nI3M0y
         avB6unSNIDXuocGPuynn2oQbHuL283oxIhuftRWaAoyu3vckhr65kiyM2b/+D2QMwNhc
         pD2J+qbcDzKk5BRY3SvP5V6yB2QVUs00m8/79OAyayQWbhxqp8jf4b+VBK1qs3SJwz8Z
         ZSng==
X-Forwarded-Encrypted: i=1; AKwUvBzAppMf/Qi7Lx5fVtow5o2+jhNH1WyYROCaeZpp1d0RMzaLxCrs8LR4Z0z6f9gzfNHeO9SG/58Q8vMlypi7RYLjVQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++nF+Urx+lAwQrmwZyrcIIcQQXYeWC85HjoMukxWt7KnErB6FCFM
	sv4o/zz4s6XZlevpOCDIAMPsGH2f/yTeHmDaITmMVNcuJL3mBgBQdYcnIp7jNqqalhBs2XRnN48
	AzeR/VCw=
X-Gm-Gg: AYBFou0XFmvY7Gmwk7/OspNmCeaK8Sku1UuT7eVLofhFigROVupWA+TFfvhvuWOLhCS
	IEE+J7VqHEYP8x2m7JidOOO46Igdw2XuP9QnhB3sDX/zJ7da6+ihFqCwyPTChtGFS0fZxgAys6T
	V/Fsxpp/HVDfbgmdFfruqjcaNMF13dEr+gZJasJ4fSEu2u0/w7XEnWagfy1sShGpyZiyGSVGZP4
	4paogKz29W9oHlPdmGH+aMMSllq7VDOtBKrXTG5KX2yxkdK5xyfTd3+IDBlYX4QwSVfrem2raJN
	FtCBGgKx7oqH8uvJUXIuoo09rPc67DcohbjCSAvNdo93VUkCaPdqWCg79B8JxQq6J6JXnQnELbf
	7lvc0Hn3HMjC4LYET+GuSE2IYWvqi8BRLcEtTtqItfEuL3CN7S6aaAqeLVitTPOxSz9TJ0xZFPt
	TRu9X5dymwZ1EIohYcfxi0YFlaNDxUsmBVEbsEDRwda05bUL71LekuSQOTEABZ/DSOab4+iPGIT
	7NdSA+XVjUHYls4ZVhcjyRE1TAncaofsuz1joG5OaH6M9B65pZ/gutBrJA=
X-Received: by 2002:a05:600c:a085:b0:49d:25b0:cc60 with SMTP id 5b1f17b1804b1-49fc5747f7bmr155975505e9.29.1789994290977;
        Mon, 21 Sep 2026 05:38:10 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bc34sm219258495e9.10.2026.09.21.05.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:38:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 14:38:10 +0200
Message-Id: <DLL00OT9VKC9.JRZSZU4BMX6L@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] libxml2: Security Fix for
 CVE-2026-86137
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sdoshi@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260910200329.842463-1-sdoshi@mvista.com>
In-Reply-To: <20260910200329.842463-1-sdoshi@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 12:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246328

On Thu Sep 10, 2026 at 10:03 PM CEST, Siddharth Doshi via lists.openembedde=
d.org wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Picking patch as per [1], and same patch is mentioned in [2]
>
> References:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-86137
> [2] https://security-tracker.debian.org/tracker/CVE-2026-86137
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../libxml/libxml2/CVE-2026-86137.patch       | 48 +++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch

Hello,

It looks like something in this series is breaking ptests:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4604
https://valkyrie.yocto.io/pub/non-release/20260921-71/testresults/qemux86-6=
4-ptest/core-image-ptest-libxml2/log.do_testimage.364096.20260921110838
|  1314	Running runtest
|  1315	Validation for ./test/VCM/21.xml failed
|  1316	Validation for ./test/VCM/AttributeNmtokens.xml failed
|  1317	Validation for ./test/VCM/v10.xml failed
|  1318	Validation for ./test/VCM/v11.xml failed
|  1319	Validation for ./test/VCM/v12.xml failed
|  1320	Validation for ./test/VCM/v13.xml failed
|  1321	Validation for ./test/VCM/v14.xml failed
|  1322	Validation for ./test/VCM/v15.xml failed
|  1323	Validation for ./test/VCM/v16.xml failed
|  1324	Validation for ./test/VCM/v17.xml failed
|  1325	Validation for ./test/VCM/v18.xml failed
|  1326	Validation for ./test/VCM/v19.xml failed
|  1327	Validation for ./test/VCM/v20.xml failed
|  1328	Validation for ./test/VCM/v21.xml failed
|  1329	Validation for ./test/VCM/v22.xml failed
|  1330	Validation for ./test/VCM/v23.xml failed
|  1331	Validation for ./test/VCM/v24.xml failed
|  1332	Validation for ./test/VCM/v4.xml failed
|  1333	Validation for ./test/VCM/v5.xml failed
|  1334	Validation for ./test/VCM/v6.xml failed
|  1335	Validation for ./test/VCM/v7.xml failed
|  1336	Validation for ./test/VCM/v8.xml failed
|  1337	Validation for ./test/VCM/v9.xml failed
|  1338	file result/VC/ElementValid2 is 111 bytes, result is 227 bytes
|  1339	Error for ./test/VC/ElementValid2 failed

Can you look into it?

Thanks!
--=20
Yoann Congal
Smile ECS


