Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A97CD98E6
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 04:06:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9548.1696997174428879587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 21:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iqVmhBQY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8648198972=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39B3cSfU000830
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 04:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=AVDGFPPufnO5N2INWD
	vDuxxUsXif3k0uFVbN8iWrslQ=; b=iqVmhBQYQLPooY2MhzAKYGOzWZg45mmCSV
	dydzMV1GcYIf7lMzX3bcpVB1e7rwB3ZpMc48cm3LzuL+vqeJXgbRyzPks4tmmgCm
	O+ZxPFyX0K2icG+tlXjdEhZoRmntpINBXeX820+3d727L1EXCXrjerPcFO6vb8wR
	5nlOAEk3eUEEzdEKrkzZBxV+AOv+/XkRgnXzRDBnIEYjS+bP8g4d5yHKCXEsVlrL
	Xb8Q5I+UecMNj+QQONI/Xg3Pfs/0jzPjxp0UHG7NMDOvr2nTZggo8wR+2CU+ZvxY
	in5jvK0ClrW+BdqCfYNYvmSgUJ49O3OsJddziNYv5lGwR9yHWK5Q==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhueg30q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 04:06:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YecnmFnYvpR+84wZIt4h9bvWxyeS7igMQHZ/c05yp27KpVTl3BX6a0zx+sVLx+Psd7a1I9dKZXgAjinv+1NdZkBHbvwGlX9o7VLYSx6rtdtJJbUTF3rOX2NxTdwxcKRGTVUuZp9HkLn5XXfb8xewRfy9MMwnpAbsamAZyCClVnLgv4KiKhO59u0e35wJkiM8AHARBBRjVBo+S/7PltIUu8Av4s0+FpEccvAkNcuesP+OX9fcvbd4AvhS940iBhIM0kumH3fCW5ONqZT0tPgAZR9dLdipwyusIwa7ehFTvEFXScgN0MYiHBjRkoK1QysXtLV51Hw4CWUUed/nRBs3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVDGFPPufnO5N2INWDvDuxxUsXif3k0uFVbN8iWrslQ=;
 b=Vdt88sPs2oyRy0wrC1THvx7zQqjPhwCIRWBVkmNpxNVwLPhJjAGYFLcgdA+6wRtXHuLEIOznQXsUP0VWuDqKTVDTSpF4zXCSx8POp6fCmEEQv/idhBEoZLeNBlqh0oMHSH1l84p1wJVc8Wny636dTv5iIGPGxkvRrnLzeNt1czzSz+MYVoW3Ai4ADjXrJa7qiIet3deExB4s9aUfVxfLGxrA7nw/hr18scy3+ll2niJkfOtLWS4I04s03gOntyoLdH4azTXWQ8Wmxh3Wka0iFfVAuSsngQEQ/iGCVw/yibn4QPOGINoOLBd0Kd5MwNheFm84msXhN7kfyMKaVQ+IeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by CH0PR11MB5476.namprd11.prod.outlook.com (2603:10b6:610:d7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 04:06:09 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::f04c:4fda:9b29:3fa]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::f04c:4fda:9b29:3fa%4]) with mapi id 15.20.6838.033; Wed, 11 Oct 2023
 04:06:09 +0000
