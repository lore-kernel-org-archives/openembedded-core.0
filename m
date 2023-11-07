Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1C8C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 08:06:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5720.1699344373553741463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 00:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=S0DJj+ew;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=967565e66b=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A77V3ge014607
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Nov 2023 00:06:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=CUfTZ7jKex+kCIqWTw
	wjJckwMkXPQAmx6DYHK+t2U6s=; b=S0DJj+ewjMdkxDk+rbhfgOYp0HotWQmqJF
	nwHBVHQ68w4WQ3PITnnlOPzn44AuHJ4VsRkUqvt5Yl+0+AEgchSfcLYiVw5mcX6/
	2X/MMIKsq3FbOm7B3Eox1LwRRu+25N7zjBDQ7U06K4kmI9pXb1rNqX4de8/mZV4C
	BpAem1AWZh7akBhrdoyJj1DgMEgFLuRPHHfvmBB62ydRDxJIaLKvuX8hjVnFDe9S
	aO7mzPsa6pHZFEwjDDRqOOQb9BAQQbmbMvVDNPL4GfY2W5UpfxefjP6ANK4zj/CW
	P9xsur708liYj3D30m30Q0XZP8sZJ9YyTsBFb6mJ3B2jXdSdX8Tw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u5h80aa8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 00:06:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgF9JXjTsekutx6yPsbYlATg9ne7bemnl5zVcIRIRh7Wb2GpzZYJc4SxLGWgeIV0+XcIBKvXNn5sls0mWrU1yATGWBgb7tq7/a5jFU7+WA2pH6vPuGXnZqxAjK9V4uVk1kDlGkC8swSfUuytcnlk3BMum8Q6rdRzbSdcyf7PQZbeQt/1/bA8oJeGbGtHS+30uKpWKJ9PlW48cvNO4SrJma/pHeugPOW9pJhl4MgMWSzIx4ywajQS7UHDX0UL6MmoBXJHVUXds3DzhgvCI8QvSfs4ZX/Qqk97FiIYymwWymzz9fTd3T8Sb6suzqdg+z6pNWV1O96o9Cvjw+S8a+oHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUfTZ7jKex+kCIqWTwwjJckwMkXPQAmx6DYHK+t2U6s=;
 b=Tzj/uH/Hd/0xrCQvFrxZyU9KFQ8/Btc6bFVOS1aqzXHbmCif66zUKBDa85KrsPvxc+W46dwLWDqC1nYKIR3DI0zljGO22sbL+R0UQuKE9aRqM8T1+MCCHhEALGecllOvl7H+KLvfoAZuFXk8kCMP32m7J9igOuZh+SOmT6DCx7pcXQTSQbUw8rnpx6/JKT4MXs4KxkGmebDwZxijcW0YMw8sA2/+PHguHi3QNTA2gqlSkRNKgas7YEy6wiCr/W+W3dSFKMsEimZwaqkk12jUOneUvDJYTbtDQHnsZHRYFee+FGUhy4M/Fu9f7GjHhYqrkO/gUsXb9pb+ff+IXhc4MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB5680.namprd11.prod.outlook.com (2603:10b6:a03:305::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 08:06:08 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::1ea8:e7e3:acc1:8eb6]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::1ea8:e7e3:acc1:8eb6%3]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 08:06:07 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore][PATCH] systemd: backport patch to fix warning in systemd-vconsole-setup
