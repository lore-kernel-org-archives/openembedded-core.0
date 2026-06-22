Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2465CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 18:09:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3370.1782151761876036581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 11:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=M1pARXMk;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Ks5pJLJK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MFX8EN1370213
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 18:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zgEfxZvZGzn4X/PAt/4ljA4Hi0e2HjW7jsL
	HOYdMDOQ=; b=M1pARXMkiFDILs/LEP4j2yw1EP4gqcaVzb3qZIE7cgJKHFULnqu
	GrDGGaTCempjMGhlue/Tp4K/nvPPKXdhYNzq7VLskKgFSeC7SmZHbXqbNmf6g4Jf
	+TQDzqZgOhKA3o1QHwKgH66ZVuaTOeOaGuH6hAm13G57xRQILg/l1SnU4+n6dBOC
	Ox0NVR6zOCMa0xEHznCyCfO+iUBZbkUdXpKao2FdFh+OMUanu+K73XIxoM0dybva
	JpI6/fgwwa6NqGr8xeSMXQwNcH6ZYEeRIirECm2elvnNA3+HXAcwJxLgVuFNpfWB
	oFaQA2Cu5/SHqPRETfKakCOJ4ODY4K8uddg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1tsjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 18:09:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6a20348ceso55016875ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 11:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782151759; x=1782756559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgEfxZvZGzn4X/PAt/4ljA4Hi0e2HjW7jsLHOYdMDOQ=;
        b=Ks5pJLJKni/qUJ6LxXjvTcGluQdYQTP8vVc//uXyqc88caGpAALZAK07b//7d0jlS3
         Wi8SJ4rohS6PJgnsnyI5L/GYokKjWu7pGYFM/TxyH3s4i4jE3ZjPau1D+m/EvBO0M7Ew
         pnzxu/UCzYnQfFWco/Su5vapMBYluadmnykAARJ3SFMNJvrdJrF0LbDi/B3m/DkVjzoo
         z9ULY2LM/R+XCu3G7o6QHLQhN3im2hEOvrSA5vfd84WFnvNpQjydjbxjzHSUYqpY/Cdt
         sLjL9hBHyQhC/bJosiwKduP4bMN6s9gn+1c4BojNntECmZ/SBEKeeZykRtISQ98/pUBe
         A61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782151759; x=1782756559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgEfxZvZGzn4X/PAt/4ljA4Hi0e2HjW7jsLHOYdMDOQ=;
        b=CwWSeJo6XmY24qZ1+WAN/IlPt6HxxcsyDtdianMIlGR1p5PtaByPXSuOQK0PU8vXRK
         Y7gVVragOoLaSh3JZ2Cxs0eJBs0RxQmUNfmBLXpWyvpjnfa6m27Tp7/4fHGaxhoMhEFs
         wjezdsBpSDjP1JrcaTtFMSZbNU2TqzP3+M9hTqk4lFVLPIhMwp4zeCS4HPKI+ElE4Hny
         sviC9WcQCQxCebVwiFF/LlqfDwFXX6PBUFOUfRvvEK5Z9zQZiQ8ZAMhg8WU1yOiIZABV
         KwNdCpG44a+m2KI/0YnvQ/AXS5a7AWaAtf+t/9/XEciJg2tFdMCPTbqeT7YkYYxzTezw
         +ATg==
X-Gm-Message-State: AOJu0YwpCy2pMWXqwhvNbna/3k8aQSbrcn3kAXidwBPyn7XoNmf+a81V
	aWHROK4oS9pA2Z2H8Zv9juHpyHVlWS37Ug9B1OWR8tUroUGib9O392k8aLiH7jAO/VPu/W0YGUj
	xK9ioeSlU4J6pvEE7aou2NIGJO8pi/VCQhM8sJqf/ehdkRIfAzXsf55VW9oEql6GWNyrW0HUczT
	aeXHTamAhq6/r2teOG8A==