From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, umesh.kallapa@windriver.com
Subject: [PATCH] rust: reproducibility issue fix
Date: Tue, 10 Oct 2023 21:05:50 -0700
Message-Id: <20231011040550.1392831-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:a03:333::13) To CH2PR11MB4470.namprd11.prod.outlook.com
 (2603:10b6:610:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR11MB4470:EE_|CH0PR11MB5476:EE_
X-MS-Office365-Filtering-Correlation-Id: 23cb8e1c-2565-40e1-fdba-08dbca0f65ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OAVls4V8uCPfCsZIsqc/QeVr5MnMpxDDDUe1O7YuNEWq7qA6Uexf9jZNOMZg78PkxQHroeW1QwCeynVp13sqyicA5y1m2jdgdYtCYGdVADYgd1W5QA1qYmfYYCrUM8ZkI5cSsfjMSj+MfNm0ltFXCDf24indAzdybsHT/S/jMfU/zKVaYdHVQo+MiPsd33WbqHgQnjnidik7VZZO2yqZjLf33xKad29EQZG5Nu8RBG3DvbolaZNSmUV2D4yU5acMl25eECqDDO5qdzdfefShEOcL/MCiN7PM5MJSQu6oYPzkGrWl+Tcu51zF06WKcMT5SJac4MULYTpq8ECllKSOvvUSBzOuHKEC/gDsDdcKowJWBsfDwgrAVU+NIulWmFTTbOHwu4fvjyw4hK16bgMO0GYqnF4F+NMAJm/hv5+z4eEf6mFnKSa6jKM9CgK/fTW61Vqzfrr26UMfv3rib04b9MiNNVuSQhMT2v/6aFPjaU1krtAdUxzHwr29gPR0MTDJMIe30n9rl3xt1nMjD00IPZ8i6bp55N7cEozOKcs2xDvvaZUCN+phmqquq8aAKvjQ71I+i4DgQUKCQcXUVkgt7rp8ZP4XdBB7p+g9V+xvijXiw722LP54CBXwvvQQ+YIX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39850400004)(346002)(396003)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(52116002)(1076003)(6512007)(107886003)(478600001)(6486002)(6666004)(8936002)(2616005)(6506007)(2906002)(26005)(83380400001)(6916009)(66556008)(66476007)(5660300002)(66946007)(316002)(8676002)(4326008)(41300700001)(38350700002)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QtkYYyaOFRDz5vqQwQQmmZBTatOlvjlFT2xZkPpKbi0e6iR0QseStvUYQncY?=
 =?us-ascii?Q?LeXrAY818Zhel2V0XnhXbjxJyPkqCUwwFaNyhb9AsHFzf1hgjQ9cvZP69X7T?=
 =?us-ascii?Q?u4lg+7ixu8KPw1zXAwUMbPw6PxiWQuzKXxQQyCzuKA0qCeU2goG1zUow76/k?=
 =?us-ascii?Q?g3DNhC1hOhPEmRFB+rsFL9ULDBaZCKU5kr+TxBiaay2lPJDD2LdwzkTzmw4E?=
 =?us-ascii?Q?DGM6ZGXdh0r0SYS3AgX/e4fWuA/vxiiSKvfPqt7FhBrR4eJuzhi6+ytrgL6X?=
 =?us-ascii?Q?jUKsx3NSiY/3skG19kBBVjA1uQmXa0oKEaXkhyVpCNYBf0E2oDZe4n3Is4GW?=
 =?us-ascii?Q?RSK7wdK95xRCFxgxpZrKgnI8Ugi/6hyxGRDsb6fTAcW2VijNOHINe+vUHSlY?=
 =?us-ascii?Q?FO+u8iFFyZE82Y+/5u67LyRE3j+clr14wrOHC9vX2RZfsBpvka/beJQPiwv6?=
 =?us-ascii?Q?4SubTI3zZEKNujEKrzW7IVhnkTx3GEjUjw++pvHD/smx00sJa1xoVbybcHfp?=
 =?us-ascii?Q?zpmxN426qNYm1ocENgpLOVUjtfaDyuu5U1FxHL2toEQKhBDiaAFgBAWQjWJb?=
 =?us-ascii?Q?WoUSYW3X0AKYI7Y/V3UQmhvA4j9IVvv7JAnGsaWHdyqYmHvd1TSQRXv7h5IK?=
 =?us-ascii?Q?DN/3AFcL0z2Eb8ctg0MYVWloCFo9txe779oRkOnfmM3E66yb2hOoO5/vbBWw?=
 =?us-ascii?Q?nmoKMpoECasjTglIMQ0HJys1NVTdYZJGush+y+465ZA/HeOzqzJI24kR/fk/?=
 =?us-ascii?Q?5kYlsFZefBw7q1RyJLA8OxPu9T/0JyPVKD0xSmHKEKJLwhp6tJS2VPrndttb?=
 =?us-ascii?Q?H2w2zh0a0o/2urUYtbqt0/x4W1OHujs8st8DLu5BYAJmAgDwkNWR0RDzEWWG?=
 =?us-ascii?Q?YRicilW+vJa4c/Av9T8J6G5mCHYjAXFBzZgRV14pB6T5hNoaSzU4LEmY5aDd?=
 =?us-ascii?Q?nzfrH00CBsaXO5lF3SZLQESD4TuRZ3+0guZAVWrGmF9eAHCSzmaOk4AdU4XE?=
 =?us-ascii?Q?e2wPiaf13yjwJVAjcaqX9HP8OHeI0bNYhQECsBm9x5lBJLwPMzu2kvqRH2+I?=
 =?us-ascii?Q?DDZvuk+2182m/LNWBSJIdQn+huVQc/LMxqTp4qnbAtwKDscLlmxSoiaWHXmF?=
 =?us-ascii?Q?UsCCjO/7sAunxtw5LDHVzsQPA90yiBXIG9VMnjZQH5renjp7fhJtpdi2HOxD?=
 =?us-ascii?Q?rhhw93swXt9zMuBHpvMrguLtFxCnotIJsLZP8U+MPI9/jrwPL1igXc0FXeGD?=
 =?us-ascii?Q?YMDKRlSg/9st4yWa/LbOlgXr8UNwEafvKiuajcdBIaWWPbeQmg7qRjaMCcGb?=
 =?us-ascii?Q?nkzvJFvQlFl6GCOtxMcsoQMETLutGLhxIYtfRG3goXARVa+ZavLMpnhtfa+4?=
 =?us-ascii?Q?WrBkwHLvW4yUQSQTehzh+zMck4zHIkVNgisyq5Z7dF6yNnr6+Cf9lYA49+CU?=
 =?us-ascii?Q?tKXoMp20DfHfxuUq6R2Q+KzKBOObqAz53MNXgYK2DIZXev+g1XyYHETQoom5?=
 =?us-ascii?Q?EsVZDIaSIp8j890jFAsiZLwupWcas1UsUakiV3d+AZKsaVW3QPy0hM+9CaBC?=
 =?us-ascii?Q?xmbz6M5WhGIrGgqhKR9bXcVqN5K1wWcoPiDAjseIe1bxtU73xri9y9HBylsj?=
 =?us-ascii?Q?kxGcdKMVymgLDRRVqSDM9Uo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cb8e1c-2565-40e1-fdba-08dbca0f65ec
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 04:06:08.7880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BHyERbvdJMVWsxzJvtSLEo5TJjPiEVx0U0w5i/dYvJJ2EizxSfalN3cPHKzlsdHbbO/aCQX0w0A2AsRkLRtPx94R9F0vqI814pozXSCguM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5476
X-Proofpoint-GUID: LENEyZg5tOwO87l_7e1vGk3nCr3JzOP5
X-Proofpoint-ORIG-GUID: LENEyZg5tOwO87l_7e1vGk3nCr3JzOP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_19,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=715 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2309180000 definitions=main-2310110035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 04:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188940

