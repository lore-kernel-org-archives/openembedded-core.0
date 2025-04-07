Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3470C369A5
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:48:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.42853.1744019302780698915
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FKmBp6Ts;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378drdW013467
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 09:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5HJcaMFJSwT4eIdh9u5ZiT7/jhxEj2oPM6ltbxl5x44=; b=FKmBp6TsArnOJmK2
	+QTCoK+5HtRjFDh+n4vCWXSonXXoQxg9ZFMAXIYd0cWwEyKgSKRQz2mHTGfhcuP4
	JkNeZ7TQ9XEYd1dDxQZ7jxcsDfzKrwEj80UzEW9vyd/55RX3t7IFUydOslYy6yxd
	si7EWNEDNoyfqkwQX5atx6XTK6OBKDc9rYfvzvmmy8CXYeHHOxgTY3ebMdcRZrTn
	wc2gUsaSQ8X3SnKDi276h4lnKcC/hYj8VUzZi7NNmZ5CPhe+vk5vl2Q/yliVsdHE
	132mf1016imPJRDCCN37dPA8pRWLXiiqTWUOf1QLqyTeXPLj6i4X5RNWWEkuomKv
	njbN7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1br3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54767e507so710675585a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019301; x=1744624101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HJcaMFJSwT4eIdh9u5ZiT7/jhxEj2oPM6ltbxl5x44=;
        b=g4DLm+IYaAxxh00eBW1jhZNPWZgL+jUwjRgsvD1kxDGbQFqJa2Fwo538Ltw+L/Vmxk
         ldGbYH4JZcC9Qq4UuI4Ml5hsBaBhrcdB1VJWnYIosrcbTlsB8gf0wibMRem4EL+sm6Ed
         8SQuNVeHS23ZEQZFceQCAha5GBK1P0D5LmUQF+tVFtnYVaEK4z/BDTcvTz4KXhthPA0f
         IdEE2ax3RQBTgTxSBdBjKSKG2dejsDQFYAliZbwmVCxLD5QhDcaj/65FVFjObUxhHwjE
         kPwoPDPL9JFf8IDjyc23CzyxHm87IE3YwMislqrubAQT5x4eCF+xa7eh6a6vsb8j3LTh
         Vx+Q==
X-Gm-Message-State: AOJu0YyRoBGsonqGUb5rq8TTi9ys84uxeASWRNnUpj6AM6tzwNvI7d3Z
	Dt6GmVWhDPILKvOyumATaOyi+/3bADJqJMca3cv6KYO7UV4QaR2uvTGr9WPV64+d/sP0IBVMwVn
	kDcKbOwWa27jcFQSWrqZKHN5OilXxJhoiOHNT3Kpc65nRMvZaNI/kwwDBwUWH3dAwov17qH/G5S
	XvTPs=
X-Gm-Gg: ASbGnctmuUzZb5/FGOUMorJnVguqoj4stWGCo8BDRBGj7KLVW3SLm31sDSvVGeWDVPC
	FCOdvrEm0tT7qtVZDxGuFIRn0jim+OKeH1cRTFAWFf2k1lzXPLRIl9/A1+92M9tkWol56Hvodxs
	ep/8BpM2QyT6YQ4Ym95lf5rkzFG+xp3rbOvUTST9viRg7K3YkbKh8zFXfbNzbzO9AlS9tKlc73s
	vDsAeCz4ffwI3DiTMTnrMg2n2aUDAw0z7PFBfUArp0CIgEM7+bwT8OOOYR/1CofjPLAsZt2Dtnh
	p4gCTjpcTT+JYUnEf31NfemBGnE2dNzWG1uxGLAzEScNEO0AXEqZ/w5FZ6jYzx1W6xjY1a7nDtL
	4Q7EIMkSEfRSUnYXvz+VQCKH+T/Q8
X-Received: by 2002:a05:620a:2551:b0:7c5:b0b4:2cea with SMTP id af79cd13be357-7c775ad8937mr1442691085a.38.1744019300803;
        Mon, 07 Apr 2025 02:48:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHecaf4zgzaba8KL9Z5jbrsBYVZ4hHid4fpPLAPCJW1yVqaEiskj7iS13cgUN7rPpNKNU1xGA==
X-Received: by 2002:a05:620a:2551:b0:7c5:b0b4:2cea with SMTP id af79cd13be357-7c775ad8937mr1442689285a.38.1744019300417;
        Mon, 07 Apr 2025 02:48:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab53fsm1216985e87.52.2025.04.07.02.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:48:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 12:48:11 +0300
