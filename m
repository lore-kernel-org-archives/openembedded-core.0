Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FD6C47080
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.35711.1649081563024832679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 07:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OeWx2Dl+;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=1093e8c0ee=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 234BPBvK012683
	for <openembedded-core@lists.openembedded.org>;
 Mon, 4 Apr 2022 07:12:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=5bCUl1zsxDc3oJSXMEhYn4NuRlAUjnRKYlfWY5ZK/j0=;
 b=OeWx2Dl+ThIymkdeOJbyKHazvvZ7P/SCo1uN7/94NDovDtRo8nJLIzLKm0GKLi4o6hFJ
 SIcNC2GM58m9SU/9kbY6B6zyxaAr35QtFg2p2BHhtKr9abESSYOlbQGQEU23jxkKCMSD
 3UVCG8Hef7J5tq2evbDhwS13I7nHUQYSyHZJvewWp7xuMD4fqryh3Wd6P3RXYKka1BCa
 Iig6gw8ClNMlNxdDnhA5SRJE3CiSQ98c0TuUPGvjhMc3lo393ZZIf5l66gO1Q1atC2O5
 OFDf2Fc7nh8w1IMc4cgaAcaXUQM1vcOh+Ssw3Xe1YfqNqePlsPveLnscjHpw/qgs/z/Z Qg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6hs3sd0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 07:12:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESVQ6VH00VPfxpvXsEamS6oheBibt1M+jsN/82ovG7RqUa3d27oczNy8QO+/o8YW9prJ2Rdx7U18KZU/JZQRLmHn15ROgBwpKxMJD5gaIDUj3QAWeS2AtL4GRrDn014Xf7tjWdMQV0aJ3YKQ4voGaSm9a6DL4vm6lerg5b0pdPnYRHLv+Alc+7JfRxhCXuLG4a3rldtXRMIaAR9M5ad9D+gecPW4Jzn9C2s4d57pQcIIIFEY9TMnZJJiaX2aZTimOuK78MGX4FWIig49QRUEXfPWnML1sw9gpxSgaV5yXgqe1XCTk1MZI3T1Y7GuFPCGW4cjgOz3SPaderNp9MKAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bCUl1zsxDc3oJSXMEhYn4NuRlAUjnRKYlfWY5ZK/j0=;
 b=ETvRktNGHs8JFVd+vbMgGoNjQjk+z/79npPSXJN9/M3s6BCASb0nMPbqRac4vstoD6AgPaHxtGyI4BVYzjv924IKfmCz94AlN01XacPGrHqiqBGZehYpiefnTf8thMcjSi9XKdVjUhF9DcFhwEmhmjwmdhvgdG0FvIMUGcg6tigm7jkKJPol6Q8FysWkaBk//vIxwJcMH3XD/vxXbbBwj2DZcbzdjLScPXjxDcmXetMjgNyZyTifKHC+3TlVtV08HDIddNxNl9jGMqz4jUpH2MO4FBDU0y2yMhILHD5BVFm9njW6wTqFJU3+SGm9pTfynCR7Xk1ALuk//Y/a32YHkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by DM6PR11MB3387.namprd11.prod.outlook.com (2603:10b6:5:59::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 14:12:36 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2%4]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 14:12:36 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH] kmod: Update exclude patch to Accepted
Date: Mon,  4 Apr 2022 07:12:05 -0700
Message-Id: <20220404141205.181821-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0170.namprd05.prod.outlook.com
 (2603:10b6:a03:339::25) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 222e66b9-d9fd-46bf-2f34-08da16452b37
