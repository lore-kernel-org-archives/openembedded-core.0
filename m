Return-Path: <kazuyoshi_akiyama@jp.honda>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2544C982C1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 04:25:05 +0000 (UTC)
Received: from mx0b-006e0602.pphosted.com (mx0b-006e0602.pphosted.com [148.163.140.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32196.1789619094959792499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 21:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jp.honda header.s=PoD-DKIM-Selector header.b=kW5W7nz1;
 dkim=pass header.i=@jp.honda header.s=selector1 header.b=Ok2Pqeml;
 spf=pass (domain: jp.honda, ip: 148.163.140.78, mailfrom: kazuyoshi_akiyama@jp.honda)
Received: from pps.filterd (m0469181.ppops.net [127.0.0.1])
	by mx0b-006e0602.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H0f1Rj2282625;
	Thu, 17 Sep 2026 04:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PoD-DKIM-Selector; bh=8ZR7TC5rpaM+Fwv2p+RavXMbwCkx5ll1Of0nA5Y9+L
	0=; b=kW5W7nz1OXZBHPhqXXLuku1M3aoQRi0e5bebSZR4PFgdWWKzw+c2idJvI0
	iHm8jPm3mchk8rOtmjzUkhI7sgtJ3Iz+EjjFRH1J8FnBIE/+72UOPyplQI+dtsGH
	9Nc53Fn1sM+PxLwql9ZQ1qVFkOPjJuk6Ib5P4emaImZQVhahGJ1KFOdePuHcbpYX
	OuZ0owNY89gt9cY9qZyiILSfr4hZtB3CcEkAdaNQiHKMsuNCeCPru1nyd66RzsVb
	nVhc4irgm3m3J/RCZldz8e6kD/1F/OaQRwSKrbKW2V9/xGfWuoMroLrlFG1orqPw
	bt92PEF6fPs0eLKH3HJwI8R9gkXw==
Received: from tyvp286cu001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	by mx0b-006e0602.pphosted.com (PPS) with ESMTPS id 4gr5vk8tm3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 04:24:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGj2YhNtwNG24XAVPnd2Hg0qZ3swz1tvwqVErU1SUU91OHFRcpH/rMLZ/wSkxpz1ZM+Zc4bF0I7T+xWf4n/fr1jekZLSdILoZuSnqjbaCpZnP2b5bvdluJ7XXMmXtBSJgQzdGTcjAJLnJWc85N4gFAiLILgRihNZ1lD+r0/1dzshjA8hbrvwKeZxzl09N09wc4e3uuXogHys3FtcAvoUv05ZwAymj2r4amxucVFqkyn70ZsKC0OpOrleIcucH+lek8djR/f95PBv8AH6Huf62U4/Zy6NAyaul0LtBpP7n+NZ/vfJS0upjz2M1FZL+iuv96+ogDVY73EZ5tvs8Rn8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZR7TC5rpaM+Fwv2p+RavXMbwCkx5ll1Of0nA5Y9+L0=;
 b=Xe8gSW25/oK43Gkr90TmKjClo13850ICdemgmm2C7FTnvljCjGkXSFH0HhsdoHhOF9/RNSP637DDgqFQMPcYSaWB7fEdV4fazr217Xv7f8TVD5CqShIDdQTC+/7bqSo2NG8g4AyaMlPpbJTxswgV19Sn+AyDzeRSVmf/lpdif2aDcXL9WJ5Wn+tvuONQutuSRBNW9fRY200OzLwfLTBOgwGpE7LBb7L5YLcIqk1kziyN0bZLlyGVsEhFBXGzAA17Cd6qhyWYG/7g7P4Eyzxz4Jx7GWh5ACz21HRcO6BVDEbkR4jttPueYSwyaK0r3lcAa2iTFhe/g92WkSHmkRXatQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 202.74.253.75) smtp.rcpttodomain=bootlin.com smtp.mailfrom=jp.honda;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=jp.honda;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZR7TC5rpaM+Fwv2p+RavXMbwCkx5ll1Of0nA5Y9+L0=;
 b=Ok2Pqemlno/8RZCuGoY1xv2mm1fdyhxGBdBbLPk90R4FpVwmgdAOlaF425GT1hIg/eFjjnOnUtOc0N29l1RmAu82q6V3crFDrXjnCvudZvWiPn8ss3w7Q24TlNVf/DrcePKWElswegmRuyCqGeqJeuk0w+PkiTxGsctHYhFYkM+JM6RI0fSzUDkV7g+QTuQhI4GFUHYeJtRJK1E5ZkWCdzqFMOgiKCRK5Fcciiusq2aIPI+Vq5IXHCOLMKwX93WINvIYLQpO2sDUsZkc1kglwdyHXFbuqqfRax+eDmQUOJd7IXgelPLVExSjS4NuhMUz5wVXLPu4Rwa2xg0y82McdQ==
Received: from TYCP286CA0035.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:29d::8)
 by OSOP301MB1935.JPNP301.PROD.OUTLOOK.COM (2603:1096:604:468::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 04:24:41 +0000
Received: from TYO1EPF00005023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d:cafe::37) by TYCP286CA0035.outlook.office365.com
 (2603:1096:400:29d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 04:24:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 202.74.253.75)
 smtp.mailfrom=jp.honda; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=jp.honda;