Date: Tue,  7 Nov 2023 00:05:57 -0800
Message-ID: <20231107080557.48023-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0030.namprd17.prod.outlook.com
 (2603:10b6:510:323::25) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db77b40-6a03-41dd-861a-08dbdf686583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u8JFJnePCrKBsyDGb0i72IBpTeKnTWuj+qnxMMRlB0dyFCs5SY4hJccz1JeeDLfjQURjGNNu62439HhunnHko/tY6EFAD3IK4ItCA9+SeqxSZOXtGjoIYE0q2/PCjeES/XgzQmu6eMWpSQusUiLaMufJaUpxRDXwqBVRN+SGzKDfeREY1PRQosS4YK//v5LqwZvPxhX0XMmNEm1JHXBL6vxI0GPXkqpSDhGEfRlI0Uib0L7LL4SULRhZfw0vDqITGgYI2Yn/zkC1T+q6Gx9AST9RA44jaWPS5RgzN5oGThcPIK4u8P8F9zm0ZP/S3eGbh1SKhfiT+60dVB/BzuOBxnVTw/d50Uwv0QihmdarjASvmoKtIM1abND+c+kuGv0d4/UHf6zIoyhuYvN7TdVGHLjXoEuJCIhIrS9Lie64Jahof1pawmYaAy6ytUNkjEuh77QzVZWLplUv/Y4Bkef48khQQdS568eojwCyzn1tfR6LaDEUfOblcbmb+az8bLx+JFahzMTX1Tiu7TfpAsQjSU0kYTXzMUJn8D5KPuj56EIoxq3kqR4WaGuRArCoUA1wtUgQzuKwqMTa7hjsNgotqqs+6miiqgXlPR34ix7yqGpKwvyHCGkWJx75ZV2G3X9z8kEBfLhPvwaOAMO8BSY3vf7B6fzLGL3l3ja3IcjrHdc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(346002)(39850400004)(136003)(230922051799003)(230173577357003)(230273577357003)(451199024)(186009)(64100799003)(1800799009)(38100700002)(6666004)(6506007)(52116002)(83380400001)(6512007)(1076003)(2616005)(86362001)(41300700001)(2906002)(8936002)(5660300002)(8676002)(36756003)(38350700005)(6916009)(66476007)(66556008)(316002)(66946007)(26005)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5d0MyLRHIsest/xZezslcvWqw8ov0em6CD/E8myhPLPTgRzeCvjcm5TndoD+?=
 =?us-ascii?Q?18emJfiumZjAAQxwGbGkm+L7CCAgnlC9iPaAI1TZKTX18p2KG27+dH2+tN43?=
 =?us-ascii?Q?BPsdZ+z2TZ/A5wyOpgpsF0WTE38ny1cCK+YbonOOXvYAa/SZlR1Je1Kqd17h?=
 =?us-ascii?Q?sBldNAQOVqhrnkZS2dfMGEmJ575bmFlhIHot9rlM++u2Wx8SDwddaIBJeGbw?=
 =?us-ascii?Q?lLkax88zfzGVI8pZgypoxFl5YwTTzIgysXYdRMmyxMmyORc9L5MLt2p332uo?=
 =?us-ascii?Q?TpDooKlTBkrPnaBovRE7qihb7b566tFLGqGg3YTKkDe8SmJ9AsMLxHhlx3uS?=
 =?us-ascii?Q?b+ot+49t5dzCxrLkiQKk8pyptrl9UTDmchYGmGXHzZt99Ev5WLopcOqnoZ5/?=
 =?us-ascii?Q?TWEL57mWW6AqMmJfBHdBVxXSAC/nusrsT9z37zSRKLXNyn4fVsYwcZmfnctn?=
 =?us-ascii?Q?LDAjbFcUmmDu0O2ykJkX15cb3qLorDQ4lyWIPGHZp6ddhxanSKQUvtRxJ/KH?=
 =?us-ascii?Q?L5fr7Y3m8TKpToaZizz2AfzdOjy4vypPAkcgVKMnqvOsZGaIijxYI1nTn9qY?=
 =?us-ascii?Q?6S9LfqSHKmf3FOrOkQppLZNYkrQmRm768+t7UJWhGo7OMHttNUCAW5TUTVKz?=
 =?us-ascii?Q?KYVQ2Yr8TYmstRx95VYFUe+uTKoEK23XthCZpiCJia3ODSdsdcNfDJL9px2K?=
 =?us-ascii?Q?9ejtANGLYR+TCyDsz8rsmZnezvX19bdilfvKF9YwYSVG78y9ZfVVs7B9N/BV?=
 =?us-ascii?Q?FqkJvoHk+RMOV9d3B0ixn1d0NA7kbUf0FG5kEz2WqnPgDLSM4HxZBv2Klf6N?=
 =?us-ascii?Q?GxWK76KkqgE+4ErGZ8DnMMyEhlqk4Scu6v/ffgLmuZcC0CafNpG+OaaJkrGe?=
 =?us-ascii?Q?G5ryOpimupl8yusqsRqpRHqUOhvXB9r4/z2zLgsmRwQiuAE/ZkoXlDzVuMpr?=
 =?us-ascii?Q?McfntjgES/aJyus4bk0RzPZKFHLAPg+/FJ+Mm3oMy+XWvgBA8qyZq7g90vuw?=
 =?us-ascii?Q?aJOLGqr0HbOGCpTJtC6HNK0yDG7DurPh22mdv0gNbYDNqkQwr0+pNgq1xuRo?=
 =?us-ascii?Q?1lgyT/xuXP48empGAdPkfp/JM3Pc+flvLyYnWGqKUYhx+zLBqXntIj1esbdF?=
 =?us-ascii?Q?/2r88wMuy640i0acFWY5RZwn1MuQWMg6FZzZgUZRzmuyLsjzQTHMz5/Ml3C6?=
 =?us-ascii?Q?sT1ZMba/CFBUzeIikiiauX3P+VGHvajBR8H4Y0oVDtMt+Q/oz4eP9i+R9rIC?=
 =?us-ascii?Q?4DSz86GFBppaPEAhGnN7EMj6UR1r/jzLQOr8zlG+Ya1+3tJOV4upIaBlcynp?=
 =?us-ascii?Q?7wGcMPbzyXctA4Uj2bOER+4WSiDRifnWnuarWYpKwFtB19Af84mxmeyYMC0V?=
 =?us-ascii?Q?4vle65AeRvxLDOJwwsI/hG8fZfOjZdJVOjzRBprSB+XVdS9hkxZ0zeoe3Ko7?=
 =?us-ascii?Q?TG9XghndvFHrKx+5mMxsekoD/g6/lShnRfSfUshXtUKzGrWSz1PfUQ5mlXu0?=
 =?us-ascii?Q?B9rq6M4o71Q5Fjjgg3n+kgDbFdsAVTH9JQiIGUGAfwdL2mtHsbzTr1W7oV7/?=
 =?us-ascii?Q?SUjXVhq5BgugqT+oOc9zprOfnyiVxhC8VH8IhtBxZi6o9E1TLbIIvy5I/sCO?=
 =?us-ascii?Q?fQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db77b40-6a03-41dd-861a-08dbdf686583
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 08:06:07.6819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odUs2g+l1PkbCG/Z8kyvHMqSI6IPQwnoacXdkiwgYc+vZzzgenEA7vd2QmEXi66X4JE5Zz8oHtiLa0BO9Y5RPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5680
X-Proofpoint-ORIG-GUID: byhEaKXWZWIAYbfpQ2Hc2P674b8Tqne7
X-Proofpoint-GUID: byhEaKXWZWIAYbfpQ2Hc2P674b8Tqne7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_15,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 spamscore=0
 mlxlogscore=849 lowpriorityscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311070066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 08:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190255

