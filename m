Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201CFC3ABAC
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 20:20:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.29136.1746217197550591363
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 13:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VUwRPzTD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAqmx015482
	for <openembedded-core@lists.openembedded.org>; Fri, 2 May 2025 20:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q1jb4NkP3worzJbAgqtl81CW
	oKMsjcG62BdE06niYZo=; b=VUwRPzTDTnCP/LPFBJ6uJ5ZDCsPx0E1RhUPJSf8G
	OQHTKcAdYgabLmO/hkoKfxoFB8zWyEnuoJM5pPYVf+AKUcGtnGg3x69recfqO7Dd
	FI1tkf0iLcNN7mZveW9NavWDJkO4mRZz7USMl4T1ye5tEFZxcEUKFQFMjRzETnhv
	8tteIMcqJfzIG0hSIexFLPjrttxY+vzQUNAbRqbPHQQE1fB1D2C2Xuv9Gxidd8RY
	6QL3fDqUdPgQVVir9FCIjQ3bWXz8Ui9iit9boUa7OPRgsvu0/JLduo9CUalcurLn
	L6s02sKH6CNl3sYem8AyqvWzeRKMZ1jukeOCa7RcRhzfAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u81b65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 20:19:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c544d2c34fso361669885a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 13:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746217195; x=1746821995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1jb4NkP3worzJbAgqtl81CWoKMsjcG62BdE06niYZo=;
        b=wKZXijG/Zhf+jSQxq3orH939/ior3ndPn0T/mdbQYX4QtkX7pHsit7xzjpflT3mzyY
         lunCx+iY3iKapGzjR8eVUggu3fNoYame3ZD+f1rVpkfLZxbQcOOZjUUdK4e+Rf0pzxzF
         q6Y4APZf/baUpgXeEPwjseh3/bbmhhLfypQGiHorl3vRzq0E/Xj9TFh0v9J/j/+8pgpl
         6enNZnf+QqBJNbnsrPtyOLXQXjVsAmOIEdzZ68DIrqq3bvUWVOGyowcrGUFelohnO9kf
         PlJB5mc8syuoFEW2bp0HU5mpPyB8MIdoOcO+GQilV2Glk9ANx4AWDudqAXVAl2oU25J9
         KBWQ==
X-Gm-Message-State: AOJu0YxT2VkLzBTlIDO3NMoEwWxu2jmHpkUIbfSXW0j49hfmc+L4mwXV
	RS+XA7M9JD3VgRJf/0uZTrhyDHeNbk/xbUIM5NWrETZJJCN2WBjBpPjPEQ0wILs++X+dVAlT64H
	TpRywV3hzgtPMvmEJ8dUAz2ZUSrjMFz+eAETIowoa/SNg5BOOjeqhuqhnXwXTnGX3mw1HPygwbv
	B0XsE=
X-Gm-Gg: ASbGnctJLv5BK9kMVE7Lunh1qVipSkOAyMpe5fdHLXTpvYY6IFYPUVn858E0Wbf2Vx9
	UN9Lt444mXuVI9GcYAVR3q91eXycGvfyd18incx0wwC76Xdg0FIH+bjWlYv2y7Yr49taE4bsWge
	RkqT9Dh1fH1Xv+R2XjzUstyT3shJ89v+IlEemS2PFeW7XHpuXMKaB/WGrp30/yvdFYtXhAjPifG
	7JuuPTkeymSzY0m4pIJYRYDLMkDj0u+CtWw4CxXNPqoTuv5KF8zM1cKaLJ8kuXMNBaKIxh+rZhD
	jRYpWAyNRNtazYn10V6g0nx6m0fL8nwj9WyRKJLqftUq8K7QbkJWslDu2TCm4hzYo1OZ/AxGHPk
	=
X-Received: by 2002:a05:620a:2989:b0:7c7:a554:e2a5 with SMTP id af79cd13be357-7cad5b8d0c3mr518025085a.44.1746217195412;
        Fri, 02 May 2025 13:19:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEinAjMMgxKMzU9zxa4afMUq/M48qvK87uY7phMctmHq4Gnr7/ON9zY8bbPMPZ9ftb4ripFeA==
X-Received: by 2002:a05:620a:2989:b0:7c7:a554:e2a5 with SMTP id af79cd13be357-7cad5b8d0c3mr518022085a.44.1746217194979;
        Fri, 02 May 2025 13:19:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c8e69sm468015e87.100.2025.05.02.13.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 13:19:53 -0700 (PDT)
Date: Fri, 2 May 2025 23:19:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v6 3/6] mesa: Pass needed clang flags via
 BINDGEN_EXTRA_CLANG_ARGS