X-Gm-Gg: AfdE7cnS9T6UgNpZj+UmYCFErj9Hou4z/JU4p90avXNM5QtMdlOQzUm65AFqp066PeD
	shQ6QnaNIcVIG+Cxr7EeuChCB0ZtioQ7GbWCTMT4HHK4G9di2IbOxrj/jE/5wqtIIpSB4p0omVY
	xd9Y8qsxcH4ePCvkCLgwbiU6M99uWKN2u2uChD2ZcNIRJ149mhDNbu1dGRMSQhuY3ePHEzuOyxl
	TizVjvHIbpGrEuKzVgKFZU861adj3AQlKTCLzfAAYA6ZzayoBHMDxUshZZWR3osvbGcABf3CMLQ
	x9jLdhosUBNjnXNh2WAlQgtl3pBcRyxBMwPgz2GSa36lJprijg5BiS7BxmSJRyV5pRIXEzTenL6
	Kl12QKWG/qPeCL3/GZNJxOe1ztVRRlrqeAZHdFpljFD644Tl5Cw49dNcvO7srYDaPHM9gvNmAA6
	TrBetMU3lA+92NNu/oIoZ9gET513RzqjNoM3GPqTqcLfnuVt1wDg==
X-Received: by 2002:a17:902:e5ce:b0:2c6:f350:e895 with SMTP id d9443c01a7336-2c718fd3fc0mr151711595ad.35.1782151759333;
        Mon, 22 Jun 2026 11:09:19 -0700 (PDT)
X-Received: by 2002:a17:902:e5ce:b0:2c6:f350:e895 with SMTP id d9443c01a7336-2c718fd3fc0mr151711115ad.35.1782151758331;
        Mon, 22 Jun 2026 11:09:18 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8524sm94605995ad.47.2026.06.22.11.09.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 11:09:17 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] uboot-sign: allow customizing the FIT configuration description
Date: Mon, 22 Jun 2026 18:09:09 +0000
Message-ID: <20260622180909.43993-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: goMy-IfrxYsi_r6bd69XzK2wpKn0ZjM7
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a397a50 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VnNF1IyMAAAA:8 a=7CQSdrXTAAAA:8 a=I1JR4CY4CEBTJ48_3i8A:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE3NyBTYWx0ZWRfXywQR4IFKy0R9
 ZCXEgzihs3wur2yyQVP54UMQVl5XbCW4/9qDSImxLcjcpUrrL/sSFDSJPtOQQWGZqlIAeXFxllo
 Hq5E0X+KGwYX5kLTRj27QyV0zd09xTM=
X-Proofpoint-ORIG-GUID: goMy-IfrxYsi_r6bd69XzK2wpKn0ZjM7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE3NyBTYWx0ZWRfX1/SEtssCmzpG
 ImHkr2h4mdnU6NmKGNv0T1AnPve7/nwfKK3TQSlvWFVp5bcJ6JcwsmP681HR4UDa4QtjnAhQ56e
 za2YRqqKG7aB2h7yJOiLW2pVekVGi+oGyElezyBVv3dvuA21cikuCosRWR3d3mGYU+s6t2sZWwA
 phmCoJuFqjCzsmd0fkwKyzzkpockfY+e1CdjaB/VWZYJRvAU8BulVH/HszEW/oVddZAGaJS07BL
 6WNB+40IGLlDJhMHfri7RJtOfGes48c+hgZAfnVlxyBf6pG/KTCpr5yqCHuwXcEuE0MHW0Bpvys
 BSFEs4pLcBryrd7TFEcz72OV0Umk0uaSwzd6jMbZRzGYkyA8tC9lJSMAnXFH05dsDri1n2eKc2E
 J8eA8D7NcCbO+IM5/Qe1AkS2HyxZwuNYJyfxwssxNEkVVscLLJ1F+vQnbtkrYAMqNNoDcvEieM4
 OKhKnHsKapAyxnMOTqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 18:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239314