[Yocto#14875]
The '--remap-path-prefix' option removes all references to build directory structure in the debug information within the compiled output for Cargo dependencies and the project's binary.
However, some references to build directories remains in the final binary in .rustc section in the form of compressed metadata and this makes the build output dependent on the folder structure of the computer it's compiled on.
So, for reproducible builds, use the configuration option 'remap-debuginfo = true' along with the '--remap-path-prefix'.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 --
 meta/recipes-devtools/rust/rust_1.70.0.bb    | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 84c6c3a05f..9b4a0887dd 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -16,8 +16,6 @@ import os
 import datetime
 
 exclude_packages = [
-	'rust',
-	'rust-dbg'
 	]
 
 def is_excluded(package):
diff --git a/meta/recipes-devtools/rust/rust_1.70.0.bb b/meta/recipes-devtools/rust/rust_1.70.0.bb
index 3b9c05a19f..16d433910f 100644
--- a/meta/recipes-devtools/rust/rust_1.70.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.70.0.bb
@@ -130,6 +130,7 @@ python do_configure() {
     # [rust]
     config.add_section("rust")
     config.set("rust", "rpath", e(True))
+    config.set("rust", "remap-debuginfo", e(True))
     config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
 
     # Whether or not to optimize the compiler and standard library
-- 
2.39.0