Subject: [PATCH v6 06/13] llvm: remove LLVM_LDFLAGS from llvm-config
 --ldflags output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-mesa-25-v6-6-29bf4cae8d28@oss.qualcomm.com>
References: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
In-Reply-To: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3323;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+gxJKfRSnv3UH2cvcNI+hzuaDpPxkXATCwLaG9OR8K0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn859XHsWi15VN9F0MCxnRuDsSY+gQxYRbC/x5b
 yDD9Vy7pYaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/OfVwAKCRCLPIo+Aiko
 1RxsCAChOzvQOYhKrxvoO1RobTdeQn0UfAnmvwdbUgAaz6SGGMtE0QfHxx65tdJmPx2yiyIEVZ+
 i+UMyosHEouhXQXodcJpuYVYkHWIziXIanzQT2SfkYWrsJbzXYvsT9a0V1s3o8OUXnTH4R8xJ5O
 Cyx9medwHHoSCsuIFMB8fKB9dpA2DceQHNSckVg3a+IpxN5FKI0LivF7WaNgJ9LAEqkoyKISTqW
 CsoTpeJIhD/jKKFw7os+iroXL8ijL10WpAVFzdGiwu5q1mriyhqGr6FXPrxlmG8pYqyQyS92f2n
 xr6Y4A1dyQhp7l6MgOc1jk4MBY1cvVIQWXagHDVSkF7LJG0T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: KZAA4UNAXdRLbLJk6hbuMQ-Ka5eGnYjO
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f39f65 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=WIpSu2wNbg6c4CAHoA0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KZAA4UNAXdRLbLJk6hbuMQ-Ka5eGnYjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214435

On native OE builds the LLVM_LDFLAGS gets a lot of extra flags which may
depend on exact build dir and as such be inappropriate to binaries
shared through sstate-cache. It is not possible to override this
behaviour in llvm-config since crossscripts are not being used for
native builds. Ignore LLVM_LDFLAGS for native builds.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...g-remove-LLVM_LDFLAGS-from-ldflags-output.patch | 34 ++++++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_20.1.1.bb          |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch b/meta/recipes-devtools/llvm/llvm/0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
new file mode 100644
index 0000000000000000000000000000000000000000..2320399d5f7de44cf9cc4269d180c097c1b4a616
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
@@ -0,0 +1,34 @@
+From caff2482f786dd7fd5f1f46f2667f7ed847cb8f8 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 2 Apr 2025 17:05:17 +0300
+Subject: [PATCH] llvm-config: remove LLVM_LDFLAGS from --ldflags output
+
+On native OE builds the LLVM_LDFLAGS gets a lot of extra flags which may
+depend on exact build dir and as such be inappropriate to binaries
+shared through sstate-cache. It is not possible to override this
+behaviour in llvm-config since crossscripts are not being used for
+native builds. As a OE-specific modification ignore LLVM_LDFLAGS for
+native builds.
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Inappropriate [OE-Specific]
+---
+ llvm/tools/llvm-config/llvm-config.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
+index d5b76b1bb6c1..29f7c2eaa419 100644
+--- a/llvm/tools/llvm-config/llvm-config.cpp
++++ b/llvm/tools/llvm-config/llvm-config.cpp
+@@ -529,7 +529,7 @@ int main(int argc, char **argv) {
+         OS << ActiveIncludeOption << ' ' << LLVM_CXXFLAGS << '\n';
+       } else if (Arg == "--ldflags") {
+         OS << ((HostTriple.isWindowsMSVCEnvironment()) ? "-LIBPATH:" : "-L")
+-           << ActiveLibDir << ' ' << LLVM_LDFLAGS << '\n';
++           << ActiveLibDir << '\n';
+       } else if (Arg == "--system-libs") {
+         PrintSystemLibs = true;
+       } else if (Arg == "--libs") {
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/llvm/llvm_20.1.1.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
index 1ea94327161a8002453ac1aa79d7661d4da72499..b95473c88b64961cb6ae2f4ace14aac4600cf98e 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.1.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -32,6 +32,8 @@ SRC_URI[sha256sum] = "4d5ebbd40ce1e984a650818a4bb5ae86fc70644dec2e6d54e78b4176db
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
+SRC_URI:append:class-native = " file://0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch"
+
 S = "${WORKDIR}/llvm-project-${PV}.src"
 
 OECMAKE_SOURCEPATH = "${S}/llvm"

-- 
2.39.5