The U-Boot fitImage configuration node description was hardcoded to
"Boot with signed U-Boot FIT". Some targets need a board/hardware
specific configuration description so the correct configuration can be
identified when the SPL loads the U-Boot FIT (SPL -> u-boot.itb).

When CONFIG_SPL_LOAD_FIT is enabled, the SPL selects a U-Boot FIT
configuration via fit_find_config_node(), which matches each
configuration node's "description" property against the board's
board_fit_config_name_match() hook. Boards that override this hook
(e.g. CZ.NIC Turris MOX matching "armada-3720-turris-mox", Engicam
i.CoreM6 matching "imx6q-icore", StarFive VisionFive2 and Siemens
IOT2050) require the description to be a specific board/DT-derived
string. The previously hardcoded "Boot with signed U-Boot FIT" can
never match such a hook; it only works by falling through to the
default configuration and breaks when the right configuration must be
selected by name.

Introduce UBOOT_FIT_CONF_DESC to make the configuration node
description overridable, mirroring the existing UBOOT_FIT_DESC variable
used for the root node description. The default value preserves the
previous behaviour, so existing layers are unaffected.

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta/classes-recipe/uboot-sign.bbclass   | 5 ++++-
 meta/lib/oeqa/selftest/cases/fitimage.py | 7 ++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 2b10e71730..78d85aaa9c 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -103,6 +103,9 @@ UBOOT_FIT_TEE_IMAGE ?= "tee-raw.bin"
 # User specific settings
 UBOOT_FIT_USER_SETTINGS ?= ""
 
+# U-Boot fitImage configuration description
+UBOOT_FIT_CONF_DESC ?= "Boot with signed U-Boot FIT"
+
 # Sets the firmware property to select the image to boot first.
 # If not set, the first entry in "loadables" is used instead.
 UBOOT_FIT_CONF_FIRMWARE ?= ""
@@ -452,7 +455,7 @@ EOF
     configurations {
         default = "conf";
         conf {
-            description = "Boot with signed U-Boot FIT";
+            description = "${UBOOT_FIT_CONF_DESC}";
             ${conf_firmware}
             loadables = ${conf_loadables};
             fdt = "fdt";
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 34b248ee0b..9858d8a4d5 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1335,6 +1335,7 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT',
             'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS',
             'UBOOT_FIT_ARM_TRUSTED_FIRMWARE',
+            'UBOOT_FIT_CONF_DESC',
             'UBOOT_FIT_CONF_USER_LOADABLES',
             'UBOOT_FIT_DESC',
             'UBOOT_FIT_HASH_ALG',
@@ -1432,7 +1433,7 @@ class UBootFitImageTests(FitImageTestCase):
             loadables.insert(0, "atf")
         its_field_check += [
             'default = "conf";',
-            'description = "Boot with signed U-Boot FIT";',
+            'description = "%s";' % bb_vars['UBOOT_FIT_CONF_DESC'],
             'loadables = "%s";' % '", "'.join(loadables),
             'fdt = "fdt";',
         ]
@@ -1590,6 +1591,9 @@ class UBootFitImageTests(FitImageTestCase):
                      Image Tree Source. Not all the fields are tested,
                      only the key fields that wont vary between
                      different architectures.
+                     3. The custom root node (UBOOT_FIT_DESC) and
+                     configuration node (UBOOT_FIT_CONF_DESC) descriptions
+                     are honoured in the Image Tree Source.
         Product:     oe-core
         Author:      Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
                      based on work by Usama Arif <usama.arif@arm.com>
@@ -1607,6 +1611,7 @@ UBOOT_FITIMAGE_ENABLE = "1"
 UBOOT_LOADADDRESS = "0x80080000"
 UBOOT_ENTRYPOINT = "0x80080000"
 UBOOT_FIT_DESC = "A model description"
+UBOOT_FIT_CONF_DESC = "Boot board XYZ config"
 """
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
-- 
2.43.0


