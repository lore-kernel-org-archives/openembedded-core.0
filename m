Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6465DD78770
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 17:54:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22405.1766166869725551609
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 09:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MO2XgZUL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=444801525a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ5plq82068561
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 09:54:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=4Ae9l3BJK74vHuRTwhFF
	9UPntt2jBytFB55+lMJEjE8=; b=MO2XgZULX4XcOoHCX3X7V0fz5+6jA8OEZvvw
	VTnRC/yYkxe4Jh/ZYQ37a5oNpnTPEpfDcL2s3aVT7FNJi7zyeggC9VleQJgh6jQZ
	ZDOrsnD7nOXIF4xR3EkHFl7S8C9aZGrIb/PAcTE3+xsVbNDoxbNFTCdcehM1Mg5v
	4wZF+yhthzSnvttjgK9QefmIwOxMgxgQvPWa/4BTTeJdNV4UwLl2ly453B2pGydY
	c0DuPDjGAKxJBTLrkY/O+U5GftQW7QkaGEIZomwl1oKhR63jnEQO5fnZCSYzq0M1
	0wGl28yNyVIJmazLunqTso+cf/Kp9xZYBA5Vw+XANCquQO5aoA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b4r34962f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 09:54:29 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 19 Dec 2025 09:54:28 -0800
Received: from pop-os.wrs.com (10.11.232.110) by ala-exchng01.corp.ad.wrs.com
 (10.11.224.121) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 19 Dec 2025 09:54:28 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] dmidecode: Upgrade 3.6 -> 3.7
Date: Fri, 19 Dec 2025 12:54:27 -0500
Message-ID: <20251219175427.2176895-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: VhxG0_Mml2vbfhuGMDyzqnJUNVmEnxU9
X-Proofpoint-ORIG-GUID: VhxG0_Mml2vbfhuGMDyzqnJUNVmEnxU9
X-Authority-Analysis: v=2.4 cv=Fp8IPmrq c=1 sm=1 tr=0 ts=69459155 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=Cc-XHiK_tJgtj2hqJvEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDE1MCBTYWx0ZWRfXw/YaaBQxjBpI
 u9by9P8IHiJQSOQhVkmLEvjRQAt98OuFI26sCbEzwK6YFnEnO02G/DqlWrZYqu5N1gmHNMMkufw
 BrLA8uOSEUww5zKvhR2rjsDb9kiwXpCAbc2UJzMmc+iyp8n5+wwyDVwpDV1xPMZblyQMkETCNKg
 AK+hPycGkEPaBV7iVLC1m+IaBV8/16CnGfORtRUpRlxNZyjNlRh/c8dxUUDvLrW5NZs+Mjm7Xs2
 AQsLICH1JXqIvLfrR9vZhNkW5CRWHxYJFhRGCsLtLLNvySpBKtZqzVhPWxxPS++6tdz4ErnzU20
 KR7iaOHXggRVqhVg4GJ2XhYSAN2tYLfj2z8MlulbRJQPNjHxNXlTnMAfdzA9ikhNa23p5OXXVRp
 s4d3SAP3W88asloPnEjFU3Macq9ly+l90cbYwRwHF4iUVBNP4lwOvMaT1w093FN4APa02WROLLB
 7E46kKxB7oq1aSkteTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_06,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 17:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228242

From: Randy MacLeod <Randy.MacLeod@windriver.com>

From NEWS:
Version 3.7 (Thu Dec 18 2025)
  - [COMPATIBILITY] Use binary unit prefixes.
  - [COMPATIBILITY] Rename BIOS to Firmware.
  - [PORTABILITY] Improve variable declarations.
  - [PORTABILITY] Stop open-coding the u64 type.
  - [PORTABILITY] Use unaligned memory accesses unconditionally.
  - [PORTABILITY] No longer build with -Winline.
  - Support for SMBIOS 3.8.0. This includes a new processor family.
  - Support for SMBIOS 3.9.0. This includes chassis type name adjustments,
    new rack attributes, slot ID for more slot types, and new memory device
    form factors and types.
  - Decode HPE OEM records 193, 195, 202, 211, 226, 229, 232 and 244.
  - Update HPE OEM records 203, 216, 242 and 245.
  - EDSFF slot names now include their .S/.L suffix.

Tested on qemux86/kvm:
   root@qemux86-64:~# dmidecode
   # dmidecode 3.7
   Getting SMBIOS data from sysfs.
   SMBIOS 2.8 present.
   9 structures occupying 401 bytes.
   Table at 0x000F52B0.
   ...

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../dmidecode/{dmidecode_3.6.bb => dmidecode_3.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dmidecode/{dmidecode_3.6.bb => dmidecode_3.7.bb} (89%)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.6.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb
similarity index 89%
rename from meta/recipes-devtools/dmidecode/dmidecode_3.6.bb
rename to meta/recipes-devtools/dmidecode/dmidecode_3.7.bb
index e5b4e27687..93c3678d9a 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.6.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb
@@ -18,4 +18,4 @@ do_install() {
         install
 }
 
-SRC_URI[sha256sum] = "e40c65f3ec3dafe31ad8349a4ef1a97122d38f65004ed66575e1a8d575dd8bae"
+SRC_URI[sha256sum] = "2c3aed12c85a1e6a9410d406d5e417c455466dc1bc7c89278bb32cf7cad91e8a"
-- 
2.34.1


