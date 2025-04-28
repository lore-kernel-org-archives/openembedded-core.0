Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86EFC369D3
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 11:03:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.45440.1745838206720027455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 04:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RKtu3z/1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SADGvm010086
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 11:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XN3oyzyRM13cNQH+56PPa+9M
	8bgcPUzjfRszykMfQYU=; b=RKtu3z/1cSUCb7I2udan+V9gMnsxTBdZGFwrUBEg
	sJdc8KvJjHuLBf7LRC0m4U9Gdniarr1qpee8nx5BAS6SPKYOmTt8fyDdR1Basv0D
	+m5pWulgBvuXINqXZvluoREABAcjLCUoPRf7JP4YW4mDmwpOCi6yu7kRf1c7yOLH
	rXb3lrSiiwzDc/6vu4kaqsAV5Zr0zcEYeoGmYDD2Tvk4YObYMK0RjGkl80ngvS0N
	T5QkCu7X2bgGZljp1f6dr3nH0+K63dQIzmrqgbbIiLrg5Ns86t3hQvAG7MLqyjl1
	KyISsqodAd3oJiihWq5i7JsWVhoxn2howcn2IsYMHq/97Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqh37x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 11:03:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5750ca8b2so722974985a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 04:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745838205; x=1746443005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XN3oyzyRM13cNQH+56PPa+9M8bgcPUzjfRszykMfQYU=;
        b=do8mGHdOK3kg2sGOcu9hj67jVweMaun8YBML2+EOG65AQ2NiIDGOQVxGRYdKwiILlP
         Zj4pw8txkNV9WeJSz3hM/g+TynBXqx4ltbDjglQN8JqdwmmkgiTO7ybqGq2eWdZ96qHD
         9US7hYVdjOXWrOUECyCr8G1e5eOpiSEVTZBuYiNbRGO37NJooNYeWqqXMx7KwNjiJrMQ
         L5HzksUrT8c+r6FlQUfaEVZdHThGzl5E8mxqYrQV3V90aEMzS6QZ+r1NQp5rNXReu4WW
         274lL9euQV0Hr+AVi2DY/Y7+w/jU1ceoD8j4NLbLSFeqH0cua4I4PPegjG5FxHNK04Dh
         9ptA==
X-Gm-Message-State: AOJu0Yx4ejEClngzC/On6L74IuazaFBg0/OzarNdfclwnse0ydBUOrzI
	AdiabjbD4D8/nzsJZXuMNR9OvScWdtfkaiws8ROS1TxZUma1OTuKtZhVuF9xumNgZljANZVqEac
	IYTfVLyfJ7YNvZ2QE1pK2B+tB91iDNEY5Z6od+wSaLCApx8LLTfszkFZYm9NGuYkaSglGAe2FXQ
	ndeMM=
X-Gm-Gg: ASbGncusSs3skKaDXeEcmh8P8/9Hb+Y4moY4oUuxgaqXpeIZgoRktNwjmQsPK+Ozfci
	j4L3Zr+tIe6Wqmne0yMqx4BP1F1tiuJL9xV2r8iRSY5EIogc6QQUSuYujfq/C3puDymHcLQzp0C
	OBxaBzL96cswELyakD1pc80K3/0EeSptyi0pMwtPLkQ8/L/KO4lqiC4a+YUfm5jTZldf/mU5UuU
	usJ4Nl49NClZl1gXmcBrCEksUm+O8TMS2ZHadnausPL9dGSl/QQ6KsIhjZL8vUZ17yVQQ5akA1o
	VnRbCQfY7RKCWTPED3Fgd/Nc/Soz4bdnoxy0pT/IST0Tem6W3QBLWxgPPGw97DfPegz9hm7I6kk
	=
X-Received: by 2002:a05:620a:4485:b0:7c5:a25a:f0f3 with SMTP id af79cd13be357-7c9606acd33mr1728705985a.8.1745838204787;
        Mon, 28 Apr 2025 04:03:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhLFve1l2sFCbTdZkcmAbHFl3xgXi+1br+OpR4qhTvnoz595B3wA7SmvF1lx2o3r2k+Jvr7g==