X-MS-TrafficTypeDiagnostic: DM6PR11MB3387:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB33874B9CD4676829E1FFF2A1EEE59@DM6PR11MB3387.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Np3zW2wW3f/wGqavQ3CH2nHjtgX7xRPPrUFSRsxri3Mp6IkbXyzDPMpMZZ/WabS6jFfGcvLeFBLQ4EqsZJJq6yd/mGwsN3udpXy0PBMrvwctu0ko34oVzchvN5pA4IFSg2qy4AYdSNOOtt7h7OEWZZvKC6jU7lSn/482/lqrHXrgjDpQH93COvqHrre/LeL2URE9TG2KKeJ1uYwN3UNLKs4Y7VrtEkJud0nJ3CJReqFXDX+xt9ebS7Lj77W/6YJdWtNAfImGsmb/4A9yyadM7OXIRE0oAK664MLd3l9+nOnyMiV6hb6CtBdXoAp82yAHyKSdlUUwv+WDtUdApsWCcUfA59wEVsSE7aJ930/zafcdXHFZLw83j3MoAAWxcvWLDkrbiBSKWQDVusNB65nIAUDU/I9uCYoP+KhE401rOcgMyNhnMR8BnS81jSyCMjPQGBSN0fo7WaeixtbSNCHPGGkOZq+PtCacUDEoy9XWZ68v9lwip/vzc3yYBrfXu8yDtnBa6EsdRdwflNei/z2DWmbrATNxH9aYRmHNuCNIomcrSET1qLcg7eKyptTxVzlK0t5c14tbLOt4kVvo/+Vw9gYEl9PsCX7u53EnuwezyNGG0ndwHO48BNBV1+zHLV4eyfvtOtHct1V07OM5C1QDePLdjT9t6BSP5rCZUgZA/oNyg4cHqKpX4TdBiGe8/QNerrwWix2oz6OHFMfaikzDKg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(26005)(83380400001)(8676002)(4326008)(66946007)(66476007)(2616005)(86362001)(2906002)(186003)(508600001)(6486002)(5660300002)(6916009)(66556008)(1076003)(44832011)(6512007)(6506007)(8936002)(52116002)(6666004)(316002)(36756003)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wfwAzWhG2dW820Si9HgKCjJEd8cfJZJ7Y4E2d7RIbiPUBvwQdik42aqpgEvF?=
 =?us-ascii?Q?vS9eToU4cTgowkRIL+hcg/kMGoI4WMMaaD3/glVZ6jog2UtcLqboXqmREYj5?=
 =?us-ascii?Q?TsLPXIj2upYaI4oP6Dber9zAM8kA828CMeQcoNiaAlvXcsY/DRXFJFpYi8hx?=
 =?us-ascii?Q?icxqr878bATTz3sPnyGoe6lQ9yYxCW4rFI7EOsh71mJVRITb9OKl/HHE6vYW?=
 =?us-ascii?Q?z7ti677GpFoiZJbJLhGkbkSZGGkIWehOVhYaqyV3vob0k3lOiGmkz6ZE5pYn?=
 =?us-ascii?Q?yn8jws5kiafKTMA8eaxgrJ0uRzuat5xQ/JKG9YXBiFCfy7LZ4seQwym0qJ4H?=
 =?us-ascii?Q?E2qc7V7H/gTWxt6NDxFT4Xpjj6tLevEOpThHMdttAL36cFK/d6KLn8K9G3ZX?=
 =?us-ascii?Q?PEHjL6sFoQN91D9jfarLhuKPKwxgqExkvcy8i0NEviz/+SExlgpqPdKCSntu?=
 =?us-ascii?Q?gL1JsgLYiYnpRHw9pevFsOfQjosk+lWUSlZd3qJXgnvHXDglFF/XmtnlhS6s?=
 =?us-ascii?Q?yEKKAWfP26GOCB8/gi7+RlXB4pr7UJtzvoGp5fE9mPRG5vlABcAzeDI8inC8?=
 =?us-ascii?Q?aSWOk/eFyjZJF8UCF1xzp+muwj7WX7Ig4GrECbFx1JYK6+MLbBOE/XvabyaA?=
 =?us-ascii?Q?1Cs6I6naYVCTIOR1CZ2gjE/vmMhlwGnzdUuocSKtKz2lCn/9I8UJSTmDTnka?=
 =?us-ascii?Q?BfgNPg7tRLvudPodp5SPukwlIVpnJ5FRthgr0VdNPM8Nt8CDbgIfMKu7u6Xk?=
 =?us-ascii?Q?E8q2pFeV1untJqARUR1d1nczsJo4pDBAH8BC/QBJbIZ+NTPACO/wMQ0MgydM?=
 =?us-ascii?Q?Cv/R6TuMJk4ZIPihtp4MGQs4j2RzY51iU8OH8Q3LVy/+LWWoFEKNbR0yue6d?=
 =?us-ascii?Q?qGAmyhY4dNIQ1D/xd3axpFPolyTkEv5RduETU0UDrLcib/XJGAT+b0yIzUjc?=
 =?us-ascii?Q?mmaK1ZTGxxv1iW6plEgbr213JDII364nPHBpvu40SwRW6klV6mbiAxmm3R+w?=
 =?us-ascii?Q?wL/+0MwA/WYvZPvc8keLXx3DXFPCkATEm37D74QOaj46VIUYrdBZgxU4BeHp?=
 =?us-ascii?Q?rbKGDmbBLM9loaFlg7thUoBe8W59n0GjIlxa+Qj10CsLRRXFE/2ptK9sfFgb?=
 =?us-ascii?Q?vppdDb+C7z9+j7rPzASKr1/8Ejk72pnUl0dAE6f9BzfAUtrFuhDeDwNW7nxf?=
 =?us-ascii?Q?HLBYrpPlo+s+bZzB7pUsCne5fAVQ22/pfiYVstVd1Qr0F5BMfJfutynq5ZNE?=
 =?us-ascii?Q?ASHK92bGNMn68YISpIxW57IQ2jR41mSvffqJP4piEDoucqS0VBRUCnDLzXR3?=
 =?us-ascii?Q?moWyNhBCe6lXT8De473vlYbrxpzQPt2no1Yik2Nxb2o8SPvy/XuzN3C93n+B?=
 =?us-ascii?Q?SeYKtiVbBpWDN7qorBNaAwziMXrc3ENaCQHgv63J3TInWIxyXlnaIX0OJtgk?=
 =?us-ascii?Q?iGXy/OTvWfdUqoIQ4aajv9HMXOs+I+LagP76owkkw1aEQKOdq5dzH9q0ZQNH?=
 =?us-ascii?Q?SymiPRrc0Xj+sRCyhJUFp09HbKX1Q3nrwolNcpzhXX/i9PyWXYiWEj8hRw/G?=
 =?us-ascii?Q?0HLiRoty4rI5wUHTmeiSiORhRuprqMdMOxvyg3WGCLXeLK5DJKu2pa7HzkYL?=
 =?us-ascii?Q?Zxaw2JX40NJ1Y8Gb55Acmb6uvttlRXMcdTlH2w3gfE+vdwYpuahKNA7qfgeU?=
 =?us-ascii?Q?uZSXGvC3H35tfYsmuILllbDMfRcJLXdMRh8UdRqH8LieSg88rWrd36d+UXkh?=
 =?us-ascii?Q?BdMqcpw1wCQl4VT7xX7Jh6P6iKWcYTc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 222e66b9-d9fd-46bf-2f34-08da16452b37
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 14:12:36.1187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KT+h3LZ1fcjXZ3bHvT2sG8asTtmwK+pQjRuEbE5ShodQ1wxONUmvj88NZIvSQNMF7IN2CaOS4UU+xBIvk5wh8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3387
X-Proofpoint-GUID: nh-wjdG8QayaWk9mF7FeRyZFSPwsi9e-
X-Proofpoint-ORIG-GUID: nh-wjdG8QayaWk9mF7FeRyZFSPwsi9e-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-04_05,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=871
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204040081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163994

