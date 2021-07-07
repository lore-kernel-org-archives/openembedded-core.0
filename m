Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.52])
 by mx.groups.io with SMTP id smtpd.web11.18714.1625648916305762561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 02:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=RpIKSpZ5;
 spf=pass (domain: kpit.com, ip: 40.107.138.52, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrweVoApAASATRNF30s1BvX1LfTRAD8veHWkgrezggb3XmflwjzqXB87JbX7Noj3PlIukyqcL7hB5XUZ2aio2294vUZZUcj00VmXGuIZZusIEsMzIjX85+XpF2R2lklR1OskUDT5JnkBgFLnGkPSBGbjMaR43thvtW2cu6a2CaxpefNLxoreAy4yCmp005RnWS63T4HY1osVubwGeD9LYxG8A/09YhqhYx6DhbGew57b+WmyDQZLFaC9Z0vC80mXwuzB67DbWh4fHMz7Bddy6uSRS2aPGP1smdmET8zb/D5Jau7/hgTismAJs1JvjFyTcqg62xoQbsXmhU9GrzydaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsVHt6orEos6lmygTjtV9HRxezcVm2oVa7S0g0jBoOM=;
 b=fCwx2jqQXFAdmD7JZkAQqqTRtlDCThSQMO1d6xFiJ72T26/E7vZAlMNPTFqK+IjG6YRYmrNWbZjfeyjVcNbwVtQgk9oRIZmaDLbQg301Srcnda5KG7C8Xg7tnyz3THYAyP2766MLROsn10WCbzHacqxWCG2gJhuuWgV3o61mHUiU7CRvEx88/A/Otxu7hedUcMWa+NPFcjNlBmZ6JmnKVRNUDPNGDP1/lzQ8S7aBKcWiZ7Ld37nlWY5LaCcPa2dWqVerRUJnmIBoRKxlqB4wuETJTtSA9S0bQGTv2Kn2g3I5K1sD+ZNLKVj1U9EmnSp1RjcGMUg3hipn7BZDFF46dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsVHt6orEos6lmygTjtV9HRxezcVm2oVa7S0g0jBoOM=;
 b=RpIKSpZ5yoFa7B1OPD+RdUpGymN9dT/4/t41kElWxLtqOuUM583wmy1jVN9MYiwdhk3ikLy4quO3gcd7i18dRbULPZ5UWMm7syJRJucQwYIBVuj9idzssC+/WwQTqKb8TvBefoneIedFjjGIC8d78LrHaH5gjqeZ4dD8PobVQSA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
 by PN3PR01MB5629.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:78::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Wed, 7 Jul
 2021 09:08:26 +0000
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::90e4:19:df85:b580]) by PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::90e4:19:df85:b580%3]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 09:08:26 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Chen Qi <Qi.Chen@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Akash Hadke <akash.hadke@kpit.com>
Subject: [poky][dunfell][PATCH] busybox: fix CVE-2021-28831
Date: Wed,  7 Jul 2021 14:37:48 +0530
Message-Id: <1625648868-1419-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::26) To PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4042:313:3c1f:d3cd:a8e5:c219:b9fb) by PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 09:08:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87f96303-705d-422c-b226-08d94126c711
X-MS-TrafficTypeDiagnostic: PN3PR01MB5629:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN3PR01MB56290B4AABFE39040A217DB28E1A9@PN3PR01MB5629.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+YxS6ctvWbEAYwOmckhfRsXy544ZQRHURx1TZEE139rCheqCcmHk9OeDEBVKsH6mdP5mWnxwnCYWmJggAYYge6tBHfVM4NqsjVb5bYWNolr4OF00XeK5sbG1Sa8D9XLrXbuRSNxTtSFWZZd5EP01raqafXM19GGXWwEGmoafqptZcdFofdQyHRcH926Yoh8hZC4JGZnHj+utPwx0VTyzN9ac01SSPvv1T0yPgMXVz0SvYznohOAHS2YpqR04w+KHTJHKjSdvN5pqu2NjRbcJKj+pe+t/A9HVqcRrbtUWeLxUofSckm3bvncnONgfyWVtHg0guKDI7Ez6L4v5l0+Shl02Mkb+ryUlqMIh2vI4I/x/N+E7mRJF6FglUms212ejCJL6USbYCKgBk0wbv+qy/Ocs/0PNmiQqQZSO3UcuiKpB95jYYCzDMY1oJid1lwRcVyX/ZLyTrPgJg+Cca5kl/RpExfQM+iZoy8RBkBN0cI4WNQQgNxbhibgKlqiQsxCDZwqMmhweoTtiXNxTKnvEdIASMVA1FhKE8oL5LI9wqnsoxnqOga8ZqBQUGwxRTDx8TBZsbAIogHxrFM0kwu7zmZ34Cp1swqCy8ts/9D/lORby+uJLRaLH9SXOrJJCWjrF2pFT6glQPKPEGIMNc0wlsa06tk02EQemTHviDNi9Bd9q1PTSzd4EhVfdkVwhrj6v8snC2+0+wY1bQflI/aKjdmfLOo0S7iKz3McpYgjLRZc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(346002)(136003)(396003)(66476007)(6506007)(316002)(8936002)(5660300002)(8676002)(66946007)(478600001)(2906002)(66556008)(36756003)(38100700002)(86362001)(6512007)(107886003)(6666004)(2616005)(186003)(6486002)(4326008)(6916009)(52116002)(83380400001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IKeW8ydGRHJlmDOx3E5dpsFfWuCC52O0YAgFuBCyqrv2Mmp7o4r+0CIedmga?=
 =?us-ascii?Q?qeBrJvXQnC4R7NyifdajF0qOnzfDGywnOHaghsV3ShKUbUtdnwtNYAA7e1PQ?=
 =?us-ascii?Q?hmdRnvTnzKSatT7ooSZah5uhfvyMpeahsDildj3lrZPfjNNUoLiFd2F8c7la?=
 =?us-ascii?Q?gZTnT5YzcipO3UFy36RPTMyZhE3hdQtHKjtW9sLGPss4iPFt46BKDphLMVrr?=
 =?us-ascii?Q?a4vgnXWRsvITHHcHTcwJ53DAUJc7Ft8c8nNkOEzMcMku8DkBDCO5Cc2VaXgV?=
 =?us-ascii?Q?5prw2NoN67BFMcdPIMwQuCWxykgyeEjXBUWRj1530Oh6y55/c4n/G/WjifBe?=
 =?us-ascii?Q?GajzHuy8EiynApnBqx85TrkcfZA0ICMx+NJmYb+2tMYJ0UHEVF13oU+vDc3K?=
 =?us-ascii?Q?9lk0SKZ/mdUH1iPQ+oJntSeZJcBUocfTX8ZTCvSfiP/8WTbDw8mSDKvskIGZ?=
 =?us-ascii?Q?wy4HfzyHeuL/3OJGA7zB/+6Y/4oxFakI0PQlkKqVKbrU64l9cbfQ1LWPdHdl?=
 =?us-ascii?Q?wFrEuXUN3vDDm+10sIPHAacdfNqiYel9znIqadSzRw5nxxczd4tvE2JCV4wt?=
 =?us-ascii?Q?GmVqKvRWu08o1HXdrPYEUwWMlYvEDdPmQ52Gnlpm6unQUUqrzBExx7j00YAr?=
 =?us-ascii?Q?b2xt2XaKEPuTF/7endbFTfdkmYFOP4SF/9qJoWag/OxmqULEWkrHuTE1mCn8?=
 =?us-ascii?Q?SzML82MT9L5eH7p5Lgc2ilE6cwCOhHHeKUpORd4fNgh/XzspFdOLYswW3U2v?=
 =?us-ascii?Q?HlKC3ff4PPogGrHW3WgW2WQcuMviL+344JXVW4H56jwZjxPBd2dIlFziAq38?=
 =?us-ascii?Q?GPG/tB5KH8FVfykwFUas2zTJS8566YT6cW7or3oWSEv9sSZfseHlDtRBXu4t?=
 =?us-ascii?Q?EReq8nLOipcGjmdf+FHl1Bg18+r6bcU2KEaxJRLqXmswfwpUSBTJ8Sn6DMCD?=
 =?us-ascii?Q?f2sd7Le/Gg3BnpZSfz6zBU6mhNL5uA7A3qXt9eti2Rkyd1HSsjgTcm4Y9RVb?=
 =?us-ascii?Q?1I/XcaO7kxiVtE65gqkgRcOosOhuuYuJ2dsLiturqmS6YkXvGYweUq6BvsS4?=
 =?us-ascii?Q?csYb0QgSYwCDn4Fa0qHtJEgC7howHbgDoYuEnIj3e3tx/bV5iPtGA9IS84wn?=
 =?us-ascii?Q?gVn0HCVyKcZbjX6oyxaaPN+JNZpXeRk1riu7VOR2SjtJkY3kQEByOk5H1tzk?=
 =?us-ascii?Q?Q01Tiq5coeP5OxoA5/Pbsx0xabNDtZoXW1yy7vOxRFQDfRldbWfxkYd2VAIT?=
 =?us-ascii?Q?8OPBv6VDywDLsn0C5+M42cpd8lHvYsMnnbKL/1//kdZupDM/Oo5JWGfPjbUX?=
 =?us-ascii?Q?zZ7Svc5xn6WHJ+IBraIEA4G7zxYLMAu5pzyJrOvX20mNL2KSlLo3VYdZ4P4Y?=
 =?us-ascii?Q?Wl8ArT7DRWiPorMqtLkUUBOQJun7?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f96303-705d-422c-b226-08d94126c711
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 09:08:26.1150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bECs+DQJpUSZm+qHp3Hg6N62X5G1pHME1AalIxs+sNeYr8anZnII1tuoxFtqKPinLPj8WVSv1xdb1ZuSl9+hbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB5629
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2021-28831.

(From OE-Core rev: e579dbd9a6b2472ca90f411c0b594da9e38c9aca)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 ...ompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch | 51 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb        |  3 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch b/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
new file mode 100644
index 0000000..b75f090
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
@@ -0,0 +1,51 @@
+From fe791386ebc270219ca00406c9fdadc5130b64ee Mon Sep 17 00:00:00 2001
+From: Samuel Sapalski <samuel.sapalski@nokia.com>
+Date: Wed, 3 Mar 2021 16:31:22 +0100
+Subject: [PATCH] decompress_gunzip: Fix DoS if gzip is corrupt
+
+On certain corrupt gzip files, huft_build will set the error bit on
+the result pointer. If afterwards abort_unzip is called huft_free
+might run into a segmentation fault or an invalid pointer to
+free(p).
+
+In order to mitigate this, we check in huft_free if the error bit
+is set and clear it before the linked list is freed.
+
+Signed-off-by: Samuel Sapalski <samuel.sapalski@nokia.com>
+Signed-off-by: Peter Kaestle <peter.kaestle@nokia.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-28831
+Comment: One hunk from this patch is removed as it was not relevant.
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+Signed-off-by: Akash Hadke <Akash.Hadke@kpit.com>
+---
+ archival/libarchive/decompress_gunzip.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/archival/libarchive/decompress_gunzip.c b/archival/libarchive/decompress_gunzip.c
+index eb3b64930..e93cd5005 100644
+--- a/archival/libarchive/decompress_gunzip.c
++++ b/archival/libarchive/decompress_gunzip.c
+@@ -220,10 +220,20 @@ static const uint8_t border[] ALIGN1 = {
+  * each table.
+  * t: table to free
+  */
++#define BAD_HUFT(p) ((uintptr_t)(p) & 1)
++#define ERR_RET     ((huft_t*)(uintptr_t)1)
+ static void huft_free(huft_t *p)
+ {
+ 	huft_t *q;
+ 
++	/*
++	 * If 'p' has the error bit set we have to clear it, otherwise we might run
++	 * into a segmentation fault or an invalid pointer to free(p)
++	 */
++	if (BAD_HUFT(p)) {
++		p = (huft_t*)((uintptr_t)(p) ^ (uintptr_t)(ERR_RET));
++	}
++
+ 	/* Go through linked list, freeing from the malloced (t[-1]) address. */
+ 	while (p) {
+ 		q = (--p)->v.t;
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index 7563368..f7808f4 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -50,7 +50,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
            file://busybox-CVE-2018-1000500.patch \
            file://0001-hwclock-make-glibc-2.31-compatible.patch \
-"
+           file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch \
+           "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
 SRC_URI[tarball.md5sum] = "70913edaf2263a157393af07565c17f0"
-- 
2.7.4

