Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E71D44D7E
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 15:03:07 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.51])
 by mx.groups.io with SMTP id smtpd.web11.47616.1730905379436760036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 07:03:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=ZFh6az+x;
 spf=pass (domain: prevas.dk, ip: 40.107.247.51, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUpRq5/M8vM51NFclYVfy3Kt9PwN8T64/GsTC9EHXEGrAf0DWVbl8nkIbunBd679OW7yFhkYtsIJgFZpSASPKWhI8EcdUrwb+JUD8DCjgW9b7fT/YVOTbnRY4w549d7PGs533adcfiBG0dIdk0ksKlZAiqEim/b8QEdv022pDBh6dOs2hfUvLUBtuhDFL5JJ46/wl13SGNHG82iMuzBdZ5xeiRDpNzzzI1fw6V+C1hR3s3pNozQ34BAT9LyVesAV7wTktIEXNsL9tJ0HsPgnh+cFdbVUnnSDU5NLdbqqtU1K94UtDCtZTfncVEeAYogfhkjxoFHtrFBU8dnLNTbFXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1m5P/hT6oTUAh3JZEZ4vshDPHWEBVVhwCKlKmKSjAWY=;
 b=LxbrVD07rpZdl6DJu9ox9BhB6Lc7ova2by3WvJqoyvi0w+l0EPuPu9TUcojuhYY9Ga6fWty9yq0qTZgX2SZl6BjFpL/hVCKeXIoo7tFyfhkF6rkzPWlk5XMMAPzU0A+kFsXgMQctD0Qxvd5umezgwOxnPwcVF5c2LEko++VQlSTIJaDlbSLHLQAYjQYBmXEV0kOdvt1bt6r6aJZKgWJjeeNKsOMkt1BK0De+oTAnCUpN8B9r+kaqlv3YahOeNh9PZIihXK0bfv/XhvFkCTA+EngCaf6TK5CoQhAkaXfyZfIwMF7GhLeaSDjD/YoBZfTodtmpoV3MSP8eqWHivInp7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m5P/hT6oTUAh3JZEZ4vshDPHWEBVVhwCKlKmKSjAWY=;
 b=ZFh6az+xcZdJRx3khCqrqrIaaC8BRmbl1UFlxQv0aI8G+DfcMsQKqOJfsSXgBAGODkNcSVhtoroh3KIjISBc7WYLzTw0NDhB1lNspsmQ1DOL6MELCUPWZkTNAQiuWR0toyQKUU5wuBTAhNInnC/Pqjfo13IsIokA4MrJA4mVmRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by AS1PR10MB5339.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 15:02:55 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 15:02:55 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH] dosfstools: add backported patch for honouring SOURCE_DATE_EPOCH
