Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C89C6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 06:18:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.31237.1681885090879573682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 23:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3473abc303=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33J5tavl012167
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 23:18:10 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyq76mvv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 23:18:10 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33J6IAqK002703
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 23:18:10 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyq76mvuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 23:18:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doykGsdBIcQ/anY4d3C9E8DsOTDj4OsMXHhExhmB784d/STEG6e2UrRxN2GmBONkAxegU7916I/xcz2kaeM3mLm958LEcZppDDhFVH5ieUetSz8SvBg7U+gZdEaglb+AmGOWzqXk8i8RQaSE5P1eP0i3o4OjkgjM4IyUE6ONIkmg0i+KR6RaSOXX0HqXMgRIPHGhQiZNgRMqnjeqqDaFD++Ayjrm2h6gHzhzEKl7KbKbV9v+FnUeDvWNrel57maWqDyg7HlYIBne6Er35w4uD3envzcqVvmUOjP/mMDHwg0GZAKfHBcuYB75XRLI71ChLKnbvg//ATzvF8oSaNlThg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4M9+YyYYQFeskxJaP6snfaT4zXMg+ix5h7jtLxaBMT8=;
 b=S3cqBDgKCRyW5ygB3ZZAT2ab/U8xRax0EIir77JJ6BZhLf+jwOBvsJjyPsIT3DhF+ziE2ZDvE8jsOwYNUD7E30JB+PpQnnNwsT4iLPhFM+IDGMuUBLGsAAVtfXCoe1wNPuOew/IUp+qR31TVulqYDhgyT+obY1u6hrSTiDIjDnebQUXLW+oVOEib29kcxiF82i0w4qjla/wjYtdL8HrA0gxMoJ95npZfAHEWhVqml5t3U4YY3IFzED9s8kMCMYc9hdsMGhOPlZ3J6CJ8EBWX2S0BUV0bon4qz7j9eszAUMD+3w2MPN6IV5ipyrj9bslzC6DqcD6G02qSoTJaA3wXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH0PR11MB5829.namprd11.prod.outlook.com (2603:10b6:510:140::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 06:18:07 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008%8]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 06:18:07 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH v2] shadow: backport patch to fix CVE-2023-29383