The backported patch fixes the following warning:
systemd-vconsole-setup[221]: Failed to import credentials, ignoring: No such file or directory

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...l-return-0-for-missing-creds-in-read.patch | 139 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_253.1.bb    |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-shared-creds-util-return-0-for-missing-creds-in-read.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-shared-creds-util-return-0-for-missing-creds-in-read.patch b/meta/recipes-core/systemd/systemd/0001-shared-creds-util-return-0-for-missing-creds-in-read.patch
new file mode 100644
index 0000000000..953afd20b4
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-shared-creds-util-return-0-for-missing-creds-in-read.patch
@@ -0,0 +1,139 @@
+From 78fc42be73d81ff625f6479784ce1950bd4741b3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Tue, 25 Apr 2023 17:58:34 +0200
+Subject: [PATCH] shared/creds-util: return 0 for missing creds in
+ read_credential_strings_many
+
+Realistically, the only thing that the caller can do is ignore failures related
+to missing credentials. If the caller requires some credentials to be present,
+they should just check which output variables are not NULL. One of the callers
+was already doing that, and the other wanted to, but missed -ENOENT. By
+suppressing -ENOENT and -ENXIO, both callers are simplified.
+
+Fixes a warning at boot:
+systemd-vconsole-setup[221]: Failed to import credentials, ignoring: No such file or directory
+
+(cherry picked from commit 55ace8e5c58441d1a2c64b297a38b232ef0c0e28)
+
+Upstream-Status: Backport [1575f1d9e78ab44beedd4eae4af3a14d45312d76]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/resolve/resolved-conf.c   |  7 +++----
+ src/shared/creds-util.c       | 18 +++++++++++-------
+ src/test/test-creds.c         |  8 ++++----
+ src/vconsole/vconsole-setup.c |  2 +-
+ 4 files changed, 19 insertions(+), 16 deletions(-)
+
+diff --git a/src/resolve/resolved-conf.c b/src/resolve/resolved-conf.c
+index d6929984e9..52e65caffa 100644
+--- a/src/resolve/resolved-conf.c
++++ b/src/resolve/resolved-conf.c
+@@ -476,10 +476,9 @@ static void read_credentials(Manager *m) {
+         if (!m->read_resolv_conf)
+                 return;
+ 
+-        r = read_credential_strings_many(
+-                        "network.dns", &dns,
+-                        "network.search_domains", &domains);
+-        if (r < 0 && !IN_SET(r, -ENXIO, -ENOENT))
++        r = read_credential_strings_many("network.dns", &dns,
++                                         "network.search_domains", &domains);
++        if (r < 0)
+                 log_warning_errno(r, "Failed to read credentials, ignoring: %m");
+ 
+         if (dns) {
+diff --git a/src/shared/creds-util.c b/src/shared/creds-util.c
+index 750ee2571e..617bae4205 100644
+--- a/src/shared/creds-util.c
++++ b/src/shared/creds-util.c
+@@ -96,17 +96,21 @@ int read_credential_strings_many_internal(
+ 
+         /* Reads a bunch of credentials into the specified buffers. If the specified buffers are already
+          * non-NULL frees them if a credential is found. Only supports string-based credentials
+-         * (i.e. refuses embedded NUL bytes) */
++         * (i.e. refuses embedded NUL bytes).
++         *
++         * 0 is returned when some or all credentials are missing.
++         */
+ 
+         if (!first_name)
+                 return 0;
+ 
+         r = read_credential(first_name, &b, NULL);
+-        if (r == -ENXIO) /* no creds passed at all? propagate this */
+-                return r;
+-        if (r < 0)
+-                ret = r;
+-        else
++        if (r == -ENXIO) /* No creds passed at all? Bail immediately. */
++                return 0;
++        if (r < 0) {
++                if (r != -ENOENT)
++                        ret = r;
++        } else
+                 free_and_replace(*first_value, b);
+ 
+         va_list ap;
+@@ -127,7 +131,7 @@ int read_credential_strings_many_internal(
+ 
+                 r = read_credential(name, &bb, NULL);
+                 if (r < 0) {
+-                        if (ret >= 0)
++                        if (ret >= 0 && r != -ENOENT)
+                                 ret = r;
+                 } else
+                         free_and_replace(*value, bb);
+diff --git a/src/test/test-creds.c b/src/test/test-creds.c
+index 44022e7324..25b0c34a59 100644
+--- a/src/test/test-creds.c
++++ b/src/test/test-creds.c
+@@ -16,7 +16,7 @@ TEST(read_credential_strings) {
+         if (e)
+                 assert_se(saved = strdup(e));
+ 
+-        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == -ENXIO);
++        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == 0);
+         assert_se(x == NULL);
+         assert_se(y == NULL);
+ 
+@@ -24,20 +24,20 @@ TEST(read_credential_strings) {
+ 
+         assert_se(setenv("CREDENTIALS_DIRECTORY", tmp, /* override= */ true) >= 0);
+ 
+-        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == -ENOENT);
++        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == 0);
+         assert_se(x == NULL);
+         assert_se(y == NULL);
+ 
+         assert_se(p = path_join(tmp, "bar"));
+         assert_se(write_string_file(p, "piff", WRITE_STRING_FILE_CREATE|WRITE_STRING_FILE_AVOID_NEWLINE) >= 0);
+ 
+-        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == -ENOENT);
++        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == 0);
+         assert_se(x == NULL);
+         assert_se(streq(y, "piff"));
+ 
+         assert_se(write_string_file(p, "paff", WRITE_STRING_FILE_TRUNCATE|WRITE_STRING_FILE_AVOID_NEWLINE) >= 0);
+ 
+-        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == -ENOENT);
++        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == 0);
+         assert_se(x == NULL);
+         assert_se(streq(y, "piff"));
+ 
+diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
+index 7d3e9db73f..b2676eb487 100644
+--- a/src/vconsole/vconsole-setup.c
++++ b/src/vconsole/vconsole-setup.c
+@@ -442,7 +442,7 @@ int main(int argc, char **argv) {
+                         "vconsole.font", &vc_font,
+                         "vconsole.font_map", &vc_font_map,
+                         "vconsole.font_unimap", &vc_font_unimap);
+-        if (r < 0 && r != -ENXIO)
++        if (r < 0)
+                 log_warning_errno(r, "Failed to import credentials, ignoring: %m");
+ 
+         /* Load data from configuration file (middle priority) */
+-- 
+2.42.0
+
diff --git a/meta/recipes-core/systemd/systemd_253.1.bb b/meta/recipes-core/systemd/systemd_253.1.bb
index f306765168..3d8e2b4816 100644
--- a/meta/recipes-core/systemd/systemd_253.1.bb
+++ b/meta/recipes-core/systemd/systemd_253.1.bb
@@ -25,6 +25,7 @@ SRC_URI += " \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
            file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
+           file://0001-shared-creds-util-return-0-for-missing-creds-in-read.patch \
            "
 
 # patches needed by musl
-- 
2.42.0


