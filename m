Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35968EB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 16:41:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3309.1687538480219589378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 09:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=d4GbwvnJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55383a2ab4=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35NBDcM7004724
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 16:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=5+w8cplWzEr8nYtmvt
	hqfstf56ssIsmMaBpcm7snHNQ=; b=d4GbwvnJ8SaOxBzEoKvirR6V36GBaOBsWJ
	gi+G2IQntr158XqRk2K6zAe76mLmgbITlI4cia4AJGUN+ZuqXAoF19Qevmrb6VNk
	Sh9Vfp1EuEbHYJ21+yPG9DfIbQewaStme6yJcK9EEUyxej9gWbYFF52TgukQsW9O
	INZUzMUJMo6GLRslx7X3iebTempKE2SZSGwQ2c1qiPAo9+6qbnebpJ4F+3WGxRCQ
	Kl1jfIURLu3mtSk090NSCmjZqpxJzS67fbXMGhgDW38DPfalcMi5AwbUYLY7CKrM
	UaYmOBL9Tx+3PpklLpT61JtzMnA6bxHL7smUHzHWeRs6LuDG1X6A==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rcy228qer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 16:41:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIdzDOudHdxQjLV7+EHrdQGgmVAR5++fbEhYKj27jJRZsh7bWGjSJ32xxrtVG/C4fguiAeTzSgA+a48d3u/l+konjbZZjwiw5TFkOnDZTn2AyjIF9HMmdMCQeyTVEk6oTjXoQNiYksMxblXM1iPCycI1qLbAFThK9LfZ+ugEkFFn0AlDLRndjD7L8Yr4NG1EuckdJrtwEsg/DW5TSQAWI33SPJKVIjHuNJRJwl83HEl1rx5gqYGaajbP+qqlxOj4ECBnWKUVEkY3b8TVWalnqrz4rSjUtFz8IdSiyNpAwIpxaYyFE6FIANVypn/W9SIV+WoHA2V8I6BHtVuemqieJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+w8cplWzEr8nYtmvthqfstf56ssIsmMaBpcm7snHNQ=;
 b=hD+LI+Qn9xtP06n/6qFc0nIMsRZf25YaF78x/G26MP+ChmRt3FEcyzycxwewwK88qQjr38awkoz2eD7N+x2O62Amh5Tu4ACnbR0+ppbJcRcdg3+Ud2brpu9rMlx0BPQywU/RDUqjZs8Toiv0tcK1vTIbBANMZkF5S/mqyp0bHDDAyaAZaKyn//u4XrZHkmd76kxLhcTN6I/Z3323CUz900Y1QPD0Sw1Guh+aR0U2L4zM+6FiXv4A7O0+XXSSoQxYUgbL7kQ3FfgJwkJJxRQG55tzcU3HR4HRCAi7HYF3yFwpdOb8htgdWNDu15ZaHDFrHCi9hMZN7etPWpsqMk2HIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 16:41:16 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::39ad:5d8d:815d:1684]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::39ad:5d8d:815d:1684%3]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 16:41:16 +0000
