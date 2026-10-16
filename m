Return-Path: <benhur.tessele@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA8BCCA464
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 12:45:31 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20875.1792154727758351191
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 05:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=lF59zNLR;
 spf=pass (domain: est.tech, ip: 52.101.72.66, mailfrom: benhur.tessele@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGQJLCWVbRV9lRb4I6/3ylZjtkpxEuklgyOEHddCQh9EJsn92kJrh5XkVw8OH0N8CPJASfi5mYYiviiXgHCRBFnxu4ix/1cwLVW6iX35QGEdFG9iPjJix6kppwWW2A/Jc8uuKz7k/+pW4rJqLkCG/53t7JwAh00Hapx89AckYNv9oohwpvR3CEEZFsgJCJIxS0DtFj3htILoTsO5DCokyx6aaRPpSjo2q2W7OJwvtOgUt6CLApTQz26qqNtYWV0bK8dgwg8GFtZEWw8wpwivx5TMZ/mj7iE/mJNo33y8wDqVrO1C8BAerkuws8+urmtiwEFvcs48y5Q7unCQba52Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7n7FbKkwBiCm6T4KBUWh0G+goMsZKH6epcl2MfgJ2m0=;
 b=GHqFMIhxbOGlkfpvVhKGljl836ljBhF8cNslcHcS8TKJfea/vebVkPaERxBwCjH6kICHVDh0xitNpXmQRRbMIdv/8+Z4hzu46bAqqpkgQaBOgmZlkIZVs//vTnymaV+Ia1fWIJNyXGAIf7k26Aha97pfz0HlNvxwyQuyiB05tCCSgdPZYKBPl+Qx3ZIHfm4KR1T7uu4Rk52jGK7Z3Fy6rlhFb2enonbtLe6S2uoDNBY9FyKjMkc9TsOk9NHGPHAmXT7Zu75INLe75Mcxl589FXm01qUKJFPyZndJwRPCpXABptU7l+y9LETNjTuPWDbi0aEKCEAipFA6msa8wOo2Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7n7FbKkwBiCm6T4KBUWh0G+goMsZKH6epcl2MfgJ2m0=;
 b=lF59zNLRT/e4D8hQlNGGt2ggGk1RW5X20DNmLoPRM6Lmby3hfoHZXhFOhOWfg7GTlSnEXgGlCSogtOXw3QMe7694fDP++HaSIXqJElGZiijL3AJh+YVujwbnQ4bnugl+WxnX6hNZEXR8vhDMZNtKk1BA/gyWsLN0AwfI1MNDfRum5e1WnDY3OUbUgfQEiMNxyaAlRtHqKM64KDuPq5fyw1E75+xW+yHn44VxVtmxEihomXsHBOwVg5KOSKE62xtD59TWWY+cxfDKDefcuKkT1CzkzMf92fid/QDAmmXz6DYynwy3NKN9czLE0ni3kONJIf2aXqrrGGv/d2zXA25dNg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35a::16)
 by AM7PPFD652E8E05.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 12:45:22 +0000
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f]) by PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f%6]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 12:45:22 +0000
From: Benhur Tessele <benhur.tessele@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Benhur Tessele <benhur.tessele@est.tech>
Subject: [scarthgap][PATCH] go: fix CVE-2026-56862
Date: Fri, 16 Oct 2026 14:45:07 +0200
Message-ID: <20261016124507.350030-1-benhur.tessele@est.tech>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0003.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::8) To PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:35a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP189MB2572:EE_|AM7PPFD652E8E05:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d1e1a97-17d1-4b47-3dfb-08df2b8357f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|261009221727099003|261009223027099003|261009223327099003|261009221227099003|261009220027099003|260925022911599003|10067099003|18002099003|6133799003|13003099007|260925021911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: 
	X3P4w9UWj3xazpt4k6y8MHtpliP2X2J4KDwbvtjZajqy5bqMcMtasE6nJsPrxzjzN8goBveFZqRGOhf0jj2ChUtMfoFs1kRX3ltuooS8NwWWgXo/tz7WtPrPhY9ihkvkBdaCgWTFbVFtzioLcT6pwj9APxU9H5D/IEultjHk4PsrvIK1nU9ozbjHvIbTaUGXDrdAgo5Oul8NdEM6LQGv+CFE6mc9Dux5Nk5sOUaOJd7H0waJ2w6onfPryivAEesCYieti7duwuZQxPvc83DABCI/GgmoAirdhc8orc4OeKoY/sL8vcKsPZOl0qDDd0aSUwfkd605sdNznQR6vG2iZiQDVpHKkEpqJRg48DGU5CsPzNM5EabH6R9jFAennJaYfdQFZEF+6KGcn0fk0nggPDKyNzw4tI/ST4g+K8Ng8gD0uAVVO3AFgK00D41TSMRiao+mAsyTZcB5/v6is6Agvb8AAELZrC/mXJvA52YvOFYINhixIhZYxjCzpThNJcg187bQAXXrNDllD6IXLUiw55Rmh7I7hqSWg214rWoq/22qjXgjkvgs+H6mo0p0c8Xg4+C9SuHJ6g5r44OBSUy5SS+5xk/9K8QB+i+QdGZfk8K0EWJ6RJU8/RxbJ7KUKiZR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP189MB2572.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(261009221727099003)(261009223027099003)(261009223327099003)(261009221227099003)(261009220027099003)(260925022911599003)(10067099003)(18002099003)(6133799003)(13003099007)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tDnvSZulekgR1Am7sXft1jbo2BITLAk2k+y9Gk+YgNV/zYKPwoV6zF6fWHkd?=
 =?us-ascii?Q?lQbrbuzRDtI1jfs8PjhTunE5No3lVFmUisRC88NwtOorAGxoeXA95lyUzKqA?=
 =?us-ascii?Q?PUdbdDQHeknBGEtLg43ZfGyYTH9u0ciN13r++m1082cTQURO/p6fh2K9WoEB?=
 =?us-ascii?Q?OYhRIk+aRI6k5CGZ0Clidd1EvDgQ2X+fkMQx66gw8BIAHV+jqys6gdkyW6+h?=
 =?us-ascii?Q?xh+fYuhHt0VKdJKGwP+2cqKF+18oMlkYlUOtkzIIKtcFvXML48A63DL1O9QT?=
 =?us-ascii?Q?1Y699Z6S9CGDz648aCIjQuSMn1qVCpIwRGBXfAbO/ZMWt7/Z5IZDgRYCvCIg?=
 =?us-ascii?Q?48AAovJ/NNViTynWiYmx6K/F8HAhP60xwG1ch87Ci9voAubNbClrKRt0Ri07?=
 =?us-ascii?Q?eYildHTIYKAsLK9mBEXj1sJj+DFJ8nQxYfG55rIJtstO0ViPIubdu3arVPzN?=
 =?us-ascii?Q?M5foAaghVzkoAiWUa+sdNV8ZKMX4zeDCFV4dykF7Qy9DEPiuoaCCsGZQZWF1?=
 =?us-ascii?Q?0EL3/gJ8e1khONRFkqEwdowCrYFc3A8R2N1EwaFEm+WSS3fH91dwk/No9OZQ?=
 =?us-ascii?Q?RRFcA/aULwteN4fA7ct8yYhArvKqq4ktVkTK1Ey2NO+7AkhJeu2Ot1h6zykM?=
 =?us-ascii?Q?l2Vx0NwLEQJ3YHeG46nVrR2ZYuYn1cD0sQzoHhKOf8RjiPs2z6Wv5p6fzqoB?=
 =?us-ascii?Q?zf+vlitwTsbe9Jq/jRMloiEEL342Bz7ctrjod63T0kSWKUQ3ihx8udZ9Kw9f?=
 =?us-ascii?Q?xoMgx9Ng1YkQjgGWZUM2UmZFb5yCpcyMTDY2CkGgU64sAQiXC/F652Xv+SFc?=
 =?us-ascii?Q?dTFwsuX1a+J0+qXCm4w38wx0lFdwWfxb0Yjon0PYsLSnru6pWkvaos3NXXxW?=
 =?us-ascii?Q?8v5W7nPX1E0V4jZXFYPBX6gF0uzYyexZgjf0/ZT68up8oF7IHwcfP5m7O2v9?=
 =?us-ascii?Q?IhmOBBT8ssB9lVGxkKmCQIpOTiyZKaTeqZvXAqmkAtIODwtaoTYJtsQtljeY?=
 =?us-ascii?Q?yu05YiCICsAW8tGMsml0iMUMCkSDzAS/WWthRG8enWKwLtjB9MExP2qAOwKr?=
 =?us-ascii?Q?qGlm2XgPnMhQE4Hdpk6J7olSLcd0IljuBEpLU2X2X32kHzFcLL2oEzbtmbnJ?=
 =?us-ascii?Q?TWxwHR9VO7o90OwAgZhpCxF9t6p7y7xrgc2ddofhasVHLc/WEwz86JTqIFtl?=
 =?us-ascii?Q?j8eZflzSNX9kxKbPfx+nZT9qNe+MOt/m52T/g+qVRQfDcdLWByV0L9+1ek42?=
 =?us-ascii?Q?5szeVsaKd43Yjtfh1fA8/ETPdLt3crPcVlImLkMzkG6sXCiOOYCx5J1s5tgs?=
 =?us-ascii?Q?h7iDFo9rTz6YYT67nJU4Nqh/zmFe5LAx1034pDjiMEFtulws9vysh+AnpAct?=
 =?us-ascii?Q?Fja2SqX2Al7r49LWOPgJc4W8mJktv170StKO6moAicxt5srUADYqMCowZMgs?=
 =?us-ascii?Q?gMsE0GSd/qZbS3TLgq4Jy/gr8DDs3h4/9QAXjVYDhUKW6H8iAvmiLChuJbSP?=
 =?us-ascii?Q?IpPzt+ELGOUXVQx0ODoOYosk93xWwEl54vEjDXSRw7qaGVhNykUSEJbdG4xv?=
 =?us-ascii?Q?MFmzLs8Eb6c+KgFUUYZkeMBbh2jAZxBSzKHAU2I0QMQXiQYGwsS4C+6zjSes?=
 =?us-ascii?Q?Ulv5OXso4ne1Cnl725nh4ToXElw1x7hO8k2lRw3eCRm8D/oagWecu7lg+f5L?=
 =?us-ascii?Q?n0vMgGdMvOCnmB9tAWTavdCELvqpDtagUroS8t8GhIgvGqICX+r2Vdge+f8M?=
 =?us-ascii?Q?svpg+wVjWA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1e1a97-17d1-4b47-3dfb-08df2b8357f2
