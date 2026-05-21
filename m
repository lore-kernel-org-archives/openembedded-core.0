Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840EECD4F5E
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:10:38 +0000 (UTC)
Received: from mx-relay151-hz1-if1.hornetsecurity.com (mx-relay151-hz1-if1.hornetsecurity.com [94.100.128.161])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33073.1779358236241546678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=dr5E02kn;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.161, mailfrom: tgaige@witekio.com)
Received: from mail-swedencentralazon11023073.outbound.protection.outlook.com ([52.101.83.73]) by mx-gate151-hz1;
 Thu, 21 May 2026 12:10:33 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0YYpP5TqHsUsZj4oUa9hPF9EmSoIhYBa8DH0uz2wIFzrEBniJ4ba0VcAlw1C5IeG36NVgPeWW0e6H3fAE+nWWUSS1nZekuvorHJstrxc75NYZVO2wy2eQAcL7a1TtJj/yRAxZP18GoibxaWdS+W/19C3dpREVKzo3Kz4rbsr3BvLoQiEqRGaIcxoa1IxFyVXbp5EkL6ro3fxS4XTq9LPd4dL0UhA562+VCKgjzca1i5UZxLTl2Q+Fw4RY5xYRFDy6gFJ0VScvZVRRCXxoh1lWmEhp0rMOzfxlMMoxSuDzUCo9WaPBKlGrF9J6NAiv+Mkt5W7agXcS54IRNT2Rf+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLRI2ZKSof5GMCPtgt361xmCiD25ffud00faAOkrxY0=;
 b=YCjFvebEiix/DlPW2udqfb9YRxADuihWv4aIJk5PPxnT35mxfCePa5joocbEcig6VN+0CvhyVAtCK9M2wAfpjXGlon1mVdKF2K2fvgG6hBYUfYZC8pCELqNLkA1MySd+2mD5vgm+vjpt4V/VzBufVUowmJxBvjlTZdNETMOEJnGyjmS6ZjCpNsK/aL3QqBPEmp6/NKLSWyjWFnyZRZnFK2nFcJ4wiNWHXBPGVrsgFFn6TexY0ebBSoBn9PIxFHddg3FgF7nkjeUdLcK/a1bxfGbAPMg3YCLP1fNOVWTSnxXr6OkqzhvJVKjhtelnj31xBYkndcrXHhfsJUDbonrJqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLRI2ZKSof5GMCPtgt361xmCiD25ffud00faAOkrxY0=;
 b=dr5E02knhEWQr4Fg5sykPbSb1ZHYdvwYev6QYCIz/pl8xiLQsAp2ksreFX0M/qvTAQHt7TWP8apTPPOBx1CDmHCRbwPsTEtiPxjhYh3USXH0y6bTycrBJZOkqG8PYPS83dwyNwfH/gFCGY8Tp6TsjE+x/9nCsdz+eWvoPVyEJk5816mMwgaoGAbQQOPbgL+T41KSlcojhlhKmO6vUqbOnRroSbBjJI3ocFlYuKjAdrj+YD9TpZ9Jh+e2ivxiWj/HdOAGLUvCP1FylLlnmBTnYGS/n4QEBgF3dn1i/2A5uzqz+/EKCle5DuAWo7jC8nDHd1BXhkd89cW7Xmz38XArAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AS4P192MB1672.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:507::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 10:10:12 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Thu, 21 May 2026
 10:10:12 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 11/14] go: patch CVE-2026-42499
