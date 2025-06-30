Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30814C8302F
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 21:10:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.51983.1751317851400320429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 14:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CZ5UfeCh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UGMTF6032426
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 21:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FysZaUGyvp/xPu6LxvxIkqQ2
	AHw8eqYiVGKs4qNWYX4=; b=CZ5UfeChtKQsHihRGaMNkTNx6cPn6E5RkyhCaTkj
	7X4JBxafWzGvF9A+Vqc7rPRHHNhPZzldvXgI2IE0vQGCw3K8lQwn4a+DoUu/8LsJ
	04bSlE1ids2qAiiPP+dy0Y84ocPuAM64ed+9Cf3TvWdM5Znm+lY6URLOhuFO1dvw
	WwJagqw1ELomgQbLZL5OGBr8y4O21hMwVkTkgAajyylHxzYrTgYuJCpCIHyeAqPP
	57PdqUp/a6jxtlUaVIL3Rpzu+i2+0MTGD+AbQ2u4bFZ26MJyL55kVc2Lfj8uMu2d
	KBkTEBmVlKlRABIJ0QCHSZDgm6OU4tw76nYb0dHtgORPQQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k6akb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 21:10:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6facf4cf5e1so50141836d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 14:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751317849; x=1751922649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FysZaUGyvp/xPu6LxvxIkqQ2AHw8eqYiVGKs4qNWYX4=;
        b=KdJqvirUF+IoTEtbXaD/t16nIOF548g7unJ6P4X0NaUkkeiq+L+IyQB56vD3TJI9aE
         mEaG0orzfNJ+nn/bM7C4sMKU3gKKIEz2wupF9O+HXtK63oQa8vU0TJsCIuFpEXbXMIXk
         yTuD/pjfLk35IGLhuZwO2xd3R/vG4rmYsOhRTVpBCgi9GUMZPdIFNk/DyJvNbel/UN5Z
         25kCpGLYlVYcY5orz9dy85DZWaFmcmgUOQ4KhGi0V4GS1r+J6aGrf/iaD7dThdaY3OGu
         Ph1ZIS55aMEFr9sv+pROygJPw0v0hAz1vuwAtZ2G4RAIVFg+ENzieisrA9CfodzXXT5O
         56aw==
X-Gm-Message-State: AOJu0YwSu/+CNuG9bAWaJZQO/zDVCxMSgV0yCcqaBDnIoSvKAM0sNpuJ
	LQMcFmwoyAVGzzgOG/h4K8lG1KjAA6M5jXS4S/+Xb10MiDEVwA/1kw9ZHtwephHdUgLSqsVadO3
	iEgp9pS0WTsQUGpXt5ImzGH2A9svmuqC/7gdQELFACGyKpOwVPF8mk7CTJXQQzruU/ma2/+kFdv
	gDQpRj1P2zNmAu6x2TWvp8
X-Gm-Gg: ASbGnculXy2kbRVMsFbtsknYLg27fO+WNBXKYh/VREalic43td43vXC+4k9Efty0FDA
	hfCtcm+ZvcsfAjbyVyhiJlz6Csm9koynqzsp2+UnIGYfB1udgDQUE3pLfECrS8H+zKpZBsbdo8K
	kRt7sQ7EP4oJ5H96BD75EMp2KfccZIY6EXRL9igfFArEFmAyax4uUIZhkZN9nH6EKIwgdrp7/sS
	Pu2DZLirEIIL5n/bEvrl9paO5k7ApYVuLvk8yQ76M+cdW0kQ5qN+8+/N0t811wxb0epVh+hKWO8
	agSwX88FdWoblYhHI+b9yr5FNy2yHvZzs0tK8/PfGhLeDbTLSBE2KtgdokEhja5405nQTkKCYGD
	DWGSpjunyq6o3XPFvpSPlzT/vJCGhxkEgT9w=
X-Received: by 2002:a05:6214:260b:b0:6ff:16e4:30b1 with SMTP id 6a1803df08f44-7000252eec8mr208728446d6.1.1751317849332;
        Mon, 30 Jun 2025 14:10:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsGkq8lvkcb4EUH7GGO7A0XzD2poz2uOYK2Xx/Ti+EOzJuXIgsXTR/ItEUPCBIYhw+F50juw==
X-Received: by 2002:a05:6214:260b:b0:6ff:16e4:30b1 with SMTP id 6a1803df08f44-7000252eec8mr208727986d6.1.1751317848866;
        Mon, 30 Jun 2025 14:10:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ec5e27sm13384891fa.56.2025.06.30.14.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:10:48 -0700 (PDT)
Date: Tue, 1 Jul 2025 00:10:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 22/37] mesa: upgrade 25.1.3 -> 25.1.4
Message-ID: <npdkml4x4sxxdljaiv4e2tbwtdwejbsnyqsummjumsqjbn2pqd@3kbwkp6hy3af>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
 <20250630091315.1897-22-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630091315.1897-22-wangmy@fujitsu.com>
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6862fd5a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8 a=omOdbC7AAAAA:8
 a=KKAkSRfTAAAA:8 a=rSyILtt8RgHCw7j8oVQA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE3NCBTYWx0ZWRfX7OXH8Zols0kD
 RH6EjuNB0xZsWHfkglvDaU84DdBVlEsnCygBTpnEZSx5bbvICA2bd7hT67yOT35C94xz9XGXFn1
 qYLQgezoxdH4r4zmC/j+IBJoQ/nZ46IRqKCMkURLW/6R8zAXJYpg47TDguAoRv/HmcYJ/sXVnbq
 oU3I0eLPf4CgCJo+Y0ubvZV12SKLgPPDlkLhH0MqGLsjy8WJyaBqFt+fCe+rsNJO1PByGJVFocf
 HF+CbQeM4ycyiMOOjp4xGop0+luK5d8pZblsXLVeNRTgJPyMiwdHbwd969VLPS8h809XDTfpv1T
 NGnpsUEXo1+Z6g2hJfRoNLx7wLersE+JAmO/wpONk4yOyMejhaxwXHwyEllGCxIscZZEJ9QLbmU
 5ln8ttMfQ9V5lQXH1JcJi4jkedJ0thMSzVWr/X7qxfqBzFxK/xw+jF9C1A7mJB8O20SE+Mz+
