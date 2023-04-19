Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5B4C6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 05:44:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.30955.1681883044193780756
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 22:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3473abc303=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33J5IRhZ007602
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 05:44:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyjwaw1th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 05:44:03 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33J5i2u7018338
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 05:44:02 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyjwaw1tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Apr 2023 05:44:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdsE+ZtyIl4KjdglUtqkKdYBXcyRfb3uS+SLZQaunLhE1ORMMJxuaFHWG1Yl0cCUuGrATS/2Xsn4E3Wf7bZiycARjIpDzlz0mrw+STT8yQMkC/INUAl+UD9RxMXZqKq2qIvL+UVfYBfF+d6pa80OVmpLQZg/w35QcYlGpzwWFyLQrhAZIO4eaz+bNfK7ou2AE9hG3lXJwLVhO1EJP/wbnzivYlQZsYMmyzRnD5e1bHwsVnaQxZAlFg8siM34LT2+q9KzoryddeFPAebGz7vtHD2qH+bm8WQOMFa+OnHyWsfHh6LqjrP52v+1P2mbOj0CKHice18ORpJtaKwYi0lHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFGDgIygrXxZTW9IUxmddjT+Au4hZkqtXjzmOBKDR2A=;
 b=IDO+Z8C3UapCEGqBcK88hDQpU8AH5zea6F9jcwHzABK4aTN+kqhTs8KrsfXHnvRFvn5T+UT3yqIXcCmt5qPBqkLXmA5ryE2LwEftoRQ33ntrA/++Z9ANvWRVG0adYqiNB/w69L4RLJhiRwrmI5EjpTOK045OaYQd0amuhlMlYuquxE5mttFVHMkdBFCAgxdsQ8k+KdAjiYkIpcyRvbqntq5JNjKHe70Rgvde+3M//WVoge3GeZuWzKO0pCSomU8QQdwsrnZjxqRR+g3y7RpXKIZUWqmAz7jCkEvxCtTmcByZArFujcnjObQY4m3rHZH9GGB6ZMaoeV/qA38Ptm5AMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 05:43:57 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008%8]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 05:43:57 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: luca.ceresoli@bootlin.com, openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] shadow: backport patch to fix CVE-2023-29383
