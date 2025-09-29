Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4706CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 05:38:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.47112.1759124272933459862
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 22:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pV8qQz/D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMuWHr013055
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 05:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MNQPqYSd/coXnWhX8IBtzXLdZVnIhRj6Z46
	Fw/JJPfs=; b=pV8qQz/D9rPVOIlDumCwflzBBQ5Q6jKZEtQUtQHVa4tiGZx2GxK
	W666kwau1vly1QnEb6NKAJJBnhzeRchSEnJO9jdhqQWKOjfV7cMXt37/9VL3h+Cc
	yj4L5gnf4V+5GapbZ0xGH99eqRPY0LQhfAS60jJCmfSEmpfLEhzLhTSUiQg9rmGQ
	fe5RNO6NcJv1/RO9VQHaETBIOHb6aj1mfuFAO27k3fPIuBUX6QdDtRxJc1f808Ft
	03UCnjxsP5lSthPVk04rqf//zHxIP4vABifz6f8wdDWYY/2KZt+tjajoFYU2Lvnb
	LmW0Zhl5TsGbJbQz4vOJTfUzo3o7bImlifA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977kscb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 05:37:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85709cdfab5so926479185a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 22:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759124271; x=1759729071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNQPqYSd/coXnWhX8IBtzXLdZVnIhRj6Z46Fw/JJPfs=;
        b=Mqjt7AqgBDQMpRAQlMnoDDK0+lCqTaQgV0qcWdQzeEOce5Q9bpDZzly7DkO5Cmitli
         VJMA7iIcCBe9UVdYfiFQdB21Lfta/UZ6/0kN55GaIfu9e/2npMLHqc47GQJDCnjgffdV
         7iXaje3mUGB9guLSnblLzlgeS763uKB/UjgYUe4mBDTN0kZO4b0QlMUF/VDo5UYYLlfg
         YL+8JYJKk74hxIOUzo0skdjgY3SO4hIKzJJ7BRbGl6ZC2m1FNK0LAK/kCWx47yWfT1Fw
         9w4yVpwBiOXIrBlufjn7p/ZOER3+py/qnl/65yTW1TGf4wTHwv8npXD5F/GV8VAu6Ob3
         aiXA==
X-Gm-Message-State: AOJu0Yxh6+cRiuEQkff4ktMaU1N6ulp9zWLXdUnNTgQMOFDI1Uizlwfr
	OeJcMWZlPzVTJOjeAvHjpO2ZJsnlZdjwvw43Q+TLOK8w5Nhzq1ysVF3xe5Gj9in6ClfL+2QP75M
	pC1Vprp3CcIJNG827QEnirkjkmI8mHe+zfaAw9rCUj+vuzQYJv1eYGV0qE+oCgPSiRVUPqzDXTI
	fbrDTzdoBoPe5Nra2b5QHy
X-Gm-Gg: ASbGncvFU374ZvDwyhrHAr5gCbq1TtRjhGfPf4x5K0UVlYqRKqXKW2TUNuM/XwY/JXU
	MaF8zixAX7VMq46WfBOno63+KYU9KsURnpnvmG1SwCQUmDQMq4IURwARalBRuu4rQou+oV0kfGB
	lLGIjK7YU8fsvJ9/DExTKhcOnbe14W/HkloGJENODteNDs0YfqWRr1J3Kb2xHLH7mCbL0QP4E6C
	nin8PJelttbS2lBJ+X3GZRn2uiIqigHm1kTBULKBrmFSDrtft9H6BNJ5+p1hM36Z7bwg5f+RMFQ
	zr/DqBgTJ2Tzb77H4mW0VqovGSyVmFgOSUwjzmiVo/SFVhAvXEJHxZUOw+3j49+Xk8fcVAskjqv
	1t/zHFwuAEisur+ZzlMRb2xTLVMogupZzJDl0AnOXZXoGHhmgYDLG
X-Received: by 2002:a05:6214:242c:b0:83a:661:ff55 with SMTP id 6a1803df08f44-83a0662012fmr65014146d6.35.1759124270742;
        Sun, 28 Sep 2025 22:37:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDaZB/j06t84Y3uL8zSY3z8bVaEIeV1awDLHScqouyf4CPkuiSzuR9m2jkuNt2jDXMXLUaaw==
X-Received: by 2002:a05:6214:242c:b0:83a:661:ff55 with SMTP id 6a1803df08f44-83a0662012fmr65013596d6.35.1759124269049;
        Sun, 28 Sep 2025 22:37:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316656353sm3913650e87.88.2025.09.28.22.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 22:37:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Puar <vpuar@qti.qualcomm.com>