Date: Wed,  6 Nov 2024 16:02:58 +0100
Message-ID: <20241106150259.1133621-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.47.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MM0P280CA0076.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::18) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|AS1PR10MB5339:EE_
X-MS-Office365-Filtering-Correlation-Id: bbad9d03-7e86-439e-745a-08dcfe7417ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rDdNEIKlsAC4bWv1ftFP0D8naSySNeeAfbrQu5dDELlX4JFN5BfFFjgkegby?=
 =?us-ascii?Q?sNCOogr4lBVjKZYEwmvBWdcF9VHofRYSK0Eaa2o9vQiqI2t2+ZYCONNFhV+K?=
 =?us-ascii?Q?ib71vcLiaqu09HflZQa23FsyIN8cPDucdQlN0lg4DSEShotBNXgHXqnpqXtK?=
 =?us-ascii?Q?IVzN9UFjfQ+mcEsZ1qftBzkN7Xu/7ANrig9DXUa8SYcYx+0sWDPvHmzu3237?=
 =?us-ascii?Q?vrDtzAyspF0dqzk3CW+aokCgx3DX454lk9YN+UBH52PL6tw1CzZ1tbPi3vRv?=
 =?us-ascii?Q?9M1ukywRg96zR/h79AnTLtuAWA7DT7/m26wDme61PCoJ7rEBYZHuexcAQwXS?=
 =?us-ascii?Q?xeMElKHd2MYn7W71hAnaB9sAiwu50m+FA9z3i01oJ6uWwn98z9HKr0k6+xYi?=
 =?us-ascii?Q?8PgYEOJo9PW6Z8p+FCiQrWjayxBbcI7scH2iwXbpe3ej62YWTOGYkqGhdskr?=
 =?us-ascii?Q?ykCpgj8WlQoyOiMQankq8w6vin1sASbzHbJp3h6PK6PkPfM0JnFtDbsX8dQQ?=
 =?us-ascii?Q?KWfxjjtT23BHuXgpGLHhEvGSvGkiZxte58Sjpwk+qghGK9P4+j63dAZtkPlK?=
 =?us-ascii?Q?82Lcj9286YucOtb30Lp9rNFR9h+xqNWYnw2xmWKM4b0rF8ZXm/ypMVfyevAf?=
 =?us-ascii?Q?VBC1rLJjbg170ATL7IPk1IQfDB94rOgAoycQ+QEd2cvOSPaisZcb7RkPDNPD?=
 =?us-ascii?Q?lH+clCPXQi3iKbyLpiDJmn/W7u6y1TUslh9BfDYomH+ZDGDw7EbL1z2oyfWP?=
 =?us-ascii?Q?WZkwHMa6OihB7Djz65QPV9X7nrMjfBuqmeCnQThsNc4olJG/cNSr35T2V0Fs?=
 =?us-ascii?Q?mn2cOqky/79Pbw03mvlX1fqw5IGgreFae/ce61dWH1TXmS3EawmvRdFLZVGa?=
 =?us-ascii?Q?NmkyYz0+fRTvl3f9dkCIugN6awIHb9oxBMUR1ezem/axeAn4jC8LCofVFVYW?=
 =?us-ascii?Q?lnk4vLbkGDDW4KViZ0bc74nsqjqfkzWYEZABP0HNvclZ17CAh46YXVYV1bkN?=
 =?us-ascii?Q?k6wCOf4mjmm53CBzssC2jzcphTZe3GfPolhkffZSw1zn8yAb/A7IPn1NTZ/f?=
 =?us-ascii?Q?3tH0H5eEvK074EdsHe2QxrZDvVjCxqCLe5C2Yq9xcSPWZX5SXEAxvBYVtD1Z?=
 =?us-ascii?Q?djHqQgi7F/MkqlXv/3wEWovwfz1MSky7qpxl5dsKD1ikqXkco1u7P26zOU2V?=
 =?us-ascii?Q?wWkWRDD1Y8u9IzsZgcAJWGsPWhcZmPh2SkDKRJltZuMrCMsN9OUxjvGxWg2m?=
 =?us-ascii?Q?cE88UkNiZkhGWZPLnlQ9b8to3eHRqrN0HEy9aifCZs2Fpf/oI/fC6Y8YaDtE?=
 =?us-ascii?Q?XtX/TQCfLHJWKUOri/pziGXU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U6894ceyTw7y0KrTKQ1g3hE1bouF/bSajSX3eYfHvSvXBvZOPn9ZOYYgZR0q?=
 =?us-ascii?Q?oCSoLdR3k5bR52c5NTCp4fjWv7sH04j94vN1McsXW3awTkN+1/XCqDb0ZqzC?=
 =?us-ascii?Q?/97pHD/z0RA4q4tbZ2scs6SOpxms5qRgdQRtuLcZ20HL5Vntcybki0QyUdHR?=
 =?us-ascii?Q?UIoOd2RXZtnlv8pjmWS7c0Mao8R3JIyCKHpNemTjiUqxtuw9ajE1zWwkeTeW?=
 =?us-ascii?Q?V4J8vzTbaednClOydCp4emw+H9jVrHX/TpGHEx9Cbcu8s0pTulG873Hb+qe1?=
 =?us-ascii?Q?2iGEUiFMYJY1kCpvrEKAlY4E8izFtwnTxFgHCdzWz+SRWSNrFJTfoEhFYke6?=
 =?us-ascii?Q?RdF+MjQT0L7dSJX03O48QoVTD8HpPUg6+B7tp5WBuQjRQyIF9EqU2Qt/Yxw/?=
 =?us-ascii?Q?92u0+ncnR6fVFh4OyIzF4w+jrN8lp7Ksa3iKN7nLBWQORC7b57mh13PF28aN?=
 =?us-ascii?Q?eitHotcUNGkhr6TlgLMJX2v4IFIIQk7Ft0U9K8CAUaLLmXzn1JgdScWt3WNV?=
 =?us-ascii?Q?umT/wLmP4TFYlQtLMS2cCJIxHmT1pLEMK3N6jgoBR9rVbIcvpLVPyrqI/3nu?=
 =?us-ascii?Q?o4e0+28SKA3hqTHYDxAbhClOyKJH+bZIEqPIC/AZ7EioUtRNtT/4ut0ulsju?=
 =?us-ascii?Q?qkjO8VdYeD/dIycDaq+oJBFCYSHGHgHiXMligsTnSqRf3ZbySKNBCLNxvz8q?=
 =?us-ascii?Q?wdhiedVAvAlH+2ZRglXxE1hAk66MlyjzwlRED15f68Wx2uZ6BmXMIWSgWZ3I?=
 =?us-ascii?Q?ovLk8+u20QwOSFEQk34DDBMJKPhIGB53uk/OjE+Bp8xXFuFWQqcWuwtgc4GM?=
 =?us-ascii?Q?w2UUNecT8eXgScqU6rWUMcDpBPTb6WVeTuxqy+2O/A5m9vl3MdrR7Wiq9olc?=
 =?us-ascii?Q?jbEmyJLJaNgwSMA+AWulb4bcZVoxT6FXSN//pMQPladwnq60XfhP6kwusN94?=
 =?us-ascii?Q?54tqSpCTLWAo+O2BkynOCLocpyWzgrokZgNfSjVm/ydcWMN84WmWE/wTMIqL?=
 =?us-ascii?Q?Xqcjo6lIdmlkoAr9PBfOvPIE37FPA14zylGW52O60LrziQUMFqXUe4s1aNw5?=
 =?us-ascii?Q?GIb1E0bH7bUAcfdlyXg/9J3pLCKdQ/qRKWW8up9ZbWRXLd17PuNp5j9u7fjB?=
 =?us-ascii?Q?jhiVfZXTEA2QeuQuKwLKizYMxgZau+O8vuhf0LcUuOjREvc5YDYhFdEaSh1+?=
 =?us-ascii?Q?sHvlHaJM5LA2gMJy6zBAMHt2sgAC3oboO/HCaXNYNZNfqd3VBpHculrG5hcf?=
 =?us-ascii?Q?xURjM4ELcTIldsDdqxJieMXU1ap4MaH657JTTgwD6lJth5gFik6ZVzDHCBIf?=
 =?us-ascii?Q?4QsI4vw3yL0xQGHuPs0bnnxTKSNYdhBsQ7T/TOc1/TmNlAF+0E87N4va6Cjt?=
 =?us-ascii?Q?QjNkyR6oiNPCW0e1xd2phKfgt2oR/oyE+zhBcgrtn2IrF9z11jEs7PsQCkJZ?=
 =?us-ascii?Q?q3bY5xWbslgxdgBy9g4ccU6+3uR+8PBYeqCb8Yk4+w/xeT8Y4ME0i1SU+ROj?=
 =?us-ascii?Q?eS5yxmm0fi/wGywEEenvucPm103D0plt1o8BXcVoER2Tjl+fNylKuH0Or1tO?=
 =?us-ascii?Q?ETlMBcOjjk0I2YO9LEJzmn0MzmupUC57lFbGiFOb7kCmXWJeC7BSefZbnSQA?=
 =?us-ascii?Q?6g=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: bbad9d03-7e86-439e-745a-08dcfe7417ad
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 15:02:54.8271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bn2pD6ehOHW4JZjySgeHbjLOn+v9LiXIIMVGOsWSB2nj0dIDFNIjNDI9bW4No/faEZ8hoCAcV2DYQaMpwaeVpiVDtED39v3JNfVlNyYWeWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5339
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 15:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206788

