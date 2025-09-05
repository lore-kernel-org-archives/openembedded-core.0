Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35011CA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 06:57:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15310.1757055469686486413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 23:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nPZzpVLM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1343561a65=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5856eLgf728000
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Sep 2025 06:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=q+gQ79Lc9nOLzj3CtxLp
	mNAUaKRMbdUp8rKWm9/xSI4=; b=nPZzpVLM47+TSD1j35nxdqM/XLzqklzDInon
	FUuMxtb7/qAGje3+WmmBhd8X9LegaOE0OJNiRRAPGxdIs40vRIhEoRcw/6+Yxsme
	qa9yltL5SnPZHJe/E2z+3wnmSm0h+OQ/tTFzki0h6CuZLIATOMyWPO/LfNggSBAL
	/FxpQCDjLEHpHFhPN/5Xu4iyLKWqisdeF5S9LDO+dYH1IuFzyUBpbLuYaWGNi0v6
	qigAKZTxBgujmF++lRrLTc9b9o/X+a4XKnPFXjHGeY1r3nxc6FTr8mw/0koPgq8B
	7i68lfarZRQFnFWQiidz4dlUb/YPh0kT86GggcWFBuYIWn3FRg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7k2hfwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 06:57:48 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 4 Sep 2025 23:57:41 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 4 Sep 2025 23:57:41 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] grub-efi.bbclass: fix racing issue on grub-efi image
Date: Fri, 5 Sep 2025 14:57:40 +0800
Message-ID: <20250905065740.3721738-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDA2NiBTYWx0ZWRfX8nas6RKorb68
 508l5isk+pqItXJ16QasawwR8q0V+mv4NwAoDuHg2OsCS8zr4oKRngZjiLV7pDQK1kxrW8gb8wH
 QSu8COayzIK1B7RnwHM6halcIiQefE9SHec+YthvjKDB3V46YkJ/2MUwPD1BXsrl3+axxQ/fV3p
 ldo1NcpfpuPqFdSB49DuYkCHjplv0ZXFNDnZZtfzHRcqKH6SAPhE4BgBnUXbgyWHXSDQXgN19f6
 N3XSOAcpOPEezCCD6XlcEBqo1w5RpmlGH8HwrRQixU/xrLwyM2pu4HoRQ/+rM5aolpJwOXpZ2et
 zrw6xFe812H2dWn5SAAUdu7pD29awFw9yMR//vuwlr2oZ2S01zDPVipnO9SXtg=
X-Proofpoint-ORIG-GUID: nKcAI1Lsqc1qpnsybze7CEnGiiQqEQRd
X-Proofpoint-GUID: nKcAI1Lsqc1qpnsybze7CEnGiiQqEQRd
X-Authority-Analysis: v=2.4 cv=E8LNpbdl c=1 sm=1 tr=0 ts=68ba89ec cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=un5mlS33vyOhQMqQ1h0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 06:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222976

In recipe grub-efi, the deploy task installed grub-efi image to deploy dir.

In image-live.bbclass, the do_bootimg task called build_iso -> efi_iso_populate
-> efi_populate.

In image-live.bbclass, the do_bootimg task called build_hddimg -> efi_hddimg_populate
-> efi_populate.

In grub-efi.bbclass, efi_populate called efi_populate_common for grub-efi to
installed grub-efi image from deploy dir to ISO/HDDDIR.

Explicitly make do_bootimg depend on grub-efi:deploy otherwise a racing issue
on grub-efi image in deploy dir
...
|DEBUG: Executing shell function build_iso
|NOTE: Trying to install tmp/deploy/images/qemux86-64/bzImage as tmp/work/qemux86_64-wrs-linux/
wrlinux-image-installer/1.0/sources/wrlinux-image-installer-1.0/iso/bzImage
|install: cannot stat 'tmp/deploy/images/qemux86-64/grub-efi-bootx64.efi': No such file or directory
|WARNING: tmp/work/qemux86_64-wrs-linux/wrlinux-image-installer/1.0/temp/run.build_iso.954273:419 exit 1 from
'install -m 0644 tmp/deploy/images/qemux86-64/$2-bootx64.efi ${DEST}/EFI/BOOT/bootx64.efi'
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/grub-efi.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/grub-efi.bbclass b/meta/classes-recipe/grub-efi.bbclass
index 4afd12195fb..34bcbc53e69 100644
--- a/meta/classes-recipe/grub-efi.bbclass
+++ b/meta/classes-recipe/grub-efi.bbclass
@@ -7,6 +7,9 @@
 inherit grub-efi-cfg
 require conf/image-uefi.conf
 
+# Assure the existence of grub-efi image in deploy dir
+do_bootimg[depends] += "grub-efi:do_deploy"
+
 efi_populate() {
 	efi_populate_common "$1" grub-efi
 
-- 
2.34.1