Date: Wed, 19 Apr 2023 14:17:39 +0800
Message-Id: <20230419061739.2924050-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH0PR11MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b91ec80-101d-442d-bd67-08db409dd779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YN5UM16n6J6bi5YyS65gMBxuVg3iNHnaZ6+qbncAZhTIsVlgfPMB5/F8Cnl8GyXe9JY4VWeQbAPbPYenMFQ47eKO6GcwBaZ+8E7+mUGUz/+u0m5GJM4UkqQX0PGzmEbsBQ0Kh+5l6ST9QtXXyrbwPCViuXTYSqTOB5PyIakck02gkhowX+7eW7v5UXa60UqLHZrbwMCw4MMfJqBrvTnPC5WQ+bFlkjDJcSFJHVYG/KeABfahBdaliI6tLKE5DJxtWnEwlGnLBimIVpoZIAEZMOBxEyt/diWoinoArzvjf10CN9wEuIhhdO5OC2TelsiycpBbFcrwxY0GitHUAPg1tPuxmqGcENw7ig9j2FWxmy+SJtVPvO6pE2okmY35y9gzt0QoFTVMhae92MhU8/PSsu4cFvjmaSZzCGlGW7EalgnJKA5bu7pvnMyYiS0m1VloS5NBIky2sxHcB34jmYo1zO/d0dt7ojmni5xQzkW4WYCb4OaO7odXRYMuspLmxeqyJv4ce3V82LbYvJMa+mcjrjHpmbAPAPZ2gTHNRAOXNPOMyZTuhi5NkOwPJs9Xsv9M0YPQyVlFqhclHabfoKf743meqxivxWETwYX0dFTg+wk3SHZcfrls5BfIVKeUf9spF3FsRbhWzz3cEvjsVv+Y8Yfxa4AGOWX8OGIxfwPT7y0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39850400004)(366004)(451199021)(66476007)(478600001)(6666004)(38100700002)(8936002)(8676002)(316002)(83170400001)(41300700001)(66946007)(66556008)(186003)(2906002)(6512007)(1076003)(26005)(83380400001)(38350700002)(6506007)(2616005)(5660300002)(6486002)(52116002)(44832011)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Xr+NNGsBRZaVrXA+esBmCJfdRkD5rNErWZEx2J2P2rEPysJiXrpoP/PHX8M1?=
 =?us-ascii?Q?kIhQ0Och2ufScTG8eTbwqn7nawZF/IRI8Tc+1yEuaR4CxFSNB4hL2x9+oNxm?=
 =?us-ascii?Q?mkB0KMidjWY9mIHS/BieWYQGGRQwj1N9gC/xvuU6x7yTfZWuJlFgXrRIYDAN?=
 =?us-ascii?Q?W6XqfdogO/NjBuaRzvVELuldoVpS5OZyvP4Q9L3LzGYluAlAx4D1VQbn5dtg?=
 =?us-ascii?Q?/Khte0nPcdPhJOHg7gxa6GYfAoHY1D4urTbNGpChkqAv9JY4voBEGLUg+C04?=
 =?us-ascii?Q?XF4xnRaUidi9ESHY7Ye/ShkenujG7bVkJs2GPSYobSXZgGbQaywfO+rRyQMo?=
 =?us-ascii?Q?smWrQVj9k7Ac7GAPxCGn2wUFVeYAw1gu7kc61g7oNtGCHeHfvrV6yWWTkT5r?=
 =?us-ascii?Q?pAXuNiBJt1uUBIfyQ25ckGoUM0zgaLfl4LS7SLLxJi6nQc/rh673C8WfA8QX?=
 =?us-ascii?Q?eXKX9+Y88rxw5Xk8CK/+GslcltG2JQ+FnUEQAoOaONKEW52Ck7QORu1S6pfN?=
 =?us-ascii?Q?MavkTnR/Yg6Ge3Q7ZbkYI14qC2rPssoBfscLDh0wSmj2gNeDrk/ldH6fCSyR?=
 =?us-ascii?Q?ifsS0wUTuiBiyoW3FeGSQfpRQmqdItLnR0pmaME5eJ2yZgKCXr0f+bu/nV1O?=
 =?us-ascii?Q?AzUXua6PvO0UJFCJDp/5kDid1hSIOPVw9ufVn+a3MjjGJt9ts7QWGYvvX2rn?=
 =?us-ascii?Q?nsHBhF1UdBNqEjjZHl3BXM2ZHNsHzuvA64IJLi6H+xAZJpUX9ZMxoCdvxFyR?=
 =?us-ascii?Q?PknIbu3Q9MXxAEtkl/JJvnukfNrxT+ettdoxecdFmeyA9+9EHzl23ZHFxOOc?=
 =?us-ascii?Q?DuZL23lC7F9+87SxgYHCN8PVYE8CY63fY9LHCuZ4z9LNx9G6nE6G/okgUsUr?=
 =?us-ascii?Q?3QZw3yYhvk7Fz1R022gyyv+Eokb97I7o6ui6ZKtya/ot2A7gymQcxjg+0TSO?=
 =?us-ascii?Q?+92rxROkEgkasgRao96d4Z9N0vrslbZGpSo8Kt29+SOyC3KwXTvwpFjf8sPo?=
 =?us-ascii?Q?SaG+o/zcHNfc9CAydY2vDWdH9DSY1oYkbl8kGZhoJcyZZh7sN0IWe73I4Q/A?=
 =?us-ascii?Q?pEyOY+QGIDeWyRY/3uOx5VU6dcD/To4gn+2Jv+qKI/fvzPphfJ0VtMTx18cW?=
 =?us-ascii?Q?KfSt0Z5CCythUbVqBPisUIChZgRnF0bDxMlMUKjlbiKPlV5emZ41vEfQsN9i?=
 =?us-ascii?Q?zkJmowUEYt1g+8PEyL4frI63ek01MjS7pztg4LndsmPE5r279G+J29cDGIS7?=
 =?us-ascii?Q?hhtrpmWQ87fWz2BIAOiCM71oJ9Nm7T73h3RiEaFM/lmZR46/DUVGNHZBeF5z?=
 =?us-ascii?Q?ETlxdqgt2FvhjKob2LGAUphTwX/tzua3eleXmX2DXnLawyDP1VEvbUFrai+e?=
 =?us-ascii?Q?kmJ1tXm2RnkNY5cVoIR5ny1Op5i+UnPQ9o0pSyrwnCvsYvB8pZmNoedPfo8x?=
 =?us-ascii?Q?HswV8eRO53vCEL0EsDx//GAkdzSRQPGXMMZ6VD0yKgPyFD/mXrpMmo2Gr8fy?=
 =?us-ascii?Q?9V5krOZGF1psGC4cy1BI30z21t7AYfNOZs6WM3psQtYhL2iXlYV41euXIhjK?=
 =?us-ascii?Q?4kxH2ezjAkijCwv4uWU2XMEjNc2B3gYgR0wtrADQ7r96WJhsE5T0wKa5NsEe?=
 =?us-ascii?Q?rg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b91ec80-101d-442d-bd67-08db409dd779
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 06:18:07.4909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CrkDwP4URcqUfzKCtZD2tBA0ySJCi45tndBUzS/QkT7eDpKCxoOrRvftLnL4jCoO02XzwPogUA8rNUQceCM/68uC/eJ7UhYaJ2l0hyF/b7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5829
X-Proofpoint-ORIG-GUID: ezSmYi1HRyqGixdaUbM_Q4kNDou0l0v4
X-Proofpoint-GUID: KycWU4_AL2ISY-i96AQF6-qYg_viLYS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_02,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 06:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180212

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
index 5106b95571..3c1dd2f98e 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -16,6 +16,8 @@ SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://shadow-relaxed-usernames.patch \
            file://useradd \
+           file://CVE-2023-29383.patch \
+           file://0001-Overhaul-valid_field.patch \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.34.1


