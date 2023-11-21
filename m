Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0EAC61D93
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 11:43:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.37940.1700567008026260965
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 03:43:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DwYSp5vv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9689cbffc5=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3ALA2PNc024662
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 03:43:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=sCsCl2uwMW7OQyAmGP3SPaqyZc11QJt0d7K8mNJND2w=; b=
	DwYSp5vvH1frZB9/5QlaqqRKgGnG35ZIa9f89FisUO29pSmN0X2kpolc0RbloTAW
	fQC+4CfRTBNfJPoBI1DlmPf7glU0xnAajpu/Lhe/LVgwN435mUwGbQ5NeoqNdtlx
	/ZGLWFmlnX/U1C36kHAkgwwQWn/XA85wp4MTxX7/kh/uy9b6SqRguNYbXBQL4H18
	eu5AA4mUmE7m9Vh5iH57P5VZoaSHDDvUUsWtSW8Im6b3Mwo+YBkvNXnYMsMA2HN4
	86X3ROgTZa48cV5S+yeRqxFiuxU7xlASXk+b41n4YoQz+6t3bW5NDCfdgvKuVGIz
	ajYqQ9Eh4BTqXYnmzH7CpQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uese429sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 03:43:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWNrdVs/HadrI0C4KRA0TGURfOXEU2S2/iZ15jZk0N1cKA8ZgGLrLTiccnfelJHsOZFvJmlgCC0G66THyQs+vxMn+Tncnd9/Ut31PGP6/GsoOtFf0fPIJxMCnE1/DTu21CuCrp11xdeuKbGXAbpXI6OdO7pJkk26MDjGuwGvm9DgNkQKb98w/vDkaA2Qlf/yvQm5Vn9rAFKTD+zFdZZkzYEy6vLtXVG/y6iYRaF0s3Bf7o3uImvtToZ3jFidjeJByRARnKBpwWwaIrZsXK+kXVl05rjd+Pxgp85FGzBQFtfeAL6YCXaK8tqqi5QW0+hl56XTsVVWte7maVlABnCh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCsCl2uwMW7OQyAmGP3SPaqyZc11QJt0d7K8mNJND2w=;
 b=humItHljDVAWcRy9V2QuuKwVZ66g8YBzP9h8wpt8WEv1iUFAD9IRH3SWBg8MGPieWobni1B0dNeviA7LNxAU4jBGkQ/Z0wAAuQLSv5CM+5yBKRQeVo4KkdpV1PYig8S7BBNDOmergsDeNnwbglikEWy2jRpXHiVAmxi7lsMA8OFATVEP/G5G02qtSNDWUzI+czRvHzz6wy4J6TNwZ7+xf5oxDYb/SA63Zfhm8+VrZ9UzZ+2jUAc8x8h5n5FKF8ZiQDQjGV7FkA7B5CnGZ0GXTkfLotRmh2Rd2oQPOaKdZMyVMndUPaPbAVfd0Klf6RGPlB/QoxtjilneJuPMKskicw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by DM4PR11MB6429.namprd11.prod.outlook.com (2603:10b6:8:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 11:43:25 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024%5]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 11:43:25 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH V2 2/2] binutils: Fix CVE-2022-48064