X-MS-Exchange-CrossTenant-AuthSource: PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 12:45:22.6947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +w8E8MYCTWO8S0HYADtPPRg4QEfgZIjfPgx0d0dv/SbdDBE40N+jqpORDbnDCEqVuR1/7weOiTg1uNfARB65ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFD652E8E05
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 12:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248017

A malicious TLS 1.3 peer could keep sending KeyUpdate messages after
the handshake completed, forcing the other side to perform key
derivation indefinitely, because handshake records were always treated
as state-advancing.

Backport the upstream fix [1]. The bogo_config.json hunk is dropped
since the BoGo test harness does not exist in Go 1.22, and the new test
is adapted to use testConfig.

[1] https://github.com/golang/go/commit/27420571845abc6a97e19e21542a3213a74=
f67f4

Signed-off-by: Benhur Tessele <benhur.tessele@est.tech>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-56862.patch                | 98 +++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-56862.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtool=
s/go/go-1.22.12.inc
index c8fb9ef450..cec3bbbb4e 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -63,6 +63,7 @@ SRC_URI +=3D "\
     file://CVE-2026-32288.patch \
     file://CVE-2026-27145.patch \
     file://CVE-2026-39823.patch \
+    file://CVE-2026-56862.patch \
 "
 SRC_URI[main.sha256sum] =3D "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9c=
