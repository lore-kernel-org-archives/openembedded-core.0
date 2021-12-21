Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB9AC433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 19:08:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.9830.1640113718804794682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 11:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YF4FRDVe;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=79896d8bce=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BLISuM3026137
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 19:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=kb+DliEXEZ3dtDEJfQ9ss47F79oAdfKjV7UQL9nopNM=;
 b=YF4FRDVeFF7Ob1QpFIKtEm58okRDetyb55sHpATUpDIU8V8nXUefq8jShzwfjOO0/Kn6
 XC3a+/FYMKpVSvzlEMPRhUXxQ9w8KdAFeuRJBlzEbJI90wfzoHRUyAuZS6Q0ISHjegOD
 DE2HuAQicQWptkw1TPsm2mN2/AJDw7HHw9TGYF86nqdDDmPFKwLkMDDWtBdiOd4X3MDF
 9c/p8/xOg2UmMDYNPfRlJGTWD6Nj3XgI5vkxQIFi3BO5zDz4m4JYapNh97LOs6RJQ/dL
 4C091od/EClxRKT0PjZ9KVK9kk8bbNPzcBfb7miV9LPNAgj4YKlxQhRWSfzHfJHJ6UL5 Lg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d2gb2sgr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 19:08:37 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BLJ8aZW017642
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 19:08:36 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d2gb2sgr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Dec 2021 19:08:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncmy2JnLKjZBHmFr59bftcj9GBsmSBHNl3i2VgjAOa4e8wMFwVi43/KZDwm6TlvuZETtDaS6Zuy6MN6ca1BNVOoPnrwkvQiyCAfV8qGG7PDObg0bot6ieEL77bwym7zhcGQ+5Mq2ZOywetFqE1pRiW9UY9x+5N6w8lusECOFo24yXt0Mv2+VK3g7Sb8vSViq14UdDt3KJVSiMGzh/oDfl7jMZF2OY8dRx5yeeQoa674jmtZhWrtq/NKIvFgGP5FK19yJQ58gcaXKIfv+r4L3U06nJEbFp4Fh3k31XWWOqRCJTwRdJ1FWZge9J/t4VE0Qxqd4kogrR8u9UnuumHzIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kb+DliEXEZ3dtDEJfQ9ss47F79oAdfKjV7UQL9nopNM=;
 b=YV4qWTR2l0bzofSP5S0gvQoNVD1tNQDqzxAmkWMBfWy/SlcbyFd8HsAgFNWpZOE5ZfzYPlKQYwMlqt0uRJdP9RuTc32Ph2ms4SusvSwE6qbKwuJEZQcGsvI49T+29Xe+z2H7n9E7l503PQtUZmPePHHTqe29Q39qL6tdBeWUym/Dr7z1NaOuwXkrdTBiuqS4LfIbjkegrRcJUl3MkhwilH3uYetiDWgMWkValV1i4DJE/vyIir7Nerta2OSxeDQ05LxUpRQ2rycT4UIsBhAMeAaO4Ul84pC4+KC7xMjUL54OYY30k6D+4IZSS/d59kvVpQt0l4maDSThNQBYAsVvzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW5PR11MB5930.namprd11.prod.outlook.com (2603:10b6:303:1a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Tue, 21 Dec
 2021 19:08:33 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::119a:b2e5:c766:f43a]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::119a:b2e5:c766:f43a%5]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 19:08:33 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 2/2] package.bbclass: don't skip kernel and kernel modules