Subject: [PATCH v2] linux-firmware: backport the topology rename patch
Date: Mon, 29 Sep 2025 08:37:46 +0300
Message-ID: <20250929053746.3977608-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CRe9f0rjyEG4oQVwPWJzqGRaWgB1SVGl
X-Proofpoint-ORIG-GUID: CRe9f0rjyEG4oQVwPWJzqGRaWgB1SVGl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX1Ts4I1ofdRU0
 mqCa5ob+DCmI1KnCIGGVbETuBLfKzULAF+BiiGIVUTulsZqc/7JiUiKyHQfWsaIFPnupjQXmjJn
 QSK49Ik+rtIwkvB3DCD5IhIxeiawV2TX6MDTg5TBcxj4EuTW3tZC4AU0MWpVlsL3uR6CXHMI/67
 cptnsbk6F0XgwNdv3BqsKU6ZpCN04Zca5d68N6c8pfxk1slee3gHqkGEdrp6jxoe42ARRe6zM/D
 rrO2s7QsGn0hagZGk3dD+1/WyBZe3NblxkqYgbuBA1uvcDjcbugWGuNWWFpqhz+YU1dDb/+NTVq
 E5jy/Xv9MbEyjpX6T+HFD4QjPJ0Fa+SjxFyzleb64CGrlL9d7I9yIOc7wE1Rxiu4eyDbhLvvgwH
 wUO2bItePQM80g32D2KF7m6Dw/IiWg==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68da1b30 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=p0WdMEafAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=X99CBnQ2ebIAYY6q88gA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22
 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 05:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224115

Backport the patch from the trunk, renaming topology file for one of
Qualcomm boards in order to reduce possible compatibility issues.

Cc: Vivek Puar <vpuar@qti.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...ANS-EVK-firmware-to-correct-location.patch | 39 +++++++++++++++++++
 .../linux-firmware/linux-firmware_20250917.bb |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-move-LEMANS-EVK-firmware-to-correct-location.patch

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-move-LEMANS-EVK-firmware-to-correct-location.patch b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-move-LEMANS-EVK-firmware-to-correct-location.patch
new file mode 100644
index 000000000000..01e555cbebc7
--- /dev/null
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-move-LEMANS-EVK-firmware-to-correct-location.patch
@@ -0,0 +1,39 @@
+From 6625e563d600eba34cf2c71df7572ad1c421c6fd Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Thu, 18 Sep 2025 05:37:13 +0300
+Subject: [PATCH] qcom: move LEMANS EVK firmware to correct location
+
+All firmware for the Lemans platform is located under qcom/sa8775p/
+subdir. Move audio topology for Lemans EVK to the same location and
+provide (ugh) backwards-compatible symlink.
+
+Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Backport [https://gitlab.com/kernel-firmware/linux-firmware/-/commit/6625e563d600eba34cf2c71df7572ad1c421c6fd]
+---
+ WHENCE                                        |   3 ++-
+ qcom/{qcs9100 => sa8775p}/LEMANS-EVK-tplg.bin | Bin
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+ rename qcom/{qcs9100 => sa8775p}/LEMANS-EVK-tplg.bin (100%)
+
+diff --git a/WHENCE b/WHENCE
+index a93effa5008b..e22d8218959f 100644
+--- a/WHENCE
++++ b/WHENCE
+@@ -8469,7 +8469,8 @@ Originates from https://github.com/linux-msm/audioreach-topology.git
+ --------------------------------------------------------------------------
+ 
+ Driver: qcom-qcs9100 - Qualcomm ASoC topology
+-File: qcom/qcs9100/LEMANS-EVK-tplg.bin
++File: qcom/sa8775p/LEMANS-EVK-tplg.bin
++Link: qcom/qcs9100/LEMANS-EVK-tplg.bin -> ../sa8775p/LEMANS-EVK-tplg.bin
+ Version: v0.1.0
+ 
+ Licence: Redistributable. See LICENCE.linaro for details
+diff --git a/qcom/qcs9100/LEMANS-EVK-tplg.bin b/qcom/sa8775p/LEMANS-EVK-tplg.bin
+similarity index 100%
+rename from qcom/qcs9100/LEMANS-EVK-tplg.bin
+rename to qcom/sa8775p/LEMANS-EVK-tplg.bin
+-- 
+2.51.0
+
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
index 5d5a5c8caeef..9a8093275476 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
@@ -246,7 +246,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "714332457b96406b3ccff321b60680b1"
+WHENCE_CHKSUM  = "a12ddaaab7162785af9d79b76132d185"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -372,6 +372,7 @@ PE = "1"
 
 SRC_URI = "\
   ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
+  file://0001-qcom-move-LEMANS-EVK-firmware-to-correct-location.patch \
 "
 
 BBCLASSEXTEND = "devupstream:target"
-- 
2.47.3


