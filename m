Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E54EC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 22:19:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.21217.1744237136428067102
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 15:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mO4sDPvV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HGJbi010463
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Apr 2025 22:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vuo2NE2vmocpiGkBamErtuiRIRf7kxygWIx
	iSx8SEik=; b=mO4sDPvVZx71rt3W7Jevg+ZMdJKMrC8x0uHrqO/RNfXz3Ywx46g
	AlwOPOPTrUVV+vrc+wpw/F5W9+y9b1E5OwzMtz6Yym4CL+9KbkFzeq9Z9mL95arZ
	CGHw1Dx4WF4Qfrn4eoZU5W6kkS3rD88Z0IroENQN0Wnk74xXdqbHlld4wNMj0wPC
	/AcW2r7sWHq4SmZ+7AXQxcPTd1JWyrvU8xDkAIe2k3lgkUTymFGyRaIruaeRXDHk
	7+bxoh+rc8M2iW7qFVHREk+nYoRH06SIkKYQPxUdMub871mDFWg2Ty05Tmn3/yBI
	O5GhLUSzTfUBLu0BobZdK71BZeKWcCZ/9Tg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftmqv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 22:18:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54767e507so29836585a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 15:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744237134; x=1744841934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vuo2NE2vmocpiGkBamErtuiRIRf7kxygWIxiSx8SEik=;
        b=loejfn75EGcwFMXmXZrsekr0BRXMwCKeLWfqXPWrw7b5zqhsw/RI/YpPbnWOEPqUrP
         dtkVjXcrrf+iP04Oe/VTlHTEaysq55aebG4vyV5KOEV04GQS+vSokCdpq6KknKwGeOMF
         +kpAe923QXnOpwwZO0e1oOlZjHSVjo5XvZRDO13c5vgNFwsal8oEVzu6ckKIdLU1rbfg
         MAenITf5rrCcoRXwTYmr21cqAPp4dp95wZ5k26BBAkZXKciHFvG6FKrnbX3MFW6X7TYE
         q9SX6JW8keYoKZ8EgkvEKB2MrSjO/l2yD6O6/9976tMQYU9uQlJ8IjLQ0RfsY9HiW3M4
         G2qQ==
X-Gm-Message-State: AOJu0YyrwESBTpz9tU7b9cb8libZw0svIKJtDvxkDrn6sLPNYoBLj0Lg
	UqETt/0VT4uSB8L/BNRl0bZQ2lOBtdTo8Jqqad005V5qmDfT4sP/T6jpmrcAmxFcC0+qhTH/gt/
	WHzUwMPRJ4Y954NSF4MwGlfPeuKe5emZuqrvDyRqO5C4XZMnEqTX5n8XwFo3ZFeb22AHeip5Ow3
	jay2q63QK4ls0=
X-Gm-Gg: ASbGncvmVQIiyFxAq9zbQ+MpPkGUO5eB6JU4FN8TIpW7lkMZymCRQhy3V+amcala6Zn
	RzQatxPiPKeUaq1tJGdO/WkGfzlcT0p0NVyw7fwpaHeTy80ALVQ+t5jJ8a9o7EmIAGX/ecF6mBZ
	rQF/ZIYukb6gCIJDyIg29PcmBEvhqTsyBce0ZE1h8e0FVKUtun6EZI92pKnSZzQzDzTyU4oSTtl
	vSgwHSdfBKxX8hDZpD6fCbZb8XRK0ySVujBy8QD2UDn0VeM3cX9LrzC2Dx1rgWNeko7kEj4vMj/
	7PZV9OxF3l13uGrRRXvtmSJTMB+iC7wDinL6GA/iNW3JFNwHVCp2F+e7tc9qd/Aru0Q=
X-Received: by 2002:a05:620a:2983:b0:7c5:b0b4:2cea with SMTP id af79cd13be357-7c7a81b1531mr12127385a.38.1744237133912;
        Wed, 09 Apr 2025 15:18:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwLCYcxMzZYZ/g3O026ENHs1RI6qKlpIPviDf4qbT0ma45kA7uH2zmqx501hlwAhXlhCeU4Q==
X-Received: by 2002:a05:620a:2983:b0:7c5:b0b4:2cea with SMTP id af79cd13be357-7c7a81b1531mr12124785a.38.1744237133555;
        Wed, 09 Apr 2025 15:18:53 -0700 (PDT)
Received: from lothlorien.lan (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c4566e86fsm227023e87.203.2025.04.09.15.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 15:18:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH] u-boot: add hook to prepare binaries before copying
Date: Thu, 10 Apr 2025 01:18:51 +0300
Message-ID: <20250409221851.1005988-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f6f24f cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=DtX1zp5rpnlyH9CIAMwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cywFWyDD4lRukFxcYajgyoAl-rp2qlGk
X-Proofpoint-ORIG-GUID: cywFWyDD4lRukFxcYajgyoAl-rp2qlGk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=947
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 22:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214598

BSP layers might need to perform additional steps on the U-Boot binary,
which are not a part of the oe_runmake invocation. For example, the
binary might need to be signed or converted to the Android boot image.

In order to let BSP recipes to perform such tasks without duplicating
u-boot.inc functions, add a special hook to be called before
uboot_compile_config_copy_binary().

Note: it is of course possible to push necessary steps into
uboot_compile_config_copy_binary() itself, but it doesn't look as clean
as just adding a hook.

Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 9464736b8418..fe86ba0ad011 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -81,6 +81,7 @@ uboot_compile_config () {
     for binary in ${UBOOT_BINARIES}; do
         k=$(expr $k + 1);
         if [ $k -eq $i ]; then
+            uboot_compile_config_prepare_binary $config $type $binary
             uboot_compile_config_copy_binary $config $type $binary
         fi
     done
@@ -93,6 +94,13 @@ uboot_compile_config () {
     fi
 }
 
+# Do nothing by default, this is a hook to be extended by BSP recipes
+uboot_compile_config_prepare_binary () {
+    config=$1
+    type=$2
+    binary=$3
+}
+
 uboot_compile_config_copy_binary () {
     config=$1
     type=$2
-- 
2.47.2