f4d9ca02db986e17d71"
=20
diff --git a/meta/recipes-devtools/go/go/CVE-2026-56862.patch b/meta/recipe=
s-devtools/go/go/CVE-2026-56862.patch
new file mode 100644
index 0000000000..5fca5be4ce
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-56862.patch
@@ -0,0 +1,98 @@
+From 616c582eae27699513109445d5c177b42c3bb9fc Mon Sep 17 00:00:00 2001
+From: "Nicholas S. Husin" <nsh@golang.org>
+Date: Wed, 22 Jul 2026 12:27:12 -0400
+Subject: [PATCH] crypto/tls: do not count handshake messages as
+ state-advancing post-handshake
+
+Previously, we always counted handshake messages, such as KeyUpdate, as
+state-advancing, regardless of whether a handshake has been completed or
+not. As a result, a malicious client can keep sending KeyUpdate messages
+to force the server to keep performing key derivation operations
+indefinitely.
+
+Fix the issue by making it so that handshake messages are regarded
+as state-advancing only prior to handshake completion.
+
+Thank you to Qi Deng of Aurascape.ai for reporting this issue.
+
+Fixes #79866
+Fixes #80528
+Fixes CVE-2026-56862
+
+Change-Id: I37d27fd5f16227a9dde5f29bb5ae6c436a6a6964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/804261
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccoun=
t.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Neal Patel <neal@golang.org>
+
+CVE: CVE-2026-56862
+Upstream-Status: Backport [https://github.com/golang/go/commit/27420571845=
abc6a97e19e21542a3213a74f67f4]
+
+Backport notes for go1.22.12:
+- Dropped the src/crypto/tls/bogo_config.json hunk; the BoGo test
+  harness and its config do not exist in Go 1.22.
+- Test uses testConfig instead of testConfigClient/testConfigServer,
+  which were introduced after Go 1.22.
+
+Signed-off-by: Benhur Tessele <benhur.tessele@est.tech>
+---
+ src/crypto/tls/conn.go      |  2 +-
+ src/crypto/tls/conn_test.go | 34 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 35 insertions(+), 1 deletion(-)
+
+diff --git a/src/crypto/tls/conn.go b/src/crypto/tls/conn.go
+index 770d456f18..376b2dcd1e 100644
+--- a/src/crypto/tls/conn.go
++++ b/src/crypto/tls/conn.go
+@@ -699,7 +699,7 @@ func (c *Conn) readRecordOrCCS(expectChangeCipherSpec =
bool) error {
+ 		return c.in.setErrorLocked(c.sendAlert(alertUnexpectedMessage))
+ 	}
+=20
+-	if typ !=3D recordTypeAlert && typ !=3D recordTypeChangeCipherSpec && le=
n(data) > 0 {
++	if (typ =3D=3D recordTypeApplicationData || (typ =3D=3D recordTypeHandsh=
ake && !handshakeComplete)) && len(data) > 0 {
+ 		// This is a state-advancing message: reset the retry count.
+ 		c.retryCount =3D 0
+ 	}
+diff --git a/src/crypto/tls/conn_test.go b/src/crypto/tls/conn_test.go
+index 5e090a017d..303012ccc5 100644
+--- a/src/crypto/tls/conn_test.go
++++ b/src/crypto/tls/conn_test.go
+@@ -317,3 +317,37 @@ func TestRecordBadVersionTLS13(t *testing.T) {
+ 		t.Fatalf("unexpected error: got %q, want %q", err, expectedErr)
+ 	}
+ }
++
++// TestKeyUpdateSpamPostHandshakeTLS13 tests that TLS 1.3 KeyUpdate messa=
ges do
++// not count as a state-advancing message after a handshake has been comp=
leted.
++func TestKeyUpdateSpamPostHandshakeTLS13(t *testing.T) {
++	client, server :=3D localPipe(t)
++	defer server.Close()
++	defer client.Close()
++
++	go func() {
++		c :=3D Client(client, testConfig.Clone())
++		if err :=3D c.Handshake(); err !=3D nil {
++			t.Error(err)
++			return
++		}
++		ku, err :=3D (&keyUpdateMsg{}).marshal()
++		if err !=3D nil {
++			t.Error(err)
++			return
++		}
++		cs :=3D cipherSuiteTLS13ByID(c.cipherSuite)
++		for i :=3D 0; i <=3D maxUselessRecords; i++ {
++			c.writeRecordLocked(recordTypeHandshake, ku)
++			c.setWriteTrafficSecret(cs, QUICEncryptionLevelInitial, cs.nextTraffic=
Secret(c.out.trafficSecret))
++		}
++	}()
++	s :=3D Server(server, testConfig.Clone())
++	if err :=3D s.Handshake(); err !=3D nil {
++		t.Fatal(err)
++	}
++	expectedErr :=3D "tls: too many non-advancing records"
++	if _, err :=3D s.Read(make([]byte, 1)); err =3D=3D nil || err.Error() !=
=3D expectedErr {
++		t.Fatalf("unexpected error: got %v, want %q", err, expectedErr)
++	}
++}