Date: Tue, 21 Dec 2021 11:08:09 -0800
Message-Id: <20211221190809.89882-3-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211221190809.89882-1-saul.wold@windriver.com>
References: <20211221190809.89882-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::11) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2264120b-fe71-4002-b1cd-08d9c4b54859
X-MS-TrafficTypeDiagnostic: MW5PR11MB5930:EE_
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB593088118C40963A9C3F5008EE7C9@MW5PR11MB5930.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mX9zrVOgXY8UcCEF+XHUP11j7mq/Cv5Nf5g33lpvj0LsBbPlJjmUsKFDDZX8J15qwtSOJ4SeNyQg0GL32SOlxnsza5E8PC4C4pzQLV116KOQmxg5IhAdB3Fk4A9pvoWm3xFEf6Kjy/7umlX8BFJRNY7/D3RexOyySUDitCJH2rkNM8HlZvRr9SJ/yBf9G8VCu8oU1uJcO5GOMZ4m8jQ3UeCkiXZ49lq0+BVWoOqzDSU/+fARKovi7g4rW2XXVITxJeCz/xBhG3Mdkqli9YZ7k8pa4Aelx6Nx8NUWAF91Aggq2pULOwF0xoW7KI8ij/KJmwZfmVQApnoLIWvCJXhQmifoQsPVuqWSfy7wMPbyPj9AKbZqCDFMh2EyfUMVO+GXI2tY2XeUhMLANlZ8S2dmX7l4MwHakOryTvNrQtVXvS7nRtCJfqbB6ThL1aIcUlrV3SPKoGBaSoV18/eNJrX0Hs8GTPQNHnwkoaibce03J+blesUfdCY0c1RdyPlXyTOj+IOXxuGVzfFDKAenEL3IQGVJ7BWQ4z1LmbU8MruR+9HyjFrANuwn5LcTe0Qxt6qQkTK7doWRqRGuXPNPcOSB11m1Ur2f95zKzpEm41MGUQJDh6oaUlD+F2usGoTWGjN7ExzyJukwomDWldRZT7Tjm3d7zoZm2HoHdRNel1onkmIUu2I+5uoKFOQd3wd+uFMYUAfziU+Hn30oc/0qcf/Ltw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(508600001)(86362001)(2906002)(6512007)(1076003)(316002)(52116002)(83380400001)(6506007)(66946007)(8936002)(36756003)(8676002)(38350700002)(2616005)(66476007)(107886003)(44832011)(4326008)(38100700002)(6666004)(26005)(6486002)(5660300002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jfq0iQmidk346g5hk5F2/dgpRdiuL+ORMGshOvT/U5QdQAuvS7f2QJSasv+d?=
 =?us-ascii?Q?UM09VUQI4lA3FjVBcrUZOg3PtJx3SbWqS0B0UMpA4dsQr2//lAitv6LRplYO?=
 =?us-ascii?Q?ZqM7CeruZbOMpuQTkf8XZsbwPFe4y9yeN/OotWz4ZQMnpRhfHFP2AbIzjXpN?=
 =?us-ascii?Q?l2fha8yPCOuC11EPSOoINVGfttpGO04twkUvwNpc6IylprhrdqkE1qR+WtzC?=
 =?us-ascii?Q?iGCZqi1yy7i+YjYKBhgLQLAEI+7DXOaSfmlOP+V8QSduJyZZvMf5+pFi7CJH?=
 =?us-ascii?Q?eA5cBMMt1Cak0kSl4U8YJ4ooEwKsyf8Dvre6CbRJnCzr+wKIW36AWhMcyTGm?=
 =?us-ascii?Q?Y7BSIYQi8Y128TqtFqOKCTWg1PGwvbMhOGH6oKmzRsnSoZOIYRYSenawiSTq?=
 =?us-ascii?Q?meMrqT5yMMskC5Y9swQcceIUmG9Jn5i1ScglgdIDATzOj05s9paNjio0RHya?=
 =?us-ascii?Q?CnX4ZwtK6lKzR3YjBRCsNirt7HIZi02tdqrikZdY4zgAvTVreZnTdPJoRpLA?=
 =?us-ascii?Q?2jW//kxzRvOQfXSFKMu1raBQFepa+b6ks9xDds0In1VvPRkXM7muhuCc3kkK?=
 =?us-ascii?Q?oHbC7TK5V3dYJoHzbedaACSCMuHPvA9++k1aPNS/5ctDKCwnfQW0/jWmqUkp?=
 =?us-ascii?Q?/fZQB/kzuplMIBJO2GQLyOrJ9D266IRIWLzssvmP5fvvwOOsjVWDFFMZymjG?=
 =?us-ascii?Q?OnexO2c84q73pQWtiNDuo6Mj6zUWQ4vqELJ8FBzbxyUCYq+Z/ahhNosn0erR?=
 =?us-ascii?Q?c97GGzWt897R9LbwyqMDJ/InbSR6PLeL/WD1sNnu6G7Simmt0OvHs5hZQWZa?=
 =?us-ascii?Q?0uVZz1CVI2rCngNwWjKoSQLoMNZBgmyfMF0afIiTA/0TfhyN8YobEvWIyT0/?=
 =?us-ascii?Q?te719oEVY+c07XeV21bJKVYNABto2qXgyp+wk/DmTKOGL4vWANwwsdk/ItvZ?=
 =?us-ascii?Q?99srt/MarUqKBONMCyJt26R92hMS7JbzBPT/wFtTtyhM2l9EyOp/tAAGrQnd?=
 =?us-ascii?Q?Etu7LzMCLr44ewGmJUCVrhIBbhnTu/95zuQLj4U5VRVAlvDYsifnvVY6yt38?=
 =?us-ascii?Q?/9zFK6z7bcWL3tYI3tIPtxX7VyyDFiwRk2TIKASB74Ay1EC11PisasIBe1u1?=
 =?us-ascii?Q?6C4ALbW0hY2F92iktG+8k6NzMzzSIr2DZDIx/HgdgYTNxFMuO8kubXPnhnOL?=
 =?us-ascii?Q?txGG3l8Wzuie2S7PA8ApnzBnd55+BGSfmFJZjbd+r6bZpiLOofjjRoXcuiC6?=
 =?us-ascii?Q?4FAvC/ggSDIM2r2kZ6tInTl7t0PK+uXVPyipyDg6Tdo1tr4oZXi3Rph14llU?=
 =?us-ascii?Q?Bo3wIPkzEt5dkAWyPoiPVK9A+7FcSsiIjq2zx84mY+YMqQSSKykWnPMY6CiA?=
 =?us-ascii?Q?loMHD1RWALPIUyingh/fl/RB6NZQYRcRqzUwsztTARiQ32j8w9DNwpor6ZBZ?=
 =?us-ascii?Q?f4hDdtSlYvKblmoW+J7UtIIGWVKNIOoANT1qAJ3Et43yPn+6nvS6Nh4m7vw1?=
 =?us-ascii?Q?L2U0uCLaEgQ9FYtOBAqundB9wm2sBsbwePMPnwDhPLte/vQO6psaf3cJTh7j?=
 =?us-ascii?Q?Tk+Cfxt7zW5pfhTEuNALHNodRBpXc3PUjjV+LziK4WYPYdPQoqhCxK3FsqLF?=
 =?us-ascii?Q?WkBFguLCtsujLw+pNm4VRCY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2264120b-fe71-4002-b1cd-08d9c4b54859
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 19:08:33.3260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wlPha9lA6ZHLZw/I6L3UiHGu41QwE14S04MIpps35WvfXdADbiUnhYb7QRBiV9SUQ33C4pj2o/wp6DO+9gcQwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5930
X-Proofpoint-ORIG-GUID: hbH7k7kxQM_ad-hfDm1CWwWSd9qq-PjV
X-Proofpoint-GUID: NuQe2zj-5VwQ7yLXFWVMR-9QQ8mEu75D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-21_04,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=582
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112210094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 19:08:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159931

Stop ignoring or skipping the kernel and kernel modules code in the
split debug and striping functions, this will allow create_spdx to
process the kernel and modules.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/package.bbclass | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 84eafbd529..4b7fe4f1e1 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -390,10 +390,6 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
     dvar = d.getVar('PKGD')
     objcopy = d.getVar("OBJCOPY")
 
-    # We ignore kernel modules, we don't generate debug info files.
-    if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
-        return (file, sources)
-
     newmode = None
     if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
         origmode = os.stat(file)[stat.ST_MODE]
@@ -1147,7 +1143,7 @@ python split_and_strip_files () {
 
                 if file.endswith(".ko") and file.find("/lib/modules/") != -1:
                     kernmods.append(file)
-                    continue
+
                 if oe.package.is_static_lib(file):
                     staticlibs.append(file)
                     continue
@@ -1165,7 +1161,7 @@ python split_and_strip_files () {
                     continue
                 # Check its an executable
                 if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
-                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)):
+                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)) or (f.startswith('vmlinux') or ".ko" in f):
 
                     if cpath.islink(file):
                         checkelflinks[file] = ltarget
-- 
2.31.1