Date: Thu, 21 May 2026 12:09:44 +0200
Message-ID: <20260521100949.1299757-11-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521100949.1299757-1-tgaige.opensource@witekio.com>
References: <20260521100949.1299757-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0104.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::19) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|AS4P192MB1672:EE_
X-MS-Office365-Filtering-Correlation-Id: fd538601-27d7-43b0-9b43-08deb7212597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|22082099003|18002099003|56012099003|38350700014|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: 
	K+MYFJK6DZRYaMmMKkqTjAfwl3vXLil5ivkj0qLxjP/HG/ox+vpYUnhLihfmj4Ee9QWmIHsOK8ArIfpaDPgPPsRD2r+bzr8ZH5vhfh7bT4tmQYQitmaKeaVedZSMvIMUtWAW2s9fPK8fK8R++JXCfXIIEDN/PmCAut/lNOR6AVkEhyjtk+EGgjdluwgf05KfqTk8P60EnqH60DpW0LSxwaQxT0qxI9XT+y9Z/r+Lu6HqgnOm6ZD0i2PaqJOezOdt5obgYoOgm5KsCYHUHg+I39x9T27yU4wRdPMGHAs7GWF54SA5fiv4QfYhOaCucLsuEMvXBZhxDKAPDDiVHdj6sUezLw5n3MsWY1glxzgPuQg3MseR69VgezkiQCtRCE0dTtv1EXfP1V//Ibrgw0aIEUFHNnzlqYHdFFlKjvJCJCgXuD6jj/lgoIGaPhGQ0Jx+PgAhLDU4JtLS/dDjrn1vwcQ5ON56yra9qWgl+9P9gG4ypABvPJLOttT3+y3I3seNaoqf9bVGbj1n8r5Y7almb/kasCl7HhLMVbV0ubEJZHYspYloZ6yvnQZmze7ZVOOOtR+xl2t95A8x/T61PZv5+lTR7ZuzJPZZhHwBaTd3xLUowpQcuzizD0xB9ElHV8G2WCP69nSyE0FIwq22cBm5DwNTvVnGI0FCqDXjH8eJlb4SNsxTxA8SwJXIQFsqOgJywBZFmDtlNRw/LonEBOcCsQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dkSM0suhGfmeN7H7YzriEv8dNjGsAdUTHs82Zyi+03FBc45wpj//Qiz1U6X7?=
 =?us-ascii?Q?w4KzhiMyJXt6Zdp+t0nHJagLR+zJ+xwJSy178elu+Utlckk2qgLc1PmAeZv0?=
 =?us-ascii?Q?zCbtb4OYQ/ohfXJ7wEp9YY9YD8pLyszCdw9cjJjBtB+tyXk5qlwPEaxxrU44?=
 =?us-ascii?Q?b0KzNNkiiEFPc9PXUWb+72onX6eICWDUoVEtAvo5b6Ocn5qcVeGNTCs0pYPf?=
 =?us-ascii?Q?qH9SRXPDNBmil2EbsUIetK6jRGw9wDERDfx3MtJpizwyIFubJnKC1vxF6wHK?=
 =?us-ascii?Q?RZ9hR4sAZd0pdqRHJYKSyBiw97vB0goTBLpc1z5JB5JmC/JzPJo/mtLqUVRX?=
 =?us-ascii?Q?F3rI0Xzv3DJvNs4ZqoUcVpbVYQpYOYPidynX5p9AFtdo3qFsHe/JcyKRuFhN?=
 =?us-ascii?Q?LT2rTvQPI1/tDp4HOjCuVDfdf55UmRuG5MgYbSkRvwhZH1nSekTES5+zL71B?=
 =?us-ascii?Q?z4sPj1oBwz7/qIU8zUuXuU+ZGBQXJSL8VKH9ftheuy2Pv5QVz4534eFpK8T/?=
 =?us-ascii?Q?iBwfOaCKgw34FwzdqyWJUvDtCXhYiq3MRcW9Hd8gGNCScA8k9IVQA/pyBVq0?=
 =?us-ascii?Q?pcGtMvHvR9eTg1kyGgAVJxPVLy8Lj2Fr7vGENuCiUGT/gt+255fZc9j/bQTM?=
 =?us-ascii?Q?bBuzBBFAqrQMAnVmx1Y8KwGx3lUCs22WJpBxBQnpupDHtUOR7Pq83JuS3SMg?=
 =?us-ascii?Q?cSbu3R4+LSq3NqWyJPfXsWqTkGtLjrn5BtwLefQ+XW4t/PTyRH3D/TiexgN0?=
 =?us-ascii?Q?QAfxXmWuPVqrbiFrIVsTunlBk97ieltsP97GTeZ5zaLNLpZpkJ6xmk/yf/+V?=
 =?us-ascii?Q?037i6h52LotXjmaj68f35gz8XztuV8Ghbx4rGr2FjyC1sBnrJoUVUk52q6QU?=
 =?us-ascii?Q?vmkfLGPNiExAH4I7pnjg1zVdnrA50HJ/4br7g8ejjJe/FKutKxxWMusuxPuR?=
 =?us-ascii?Q?M5FAYt6JgZ5d2o+HZGyE05H8L/f5GvShkkl8j2YsX1HVW0R3wasy1RJWAXwk?=
 =?us-ascii?Q?FdLDixe/gANjCouzPkaPs/r5LmSoFcMfNigEQJRK52ZrUA99qku3PhtfwCO1?=
 =?us-ascii?Q?Y9iZmXbgIjtGCgMZnpyIWWX4A3oo3BFJc+1BkBOgr89uZ1+jdGhw7OdFdME0?=
 =?us-ascii?Q?nB12M+TrZMERxQADZCTwJdbzeua1mm7xkKOinVRfL0JS894cT7CRAJi/P5Tp?=
 =?us-ascii?Q?FrjOj+v6fFN/UtTEqJAq+62PpQTRtwHqoL9ub3uBwtkfq/zp984w8V10wD+B?=
 =?us-ascii?Q?9gJg3bTK4QJvCYutSZdkGCWsmI7BdsW++EYVxfe01Ag/+KY4pRaQMDtizWxi?=
 =?us-ascii?Q?uzmMYEJtMxHaz3m6VxcsZVwKN9fM4MtllDgmzLUPk97olfWVqdzdO52+bAr+?=
 =?us-ascii?Q?1r26Vc9p25D5hmvRwu7hothCqJ9wyz5xA0PFrqt3T3hJOb5NPTRe7UbQ9LOQ?=
 =?us-ascii?Q?Y3tizUCss9CETi1/wZ3bdvk19AGbmNWZ/MRYjSfDJoXat8I3b22iSI7fYCkf?=
 =?us-ascii?Q?tEB1Kgl88au0yB6E9Jr7rAVLwUv+eOCgsy+r6Q/vEJqs/5cCQFfDNXQdxHaj?=
 =?us-ascii?Q?htVaIz4mznHovNbtxgmtxdbxdBCTIfsPcZKUlf3/8/Vu6DJLsqNc4IwTPtEO?=
 =?us-ascii?Q?/3b/ldLvtMxrG2SGoXQWUnGM48laK1rJcx0m1WxbYU5sCt17CKphrwyc8QMW?=
 =?us-ascii?Q?Pk8GBmpsZLyFJz8EWxgZ6hbXJxrmJtwWE/V5eFtTzbU6qoO9tn09Ntg88sIE?=
 =?us-ascii?Q?TibW0A7yHA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	FG/6er6qO1YEGQWiursZ7aZe8HtIJXDoPxqzv4JHAtb3Yu/Hl8W2JlcEjoj11LIFfuFTNXaptBq+MtD16I+ArESBWSOBO+OLWjTjJvp8+JhtbrK2WpRei45mP/JZYVvkh8xX7A4U+4Fez5PM+5V+a3tAGG1hhS1gE+OIWjdKxmAk2Pw8nV18n5SC6hz795uALqFwPi5Q8FUQl4LQ+h5x63TJSSAFxZRqxcjuUfEt/umIJV4KBgDew/PMrGAhBAihdy0U5exT8aqR96QKlNt7wBACBNs1sKWGvctda+eUBUpoexAEhtvstwKGVPuiwGhG8rJeiolCDbnqaY+QEv/43A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Tx/zb9/tVPEK7LYOK3gpXa8uRqoLuJNSjdlWKUuw90zma1slxaHvqPDGjHv2nnTM/DuEu5/2ZgzqjaFJbWsvUqs1/riY8tTmCA9hdOy5XdJP0sMhhEA7rJH5XMNxUn2Qk4iB/EeVzwDaUD/kme+vmM4WNOB2jckqnohsmf98ncT2tjxcmOhqxsM4EFRbspcj0g6a1b2QmrMO0RA72mw4ARJcZU4HZTMN76LfYuAb6YyOE1ywC1YzDQvTwhFwqF0Dx2Sq0NcnNkLSWNq0cb+eInpOfZspqgiGdccqN+VnCRhFycPAqqUBwg7y3F8tGkzwLqLI3LXpAYiJgkcT5GEiCuebLIUWf7IeuOockcKWQKu7tSFubUD9YdPjRctWlVQT0Yfa5wzo+Z5oSkX+SmYbDX6cvPhnKHFkYb+fJXf220hWJiyWgzYPYinHI3v7e47CFSK4IOcmXY2JqxOFDbUpwjmtffQ21xcvqW6iEMnOi8MmOjjgea95/uANiWkDnsDgDPolj+mzBbXuK6mCuvxm+GJL2Ul9zyqMHYT5E5R+sfPXXTmitY02g+NFaKn9j5JGmZ2KTh4dIFAIP4zHKp/Lh/znqr7XFeaDlq31B4CoLfVanSzzF8SQXZ5ItnQaWEl6
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd538601-27d7-43b0-9b43-08deb7212597
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:10:12.7225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1pSXsh8fOKiyfWeLLn2IVQghWyrVa9IAWZXrc4hAEBjDTUjBLR9N6XKW2MAbisucDGs6HrPGkWqstHxJf23rYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1672
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate151-hz1 with 4gLkgN4H8Gz1g0CW
X-cloud-security-connect: mail-swedencentralazon11023073.outbound.protection.outlook.com[52.101.83.73], TLS=1, IP=52.101.83.73
X-cloud-security-Digest: e549d7882c8f8fc911d512b448fd38e2
X-cloud-security: scantime:2.204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237495

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/771520

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-42499.patch                | 91 +++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42499.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 77e6bcd59d..85f75f0d89 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -51,6 +51,7 @@ SRC_URI += "\
     file://CVE-2026-39820.patch \
     file://CVE-2026-39825.patch \
     file://CVE-2026-39826.patch \
+    file://CVE-2026-42499.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-42499.patch b/meta/recipes-devtools/go/go/CVE-2026-42499.patch
new file mode 100644
index 0000000000..d4ac9b3823
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-42499.patch
@@ -0,0 +1,91 @@
+From dd339e72189d59f249786afd4021b9fb391f3562 Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Tue, 28 Apr 2026 12:10:24 -0400
+Subject: [PATCH] net/mail: fix quadratic consumePhrase behavior
+
+Updates #78987
+Fixes CVE-2026-42499
+
+Change-Id: I8438e5dee7e6433573d4161baf8fb2151e7fbc2f
+Reviewed-on: https://go-review.googlesource.com/c/go/+/771520
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+
+CVE: CVE-2026-42499
+Upstream-Status: Backport [https://github.com/golang/go/commit/2c59389fcc5194aeae742fb413e55b656c22343f]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/net/mail/message.go      | 23 +++++++++++++++++------
+ src/net/mail/message_test.go | 11 +++++++++++
+ 2 files changed, 28 insertions(+), 6 deletions(-)
+
+diff --git a/src/net/mail/message.go b/src/net/mail/message.go
+index 37d7ff5df1..f57742068e 100644
+--- a/src/net/mail/message.go
++++ b/src/net/mail/message.go
+@@ -567,8 +567,10 @@ func (p *addrParser) consumeAddrSpec() (spec string, err error) {
+ func (p *addrParser) consumePhrase() (phrase string, err error) {
+ 	debug.Printf("consumePhrase: [%s]", p.s)
+ 	// phrase = 1*word
+-	var words []string
+-	var isPrevEncoded bool
++	var (
++		words []string
++		sb    strings.Builder
++	)
+ 	for {
+ 		// obs-phrase allows CFWS after one word
+ 		if len(words) > 0 {
+@@ -600,13 +602,22 @@ func (p *addrParser) consumePhrase() (phrase string, err error) {
+ 			break
+ 		}
+ 		debug.Printf("consumePhrase: consumed %q", word)
+-		if isPrevEncoded && isEncoded {
+-			words[len(words)-1] += word
+-		} else {
++		switch {
++		case isEncoded:
++			sb.WriteString(word)
++		case !isEncoded && sb.Len() > 0:
++			words = append(words, sb.String())
++			sb.Reset()
++			words = append(words, word)
++		default:
+ 			words = append(words, word)
+ 		}
+-		isPrevEncoded = isEncoded
+ 	}
++
++	if sb.Len() > 0 {
++		words = append(words, sb.String())
++	}
++
+ 	// Ignore any error if we got at least one word.
+ 	if err != nil && len(words) == 0 {
+ 		debug.Printf("consumePhrase: hit err: %v", err)
+diff --git a/src/net/mail/message_test.go b/src/net/mail/message_test.go
+index 1b165317f9..27837a9cbd 100644
+--- a/src/net/mail/message_test.go
++++ b/src/net/mail/message_test.go
+@@ -1219,6 +1219,17 @@ func TestEmptyAddress(t *testing.T) {
+ 	}
+ }
+ 
++func BenchmarkConsumePhrase(b *testing.B) {
++	for _, n := range []int{10, 100, 1000, 10000} {
++		b.Run(fmt.Sprintf("words-%d", n), func(b *testing.B) {
++			input := strings.Repeat("=?utf-8?q?hello?= ", n) + "<user@example.com>"
++			for b.Loop() {
++				(&addrParser{s: input}).consumePhrase()
++			}
++		})
++	}
++}
++
+ func BenchmarkConsumeComment(b *testing.B) {
+ 	for _, n := range []int{10, 100, 1000, 10000} {
+ 		b.Run(fmt.Sprintf("depth-%d", n), func(b *testing.B) {
+-- 
+2.43.0
+
-- 
2.43.0


