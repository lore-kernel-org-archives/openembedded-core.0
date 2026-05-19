Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249ACCD5BA2
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:26:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16159.1779175559207930641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YupDh9zW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9599376d2f=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F2wQ3076794
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:25:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=uAIBjI+Mxy97IdUA9oxj02q1q/KA8i7rOiJrIOWVYfI=; b=
	YupDh9zW0BjO2egJuM99g1N/J802jixwDkIaUBRS+Z6m2BMPhWJRc5G876GmA/ed
	jCG8zkZKJZzmxhZg9JF3jkb2mtZgG4NsuBZ5c1e7++WojabGxpQM264KaRHwN06D
	CtefmtlA0tFRUvhrLTaK9Uap4UqsQoknVoeC9zrmYUeWaxA4WH07Ww82Za3yf3l5
	YRa5AAg4o1WV6xxR2WqmEjQU2g8znq2mdBCTJP70Hrk89r/nQ02NdleGLuKrRnzz
	J+OG3EldS5vvLfapjyZuFbUChueaJpeU3mlgwyO+tdW4uOCwH3aCjmtAkrX7BuH1
	rdbm+57mDm1QgG/LHNVrZg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3gaxe8-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:25:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQX7i+AeIQJmNEon0DUQQE4T5YBTVBo0u/fM9hUD+e8aKg/WwtfsYDqNJQ8+VI75u2+bKwZ3VKbHjm9J34UeeRafdT07yx3gmdLZE/QtuITgI49D5XjEFa1lbP4PY/idWVPjE+TwTnHwbribPQJqXhdh0Yt7u69OGknwLVoiG/L5gp5dOL+T0Ixm62ZiG+rf4q83oFxYJxCw+AmKTCSVNSl3qe5tevmVC1AXz3Miv/1SC0bndN8C8kjblY52Kmky6bZMfArTn+fqrgyhMjd1BDlIhMOMka7u3hFx1td6yLPIdreDkejaAENfVRq1n7Xhmiot1TZNsepQtZ7e0+WZiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAIBjI+Mxy97IdUA9oxj02q1q/KA8i7rOiJrIOWVYfI=;
 b=niDeffyUMBTOSDPr5KMGMYtak5fZbPHW71Uc0l32felurhmuoOvCLM4yZ1qqAaJgkUsK0rt0hbbHcV5pPiplE9LcoeG7ONP4+RicjN1GKkDTc9ZIYAxWnoN55MjfZCzgys36kkKuoSivxFGTd2A9mkoHng1fsfzqNXc3eznjdijEnTi5ohnX1BBc1bivAFNoixkduuQ5dcD8tfgsBrXCtCUI9ZHYc1d8k36rZf9TNBIfmei2jVj3/o/bKbirqUDavt8GLFzOCu9c9YYH7oiIGA9dyKf60wVeGN8xsYcXu+CNc1wza3qQZnc5uGBojqmL6h+eEnJXsk0XEF1q7ghtEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA1PR11MB8175.namprd11.prod.outlook.com (2603:10b6:208:44f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 07:25:52 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 07:25:52 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v3 06/12] gcc-runtime: package new libatomic_asneeded files