Message-ID: <coea7eqq4tekzubxffzhyom5vbhfl3fhh4fv25eht2inzpg2mn@nkb7tzza3fn3>
References: <20250502-clang-merge-v6-0-00f2c2e9ff68@gmail.com>
 <20250502-clang-merge-v6-3-00f2c2e9ff68@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="mcjvn7p6xpbz3zhl"
Content-Disposition: inline
In-Reply-To: <20250502-clang-merge-v6-3-00f2c2e9ff68@gmail.com>
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=681528ec cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BdmUbkx-uRjU-MmdZXYA:9 a=CjuIK1q_8ugA:10 a=keFKexZyN-4PHm5qui8A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7ucl4_72jHxE92CiLQarrcDdYw1y2Ln9
X-Proofpoint-ORIG-GUID: 7ucl4_72jHxE92CiLQarrcDdYw1y2Ln9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE2NCBTYWx0ZWRfX4lliwniFz4U9 Z75j4ybk93BiaSY9YS/VEwuRH7Rn8g1udp0JphN7HWitp95XEH+RRh9nrv7pwa8piH0YG/Qgh5j dO/2jPKFKAloLgktShhELIEM/1IF1XKkYaXvktRMOVvYITR4qh0K4OjfKpWaOupAg+/skBlS0Wv
 B3t083cSVXWrQihfGZuGyD8HziM9YBdHod8rNKWIRpP2eRADCszDDAvWBzrDarr6D6zyb9km0gh W8olTo8Qa0CagFQZ294sZT6uVPtZ+HjUwRGCrlwG2PQySyCwJf0w+SVOqts1TFNYYhnBZlPXp3H 5Kk+xOPis/2umMc4dke4sB7GB56ACibqksaxDG6NFJevHqksAf49XnnAeGfc77LqZQ4HZ+pNAXN
 E7lBC4tr+5o1Mvigo9UNiUFhPZVw0YLAUDsox3QxRJvcznotsAZbWmyHTfza5004YHElabpS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=411 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 20:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215920


--mcjvn7p6xpbz3zhl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 02, 2025 at 09:55:17AM -0700, Khem Raj wrote:
> This is needed for clang to find the c++ headers when invoked via
> bindgen
> 
> Fixes
> | /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found
> | Unable to generate bindings: clang diagnosed error: /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found
> |
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 4 ++++
>  1 file changed, 4 insertions(+)

I still think that the attached patch is a proper solution.

-- 
With best wishes
Dmitry

--mcjvn7p6xpbz3zhl
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="v2-0001-meson-correct-bindgen_clang_argments.patch"

From b88d59727572f7f65d40cd4eeeb4e42b61254429 Mon Sep 17 00:00:00 2001
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 13:59:01 +0300
Subject: [PATCH v2] meson: correct bindgen_clang_argments

Follow the changes in Clang search paths and specify sysroot via the
TOOLCHAIN_OPTIONS, otherwise clang will fail to find system headers when
executed by bindgen.

For SDK packages TOOLCHAIN_OPTIONS don't contain full sysroot path, so
specify the correct directory explicitly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/classes-recipe/meson.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index ef45a034a767..c8b3e1ec29a9 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -62,6 +62,14 @@ def rust_tool(d, target_var):
     cmd = [rustc, "--target", d.getVar(target_var)] + d.getVar("RUSTFLAGS").split()
     return "rust = %s" % repr(cmd)
 
+def bindgen_args(d):
+    args = '${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}'
+    # For SDK packages TOOLCHAIN_OPTIONS don't contain full sysroot path
+    if bb.data.inherits_class("nativesdk", d):
+        args += ' --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}${prefix_nativesdk}'
+    items = d.expand(args).split()
+    return repr(items[0] if len(items) == 1 else items)
+
 addtask write_config before do_configure
 do_write_config[vardeps] += "CC CXX AR NM STRIP READELF OBJCOPY CFLAGS CXXFLAGS LDFLAGS RUSTC RUSTFLAGS EXEWRAPPER_ENABLED"
 do_write_config() {
@@ -93,7 +101,7 @@ cpp_link_args = ${@meson_array('LDFLAGS', d)}
 [properties]
 needs_exe_wrapper = true
 sys_root = '${STAGING_DIR_HOST}'
-bindgen_clang_arguments = ['-target', '${@d.getVar('RUST_HOST_SYS')}', '-I${STAGING_INCDIR}']
+bindgen_clang_arguments = ${@bindgen_args(d)}
 
 [host_machine]
 system = '${@meson_operating_system('HOST_OS', d)}'
-- 
2.39.5


--mcjvn7p6xpbz3zhl--