Date: Tue, 21 Nov 2023 03:42:55 -0800
Message-ID: <20231121114255.43746-2-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121114255.43746-1-Deepthi.Hemraj@windriver.com>
References: <20231121114255.43746-1-Deepthi.Hemraj@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0019.namprd08.prod.outlook.com
 (2603:10b6:a03:100::32) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|DM4PR11MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b9de1f2-9433-43b9-e2be-08dbea871240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KUHH878jLSoWEQsZ6J+VOHtBo507zXesmiFo/yUUleQejU/ZYmWJXtflNZA0vDatZamX6YMVDnRI5xFCeTiJMuAWjBeYq7CNbqOFcxkz8Olhf6YjyPeOV2e9oKERWsBP1SRu/B/MG2SKjrWgrOGoAHaeut5gaLKHW7vLDSEBVS4dMGu5KNHvRTGsWY838AWZmeFDTr3H8BpHZn7bF2KCsoDKRXO0QXd4V0jU6WMZn8diisCHUrBgT9Kcoo0Raq5DSDuhb6i2HM6RWA52OtkEvEg8MvC72059Qhja7WesdSGxfPw/u4yzrm+uOk1Yn2HSNy1MQSBCFHeMs8qFSY7hCuPZMbTJe/+8H26uGa3ZGVpPTUS/xefODGSEu992Z2Jra6M9lYMZBz7gfsLErtMZM3eQdelZFxpc7PyWW/JLWa6QqQO64qijMzFugOtI9ayxQQlfm9bsgjl/789AAlAjW2VZufd+u/ACCUpWNYOpj3wt63xpWuN+i6PSBEVN2wQ+DZ9EfORAt018Wkyn2qWomwaBIpdbZf03o7IQElGxTxsV88mxOcoO7LivOMKFOFrag441KL+nEbv0dlH0MxTa/Hb2yxhlGID2R01+ZBaJE98=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(376002)(39850400004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(966005)(5660300002)(4326008)(8676002)(41300700001)(8936002)(2906002)(316002)(6916009)(66946007)(66556008)(66476007)(86362001)(26005)(107886003)(478600001)(6486002)(1076003)(6512007)(9686003)(36756003)(6666004)(52116002)(2616005)(6506007)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iz+teZPZNfkxPkGCyYruIeroC/JIs/yNilJiHAXoKz0ym/fp374OfpOfTQ1p?=
 =?us-ascii?Q?wCX+shHQ6p7RzxMIFvKvwLUQLQ5glJgJqxIXmNg2WYMMiAjrjzELCEfJ08ge?=
 =?us-ascii?Q?tUkHE0oEI8mdff+ywETI0E9R3OAkVok6lZED+45k0F5KypJTRurk1tWoe3y6?=
 =?us-ascii?Q?vBDB0lQ5UfaddVXHn/cjzv0Z+mni+z+FpoNhFkLc/rwgj3Ps37+xC8zyfAZY?=
 =?us-ascii?Q?j/RO8dv9rpN6Py+IOckzWx1DH2so/BpIwRV7UqzHI2uf2bI6ygMsq06sq+OP?=
 =?us-ascii?Q?UkqfOrui+YXfh8q2J7u7J2WTaGjfonxGEz0zFYrbd9rzHC6JvGCyW8Kd62DI?=
 =?us-ascii?Q?uypBWeac4zYEoU7/h/JRy42S2gcX2CzTJEfbkIhICpZp4T5o/KpJ1LuOGpAq?=
 =?us-ascii?Q?/iLbnp6SVcdDl0ldMVIgUld46A/+WaOSedmaiiyIDvtRNaF3f/J4Z5Wj90eL?=
 =?us-ascii?Q?IIaEEI29a/ih7JzhHOg/A7CSqtkIvWXY29R2/x8B1tIoMtkHQbB/4uuwVbYF?=
 =?us-ascii?Q?m3qEaPOHq/CtZGIWqb0gGzRNH7sMK4S8ISIS4tMz5qSm2UFhr4qY3zeTz9+i?=
 =?us-ascii?Q?g2fwP71avpqcOAd9ivlsHdKvBgFBf+2XdEHE2zldoG7ZoGrprfCQ/5AjavOl?=
 =?us-ascii?Q?/PknUmlVmovRKl51MmSKAPeg0QDx/E1t+jX6pSbZbNzhO0fS0yTvIMVkzo0o?=
 =?us-ascii?Q?yTP3lpAFTx++JzsXgYqi64Va41mfR2brUjQ9R8ZajCPQ7TlTmehp0JdSVO6O?=
 =?us-ascii?Q?IxSzDuHAj1Y1ZRA8t6dw8ZBvKePGwo/yI9x1mjgv6YA5urrkar5Z6nORMkPp?=
 =?us-ascii?Q?QtrLFpXhHL0GFSAdC2WFkB7AyJuHYhybVFTTIKTAxEM5N4l27/zjcGOkaIdE?=
 =?us-ascii?Q?DUbEAUcAF3pzv2NyI04a0Ds0RnDuZR3chdBVG+ORG/WZdXrCk4g+w1kGEjRH?=
 =?us-ascii?Q?UEMVoowdwSuuSclX+OV3ZpDYRBD7sxTbWqwElzm4xKoF9XUOS6SX5sf34+sn?=
 =?us-ascii?Q?bRfFSh7PP8kXfFQYaMSz5RitO5qiOxLaPxND5EGX8gGjl6D3RGZI/Z/J0WMZ?=
 =?us-ascii?Q?TJ07yVEvOa+X2CKsFCHie29th3jB/VfRUl7qwpQHCslFOTjE/YwlLuHZhH/D?=
 =?us-ascii?Q?wMVLc3BVlT+l0z2r7+KiS4gf02gOkx4hhDfAI4VbURxKQgzjIc0LUa/yiIXs?=
 =?us-ascii?Q?SdZoL9GscBXR9nHylVIveClhV9sbg1Yko2YyD9dHxsZxDYZZymn7FVDHEmZZ?=
 =?us-ascii?Q?0LtECb9nOxafnNqUCGOYWzaWS2zCgjAu2lXfW+c3T1kmvq+jAezGkiaMmHH3?=
 =?us-ascii?Q?SaFCVFYrTsj3kI38oGBBvq+uJZj/tk/AF76osmTdeKoDTbjsexo3409ebuye?=
 =?us-ascii?Q?Rpx8g4vxfa4G8R5tyGQ86Cyd/jr6vsWt6m2CeS9NgY3uDEOIEWAJDtQQ8RpN?=
 =?us-ascii?Q?lvMXcpg6CMRYiax+nuI+ICRDlsf8j/DERoBnIBW72CZMYdLjxGkKTU192LxX?=
 =?us-ascii?Q?uKaL+nqJsGZFtCAdpmEDJY2JAFxGXZ8Q21yVgPDoKYtpQHZrowiEB9pp2yEa?=
 =?us-ascii?Q?5F88ya+uxpnDi+HWUKfZX8llTAQ7zsfAKoxDCTTRUBLDLBlmKv2zXjxNFShw?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9de1f2-9433-43b9-e2be-08dbea871240
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 11:43:25.2264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ytc3Dy6ICpag6/+50GLGIdsv3g5IDCgoXmcvOQHLDeH/SNYgDgankIAxuZLIikw/Y+8jejdtx/Ct9Dgu5MP1ewc3r/m+UTBc7NetgSNjB/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
X-Proofpoint-GUID: NxHpQu9sPKA9kUVKSVQXNB9FF59OZf9v
X-Proofpoint-ORIG-GUID: NxHpQu9sPKA9kUVKSVQXNB9FF59OZf9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxlogscore=788 suspectscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311060001 definitions=main-2311210091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 11:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190970

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0034-CVE-2022-48064.patch        | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0034-CVE-2022-48064.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index dc29141812..3787063cba 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -68,5 +68,6 @@ SRC_URI = "\
      file://CVE-2022-48063.patch \
      file://0032-CVE-2022-47010.patch \
      file://0033-CVE-2022-47007.patch \
+     file://0034-CVE-2022-48064.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0034-CVE-2022-48064.patch b/meta/recipes-devtools/binutils/binutils/0034-CVE-2022-48064.patch
new file mode 100644
index 0000000000..b0840366c7
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0034-CVE-2022-48064.patch
@@ -0,0 +1,57 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 20 Dec 2022 13:17:03 +0000 (+1030)
+Subject: PR29922, SHT_NOBITS section avoids section size sanity check
+X-Git-Tag: binutils-2_40~202
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=8f2c64de86bc3d7556121fe296dd679000283931
+
+PR29922, SHT_NOBITS section avoids section size sanity check
+
+	PR 29922
+	* dwarf2.c (find_debug_info): Ignore sections without
+	SEC_HAS_CONTENTS.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=8f2c64de86bc3d7556121fe296dd679000283931]
+
+CVE: CVE-2022-48064
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 95f45708e9d..0cd8152ee6e 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -4831,16 +4831,19 @@ find_debug_info (bfd *abfd, const struct dwarf_debug_section *debug_sections,
+     {
+       look = debug_sections[debug_info].uncompressed_name;
+       msec = bfd_get_section_by_name (abfd, look);
+-      if (msec != NULL)
++      /* Testing SEC_HAS_CONTENTS is an anti-fuzzer measure.  Of
++	 course debug sections always have contents.  */
++      if (msec != NULL && (msec->flags & SEC_HAS_CONTENTS) != 0)
+ 	return msec;
+ 
+       look = debug_sections[debug_info].compressed_name;
+       msec = bfd_get_section_by_name (abfd, look);
+-      if (msec != NULL)
++      if (msec != NULL && (msec->flags & SEC_HAS_CONTENTS) != 0)
+         return msec;
+ 
+       for (msec = abfd->sections; msec != NULL; msec = msec->next)
+-	if (startswith (msec->name, GNU_LINKONCE_INFO))
++	if ((msec->flags & SEC_HAS_CONTENTS) != 0
++	    && startswith (msec->name, GNU_LINKONCE_INFO))
+ 	  return msec;
+ 
+       return NULL;
+@@ -4848,6 +4851,9 @@ find_debug_info (bfd *abfd, const struct dwarf_debug_section *debug_sections,
+ 
+   for (msec = after_sec->next; msec != NULL; msec = msec->next)
+     {
++      if ((msec->flags & SEC_HAS_CONTENTS) == 0)
++	continue;
++
+       look = debug_sections[debug_info].uncompressed_name;
+       if (strcmp (msec->name, look) == 0)
+ 	return msec;
-- 
2.42.0


