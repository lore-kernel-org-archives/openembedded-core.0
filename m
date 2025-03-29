Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 845D1C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 20:07:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.17855.1743278847573639736
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 13:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=IM4NS1GL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52TIpdhZ029997
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AS+w1P7zyHFnfLucYjiktS7bjXogJ0ROIA2ty176TmE=; b=IM4NS1GLiH9Y6yfU
	/GUASTNrWgFbg8IQLUdVcpwc1RUIPwZjl9ULiP7olg/axWh7P8TDUK3mGsXKhsa6
	/IRmvSOiNOzUEeKwSrZ+/+R041U2J50gxuKXfX4ObLf67eEiEJSLyE0Db/wJHAJk
	z4taM0AeeTiXtdeVHJWn7rEYX17F08/UZSuGJJfnyEtK52c9s59s5IISrbE4+5e9
	d3bK8/5BGbIfZQdvGcrJY0AgryN5TtVaNm0u/w0NGIz1bb1GcHOsGL4g+xdTmxoz
	TAhr2JQ9Z94MCdYbf/N+eCv3vh0GPSY/nf6pctFeBWFjVZm2ch2MirNZ8+LeY7o6
	JNsUjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p86khac6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ba3b91b1so151259285a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 13:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743278845; x=1743883645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AS+w1P7zyHFnfLucYjiktS7bjXogJ0ROIA2ty176TmE=;
        b=wW/ndO7kls5K38rh0npFx7+v6KmWM8L2ycIDR8BlGoxtk/DlykUqQ8D9tA60xi6WXt
         kMDVqdYXNNApxWDG+7a9jI7PystFWeVeVDdtwiycygMF8YkUPRaQCRxLxRuDDMocO3LA
         VtO1rR1TI1CtGS8KGkcbpYRgtbmW/bwuCSxDI+Obkg7xFzvbOhzzLfqgFJYrC1jZv722
         2HOpz2usr8A7N0pjDl1aFl+NpN3DisDjSiMDnsd3cguszr+tbYYZIXPc6rkc395/T/gP
         kCTOEypSZXc6zJUNKgBI/gAT4f3nwY+9CYajs0mIURF4Hpsn+JE8Fnqwn6PAziI3fMay
         0pkQ==
X-Gm-Message-State: AOJu0YxxgBeqKRZDoMN9H8rrl55A1piFJlmJNtX5Xpl/TSMlLhnPGQtz
	72wDLANR5pZOc2QTKcMZ52jD6hJaIlNRUIw7sIkezb3mfSuhpd9tRdRxbNNCNMjAqUskXRuCJ1L
	9ScxGdA5t1ydsGXlNdbmw/JrOdiml2tv3sesmrHSzoklebTMbJCs1nxvmcBSZtNP0LYLD4NAUyY
	BKn8D+nG6dk8U=
X-Gm-Gg: ASbGnctzYgu4JemH+jYgVgrQpesyy6QkVvg0yDXww78+1D5oe/DNR3KM+uh9FPmLInH
	9gwC/fpUosGI5ueeeFNdq0KifhPmNgEXlrmUhlYF+or2HJygQM9ZtmVDMpwqjn7rVfnz7CaAhuG
	Pzq1V1iugkIw4WViyxx7ijqj8Um3X8+8WC8LCt/NwIDQ7e4xHMlpOyy704ztQoKaJNJzt0gm5BI
	uFoOoqe1U+waBIMItS7H5QMKjanw06cnaNB4835q8ncn+Fu2MliZbLm02HKXhDnvc3DFbS3kzUV
	+xdg1LGXT1fbDRyACEZfc2DL2aRKf5fc0DdkDrCnE/aaPQpu4KzxZmii703CiGZaO+OJXonC3aG
	buGFoEPsEErfwTseRd55XYoE4L8oK
X-Received: by 2002:a05:620a:430f:b0:7b6:d7be:2e4 with SMTP id af79cd13be357-7c5f9c20a62mr1108336585a.26.1743278845504;
        Sat, 29 Mar 2025 13:07:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtZxuI7KFuyNGriQFA4p2UztvV5QERBHCulCcqngaALcaBW3pM7joNSKr774lsk3PTKIjrwg==
X-Received: by 2002:a05:620a:430f:b0:7b6:d7be:2e4 with SMTP id af79cd13be357-7c5f9c20a62mr1108334185a.26.1743278845124;
        Sat, 29 Mar 2025 13:07:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb365sm685848e87.29.2025.03.29.13.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 13:07:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 29 Mar 2025 22:07:13 +0200
Subject: [PATCH v3 2/9] llvm: use OECMAKE_SOURCEPATH to specify cmake dir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-mesa-25-v3-2-f4d0328eb867@oss.qualcomm.com>
References: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
In-Reply-To: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Up3cMTdzpBSB2lLY9eOM+XuWIZCZmELrydx0Z1G8gjc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6FL0zt9T1ErMhrrZrWYHC9llSCwH1OuOG2sNJ
 0vI6uS5fA2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+hS9AAKCRCLPIo+Aiko
 1VwqB/9q8rn9Sa/uRaNQZFO0vysrsn3jeiJXtZgQbhMfGbEnpJD9mKhGfxAAs14rAT6XEpKpKU1
 9vCdMvSM3+QUX0xkv6DmCFm77FZMrGJyiZLl0fVhHnrTizm/b4S3AkMX2+XR2Q8WX4Hs44yGIYA
 Y2X/EByKpU9nkEerRAI1TxUrQGgjCLvy61I68/psE+CbkGiiAf8bYAhodGnsrmI23ClzZUu4dlW
 eIXQDPZJJJ8yZLejIYpxcUy5c/sixI6RoUUeEraMdEv1eUNKUHR9Ek3tdYak30zJRkYw1hBSdip
 H8TS+04wvLh1EBEb8ln9srtran116SxXgkols/AmQemKynky
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=W8g4VQWk c=1 sm=1 tr=0 ts=67e852fe cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=D0RIUQgIwEgepnv7z8kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: k7l3wrvqJAqr38Erwf-HQCR9W90Kwhun
X-Proofpoint-ORIG-GUID: k7l3wrvqJAqr38Erwf-HQCR9W90Kwhun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=828 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503290146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213896

Instead of pushing an `llvm` sourcedir into S, specify it through the
OECMAKE_SOURCEPATH so that all the patches are applied to the topdir and
debug paths also use top path to map.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index 296a164cdd7ffb45f056c879cc5fc4fbc459caba..7470d2b4d8a55868fe5d2e88f5843a2ec3faf7c0 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -24,15 +24,17 @@ MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
 LLVM_RELEASE = "${PV}"
 
 SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
-           file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+           file://0007-llvm-allow-env-override-of-exe-path.patch \
+           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
            file://llvm-config \
            "
 SRC_URI[sha256sum] = "4579051e3c255fb4bb795d54324f5a7f3ef79bd9181e44293d7ee9a7f62aad9a"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/llvm-project-${PV}.src/llvm"
+S = "${WORKDIR}/llvm-project-${PV}.src"
+
+OECMAKE_SOURCEPATH = "${S}/llvm"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
 

-- 
2.39.5