From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, umesh.kalappa@windriver.com
Subject: [mickledore][PATCH] gcc : upgrade to v12.3
Date: Fri, 23 Jun 2023 09:40:55 -0700
Message-Id: <20230623164055.89846-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0099.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::40) To CH2PR11MB4470.namprd11.prod.outlook.com
 (2603:10b6:610:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR11MB4470:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: 31fa6330-e482-40e3-0233-08db7408a9d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hc5XXgLduEZebjWLs2l6v1EJH1B4JehXaWk4BqlVke/17e7jb8YEwYERk2AxGhdCBS5FKYpyMI7NI6MZbkZ92PUk3/k8YWB9Mxn6MBeJ3ePOI9nUxS5vINoNdVA9c8JeJvB/8SuHafSpcqPGO8oGYKZ9NYb8dEVO/LwPg/h1BAfBtiM2AY8JCir68FNtR5o9uULDAu5jElzV/VZgs/2MCsbrbI9WwBw0Px8O9vezxXxSBSDCT6CW6zYGvcJcPzKlvnAf89N1E1K2CPVqPdv6dRUKn9rRKfBAf759TfVZ+4xLWjcWDm0vcK43MZUDulwidnMl0xGe2iLF5XGmWNM1aw+ts/J06VB7QGjrqhkAgnw3k0wBFYYLEDmdhv1q4bHp5UoWh+C6HvBGw/nnWdRgd52GLpAtcxbZsSnLg3mgMpArHYR8gdWKwqKW0WgfYfiwIf30BKO9lSIlBkTm71zo8j/LV5M8Umsa0SN8uF+N3Xe9CoFvXifFxUE8a3g2Krpe1QkdrExcb4GU//G0uvKwO5YIb9OPLqbIiRdE1nR+QC+UtFm51dAj94VrX5s/KHpNJpPsGFd0bbbD/LydVo7FsBRPnXFJoPMdvG1q1FJLI4E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(346002)(376002)(39850400004)(451199021)(38350700002)(38100700002)(83380400001)(2616005)(316002)(6666004)(66946007)(66556008)(66476007)(52116002)(6916009)(41300700001)(966005)(36756003)(4326008)(8936002)(6486002)(8676002)(186003)(478600001)(2906002)(6512007)(26005)(107886003)(1076003)(5660300002)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HnQt4FEAnCekmHKXBL4yPQqBLgJLgW2R1asyjX11PzkXvdCqkFtMR1SPC/77?=
 =?us-ascii?Q?gjdDL1h1bD1pvHeYN/OoKGO6KteZHjKkpMxZZTM/3cpzD/rVGOk+Gc1uLCa/?=
 =?us-ascii?Q?WrGcnjMeKBbQINwrxF9Q4XyacoA/O/5A4N468jZ/JYTJnANgc6ly9GcCycTe?=
 =?us-ascii?Q?lgrRf1W8EMoH9vKWkXykbVC89WNczVr5644PPpb8Bh6Kq0HJ49ROGJuIN3B6?=
 =?us-ascii?Q?MWhk74Il5zH0JhQsPt/ghK4IWdntCnp9ZZyvqQajdG3oX92djw8gF6MRhmyA?=
 =?us-ascii?Q?ymrnY/wY8rIL8o2x1cjZy69hUht5kzWwU+VkT6Fjg1B+eyRvFSQqqDMBsgiP?=
 =?us-ascii?Q?WS0rSjagdSRXMflwLEfJ5MGZ64gVhGokCXCnPzhCDlpyJ4b+lSIbc0Rxt4cc?=
 =?us-ascii?Q?Gi74X+0aeCiCNs2jdBUw49F/ElGKlhvrRKFffk9oCL3SukvUOiMM8kS03LjV?=
 =?us-ascii?Q?rdf60maOnITmfdlX/u0y00TcHaJGxVaKoKoA3Whj6fmkmQcPjypXnzDA/T9H?=
 =?us-ascii?Q?17psxocjx21/r/2ROts9x3TLciQ9JeWN/1KHXYZ3iGHvMi3FiluqUWHMvwnp?=
 =?us-ascii?Q?oivsk45PD/su70PU9SnTUn+rbfBrConqpcM4LTGPkz0iulCq3zOqbYyXGAG0?=
 =?us-ascii?Q?XhiH0LHW71FVe2WxJ+wdUGmIjX32PvOJnn6Lq8usYeqhgQfyM7f928MIMSK7?=
 =?us-ascii?Q?Q/6pCioeGsNViAIseeZ3UV4rcexLqsjjDiasEJ52KK1x7ndsMSiO03J5EEFg?=
 =?us-ascii?Q?ImDAEaIiUILwtfBImqv0TFWImKuecIBmH1Fs9BOQAS4lP4t0fFpJibiFaqoh?=
 =?us-ascii?Q?iIdyQVHr8zq6f1F43p3mx+icOpzY+he0m/r8s/zFw8wSn7AgYNzk8NmN2mT3?=
 =?us-ascii?Q?RQr3xMLDIr0guTzl5rPw0/812uYXwNU/2ue3z868MBee+ccgAeiIdSQR7Q6W?=
 =?us-ascii?Q?KpORX/0U0GT+ZxUtuoxghc5xTv8DhGRVCrnG/W+VygXkvDZGp69E9x8iySqW?=
 =?us-ascii?Q?xpOwtzH9ZxNqMmgnWyBoKfXyEq+jraclgAop7tLKXINg0qI9vcS+EzLuKwLs?=
 =?us-ascii?Q?QunnyQuVExCZWjPUxnjTeL5qadwAHotv8ZUCTjPkmUK+9wFJorXWcpLyROZn?=
 =?us-ascii?Q?7koJX8RWlVz4ZXtRiurN9jDzPyHqwPJ0nXXi6IoRWhDv58ZMxx+f6eKUZTnw?=
 =?us-ascii?Q?qwjwbzFhicV2pAkoibC/XTq8xx0wspjoaAeLuFDBqjiHa5LXB6OAAkGP7VAD?=
 =?us-ascii?Q?UNicmbWGXzvDvzjSPnk9UE858GzP710Mm413fO4bOYe1gDjFWeFRZXPcSk4D?=
 =?us-ascii?Q?OYqVqLNfJOLONgUT87gpEIxrHYKXvTHh9RIpGAAjk9GgDoSXsgHXEq4hlZF3?=
 =?us-ascii?Q?CSELlM3Zrk7SPJXpK06kr226f4UOunh27IXnVbLTzcD2F0CrzpvaZKw/EuV6?=
 =?us-ascii?Q?3TDsz7JynI8o6fYG40mp81HZ+qWTUoyB8cZ3uW0Qmz318ZLFiQBar243KL3P?=
 =?us-ascii?Q?MUNeGkJ0xRyNtNKd6j2WWJ0hogq0AFpoqZsqIbuVCnQO7yOOXhg/jgoqH6QM?=
 =?us-ascii?Q?CqrwU22KwfOIfKK/D8Xs4xlCazQS5RzHnh4ee66Dayd6qRLieu13DsHfGMq9?=
 =?us-ascii?Q?K90HuT/zwReyXKWJj/r0JAA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31fa6330-e482-40e3-0233-08db7408a9d0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 16:41:16.2001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Epp6+WA4EC2kd6uYO98qeE757hjQrid6SqPVh7aszGd6jvR4HW28svG9oAgwyVuKm6du1HpWWReSEPZ1V/K/KnmfQ0Gg+CAXbWVvp3YmWPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
X-Proofpoint-ORIG-GUID: 26ng0mDxSX3xwvrugiNHqekVZhCtFubf
X-Proofpoint-GUID: 26ng0mDxSX3xwvrugiNHqekVZhCtFubf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_08,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1011 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306230149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 16:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183346

gcc stable version upgraded from v12.2 to v12.3

Below is the bug fix list for v12.3
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=12.3

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-devtools/gcc/{gcc-12.2.inc => gcc-12.3.inc}    | 6 +++---
 ...cc-cross-canadian_12.2.bb => gcc-cross-canadian_12.3.bb} | 0
 .../gcc/{gcc-cross_12.2.bb => gcc-cross_12.3.bb}            | 0
 .../gcc/{gcc-crosssdk_12.2.bb => gcc-crosssdk_12.3.bb}      | 0
 .../gcc/{gcc-runtime_12.2.bb => gcc-runtime_12.3.bb}        | 0
 .../gcc/{gcc-sanitizers_12.2.bb => gcc-sanitizers_12.3.bb}  | 0
 .../gcc/{gcc-source_12.2.bb => gcc-source_12.3.bb}          | 0
 meta/recipes-devtools/gcc/{gcc_12.2.bb => gcc_12.3.bb}      | 0
 .../gcc/{libgcc-initial_12.2.bb => libgcc-initial_12.3.bb}  | 0
 .../recipes-devtools/gcc/{libgcc_12.2.bb => libgcc_12.3.bb} | 0
 .../gcc/{libgfortran_12.2.bb => libgfortran_12.3.bb}        | 0
 11 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-12.2.inc => gcc-12.3.inc} (97%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_12.2.bb => gcc-cross-canadian_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_12.2.bb => gcc-cross_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_12.2.bb => gcc-crosssdk_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_12.2.bb => gcc-runtime_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_12.2.bb => gcc-sanitizers_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_12.2.bb => gcc-source_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_12.2.bb => gcc_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_12.2.bb => libgcc-initial_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_12.2.bb => libgcc_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_12.2.bb => libgfortran_12.3.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-12.2.inc b/meta/recipes-devtools/gcc/gcc-12.3.inc
similarity index 97%
rename from meta/recipes-devtools/gcc/gcc-12.2.inc
rename to meta/recipes-devtools/gcc/gcc-12.3.inc
index 0dbbecad4a..4ec03f925c 100644
--- a/meta/recipes-devtools/gcc/gcc-12.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.3.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "12.2.0"
+PV = "12.3.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "12.2.0"
+BINV = "12.3.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -64,7 +64,7 @@ SRC_URI = "${BASEURI} \
            file://prefix-map-realpath.patch \
            file://hardcoded-paths.patch \
 "
-SRC_URI[sha256sum] = "e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4181e06926230ff"
+SRC_URI[sha256sum] = "949a5d4f99e786421a93b532b22ffab5578de7321369975b91aec97adfda8c3b"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_12.2.bb b/meta/recipes-devtools/gcc/gcc-cross_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_12.2.bb b/meta/recipes-devtools/gcc/gcc-source_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc_12.2.bb b/meta/recipes-devtools/gcc/gcc_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_12.2.bb
rename to meta/recipes-devtools/gcc/gcc_12.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_12.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_12.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_12.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_12.2.bb b/meta/recipes-devtools/gcc/libgcc_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_12.2.bb
rename to meta/recipes-devtools/gcc/libgcc_12.3.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_12.2.bb b/meta/recipes-devtools/gcc/libgfortran_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_12.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_12.3.bb
-- 
2.39.0