Date: Tue, 19 May 2026 00:25:28 -0700
Message-ID: <20260519072534.24588-7-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA1PR11MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: c02f9979-4555-4dbc-f131-08deb577db69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|22082099003|18002099003|56012099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	xBtokqNtALmpuhbdV6qdQ2jRtlU4WINBnp99poNMNHQyTzqY9dT/LtMTQBejKG5bjG3iw6wEXxRqen7uu88eYMMIIPRpELcHEevfP9qQKE98hiKZgCVBxqQuPd+hShplbQES6nQj5UoBpqIhkLUQ86YNVi9RFrAhHpsoe4qgEEZv0rzApAFjZSAeZhlRN5vihkL11EVFusojKk0m7YHuPzvoZhnaPnah7YD4SK0bv5YUPRPN+IvznchrOd2qeuk7IalCpRxyqeZ62bkau9u2CJZvUCUpzJdSRUKVHykKjaeF++SBtBnwjXcyFGjMGtEErla2PUyk5aCOG+C9bBoqkusgWOArd0k7QMDSwOWD8QRUjgSC446qI7JAEOx303XwVnAtaNrV2kYlVXTE3Cpjnx7XPBTx25xHESd7SpO4NR2KPk8wqjDCzlyHuFLMAG0gstkeNpgK+8K/xCb6yin1svpSQJLPsOeQjDin71u73uEHl1A87HUTt5NQrsHYY3rkcmxnaRI9YdT/sjF75Mzrl2dm515Xkyav5njvAEJKO92GyiJlG2ajt2vMyV/c8EnFO1YJTkkpadydxSbpY9TvcHhE2PhdMwQz854ELsQA1eWAaQazye7cuJeMXnCFKgXoH6507EEBdn8S7OsF+4hq3CJTwE55Ds6fgLyLqa6gk19IO6lFilzkhtnBtOOrf3aUezI6FrflSrxtNEN/YSqiD1F3E/F/s0oTQlFP8LHB+dCbJLKKG7jNpHmm1I2+yxiO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qdc8saiF1cOlE9UUzmbc1vD72LO3bB9zSykNLPJmD8bA9N6o963LMywhAL/C?=
 =?us-ascii?Q?cAGiYjQ7vZA9UKPfz/Lk2H139AzVcdw6ekOSVCdYHEUbZd7fif+tJKv7P6Gj?=
 =?us-ascii?Q?P4yHhiN1eKQdgJnIJnseGqdHsOlIirc0KRrTfi+vlLaePLV/it7t9RszfLKb?=
 =?us-ascii?Q?6e9KNUuxQ5ekZywPGUSLU8COWRbBoOZe8l02KeL/BijGiVNe8Ei3eARvWuXY?=
 =?us-ascii?Q?bET3M43L3XFMKqLhjmhmf+jt2CmY41zpt/CVafy95jQWWxfO/ytgBPItZqyZ?=
 =?us-ascii?Q?2JbQpZAjR6LtlBmYKD/4PCy4FOsuTI15o+PAh6tn2BRHksYemL1RVtbeyA9v?=
 =?us-ascii?Q?j5I+vuX4MWQRDjbQF1THB7KdcnYiZov35i79uD0Twy+lQFspQGeh29gKYKTv?=
 =?us-ascii?Q?Gyu7OkLWYv8w7YQkjBh2jVrG96loHPB+5dZ2sQG0KJcQCYWA54nkKQFtYeOj?=
 =?us-ascii?Q?ibvG2reZC9OUHMw0lofD5FpJ5V7/ZpzUhy2nwGPETdq8h+YwwcnORM4DdoLV?=
 =?us-ascii?Q?7zndu5CIr1KqhXyrxLwqziHSFwRnbUcu5J7GFJ1oYgL6qJ5NwzNX/iLMLZbU?=
 =?us-ascii?Q?xv2G2+JtNeKrxb+t6p4UUyTGE+cJebjs2oodFSM+sHrLshFoSZXdZLkMq0mo?=
 =?us-ascii?Q?Ea7f/wi4ZWEexg8Yxi82n1hqDF2qGmah9HfLexcg36KO6tAXgnPAa9R06npA?=
 =?us-ascii?Q?H8S367PZuzuRSx9NNibpTShW3wM2VxHRARQczBHKD/nIOl3h9dvG6zXNQzbQ?=
 =?us-ascii?Q?oxh/Cxh5I0TF/sBtn1GBDXF16jfjkrKmvsw/Ln6F0ghV3tYM67j2iwcm9X+G?=
 =?us-ascii?Q?ExrClIbw7CwxVsyrgBVH0ib+Rdjw6NMQsLl8vQPycxD4bzna/KtG9KfUTWrD?=
 =?us-ascii?Q?MXLQnsBKF2wNOugrl9AzmIOTMO5ZRmjR01KJGKXoxgETss2Phsjxh6sPRbKi?=
 =?us-ascii?Q?y+7P7FsOlz1BE6CMQ6oF7zJ87qGqYSFpnm50cV74xxbA4EWRYj+6kSAmHLNf?=
 =?us-ascii?Q?tkSpokc4t1FUIzQbjGfxXQc8aHq/8REAmOvL/0hKHyOzAjWg+FwHwNfG0QHx?=
 =?us-ascii?Q?IHkP9Q0sfoY74SU/sptdwPyxOmXNDfOK4HGlqlBS7/cYPTyEJrWoH/VzgnHr?=
 =?us-ascii?Q?QTF7blUhMsXUTUP2yEOlH0IwALxQ4OWM9FwnsacsytnMdv0UNlcZL5LJVwfl?=
 =?us-ascii?Q?JTTty3gI9g8yv6v3PFQeS8Y3/sGAXME9E0Imz9E3lF9u/kDTzeIBGXTBxkpT?=
 =?us-ascii?Q?pm/rYy3mLnl/LaOshmrf5dmct77TCSm25HlhWYYH1TuN19K10L36n3lNkapw?=
 =?us-ascii?Q?V4RGxUpv1VHe0wrIjxjY/TC8S4Z19kXFX8t8YbX9k49VC5T37oycRaMU/qKJ?=
 =?us-ascii?Q?FUJhNmnMVmLqVeF5X7uj5c4uI0xQrlPlC9OWg0g1motEk62vdr+E5ANh5mDq?=
 =?us-ascii?Q?NQf13KBNicMWn5UlTQ1SkyzAq/o9TmmWEg6PnVHePqqwinSyyDryM1tj95Pz?=
 =?us-ascii?Q?+2tbHK7IY1l9KA+WsoAtedMBLNjUM3bYf2nTfATS7ALL9VhdajPyqauZmIw+?=
 =?us-ascii?Q?+JMG14ok976z/c0Sz/6PPHbDTmFKvp9EMmaYhtQ0I4GCfdHU0Pe3mlq9uOwI?=
 =?us-ascii?Q?MSlF4nVjuSjjF7zEdxFwovEP3qsh4s19xKKsfjRog0G//y7TLvbFMxP+NIrb?=
 =?us-ascii?Q?byPBR34QFc0TH1CNIwPz6cSigkQ1GIzYRCjOToGPXHtz6p1gDpXeHjni1iCS?=
 =?us-ascii?Q?Rx/faK4/IKW/A4979d7nmmDjdeiY+F4=3D?=
