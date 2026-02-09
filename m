Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B2AE81BCE
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 14:25:19 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48335.1770647117442862364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 06:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=N6uJCEO8;
 spf=pass (domain: est.tech, ip: 40.107.130.65, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHaw9ViZ3DjVK0IifUNIR7jWbSeqr+cdSqSBbg8SFr9bkO/b5A1jALOdLIrsIZteYMMSIJMyqPsZxZuZV5ls247843njP/JYKt2Naah3J/qbQK+OjYd7fk89HbVTdpm5Qq06lj8lH41MFgfvihqsa76680+i2xRYLQlmUNdZV+N5dNx6ML3Vf+58wnNC3qJpULENw/Wajjppa3EMr/ILMWgKQhmjrPstnWShbY68XoA5qLxxivW3pucTzC69vJxNhs0Rq0aYSlh5p2zk6tMJrcoJZc2qqW5wYcQKa6lsDs39v/szLA/LW/sc3seXL5qYHvj8usRp+t5kJmKU2bjROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxI9mcen1iPr8yo5ou9SaE76khnUt9QaqryBjlgR9lA=;
 b=ZKHpfYTXMp/pN+nQcA3wHMoRnqrLArnKMVWN50qYDI25QE7NyLelAImfZNV2LQua2DNDkZFDvRG48BNugZs4O6CIhwEdhVr+jEC746LBp3NHq252hV3uh6Ejtevfuk0Olrcn3art52WRJq2oVaCcso6hwnu6rF1dUt7smHMMr2FneLMPkzvEsDzbn2TOjMMpQEahCS0hp0QETqMcj0+TmdGs8Y5gOLwArLM865MNsdeY+F8rck1JnGZ90ABsBdHYSjOy6xkmOkcQSc/EsLpDjgObWl9oagcHda8xLfHwZmKZpr5RYV3VVOWWgn/ADav55clsuf5JMGFKYh8GSlTAHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxI9mcen1iPr8yo5ou9SaE76khnUt9QaqryBjlgR9lA=;
 b=N6uJCEO80a3/1I40SOvMHpCgI7fD7E+FgQLL3m7HCDGeLirAFeUijP8evAA2rynhZXKL3UyefBYykRR9d8J6l3VAG9kC5yFFJzDZ68M3vU+g2QMkLRh34lrkqhbY1hpdRxWr2STFIjC6zRbITfAfRhkRjsvZ8xH+TROzMW7J5wxa9Vbx5XFZxxb2I9U9cM/7St8yCmOoOxnvVP/oYb3y5jgciBZEzFn2GzR5l7wvSh7Kh0uAqIbe/LmEoz3TnBEIk5sOLueNGvxIk2pWInt8fdQ8hjGwNebj2MPvpw08MPPYEZhLeSvXmsHqm2A0v6vzGnPFekSN56BL3tDUsT7CjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by DU4P189MB2684.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:55d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 14:25:13 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%3]) with mapi id 15.20.9587.013; Mon, 9 Feb 2026
 14:25:13 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [whinlatter] [PATCH 1/2] avahi: patch CVE-2025-68468