Date: Wed, 19 Apr 2023 13:43:35 +0800
Message-Id: <20230419054335.2895194-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::18)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 7966d054-29f6-4471-9dbd-08db409911bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CKVTMwwj8JnGXDgfmO6voCHutrrsBB1QGuJMlSbReJqb0b8IsxOfWy5htMGYLfZmQ2wuDWn44wRA9JVHFkZFUaqb1wP0hrJFe1TaQFZN8QUiTTG6XTMkTvVmjYWXJgCc09JHj11OxmaDvLS96zUm0608xMlKTKSQGRAPjSMdKf448vZAd27ONVT3EH8MReB3aLOoB0xzINclTZC5FHJDa05/GVDnwYq4arGpYNee343g5mjahNHRKo3Ry3yUT0AVLh9bfimFAylNyFvbigZgNVsnp609CpLydMyNesUlt3UGAa+/mohUfYnqTo6jXb0Yb4EqMofu5aUz+HzDkIZP1tYWg7xTLATeqrULxaxD7KCiizEPt7NktRt96Yp7R6EcS9Ulb+igc98rsfzDQ8UTvCk+Lc3vud6HRpai7qt0ksmT6TaNWJ5S4mjtmuMrn+ScDi7c414MOdIXKdAVL+rfzqEWQVCw1MusVbNTsToJQP5/C36xx5cOlw5pxng892ZA2uw7KVDjuQnxzRM+W9SP9Z1u7IOVLt7tXDVaDfEAmpIQPQldIsmxEN2g3ZZyUTegMbfcrM/Sy9istITYb4wk4HA1k8rkF7CcKZ7mpLxUaXXWgKMq44rK76m16qUi5O1EZZwt0f0wRRwqQpf/vtGIMMFBSl3PRfHNxkvAqDgYSH8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(136003)(39850400004)(376002)(451199021)(316002)(66476007)(66946007)(66556008)(186003)(1076003)(6512007)(6506007)(26005)(38350700002)(38100700002)(2616005)(83380400001)(8936002)(41300700001)(5660300002)(8676002)(52116002)(6666004)(6486002)(478600001)(83170400001)(2906002)(44832011)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+mtriGwl3irc2ic63S6MZ0KLz8weV9RCiTuZcq2nYQHeZpLItJizuXljiLS9?=
 =?us-ascii?Q?tpN3JIRlU2GozDPAprK7IfyZlqniglRA9MiTAV8IYN+MJC11KGVhS5j0+K0l?=
 =?us-ascii?Q?0Zz5/uZMDzKee18mR69vs3aU62tlQL/u7nhZdHKUtbgubRt1/npb6jfKQECE?=
 =?us-ascii?Q?W95eEQ+d79YEhx2eva0e1b/g4UYTGczg9qKyGslzIs4nwUNeGMj6GRHpkfCt?=
 =?us-ascii?Q?bnX9NuAGhYR9xtxgBFCAXhimXQMAfk6d4lR67QrHWD3JPlDgSlH8rGoRjzfa?=
 =?us-ascii?Q?7sr5U8aXSNWx5/KkDLWJw1wWRojkEUktn0Y7kW757JuXjTO7SfdVHtwzvjwO?=
 =?us-ascii?Q?NbEP1Z+wbpM2t0s4WFhVgmo3fA4lTZJIqDreLyk7+cmE5vmudkHB1JBuxFuc?=
 =?us-ascii?Q?IypgtlhJba4+a7ORZNVLnaGgoMize5txpU82ikifQNtKNRFmUiv+5LVCaod3?=
 =?us-ascii?Q?Y6A8OBddRrY+MFLS5Pw3ljm8iTEsJphXqf6oi4RFohWbbwLZnP0Oni51XGf6?=
 =?us-ascii?Q?3klw10co5ZhJiyZBo2QKRf5H7fKF13Z15KBV2FvewTu/2G4skjy17JtuiH2M?=
 =?us-ascii?Q?SZIqfEHbyKWcKD0dvVVZ7EEpYRVZlZ/w0+pacZzlGkgmEuHMhsLktN2DMWJ6?=
 =?us-ascii?Q?h8q5UgAnK9xva2mQOSsThadXMnlk935C9TFKEbTDTWjjb+y1Qo/pJ1ud0m1P?=
 =?us-ascii?Q?pRMJUTGmeWksU5jg2lVeTd1LD2p/8uBjXZ4YuOnH4qjXI6dBXpvpWwPfGWja?=
 =?us-ascii?Q?QBmhV+yKw20HpqlMCiLonYFt+enXdjdG1BF/qQ+SgjBtBz9Ik7/SqKnAUx+O?=
 =?us-ascii?Q?kWmTYIMTli9LhspzijlfGr95N0DpTltSSp7QDpbH8W5/mJV2/PVHPrc4UD25?=
 =?us-ascii?Q?G/wIRHj+BjM42t4KMI1WWZ7q9As7NVenLhgS9dizuixVrO5WNYIMmfzkm3BG?=
 =?us-ascii?Q?pVEG/DaSPwGAYr6ktAPm7jKDxJ7GAV4UZ8HSrrc5JWdDd0q9OytrjJKcd+Iv?=
 =?us-ascii?Q?eZnQt6uHp+pAKmT68Huoat8NO2gPBeo2sTViGkUWuKBp87ce+EQizf0jNqL8?=
 =?us-ascii?Q?kjZBv52feKPy85Ijp3FsrbrkTLh1vmP3AiohQVEMpDT6i9N5UBY+Jn1Gw2VT?=
 =?us-ascii?Q?imnxTqVVQKIHwOE+//h+N/Kzxrg+whkEMZ9c8WFidc2/VNo4miCS43QhZaEG?=
 =?us-ascii?Q?AYokQRd3/oDcaKcafAOzA483UHQvNXMHLEWqo2BZqVppV40EDfymr946GzDk?=
 =?us-ascii?Q?xyCVtml3RI1eZ3tdkzwfVNnv7I1IXd/kLzGCaBDxjvXe+NwJYwdIvewvLs+O?=
 =?us-ascii?Q?nCLSefgBjSjiR0Pjuq8LxhRlJnrpM+y4MznFPwvLiMbQV6AvFSXVGxb/cnsQ?=
 =?us-ascii?Q?op4cRrKmM1DlNqmeXPXmK0VZGiwetCVPKhz2umZ1gp/GErs5rV+99qtV3yI6?=
 =?us-ascii?Q?H7UtJnvAantQEjiHmGPuTWCAbx4Q3y/npfJNnxHacws659p49vLK67xXFsav?=
 =?us-ascii?Q?ytQLiPieTJeS0X06otUnoN8oSoZCS2j9Ap49gs1ayNJ5n3eh4vVTs2mDn4PZ?=
 =?us-ascii?Q?reqmE0zKmxGMjIOzNuOz0xcIF8nJCEtjr2a33neDEDR1WUY6d2tey2VadX9Z?=
 =?us-ascii?Q?9A=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7966d054-29f6-4471-9dbd-08db409911bf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 05:43:57.7348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m65V31B2VcLGszDj8N82lt5dDwXSseJpUcLHTmgHebaEYTUkAumMlOBpcGw2E+R6mvN23SGnl2WLXTAEyfoDMcgaR8QaEfycRZjk1Uia6X4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-Proofpoint-GUID: vd87aOET-RsYIP22btSAvDfk9vXrYOJ8
X-Proofpoint-ORIG-GUID: UqEfTS-QbttDw-l-WXbl_4ujTAqZVnvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_02,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 05:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180209

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The fix of CVE-2023-29383.patch contains a bug that it rejects all
characters that are not control ones, so backup another patch named
"0001-Overhaul-valid_field.patch" from upstream to fix it.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
Changes