X-Exchange-RoutingPolicyChecked: 
	U3RaVEHO/n/fl8fb9+8G+LrQ2yvUadRhFGB7DtCuyO3pzLwab+3bDMtcZ8MEHaHEwgzGJ6K4CVtRNyA7g2FtJrT55/jXAKK4C9vbORR3Bfv4ud0MzAV7c4rB+sOnIXxWQgYRUK7LG4tNFza3s066Z/z+TH1/Aphu4Cyo88OBrzCxHDV41LX99148r78m+ilpEqvEnCAJDlGtPSxWG6rYjELEhaUVXHIXIh1pFUpxShRoxKZc6ueV/x+HdPjFjRsLldsCICxaWHqdv31yR3tcirTuZjle4KBbZyFd0cBVYznGJyuDak+ZVfaeeWPU+PUstlylwKwmwf0MJKZ8hm9NOQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c02f9979-4555-4dbc-f131-08deb577db69
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:25:52.1083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mH94Yq2c6jBTuX7dg8YQhMhZRqdf2sie7jZIPG3j2LV5rHIMae7gIWy8eKQYHqFYexG9M6paBAHWS64mWE/YGNkYtxIxfGAido3FRvshpf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8175
X-Proofpoint-GUID: d1ix5oGTXZ8V3bZiFNMiBpa2jjYw1ecm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MiBTYWx0ZWRfX8UT2T1wHyUid
 JfxSbeSWpAU3viClYBEDXUtoZkwerv1yNI5+JL7EEwR9gO3DBJV3QNhl5vjHXA9538rCnGc/7G7
 jXblcGqtmUpHRGInbVf6d/Um57+uxeu2fCKQCf1pFff0zd3nGG6TjDgL8ASMKYPM+5bp91OCmOb
 Hcfdaqs5Jpcq8kI+uFyJ5pJDGrJ6pmSpIoEdVRbBC60GjCTYnt9dOqC1HweecQ2+JbJK9laW3wQ
 /dStLyvE72nj3UuW2mpvlWdw9vDWy+qTmDw4ngt60gDaaxKSQ6L6SWw/6pUaqEGMMrhp1KsBwo8
 PiYDq+HmzuuNVRWqyIHwHCOMnMECQjsTapdtMkWggW2dNUKFabKM+mrIJyV5st18ILHS5VLUn81
 0jp/psWo5Y7o8xFNFjAsVIylpU/tb9jFS9Om23DkHIf3pyOO1c422QjT3yFkJQyNb63OfkwMRHf
 nvAPJt46XDVYWEZd09A==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0c1086 cx=c_pps
 a=LdSsacNKwWtvIYfRw5AjOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=f-1Ak3PPjXL7i1jfQukA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: d1ix5oGTXZ8V3bZiFNMiBpa2jjYw1ecm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237284

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 generates libatomic_asneeded.so and libatomic_asneeded.a
during the build as part of the fix for unnecessary DT_NEEDED
entries on libatomic in GCC runtime libraries (PR libstdc++/123396).
Add them to avoid unpackaged files QA errors.

Link: https://github.com/gcc-mirror/gcc/commit/8a99fdb70493df1294b53406913e5ea1fc971c13
Link: https://github.com/gcc-mirror/gcc/commit/34039b22adea4d7809dae53f809177d6dd1155d9

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index d975153bc2..30b2832c82 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -268,9 +268,10 @@ SUMMARY:libatomic = "GNU C++11 atomics support library"
 FILES:libatomic-dev = "\
     ${libdir}/libatomic.so \
     ${libdir}/libatomic.la \
+    ${libdir}/libatomic_asneeded.so \
 "
 SUMMARY:libatomic-dev = "GNU C++11 atomics support library - development files"
-FILES:libatomic-staticdev = "${libdir}/libatomic.a"
+FILES:libatomic-staticdev = "${libdir}/libatomic.a ${libdir}/libatomic_asneeded.a"
 SUMMARY:libatomic-staticdev = "GNU C++11 atomics support library - static development files"
 
 FILES:libitm = "${libdir}/libitm.so.*"
-- 
2.49.0