Upstream made a few tweaks and accepted the patch.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 ...dd-support-for-excluding-a-directory.patch | 35 ++++++++++---------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch b/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch
index 18d97935331..ea0570af2bf 100644
--- a/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch
+++ b/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch
@@ -1,6 +1,6 @@
-From 01f3fe68a7a42b06eb318f3b09fa5e5ea75d46c4 Mon Sep 17 00:00:00 2001
+From f50e2d67575ac5f256fb853ca9d29aeac92d9a57 Mon Sep 17 00:00:00 2001
 From: Saul Wold <saul.wold@windriver.com>
-Date: Tue, 22 Mar 2022 12:11:45 -0700
+Date: Thu, 31 Mar 2022 14:56:28 -0700
 Subject: [PATCH] depmod: Add support for excluding a directory
 
 This adds support to depmod to enable a new exclude directive in
@@ -12,13 +12,15 @@ via a new exclude directive.
 depmod.d/exclude.conf example:
 exclude	.debug
 
-Upstream-Status: Submitted
+Upstream-Status: Accepted
 
 Signed-off-by: Saul Wold <saul.wold@windriver.com>
+[ Fix warnings and make should_exclude_dir() return bool ]
+Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
 ---
- man/depmod.d.xml | 14 +++++++++++
- tools/depmod.c   | 65 +++++++++++++++++++++++++++++++++++++++++++++---
- 2 files changed, 75 insertions(+), 4 deletions(-)
+ man/depmod.d.xml | 14 ++++++++++
+ tools/depmod.c   | 66 +++++++++++++++++++++++++++++++++++++++++++++---
+ 2 files changed, 76 insertions(+), 4 deletions(-)
 
 diff --git a/man/depmod.d.xml b/man/depmod.d.xml
 index b315e93..76548e9 100644
@@ -46,7 +48,7 @@ index b315e93..76548e9 100644
    </refsect1>
  
 diff --git a/tools/depmod.c b/tools/depmod.c
-index eb810b8..ac365e9 100644
+index 07a35ba..4117dd1 100644
 --- a/tools/depmod.c
 +++ b/tools/depmod.c
 @@ -458,6 +458,11 @@ struct cfg_external {
@@ -125,32 +127,33 @@ index eb810b8..ac365e9 100644
  }
  
  
-@@ -1229,6 +1270,24 @@ add:
+@@ -1229,6 +1270,25 @@ add:
  	return 0;
  }
  
-+static int should_exclude_dir(struct cfg *cfg, char *name)
++static bool should_exclude_dir(const struct cfg *cfg, const char *name)
 +{
 +	struct cfg_exclude *exc;
 +
 +	if (name[0] == '.' && (name[1] == '\0' ||
 +			(name[1] == '.' && name[2] == '\0')))
-+		return 1;
++		return true;
++
 +	if (streq(name, "build") || streq(name, "source"))
-+		return 1;
++		return true;
 +
 +	for (exc = cfg->excludes; exc != NULL; exc = exc->next) {
-+		if (streq(name, exc->exclude_dir)) {
-+			return 1;
-+		}
++		if (streq(name, exc->exclude_dir))
++			return true;
 +	}
-+	return 0;
++
++	return false;
 +}
 +
  static int depmod_modules_search_dir(struct depmod *depmod, DIR *d, size_t baselen, struct scratchbuf *s_path)
  {
  	struct dirent *de;
-@@ -1240,11 +1299,9 @@ static int depmod_modules_search_dir(struct depmod *depmod, DIR *d, size_t basel
+@@ -1240,11 +1300,9 @@ static int depmod_modules_search_dir(struct depmod *depmod, DIR *d, size_t basel
  		size_t namelen;
  		uint8_t is_dir;
  
-- 
2.31.1


