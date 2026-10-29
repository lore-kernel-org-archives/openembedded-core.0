Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7321.1793264049995771629
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 01:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=h3Rg6VdM;
 spf=pass (domain: est.tech, ip: 52.101.83.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9cLDaemP2qt+9sgfs0Tde8iM5QVeLFhGcd+LfbehxA6npa51PblCuC2SXut/UEvsrC77I73hVSaKi+SvJXJACyfZO5yRIMWZQ33Y0pPL3W5YINSFHR3Ym7R3UnLE/ThEuywVRCZiX2N3IWnZPGE6J00nwVjb4GMtmyJqKigi8/0udHkrDnphvKEVH/AQgvvYWdiTC1ujntbS1x7EDATmISJIBGafPucH7IsyP1cdkY845CHOlI9azTBSXK/2oCRU1nkugevP/+vvGDVNB+p3xykt3pQp5s956kLbjqyWv235/CkZmU4+ea4sn2zfsnRK6g1OA6wpRB6sgufRuIA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbcgKqUilV5FUYtQGmfd2HB69Fha5kFBMrmkAp0To/8=;
 b=iInLUSVJbpTYqlBZnsPk+Ak44TjNq3MpAWxADWj6c9MpCto3KfVE73lkfjlgXKaP7F2E9O07x3oweFdhNSK3yrotAcrGJalTsZ4uBgvQqFdk8HDtbI79MZqDuKOZzwV6AucdGxewb/VEv4XE+qdYTOcLVI4nDvPbYHvM2lJEi2lierp1NjWC+1HUUpPJKKsAiqOTqLj17C8tcEmcpLjfvEKeSzRYa7rMUuXan56w6JIlXZqIbDWDaBBeWWa+bbB0iJiShzFT+0lZ+ktjSElaPIAw6hvMhAbezw+1+Bq3cDoChvh3D/khYy31nj32jineuQy7qgfndmg4TGdCMj2d5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbcgKqUilV5FUYtQGmfd2HB69Fha5kFBMrmkAp0To/8=;
 b=h3Rg6VdMtQAnPuRjzsZCrHFCbgf9bDN5Lu3m/0Szp0XqOmQy7Of7qXuFZdSZBBF0DGFhWVEwSRNiouZOggpMdOXTmLwNMcsYOUBfowHNxJAUVSFmhgCiOZeQyCyf4jY+2Q7zquittqjgc/aHlqlfydi2XptlE6f1dLC62GUMjI7fFXdWTbMfSauMTCkIhrsNWa/+LYv2Q+vDMeNNxQcWReOVO1Yc350I9aNxtKeid6/AstLtVqcD0BEWJvdRHkR/goPz/gAUxHuxACTiAQljEBw/gQzHN3YQzMG41CZ4kqWMYEYQOVoaCLqW9ndWFmhs+uC6k4gm44F4Jjr3GdZiLw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2605.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 08:54:05 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 08:54:05 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/3] python3-cryptography: backport InvalidTag fix for openssl 4.1.0