X-Proofpoint-ORIG-GUID: Xh8NRztMozjkGYmt7BEdGOejMHKKwykR
X-Proofpoint-GUID: Xh8NRztMozjkGYmt7BEdGOejMHKKwykR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 21:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219541

On Mon, Jun 30, 2025 at 05:13:00PM +0800, Wang Mingyu wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> 0001-freedreno-don-t-encode-build-path-into-binaries.patch
> refreshed for 25.1.4

Please drop, there is no need to refresh it: no fuzz, no changes.

> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...on-t-encode-build-path-into-binaries.patch | 23 +++++++++----------
>  meta/recipes-graphics/mesa/mesa.inc           |  4 ++--
>  2 files changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
> index 953a724dc0..059ff46cef 100644
> --- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
> @@ -1,4 +1,4 @@
> -From 027ac36756cc75eea9ed4fee135a351af30b35fd Mon Sep 17 00:00:00 2001
> +From 1e76f138b1eb3102a84e032961e560aeb9c70a6b Mon Sep 17 00:00:00 2001
>  From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>  Date: Tue, 16 Jul 2024 12:32:47 +0300
>  Subject: [PATCH] freedreno: don't encode build path into binaries
> @@ -13,13 +13,14 @@ it manually when running the tests.
>  Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30206]
>  Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>  ---
> - src/freedreno/afuc/meson.build   | 4 ++++
> - src/freedreno/decode/meson.build | 4 +++-
> - src/freedreno/meson.build        | 2 +-
> - 3 files changed, 8 insertions(+), 2 deletions(-)
> + src/freedreno/afuc/meson.build        | 4 ++++
> + src/freedreno/decode/meson.build      | 4 +++-
> + src/freedreno/meson.build             | 2 +-
> + src/freedreno/registers/gen_header.py | 7 ++++---
> + 4 files changed, 12 insertions(+), 5 deletions(-)
>  
>  diff --git a/src/freedreno/afuc/meson.build b/src/freedreno/afuc/meson.build
> -index bb7cebf5a748..351cc31ef2de 100644
> +index bb7cebf..351cc31 100644
>  --- a/src/freedreno/afuc/meson.build
>  +++ b/src/freedreno/afuc/meson.build
>  @@ -56,10 +56,12 @@ if with_tests
> @@ -50,7 +51,7 @@ index bb7cebf5a748..351cc31ef2de 100644
>       )
>       test('afuc-disasm',
>  diff --git a/src/freedreno/decode/meson.build b/src/freedreno/decode/meson.build
> -index 469eeb4eb597..dfa1c12d0d9f 100644
> +index 469eeb4..915ba11 100644
>  --- a/src/freedreno/decode/meson.build
>  +++ b/src/freedreno/decode/meson.build
>  @@ -194,6 +194,7 @@ if dep_lua.found() and dep_libarchive.found()
> @@ -72,7 +73,7 @@ index 469eeb4eb597..dfa1c12d0d9f 100644
>   
>       test('crashdec-' + name,
>  diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
> -index 98e49b8fcf0e..145e72597eb9 100644
> +index 29e1bc4..afb7426 100644
>  --- a/src/freedreno/meson.build
>  +++ b/src/freedreno/meson.build
>  @@ -6,7 +6,7 @@ inc_freedreno_rnn = include_directories('rnn')
> @@ -85,9 +86,10 @@ index 98e49b8fcf0e..145e72597eb9 100644
>   dep_libarchive = dependency('libarchive', allow_fallback: true, required: false)
>   dep_libxml2 = dependency('libxml-2.0', allow_fallback: true, required: false)
>  diff --git a/src/freedreno/registers/gen_header.py b/src/freedreno/registers/gen_header.py
> +index e1cfb5f..4e3db12 100644
>  --- a/src/freedreno/registers/gen_header.py
>  +++ b/src/freedreno/registers/gen_header.py
> -@@ -885,13 +885,14 @@ The rules-ng-ng source files this header
> +@@ -889,13 +889,14 @@ The rules-ng-ng source files this header was generated from are:
>   """)
>   	maxlen = 0
>   	for filepath in p.xml_files:
> @@ -105,6 +107,3 @@ diff --git a/src/freedreno/registers/gen_header.py b/src/freedreno/registers/gen
>   	if p.copyright_year:
>   		current_year = str(datetime.date.today().year)
>   		print()
> ----
> -2.39.2
> -
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 6b42a238cc..3d9e9ec91f 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -20,8 +20,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
>             file://0001-dont-build-clover-frontend.patch \
>  "
>  
> -SRC_URI[sha256sum] = "ffcb6cadb5fd356d56008e6308641dfe4b2929f30139f6585436ca6e3cddba7f"
> -PV = "25.1.3"
> +SRC_URI[sha256sum] = "164872a5e792408aa72fecd52b7be6409724c4ad81700798675a7d801d976704"
> +PV = "25.1.4"
>  
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>  
> -- 
> 2.43.0
> 
> 

-- 
With best wishes
Dmitry