X-Received: by 2002:a05:620a:4485:b0:7c5:a25a:f0f3 with SMTP id af79cd13be357-7c9606acd33mr1728699285a.8.1745838204108;
        Mon, 28 Apr 2025 04:03:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb258c2sm1643679e87.32.2025.04.28.04.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 04:03:22 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:03:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 08/10] mesa: Pass needed clang flags via
 BINDGEN_EXTRA_CLANG_ARGS
Message-ID: <tims4g3kpjke7bfqfbvx2sfc5y2avhiyixn2sm7cgvwmwt7lid@3il6kjlvkpcd>
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
 <20250426-clang-merge-v4-8-42d205904261@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="lvrsif3kgmvfdutr"
Content-Disposition: inline
In-Reply-To: <20250426-clang-merge-v4-8-42d205904261@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA5MSBTYWx0ZWRfX7/w2vW45yV8P IIUmUt84cUZEtEvH57nh7H8F9tJ/OKbnsjq1l96KXTmFpD5BUgdtNHStbGKEAk9bq7h2720uRWG tWlWKJoWWSwhLoKi7rINYmV5fp4+4rlOLirJknKOETvpfLnJVAGXmgkF6XHvEBMHZOGG4Y5J3IK
 dgNQUY5gUBIFz2Ej9l5mqPXvJyMTJXJP+hDfk1LeceCVWblrcUSivKc1/E9xuXbxH4al4JD3Omv zQtrBmMdqnGQVBnymTDRiksqV+NpPZZgnCU9ImlKKayiRbPqwX8J/5PeoobUVsLGWKriZBjGaj3 2BfrukPkwrmeO1HMbG1qWfmn7lTMpNTtbtzBpMEa7cgAX0VpCjtsCsgE9MdIv+aFCaGj0o9fFc2
 QYbOAUmiOVRgW+aJOFmGDIrZNR7HeNG9mRjsP1nK3V8nTbjZcUBtoaaFcCcA1ZiguzKB6PnJ
X-Proofpoint-GUID: svXaNHX2dgbXloh6WhKGHXtXB1Qyzj57
X-Proofpoint-ORIG-GUID: svXaNHX2dgbXloh6WhKGHXtXB1Qyzj57
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=680f607d cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=iI0CZyxFEQmHUC52CcUA:9 a=CjuIK1q_8ugA:10 a=LO3Pcj7W_tpGBBrZ76UA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=594
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 11:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215594


--lvrsif3kgmvfdutr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 26, 2025 at 08:16:47PM -0700, Khem Raj wrote:
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

This way we have two sets of bindgen/clang args: one added by
meson.bbclass, one specific for mesa which you patch up here. Please
pick up the attached patch instead, it makes sure that there is only one
place to specify bindgen args for Clang and documents the reason for SDK
packages requiring special handling.

-- 
With best wishes
Dmitry

--lvrsif3kgmvfdutr
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-meson-correct-bindgen_clang_argments.patch"

From f0f54e295297474599c9cd53854c66cc15b62f33 Mon Sep 17 00:00:00 2001
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 13:59:01 +0300
Subject: [PATCH] meson: correct bindgen_clang_argments

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
index ef45a034a767..7411c76dddbc 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -62,6 +62,14 @@ def rust_tool(d, target_var):
     cmd = [rustc, "--target", d.getVar(target_var)] + d.getVar("RUSTFLAGS").split()
     return "rust = %s" % repr(cmd)
 
+def bindgen_args(d):
+    args = '${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}'
+    # For SDK packages TOOLCHAIN_OPTIONS don't contain full sysroot path
+    if bb.data.inherits_class("nativesdk", d):
+        args += ' -I${STATGING_INCDIR}'
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


--lvrsif3kgmvfdutr--