From: Rasmus Villemoes <ravi@prevas.dk>

From: Rasmus Villemoes <ravi@prevas.dk>

Currently, file system images created with mkfs.vfat are not
reproducible, because both the file system creation time and the
volume id are derived from the current time.

Upstream has added a patch for deriving those from SOURCE_DATE_EPOCH,
when defined, many years ago, but unfortunately there is no official
release containing that patch.

The issue [1] is 2.5 years old, so there's no reason to believe such a
release would be just around the corner.

The patch applies cleanly, and e.g. Arch Linux already uses this exact
combination of source tarball and this single patch [2], so I think
this should be ok. It certainly works for the images I've tested on.

[1] https://github.com/dosfstools/dosfstools/issues/179
[2] https://gitlab.archlinux.org/archlinux/packaging/packages/dosfstools/-/=
blob/main/PKGBUILD?ref_type=3Dheads

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 .../dosfstools/source-date-epoch.patch        | 158 ++++++++++++++++++
 .../dosfstools/dosfstools_4.2.bb              |   2 +
 2 files changed, 160 insertions(+)
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools/source-date=
-epoch.patch

diff --git a/meta/recipes-devtools/dosfstools/dosfstools/source-date-epoch.=
patch b/meta/recipes-devtools/dosfstools/dosfstools/source-date-epoch.patch
new file mode 100644
index 0000000000..e3a649e55a
--- /dev/null
+++ b/meta/recipes-devtools/dosfstools/dosfstools/source-date-epoch.patch
@@ -0,0 +1,158 @@
+From 8da7bc93315cb0c32ad868f17808468b81fa76ec Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Bj=3DC3=3DB8rn=3D20Forsman?=3D <bjorn.forsman@gmail.com>
+Date: Wed, 5 Dec 2018 19:52:51 +0100
+Subject: [PATCH] Honor the SOURCE_DATE_EPOCH variable
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Implement the SOURCE_DATE_EPOCH specification[1] for reproducible
+builds. If SOURCE_DATE_EPOCH is set, use it as timestamp instead of the
+current time.
+
+[1] https://reproducible-builds.org/specs/source-date-epoch/
+
+Upstream-Status: Backport [https://github.com/dosfstools/dosfstools/commit=
/8da7bc93315cb0c32ad868f17808468b81fa76ec]
+Signed-off-by: Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>
+---
+ src/boot.c     | 23 +++++++++++++++++++++--
+ src/common.c   | 18 ++++++++++++++++--
+ src/mkfs.fat.c | 19 ++++++++++++++++---
+ 3 files changed, 53 insertions(+), 7 deletions(-)
+
+diff --git a/src/boot.c b/src/boot.c
+index 4de450d..8f78e1c 100644
+--- a/src/boot.c
++++ b/src/boot.c
+@@ -33,6 +33,8 @@
+ #include <stdlib.h>
+ #include <sys/types.h>
+ #include <time.h>
++#include <errno.h>
++#include <ctype.h>
+=20
+ #include "common.h"
+ #include "fsck.fat.h"
+@@ -672,6 +674,7 @@ void write_volume_label(DOS_FS * fs, char *label)
+ {
+     time_t now;
+     struct tm *mtime;
++    char *source_date_epoch =3D NULL;
+     off_t offset;
+     int created;
+     DIR_ENT de;
+@@ -687,8 +690,24 @@ void write_volume_label(DOS_FS * fs, char *label)
+     if (de.name[0] =3D=3D 0xe5)
+ 	de.name[0] =3D 0x05;
+=20
+-    now =3D time(NULL);
+-    mtime =3D (now !=3D (time_t)-1) ? localtime(&now) : NULL;
++    source_date_epoch =3D getenv("SOURCE_DATE_EPOCH");
++    if (source_date_epoch) {
++        char *tmp =3D NULL;
++        long long conversion =3D 0;
++        errno =3D 0;
++        conversion =3D strtoll(source_date_epoch, &tmp, 10);
++        now =3D conversion;
++        if (!isdigit((unsigned char)*source_date_epoch) || *tmp !=3D '\0'
++                || errno !=3D 0 || (long long)now !=3D conversion) {
++            die("SOURCE_DATE_EPOCH is too big or contains non-digits: \"%=
s\"",
++                source_date_epoch);
++        }
++        mtime =3D gmtime(&now);
++    } else {
++        now =3D time(NULL);
++        mtime =3D (now !=3D (time_t)-1) ? localtime(&now) : NULL;
++    }
++
+     if (mtime && mtime->tm_year >=3D 80 && mtime->tm_year <=3D 207) {
+ 	de.time =3D htole16((unsigned short)((mtime->tm_sec >> 1) +
+ 					   (mtime->tm_min << 5) +
+diff --git a/src/common.c b/src/common.c
+index 6a2e396..4f1afcb 100644
+--- a/src/common.c
++++ b/src/common.c
+@@ -30,6 +30,7 @@
+ #include <string.h>
+ #include <stdarg.h>
+ #include <errno.h>
++#include <ctype.h>
+ #include <wctype.h>
+ #include <termios.h>
+ #include <sys/time.h>
+@@ -298,8 +299,21 @@ void check_atari(void)
+ uint32_t generate_volume_id(void)
+ {
+     struct timeval now;
+-
+-    if (gettimeofday(&now, NULL) !=3D 0 || now.tv_sec =3D=3D (time_t)-1 |=
| now.tv_sec < 0) {
++    char *source_date_epoch =3D NULL;
++
++    source_date_epoch =3D getenv("SOURCE_DATE_EPOCH");
++    if (source_date_epoch) {
++        char *tmp =3D NULL;
++        long long conversion =3D 0;
++        errno =3D 0;
++        conversion =3D strtoll(source_date_epoch, &tmp, 10);
++        if (!isdigit((unsigned char)*source_date_epoch) || *tmp !=3D '\0'
++                || errno !=3D 0) {
++            die("SOURCE_DATE_EPOCH is too big or contains non-digits: \"%=
s\"",
++                source_date_epoch);
++        }
++        return (uint32_t)conversion;
++    } else if (gettimeofday(&now, NULL) !=3D 0 || now.tv_sec =3D=3D (time=
_t)-1 || now.tv_sec < 0) {
+         srand(getpid());
+         /* rand() returns int from [0,RAND_MAX], therefore only 31 bits *=
/
+         return (((uint32_t)(rand() & 0xFFFF)) << 16) | ((uint32_t)(rand()=
 & 0xFFFF));
+diff --git a/src/mkfs.fat.c b/src/mkfs.fat.c
+index 37fc8ff..1948635 100644
+--- a/src/mkfs.fat.c
++++ b/src/mkfs.fat.c
+@@ -1074,7 +1074,7 @@ static void setup_tables(void)
+         }
+=20
+         /* If is not available then generate random 32 bit disk signature=
 */
+-        if (invariant)
++        if (invariant || getenv("SOURCE_DATE_EPOCH"))
+             disk_sig =3D volume_id;
+         else if (!disk_sig)
+             disk_sig =3D generate_volume_id();
+@@ -1287,7 +1287,7 @@ static void setup_tables(void)
+ 	    de->name[0] =3D 0x05;
+ 	de->attr =3D ATTR_VOLUME;
+ 	if (create_time !=3D (time_t)-1) {
+-	    if (!invariant)
++	    if (!invariant && !getenv("SOURCE_DATE_EPOCH"))
+ 		ctime =3D localtime(&create_time);
+ 	    else
+ 		ctime =3D gmtime(&create_time);
+@@ -1477,6 +1477,7 @@ int main(int argc, char **argv)
+     int blocks_specified =3D 0;
+     struct timeval create_timeval;
+     long long conversion;
++    char *source_date_epoch =3D NULL;
+=20
+     enum {OPT_HELP=3D1000, OPT_INVARIANT, OPT_MBR, OPT_VARIANT, OPT_CODEP=
AGE, OPT_OFFSET};
+     const struct option long_options[] =3D {
+@@ -1497,8 +1498,20 @@ int main(int argc, char **argv)
+ 	    program_name =3D p + 1;
+     }
+=20
+-    if (gettimeofday(&create_timeval, NULL) =3D=3D 0 && create_timeval.tv=
_sec !=3D (time_t)-1)
++    source_date_epoch =3D getenv("SOURCE_DATE_EPOCH");
++    if (source_date_epoch) {
++        errno =3D 0;
++        conversion =3D strtoll(source_date_epoch, &tmp, 10);
++        create_time =3D conversion;
++        if (!isdigit((unsigned char)*source_date_epoch) || *tmp !=3D '\0'
++                || errno !=3D 0 || (long long)create_time !=3D conversion=
) {
++            die("SOURCE_DATE_EPOCH is too big or contains non-digits: \"%=
s\"",
++                source_date_epoch);
++        }
++    } else if (gettimeofday(&create_timeval, NULL) =3D=3D 0 && create_tim=
eval.tv_sec !=3D (time_t)-1) {
+         create_time =3D create_timeval.tv_sec;
++    }
++
+     volume_id =3D generate_volume_id();
+     check_atari();
+=20
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb b/meta/reci=
pes-devtools/dosfstools/dosfstools_4.2.bb
index 47d81dac8d..175fa265ef 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
@@ -13,6 +13,8 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar=
.gz \
           "
 SRC_URI[sha256sum] =3D "64926eebf90092dca21b14259a5301b7b98e7b1943e8a201c7=
d726084809b527"
=20
+SRC_URI +=3D "file://source-date-epoch.patch"
+
 inherit autotools gettext pkgconfig update-alternatives github-releases
=20
 EXTRA_OECONF =3D "--enable-compat-symlinks --without-iconv"
--=20
2.47.0