Date: Mon,  9 Feb 2026 15:24:38 +0100
Message-ID: <20260209142506.55783-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0048.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::8) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|DU4P189MB2684:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b58a618-ac5a-48e3-bfa6-08de67e70a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M9xC82SlMc4MMZ1ZF7rDjt+Yrz+ZrY017wwUrFZ4YEjP9hlPAJygWocvYrve?=
 =?us-ascii?Q?uINIWAmLpe5FnZyYg78/21poz9sQprV/rzMoq9XEpy/vd0Hxeipet+BfPY7Y?=
 =?us-ascii?Q?5/4cKlwNMxFNeEl72Jkg9udC85+/K2A8HMgiH+6TfjbnKgbagKEiYf8+YNwf?=
 =?us-ascii?Q?m3SMxO/4jSqO5oURnj+lEXDZEXB7UCEwwp3MGAYQ6dnYpiVU+GkT5suwevZa?=
 =?us-ascii?Q?XTxBf4uMDHRAXuw+n27DR1JLRrwHKPaxp6hUpevS62bzEpJEymG3G+3gH2KD?=
 =?us-ascii?Q?/7vNLX29HlFIF1lKzkzlPwCVysMPETeZ+W63EJc0/Jj1FHAOLrcAggSZ4d+d?=
 =?us-ascii?Q?OM/jXNZ3JNjW+TGDH83o6zFSpz9GlngtDJhEbSHNJi18IXbQspVyGxOVkKSE?=
 =?us-ascii?Q?GUnlsdf6a1TeYnwuGpvfmB5bqWTmO3sho875G+IjZlJFXGjypUDJOEJNn2r3?=
 =?us-ascii?Q?TQ208cs9Ct5wEB34XrSONPpDJAFV+Ho4lptmKd4KKumPttAEf0DYiCDkHL8L?=
 =?us-ascii?Q?F9vGBAf1HFsiXFlNUeXfjotONPtmQ/nSxBGBtsOm4G4MHINL15kaWNXnuuDm?=
 =?us-ascii?Q?1+03Lg9aGNvaN98R1EyPFgNaLLYYxrELp6jCRRdFdD8GVb9tJjSFzE3nTmIF?=
 =?us-ascii?Q?0nsM1ma+3a+uYuR4Ph50aayLMtSvHuWWx+vwz+Jim2JuVkzB/6wDJwWWvjjf?=
 =?us-ascii?Q?K5U3UboIyYbyQQd/s5MoVl5qcxbXESF1K/kTZNnoOE6nvIUEuJHUHmHK1QIK?=
 =?us-ascii?Q?+DTQT4xU0btx5R0s/OSeMxb8zBH5HgviXdXnAylR3A+vxYIIRoKFMcJET2Hn?=
 =?us-ascii?Q?CxI0T/1bSkjalCQWsU501DgtWPCeTZXzCPj5A5dWoYGiXwIPr3WqZ2Dw570m?=
 =?us-ascii?Q?/d49F7REQph6M4C7w2HhW/1INdq/xypKfyr5UM+OL3WwI1BR1qIC+PNuBcIy?=
 =?us-ascii?Q?tpz1YifDjM0n+T8v6YEWPWqdtB84WtggE+HKVgZztUGZkQvuZ+TGXWrQ5AUY?=
 =?us-ascii?Q?p1WxjDkLLDOjqRoyTHuyAUQStr3tywbCsJm9fGOsOB1yakuEsdKd+JwMJg13?=
 =?us-ascii?Q?nd4vSncXjq75mnH+skTgR/Xxdzd7ioB0jQyP4mCW6Nm8I/ZeW1WXcwcKynxE?=
 =?us-ascii?Q?tgFcWY4/jnbuRmD+CcNlNhbgCcy19chabLCZkNVm1qohjFdVthnv/3IvLAic?=
 =?us-ascii?Q?+ImaJ60goeTGNxK+tpbKZXQeltpQdLSkjNz8jvCWst+pzkGNsbX1HtcPgsSZ?=
 =?us-ascii?Q?p2XYpBgNmZD9fEVf/tnqyyl4UoA+rQmaacHP1z5gd7pQnNvdTNC5JvD6l+CA?=
 =?us-ascii?Q?3yfZGyfQHfVR8U24BR26CLt6jPauJDSSUSaemaW0pHaCCkqaLtGBhSGR7Y3b?=
 =?us-ascii?Q?fOwxxjOb3jOe4S84ySDlKUfBh4KhSMIVimE2+ApcHZWn9+nZZ3Lfw1qiKQA0?=
 =?us-ascii?Q?WtBsFwYcwlUkyQyvgYXmp8qBLua3xCDv6IEwFlq//m87j8AwsJa25QvZRGV2?=
 =?us-ascii?Q?F2q4zt1p429hki7kL39zgsmZF7eS/4hrh0J8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/1BgGCP5Ps2I2Op6GoJg2Gds/9kWxfGp+Rccodk+ua6QbECb61CH1ghCMXWI?=
 =?us-ascii?Q?B9igIWfLCELNGbZj2khiECgZXuguKgwN+NlUtw9lJAUhb1Kzio/9OTGpqQ86?=
 =?us-ascii?Q?Ge9eDx0SxuQeNv+TY3rwwyeOXn/DGaag0jjf9Mft6YAFjp2Ok9xxZgm9vKbK?=
 =?us-ascii?Q?s8QcWsZKhpN12oXFgR3C5IyhFj7P2d+rNz3usvsxzv9n2NfpOaRAt26pq4Wu?=
 =?us-ascii?Q?L3FDXe0FSt2a1xFEKe6Onsi1PTyXk+ke0GbDeYxxIvh8hihx758ldN0afHoK?=
 =?us-ascii?Q?QJJONBSf3/B093N+bfdK3k0mAoO+A4P1cl5oWy/MQqH1Djn1vbpCHOVFT3bq?=
 =?us-ascii?Q?ZGG2+J02VhZfUqsuOQe83jI1jk0EMWDpD/PdK31zMBiwKR9UezB113IkM++0?=
 =?us-ascii?Q?Ac3N+yhvwB1oq3LJQtD7CCHlC6qex/uAwIcU2qVFCTwjTXLnvN+isUL/ZMya?=
 =?us-ascii?Q?hmkNkAh+ksyOtzo3USqWurgVPok6TiOT2tFyiiVi9QyMn18yd4uiKPqwVKKE?=
 =?us-ascii?Q?xA5dcliFPKKXAGLm09Ih2lKspFKqILun8gUVvxRuK6AELIXgEvvjJ664Ka9K?=
 =?us-ascii?Q?0IZS33OCFxM0OMn61W+kCpX82QZ2jamw8ge61DAv9t2RE+fF+5LanFC/QMHq?=
 =?us-ascii?Q?WXVC0GOZv14ayBAN5hOs2jqKz9nhBSC9cwam9lwxqQXFGeR61P30BTCOaDUo?=
 =?us-ascii?Q?w28czS1eTEl3CDoYChHRniz0UoUFM0fMbr9e+oHPE4koIC9kaJ+wZle3Zx2R?=
 =?us-ascii?Q?PY/ytrGYH+72RVGNmfuU9oyK7I+jK6vx09lgtacb5S9HR8K7ByxHRJJqggRB?=
 =?us-ascii?Q?RPhs3qlZv6JfYsEq6PbUrPG0NuibJ+8u50JfDc/dZPnPoJDlwIzvtYmbcXNo?=
 =?us-ascii?Q?xAHgmNXxnj5BNeOoYa8gqw8/U1FMV5mxW5Nm5UZDCaiC27cWatYTlhjuG5dJ?=
 =?us-ascii?Q?I5OotBxejlOwuJW6BiVuJF4u6nN3Wbxxvufl/BAo0BVpdwpfxtHPm3FUIg6j?=
 =?us-ascii?Q?9CpNfikk2NsLbVfbutFqVxt1P0T44W98GfwbyqT0QAiUL1Kz6t2X3oACe3TN?=
 =?us-ascii?Q?OgeIrnma0UV5+dPbP79Dh1kxNuiXBeoGplnOWoOrLYRUqmiCMglkChTgutNS?=
 =?us-ascii?Q?vlGwsUzpmPZZFz/30mPZ7X36bRRrxh0OJxbdftgR/4Hn46sEi9lUz4PYd281?=
 =?us-ascii?Q?10GdlUmU8wNasWAXyGJ/MRhFQeQUPGNtKyJ6WokCDYP1rRU5VjnKnFObuzUa?=
 =?us-ascii?Q?Llw1ZG1X++/z1Tc4fHpSD5st/v7GanVedogz4b9Nm6s8sAxSaLtcoBF4dJF9?=
 =?us-ascii?Q?vRjapRX2Txa66DqH2l9UauLkx8+cNX3YRbG7qj6HwT+iELzuGTbr95ZKUn01?=
 =?us-ascii?Q?QRvAw2wdO6BaKnmB76d5p7yb/uYPmnOIJmCqONy4nnxIepnHfuTLqEoM7skE?=
 =?us-ascii?Q?/YPYnUML3YAKYV3OfKe6bS7+ijvPZ3tEicq7A5TYgnq8ys2nYVnKJcYNXv+3?=
 =?us-ascii?Q?xOA4mTbfoSh2xFWHsbuaCUfbVk6yFgLXkX0UbQWcTtV2hmMk54baiF1STy3L?=
 =?us-ascii?Q?ZQ1KDN8Q69ySuiGxodJa98SWC0aDs6tNprlqpR18NIQTQHY4tvettRStjQK9?=
 =?us-ascii?Q?poDxiOxocoa5EcswfIYlsVh+GDdHfpzSZQfumse9xeL6oT1VTAi7pCzvy83W?=
 =?us-ascii?Q?L7R31NAjBEBT4SzN6fgFAw+3TK4+RifyOmWEg0mOBlh9+K6B2DGvtdNOkRvH?=
 =?us-ascii?Q?LjE0iUZ7/g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b58a618-ac5a-48e3-bfa6-08de67e70a21
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:25:13.8733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pftCFc5jaBImvNIgXUV3Ko2O4aJ/EepjJmnJ1xS6EX3QVvzHcKk4MevN967Rs1Crxj4D1ydxezbo29lpu1bnkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB2684
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 14:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230803

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68468.patch          | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.pa=
tch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.8.bb
index bd61c39dbf..4efb29a7d3 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -38,6 +38,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-${P=
V}.tar.gz \
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
            file://CVE-2025-68276.patch \
+           file://CVE-2025-68468.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
new file mode 100644
index 0000000000..3635cc8d53
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
@@ -0,0 +1,32 @@
+From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix DoS bug by removing incorrect assertion
+
+Closes https://github.com/avahi/avahi/issues/683
+
+CVE: CVE-2025-68468
+
+Upstream-Status: Backport
+[https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b67240179=
d309a]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ avahi-core/browse.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 86e4432..79595fe 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -295,7 +295,6 @@ static void lookup_multicast_callback(
+                 lookup_drop_cname(l, interface, protocol, 0, r);
+             else {
+                 /* It's a normal record, so let's call the user callback =
*/
+-                assert(avahi_key_equal(b->key, l->key));
+=20
+                 b->callback(b, interface, protocol, event, r, flags, b->u=
serdata);
+             }
+--=20
+2.43.0
+
--=20
2.52.0