Received-SPF: Pass (protection.outlook.com: domain of jp.honda designates
 202.74.253.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=202.74.253.75; helo=JPPFSMTPY01.hm.jp.honda.com; pr=C
Received: from JPPFSMTPY01.hm.jp.honda.com (202.74.253.75) by
 TYO1EPF00005023.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 17 Sep 2026 04:24:40 +0000
Received: from JPPFSMTPY11.hm.jp.honda.com (unknown [10.126.162.186])
	by JPPFSMTPY01.hm.jp.honda.com (Postfix) with ESMTPS id C0C0310000645;
	Thu, 17 Sep 2026 13:24:40 +0900 (JST)
Received: from srdserv1.hm.jp.honda.com (srdserv1.hm.jp.honda.com [10.121.66.58])
	by JPPFSMTPY11.hm.jp.honda.com (Postfix) with ESMTPS id BE01510F6723;
	Thu, 17 Sep 2026 13:24:40 +0900 (JST)
Received: from RL25041301.jpn.mds.honda.com ([10.109.174.205])
	by srdserv1.hm.jp.honda.com (8.14.4/8.14.4) with ESMTP id 68H4Oeh6028153;
	Thu, 17 Sep 2026 13:24:40 +0900
From: kazuyoshi_akiyama@jp.honda
Date: Thu, 17 Sep 2026 13:24:41 +0900
Subject: [PATCH wrynose 3/4] spdx_common: In get_patched_src() ensure
 kernel dir name to be ${BP}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-backport-wrynose-v1-3-bb7d640c2719@jp.honda>
References: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
In-Reply-To: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
To: openembedded-core@lists.openembedded.org
Cc: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>,
        Benjamin Robin <benjamin.robin@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.16.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005023:EE_|OSOP301MB1935:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a12db4-e247-4150-56d8-08df147397be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|22082099003|18002099003|13003099007|3023799007|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	brkwU/zbIJAyrK3CKX10fFeJN+5j79msSs6lUjM3s3gv6uKhTlNNVB6bHW9wGDCiyAX3Csbr4shgZFC4CcQthTgJmdpfoXL/xPVxeQQCjA/6puCMcdEhjNqEZBtWmOzvlEW9zAODh0rGRFMWGzRK8zHe2f0cLr0OCvBTetl3qMLaXNpiGA3HHHr58dRkO2kdhGE0V5qN6yub772c2Bt7M65MzcpTDO7UHBnn8p7XnoVkFqpiRGacEx7gB0EJRcex70oqRZIBT0AAwBJpkVCUpNueZXhwzOvDCr7/KYyGIaqDOVQ7YYpZ46AO0zCN1zEG6wMFAsWlu/fszgAQipD+F+Mwh+ZtQHkfiODJVi+Y4m80TYgrRqq0PS3GdbZ4mYbrS1IZybm9cJtUc7+NPIBqwoBOvYghrK4aELCcFcu0WgSBiVWUQ8vu0BgyTAUh/dh0aD4sWKwt574eRSLkApjAfFF5tIRBYDOFuh2+xyBHLrtntaSRWDOfk2yAy0lhEMIszxALKNY6jwRsNvvkbm1YAK35osOeNiW0CTJApRC6QYSYaCAa/uKDH6aNu1TuQrRr9O92IW0wfEJe8C69cRXtSch1U6nfRC9i/SBi+ej/NIUO+blWtQa3fnsJMgGw/x59IL29/asVAf0pMZKbjfS8heNbhSZIJLP51rp+IBWeUMfbo/oB/OaqM8cZINrBi4lw
X-Forefront-Antispam-Report: 
	CIP:202.74.253.75;CTRY:JP;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JPPFSMTPY01.hm.jp.honda.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(13003099007)(3023799007)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+Rsq3TG+F9S/79NkA6EqmYNC7LcWwM0b0ROoUm+cPBbNkygFBz2Uk+d9CUneUprsmmqivliRIUfU2RGPKwTRdPSzGLzOIGyVNxSJPNhqMzw2XfaDBvXSkzCT6JjCt+t2DZRL1gvNw7Mb5Dz43ShuY2wfb08edzPyrMpxwpCaChdwb9I8JQ3ntsn0FL9yVrkXIVgImugJ8D92Lclt2e4EB5gTpL3+lw2CBKA3jMZRHw6OH04uo5z4ne0ipE8v4cYbEDKXFcxQnjIBk0Vuo66G2bRpbNl/zOGyh3eemvW6nSjMG16XaHiwpZVT/jfFyp5/dviLo0uE46Cc4zi3ygXG/tiE7/vhZ09hbt3gAxYgB+ackH3r2feejDP0diZ8fkoWppvW+crZBc4Ls3oDCTUPt90cdJiWG1gxk9GVkyahQ2R/rXEmYR7XFybN3LcwquKs
X-Exchange-RoutingPolicyChecked: 
	VFJO5XToAqtU35P5gyQ97PF3nh1hGQq1cswPyEnFEtyJe/Ie3Iu6zWNkayioV7Txz/zEMbGcWQxcdHLFhrV9y50dYaedotwVTebwWLKmfQ8bRAc1AuNcX44KSqa8e7BTLX9UXbhiTtp29rFYwge/jvLpWisMo/vv7h6g6DA3jgNhDN0lk7pkRRPL/G9J15qLDgZBQt58Ke1b73+C9z5x7lEnsjR17WTrZaRGWnROw4pkWc0gFuQxRnwpuEWzJu+gVtnodBmEM6W1miOgMJDicHAqNvsrFjjCPGJ7efTdIPjHlKs06Okc9RW0TzpfhF4j6B8IDgzNjUHwoBnb4T3neQ==
X-OriginatorOrg: jp.honda
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 04:24:40.9038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a12db4-e247-4150-56d8-08df147397be
X-MS-Exchange-CrossTenant-Id: cc138ffb-9c4d-433b-b211-d4549ae62e8b
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=cc138ffb-9c4d-433b-b211-d4549ae62e8b;Ip=[202.74.253.75];Helo=[JPPFSMTPY01.hm.jp.honda.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005023.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOP301MB1935
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 04:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246004

From: Benjamin Robin <benjamin.robin@bootlin.com>

If a kernel recipe is using a tar file instead of git repository, it is
necessary to override `S` to point to the unpacked tar archive.
In this case `${S}` is not going to be in work-shared. So we must handle
this case in get_patched_src() to ensure that the kernel is extracted in
the following path: `${SPDXWORK}/${BP}`.

For a full detailed analysis see [1], but in summary this change is
necessary because:
- In `save_debugsources_info()` the sources are extracted from the debug
  symbol. For the kernel Linux the source file path is modified to look
  like `${BP}/init/main.c` (`${KERNEL_SRC_PATH}` is replaced by `${BP}`).
- In `get_patched_src()` the sources of the recipe are extracted (again)
  in a sub-directory of `${SPDXWORK}`. If `${S}` is in work-shared and if
  the recipe inherits the kernel class, then the sources are extracted in
  `${SPDXWORK}/${BP}`.
- In `add_package_files()`, with topdir equal to `${SPDXWORK}`, all the
  files (recursively) found in topdir are listed. For each source file,
  if the file path (relative to topdir) is in the list of source files
  retrieved by save_debugsources_info, then the file is added to the SPDX
  SBoM.
- If we are using a tar archive, `${S}` is set for example to
  `${UNPACKDIR}/linux-${PV}`, so in `get_patched_src()` the sources are
  extracted in `${SPDXWORK}/sources/linux-${PV}` since
  `UNPACKDIR = ${WORKDIR}/sources`. `${BP}/init/main.c` is not in
  `${SPDXWORK}`, but `sources/linux-${PV}/init/main.c` is.

[1] https://github.com/bootlin/yocto-kiss/pull/26#discussion_r3626224833

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit 9bb9763c4c857edfc64aa2ad189a78a4bfb0c897)
Signed-off-by: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
---
 meta/lib/oe/spdx_common.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 013f23ae7c..e40cf36bba 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -187,6 +187,14 @@ def get_patched_src(d):
                 bb.build.exec_func("do_convert_crlf_to_lf", localdata)
             bb.build.exec_func("do_patch", localdata)
 
+        if bb.data.inherits_class("kernel", localdata):
+            # For kernel source, rename suffix dir to ${BP} (${BPN}-${PV})
+            dir_name = localdata.getVar("BP")
+            kernel_dst_path = f"{spdx_workdir}/{dir_name}"
+            kernel_src_path = localdata.getVar("S")
+            if not os.path.exists(kernel_dst_path):
+                shutil.move(kernel_src_path, kernel_dst_path)
+
     # Copy source from work-shared to spdx_workdir
     else:
         share_src = d.getVar("S")

-- 
2.43.0