v1->v2: 
1. Based on latest oe-core commit
2. The fix of cve caused useradd/groupadd report errors as below:
"configuration error - unknown item 'SYSLOG_SU_ENAB' (notify administrator)"
"configuration error - unknown item 'SYSLOG_SG_ENAB' (notify administrator)"
so backport another patch to fix useradd/groupadd wrong paramter's issue.
3. Using CVE-xxx as fix of cve patch file name
---
 .../files/0001-Overhaul-valid_field.patch     | 65 +++++++++++++++++++
 .../shadow/files/CVE-2023-29383.patch         | 53 +++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  2 +
 3 files changed, 120 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-29383.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch b/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
new file mode 100644
index 0000000000..ac08be515b
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
@@ -0,0 +1,65 @@
+From 2eaea70111f65b16d55998386e4ceb4273c19eb4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
+Date: Fri, 31 Mar 2023 14:46:50 +0200
+Subject: [PATCH] Overhaul valid_field()
+
+e5905c4b ("Added control character check") introduced checking for
+control characters but had the logic inverted, so it rejects all
+characters that are not control ones.
+
+Cast the character to `unsigned char` before passing to the character
+checking functions to avoid UB.
+
+Use strpbrk(3) for the illegal character test and return early.
+
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/2eaea70111f65b16d55998386e4ceb4273c19eb4]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ lib/fields.c | 24 ++++++++++--------------
+ 1 file changed, 10 insertions(+), 14 deletions(-)
+
+diff --git a/lib/fields.c b/lib/fields.c
+index fb51b582..53929248 100644
+--- a/lib/fields.c
++++ b/lib/fields.c
+@@ -37,26 +37,22 @@ int valid_field (const char *field, const char *illegal)
+ 
+ 	/* For each character of field, search if it appears in the list
+ 	 * of illegal characters. */
++	if (illegal && NULL != strpbrk (field, illegal)) {
++		return -1;
++	}
++
++	/* Search if there are non-printable or control characters */
+ 	for (cp = field; '\0' != *cp; cp++) {
+-		if (strchr (illegal, *cp) != NULL) {
++		unsigned char c = *cp;
++		if (!isprint (c)) {
++			err = 1;
++		}
++		if (iscntrl (c)) {
+ 			err = -1;
+ 			break;
+ 		}
+ 	}
+ 
+-	if (0 == err) {
+-		/* Search if there are non-printable or control characters */
+-		for (cp = field; '\0' != *cp; cp++) {
+-			if (!isprint (*cp)) {
+-				err = 1;
+-			}
+-			if (!iscntrl (*cp)) {
+-				err = -1;
+-				break;
+-			}
+-		}
+-	}
+-
+ 	return err;
+ }
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/shadow/files/CVE-2023-29383.patch b/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
new file mode 100644
index 0000000000..f53341d3fc
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
@@ -0,0 +1,53 @@
+From e5905c4b84d4fb90aefcd96ee618411ebfac663d Mon Sep 17 00:00:00 2001
+From: tomspiderlabs <128755403+tomspiderlabs@users.noreply.github.com>
+Date: Thu, 23 Mar 2023 23:39:38 +0000
+Subject: [PATCH] Added control character check
+
+Added control character check, returning -1 (to "err") if control characters are present.
+
+CVE: CVE-2023-29383
+Upstream-Status: Backport
+
+Reference to upstream:
+https://github.com/shadow-maint/shadow/commit/e5905c4b84d4fb90aefcd96ee618411ebfac663d
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ lib/fields.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/lib/fields.c b/lib/fields.c
+index 640be931..fb51b582 100644
+--- a/lib/fields.c
++++ b/lib/fields.c
+@@ -21,9 +21,9 @@
+  *
+  * The supplied field is scanned for non-printable and other illegal
+  * characters.
+- *  + -1 is returned if an illegal character is present.
+- *  +  1 is returned if no illegal characters are present, but the field
+- *       contains a non-printable character.
++ *  + -1 is returned if an illegal or control character is present.
++ *  +  1 is returned if no illegal or control characters are present,
++ *       but the field contains a non-printable character.
+  *  +  0 is returned otherwise.
+  */
+ int valid_field (const char *field, const char *illegal)
+@@ -45,10 +45,13 @@ int valid_field (const char *field, const char *illegal)
+ 	}
+ 
+ 	if (0 == err) {
+-		/* Search if there are some non-printable characters */
++		/* Search if there are non-printable or control characters */
+ 		for (cp = field; '\0' != *cp; cp++) {
+ 			if (!isprint (*cp)) {
+ 				err = 1;
++			}
++			if (!iscntrl (*cp)) {
++				err = -1;
+ 				break;
+ 			}
+ 		}
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 52b10000ee..cf05a3af93 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -15,6 +15,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
 	   file://0001-Fix-can-not-print-full-login.patch \
+           file://CVE-2023-29383.patch \
+           file://0001-Overhaul-valid_field.patch \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.34.1