Date: Thu, 29 Oct 2026 09:53:59 +0100
Message-ID: <20261029085401.9109-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261029085401.9109-1-jaipaul.cheernam@est.tech>
References: <20261029085401.9109-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0058.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2605:EE_
X-MS-Office365-Filtering-Correlation-Id: 0230199d-819b-42e1-b86f-08df359a2fa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|260925022911599003|260925021311599003|260925021911599003|11063799006|56012099006|261009223027099003|261026130827099003|261026121527099003|261026135527099003|261026140227099003|261022105027099003|261021123027099003|261028144727099003|261021135927099003|261022115727099003|261021133027099003|261022113327099003|261021121427099003|10067099003|261022075727099003|261021130227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: dSJN4TSWjcT8z8ZfYPV8nblJt0UHnMpcekgsvS+HvJg6o5KEDCwR064GcjYLiTRCT69w3/nP02BXlgu80E78XDLRSF9Cq2YGX+EZgEjPBQSYGHETyv+tFa1Ew5f7MixgyCPLUX/bMQw8oB3nYINDrkRgEg0zH+gl8eeWNF1u1/x1AkKI9jgzuGWy/JI6vetUTNAmHMGyUOUZXVKH/aINH4NpQKssmG1I+1RK+y7peMcfDOF0roMMVXWiOGn8c9JJZvx6bpRqTwg8qRObse2x7xS+l0CyJ8UlaitxQhRa1csrDAD7OIRHIfY9dlB3yZ4/wxS64UvkRn8oKc1i2xrdrV+gEHb7VQEMgSVmrow65VTnXw+2IPOO2VS3Aj7Ng4PJI4i0ErjbCBkkhOp+Y8xzcAfh3g97IaEDQv/k0Lky0qsAh/cSnvFkRP8F9monbBmI0ooVJ5S4TdvSMFzQ6mTGTCcsH5KVYErlATgqXHMAf/sK86lXcAApMkGGj0w0GgG2vGabnMHL8xC8neJK8kyr2PsO2HyNMq86kVULbhFRVbDWh/3n+BXeFXIr6C2PnE7xxwvg1AHlCoNAjB9MebjRnIJ9kmHbLHs+n8r3m+CAgYsN/56aP76ledfTEJ8OYvsS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(56012099006)(261009223027099003)(261026130827099003)(261026121527099003)(261026135527099003)(261026140227099003)(261022105027099003)(261021123027099003)(261028144727099003)(261021135927099003)(261022115727099003)(261021133027099003)(261022113327099003)(261021121427099003)(10067099003)(261022075727099003)(261021130227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rn6hKG7yfPnBe4OMl7UFHj5kPNjn2vq251xdOZ9hyKZF6Qhk//+9+4hRuVK/?=
 =?us-ascii?Q?i7LHUA2GKWRtO+5jNoXsZAuqXXQfb5aGrvwaNLTnJvx9W2bBSLn2ft7srQhD?=
 =?us-ascii?Q?u1rHsvhhBWZmrXaUyt/oegyvZHEee2fltFJKaUcmE/S1zu/hg9lhZjLssFFI?=
 =?us-ascii?Q?I+wtsOvGxYkyFy0Q91k9LH5pPfgZ3haLBVr7kRfuQRrZazTfLbI5KFY5PZjo?=
 =?us-ascii?Q?iljZqor+Ab40YyAUj2dlIpIn7mMKbtD13USiW39MnO+/qz05x+LK7xyvVbJL?=
 =?us-ascii?Q?Ow7mwtE4VZqmYfJFku2YKlStaFRxR0IpjOnjhp/yamHNlGaLjeMBBJj5/qQo?=
 =?us-ascii?Q?6xZCuyMwEd6dWbAt8gAO9nEeIUiXDBCXThtm7RuxAAu5FLX2cJzQUVJMx3jV?=
 =?us-ascii?Q?c3vv6j3VZNwHh7PhHtajijYcTdJtXxGou0u6oykojO9LRpPJEjGt1sMDn/ld?=
 =?us-ascii?Q?jjAzCSxgKAiQ9kd+UEKkEK2zbRULI0UcDFILth17+0crB90siT4qIzjFj96I?=
 =?us-ascii?Q?8e/J1nofEOTTVNfFQAPZQFOmS5hsPQFcQPytLP1qXVzHTE129xZ5j2L5qjE2?=
 =?us-ascii?Q?hRsmnouQ/W81oIVsVfFRZnfyZFxsIlZV2cfyO3yfzdh/n172iEx9MN5dNI7Z?=
 =?us-ascii?Q?vDOKlOWJzEbpf6wLOqucO4yjqwWyeGZBCvxwKbkA7RymLkzGs4YkxL1/CgmR?=
 =?us-ascii?Q?vXHPaH6B+gd3L7RBUsgKN6julqddSE/QLXYJ1xYIOAV+nIEDppWFMrsRXP8x?=
 =?us-ascii?Q?tGdV9tgqsjCmjOcl9/riemBZDFRnTtrWM0VGUbcSLg/CxwVjUSXiQ4qkWgZG?=
 =?us-ascii?Q?kKhthQBv6+j/qcc1DeYiGVlB4yE1JQPVwdMtRJfXD3FDgGeuP4PXcEeMi9xC?=
 =?us-ascii?Q?kDOm5vMCHH0gkuKgZHY2NUpNkTPthUE20h4O6zYwXMQZHahPBIVQ4f9fJ5V1?=
 =?us-ascii?Q?W9APW8EH9LNhz8fTl+oj0K8/nryctx6DibS/EbZh5ktfn8aWICW2gdWX4h53?=
 =?us-ascii?Q?AyzMR80gyHwLrW/8OGjds2Q+MotsbdhoD7l1DpgrtYb8L/Bnka9W95rNuU5l?=
 =?us-ascii?Q?ylWi5SU/eamGoVwEBXGZJzpdpHNTzb4OoyFvoTbt/CutAx7ZxHADKKBaNDv3?=
 =?us-ascii?Q?RwxjqAklgERR1gi8MmydRTAFSj43Mp90cart1vSML5hKOglSsUlOJpeSFw00?=
 =?us-ascii?Q?wnTDRDfIWME4LDKzbh2vVekDKeVK7qbW4ZEqPrfaz0NUlvJDhDfKy6q2Rqfq?=
 =?us-ascii?Q?G/T1vRf5KY82j1py4qHyDvrnj1CofpV7zwa1d5GYPDdGtXd3B1l+f1pp1kuk?=
 =?us-ascii?Q?MsY1PQ68qgZiFroQhDbcEFDfkmKgnO8oB3M8qcmUPbpzncdSoKckTGPNCFT4?=
 =?us-ascii?Q?G89T8CbwhXjnkXCx2jpmUr0eO1u1KeGbbaXoHjYoNpOAhr1NAtQPeyI33l/Y?=
 =?us-ascii?Q?1s+2H7X52ZtZ2n4iFgTIxrGceho3esGEOci/0dUwoJU7BmkblYBRDEeAurco?=
 =?us-ascii?Q?EgcNDlEfI+dNkRIaVgZ1YsHu2MbQ/wZGAOViw+SVkCeCpZnO2Uok9rOL4VZV?=
 =?us-ascii?Q?yU6UvY/7bsBSFH8dLaohKn6VIB5o3Qk3aXd21E/tsdm0AipW5UfpYZ3uI2Ju?=
 =?us-ascii?Q?4IaZlt06rWusiU8QiSOzMDsiOhl9sjMLR+zHe+rmfgdvGRzwpt/k0oSKHfvb?=
 =?us-ascii?Q?YY333+dGGp0KU1FvklPJxT+atWBv75C6rGI3Z6cMSWxGPl8lxD/vgyq9/AW/?=
 =?us-ascii?Q?/tkxK6AY1w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0230199d-819b-42e1-b86f-08df359a2fa4
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:54:05.1900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1eqXIJraDIzJdPS7wA8tynCrqTeO1A5FbgNHzQWJQyKdHO7d6INSLzyP3MgM9tDIXcYOk1I8rF7akhNhMFOGuEuJGGd5ps9JSx3YLM0PXH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2605
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 08:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248911
Content-Type: text/plain; charset="utf-8"

  openssl 4.1.0 changed the AEAD error queue, so bad-tag ptests now raise
  ValueError instead of InvalidTag. Backport pyca/cryptography#15596.

Backport of https://github.com/pyca/cryptography/pull/15596

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/python3-cryptography.bb            |  1 +
 ...-on-AEAD-finalize-failure-regardless.patch | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/0001-=
Raise-InvalidTag-on-AEAD-finalize-failure-regardless.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/re=
cipes-devtools/python/python3-cryptography.bb
index 5a1ce9fe2d..311b7313f0 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -16,6 +16,7 @@ SRC_URI[sha256sum] =3D "7b46165bb56eb4704e2eaaf86f3c940d1=
9154535d9b0ca7d6d590b0406
 SRC_URI +=3D "file://0001-pyproject.toml-remove-benchmark-disable-option.p=
atch \
             file://check-memfree.py \
             file://run-ptest \
+            file://0001-Raise-InvalidTag-on-AEAD-finalize-failure-regardle=
ss.patch \
            "
=20
 require ${BPN}-crates.inc
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-Raise-I=
nvalidTag-on-AEAD-finalize-failure-regardless.patch b/meta/recipes-devtools=
/python/python3-cryptography/0001-Raise-InvalidTag-on-AEAD-finalize-failure=
-regardless.patch
new file mode 100644
index 0000000000..4c3be321ee
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-Raise-InvalidT=
ag-on-AEAD-finalize-failure-regardless.patch
@@ -0,0 +1,53 @@
+From 098b3b1816c3541847b507b2b1e0ae2e3aa85102 Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Sat, 5 Sep 2026 17:11:53 -0400
+Subject: [PATCH] Raise InvalidTag on AEAD finalize failure regardless of e=
rror
+ queue (#15596)
+
+OpenSSL f7d2d2acef (openssl/openssl#32587) now pushes PROV_R_BAD_DECRYPT
+onto the error queue when an AEAD tag check fails in EVP_DecryptFinal_ex.
+Our finalize only mapped failures to InvalidTag when the error queue was
+empty, so on OpenSSL master a bad GCM tag surfaced as a ValueError about
+block length instead.
+
+For modes with an authentication tag, treat any finalize failure as
+InvalidTag. Older OpenSSL, BoringSSL, AWS-LC, and LibreSSL still leave
+the queue empty, so behavior there is unchanged.
+
+Claude-Session: https://claude.ai/code/session_01Eg4jjDRiLcBQrdEFsL3fCD
+
+Co-authored-by: Claude Fable 5.1 <noreply@anthropic.com>
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/e83=
bbe58e373536636baaa7c33a64a6e8f04c953]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/rust/src/backend/ciphers.rs | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/src/rust/src/backend/ciphers.rs b/src/rust/src/backend/cipher=
s.rs
+index f850bef..073bee3 100644
+--- a/src/rust/src/backend/ciphers.rs
++++ b/src/rust/src/backend/ciphers.rs
+@@ -233,12 +233,16 @@ impl CipherContext {
+         py: pyo3::Python<'p>,
+     ) -> CryptographyResult<pyo3::Bound<'p, pyo3::types::PyBytes>> {
+         let mut out_buf =3D vec![0; self.ctx.block_size()];
+-        let n =3D self.ctx.cipher_final(&mut out_buf).or_else(|e| {
+-            if e.errors().is_empty()
+-                && self
+-                    .py_mode
+-                    .bind(py)
+-                    .is_instance(&types::MODE_WITH_AUTHENTICATION_TAG.get=
(py)?)?
++        let n =3D self.ctx.cipher_final(&mut out_buf).or_else(|_| {
++            // For authenticated modes, the only way finalize can fail is=
 a
++            // tag mismatch. Older OpenSSL versions (and BoringSSL, AWS-L=
C,
++            // and LibreSSL) leave the error queue empty in that case, wh=
ile
++            // OpenSSL >=3D 4.1 pushes PROV_R_BAD_DECRYPT, so we can't ke=
y on
++            // the error queue.
++            if self
++                .py_mode
++                .bind(py)
++                .is_instance(&types::MODE_WITH_AUTHENTICATION_TAG.get(py)=
?)?
+             {
+                 return Err(CryptographyError::from(exceptions::InvalidTag=
::new_err(())));
+             }
