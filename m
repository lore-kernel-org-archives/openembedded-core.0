Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26021.1793126070832048196
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 11:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=MZRhrnZu;
 spf=pass (domain: est.tech, ip: 52.101.72.8, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoOBt2HIDAnIiaEHRsIzCUm6zkWt4Wib7fx1N1t4o/Ygca7IU2spAT2Xv1m6S2FqQPQ8m0nZdo1clmdOZqtfqdwSPjHWfrFafnBNFyb3+JHY+CMs/ViXmIBMUTVqKCYy/GcEqsYgvCbQq+pCEvp7aWVowglmnjY5AQxXXZqUHutvpYpg/hHJTiRXNeHr4o8Y+iSev+GnXvTteZI3USXNGfmC8HkR3o3nYMmyHoLbyTQte8D8TTot3sNgi+XssVxQ0wZUw/3HVcbdYWP09mSSyBdClcaiurbOzzOvp3WTs23SOEEdggZqR7fb6iNJa2TRiTkAMhYcOBfHVgrSi00o9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbcgKqUilV5FUYtQGmfd2HB69Fha5kFBMrmkAp0To/8=;
 b=Srgx9LP7oxabeCgrSXozcuJ/BTAIUlUPSLErhZCiDh2Q8VFjnDmBeMsLjZFDAiTcM6ekwz6p4PYDcQDAv8FCvAXApoR9C5Mpmg1JuQ6BFDtQep/7/gjpBCEu67pyb51WE1QYFdfezwQLCM0VdEzNcCHqSDtvvZYICkwAneIZr2/jo+Z1wXF+edBNsWbWcLxcH5NKIK11nUeOPKvlCA9m1DOqNiXFa/FUyiNtHYBcMjTLtBWRi85kLd9giLzMpukah6WYLKRVW7PqoDdxOloIcNht414lSwToOGkBmHJQCvkRqNigS1gAeKVtbv+LjBMjCdNKPIg5P7PR3G2l4XfUfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbcgKqUilV5FUYtQGmfd2HB69Fha5kFBMrmkAp0To/8=;
 b=MZRhrnZuWFPMnCgLZJ2XJwZLcGPh6NDbH09+wXLzGi1Sc9GeaxoXxFNUQcICLBCtFji+Mm9r4hDhV0e9oDy2sV/y8BFRlbt8oMyCPaifQ5F8E+zWIYbNCtL5ABFbmNDd5omwEy6LP6Ggjwh5Z2JfBgjL4dRnX9teKW25JfeXtkzTkVZaGv/InxDLCpSn5NtczOF85pXMMqHKd3HWAMPueNkRmudVGsQxV9aygoy5B9YrOShbOypcvU+Zzr2qTmEbBtj9MW3j975Mhd+P1u24D/HBBfhAs63UD1Ak1R+fIDHVF780orPXJk+rUw6TtXtjUWLsXRsPDycCsdTq1eeaGQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PR3P189MB1082.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:45::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 18:34:26 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 18:34:26 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] python3-cryptography: backport InvalidTag fix for openssl 4.1.0
Date: Tue, 27 Oct 2026 19:34:23 +0100
Message-ID: <20261027183424.11874-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261026183524.6389-1-jaipaul.cheernam@est.tech>
References: <20261026183524.6389-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB8PR06CA0059.eurprd06.prod.outlook.com
 (2603:10a6:10:120::33) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PR3P189MB1082:EE_
X-MS-Office365-Filtering-Correlation-Id: ce575008-41ee-45cb-47de-08df3458edae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261026121527099003|11063799006|56012099006|261026135527099003|261021123027099003|261022115727099003|261021121427099003|261021133027099003|261022113327099003|261022105027099003|261022075727099003|261021130227099003|261021135927099003|261009223027099003|260925022911599003|260925021311599003|10067099003|260925021911599003|18002099003|22082099003|6133799003|261026140227099003|261026130827099003;
X-Microsoft-Antispam-Message-Info: B7KDTqt2+sIi7Xy+F9UU+rg2lPa/5npyWBXvB4sBOdZEKaqgscpmHsqkvRuzx8h3Mk8ou8IDybmL5Y5THcD9s85KdjqnBrfTXTn88iT2bxfQTwNOmPD3Mvo/i9vwrVq2joWcohP4ZzaeoaUyG17yTifqiMmptcsjA6ryTozz+es22wmcafp1wlcfel7qxr4OOaB0pSh774H1ZMvZQHIXQFJyRszbbFZxJvlu90KqP7+gUrhlxVzarxzk7kEnpHbdQQX+1XCeBdkgBN8DDXL8ufp1BobEX7MoEWh/xx+txiwgG8z+3S1g9nSltUrPW4gC0Lye6DhXy8HfO0HiqxbMhfsLM9RXlNgV1ecilKWAlhxnkc5DUFM+EPDysvxhQtE3nho8l2wlOdJibq0gr7e6/+lPxQLiBuacLjbyx60On0KYAfnFwZAQ1HVyR541TXa0gT4HpO+eIt3mQ6pnyZCKEczLdPmthzBM1zFONbgvAyO2+wBoRxVKCMp4/lfR+YCQm7Z8MTAGa20V059YMMAtKG602hb9Kc09AQ9IwuTJLrnjX+kwcjHnWFDyqdhQiUfhFdJmq3RER1s5CUIexp+MGYUI2WPoBC3FEjNIMjlxrMBlcxZ+AHb/hZBc4EAH9+7L
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261026121527099003)(11063799006)(56012099006)(261026135527099003)(261021123027099003)(261022115727099003)(261021121427099003)(261021133027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021130227099003)(261021135927099003)(261009223027099003)(260925022911599003)(260925021311599003)(10067099003)(260925021911599003)(18002099003)(22082099003)(6133799003)(261026140227099003)(261026130827099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P3N07P++DJ9P3IRNsaEIB9uXqp1qq3UESXTDxop9thECngyuWXrV+kjBCY+O?=
 =?us-ascii?Q?gu5qBJsatCkZWz/P7QC1AyxBBguyH0sk2w9V0qt0luFCOZSw+Tplf+ZwNnRU?=
 =?us-ascii?Q?p/t7yqKGt7pFBVS4Gh8e70XhLSVVffg56ano/pwXJqycby3iuixHdAYauqr2?=
 =?us-ascii?Q?sktqRDTU5aB8b5koJkXB54tO+oVkq6siltC0WTT1ZW50NwTMdRGkB1jagBfC?=
 =?us-ascii?Q?262kbbLtMUrAq8ckAjHdFODg/bVKgdrBa4aXRkoKfSMG+qLKE8HV7PfeRs7s?=
 =?us-ascii?Q?XBzkQELuzXLfi/Qq8sZooD2pL2jDA25MoU5LHUniAvEMl59Kx1NnCZf6zisk?=
 =?us-ascii?Q?ggjYbYxH6ejMdKpOFU8p8Pfl3Zi45TsNyhJTWSteJ0Y2ga+PO3RpPhzjoVml?=
 =?us-ascii?Q?1KGtWsSKlmNz/6vUILdQTrjA1oakKZX82Uo7zMsvoDYN2NqZMIcsW+aNHMDH?=
 =?us-ascii?Q?uEoZO4UfY/HuAntyQuiYvnPXribQq/h4lEzmj2R3y6naGBM9+1cLs8HvIBsR?=
 =?us-ascii?Q?Y9knpnafsSh3ayekSq4Su2VT9r26I0J6u7qce6oP0yqR4wFgJBkhbLUVJI5M?=
 =?us-ascii?Q?r+QUQYa7iQv/FCJQ2/KTUHWTiGqwNhRhRXlMT7TFD9EDxLOiJ3w5AzFkORKn?=
 =?us-ascii?Q?cf3ZGqjtrqI/o3OMtiJJH8OvJkugw52Y0VLsPaL8UsHEYvkf0rEiCIn6ZWZN?=
 =?us-ascii?Q?Y2r1QyNvgnIS5cHYwdpAgkhhzasMQh+92WOo2XgNRko8ArBlYqHJ7taBcMDn?=
 =?us-ascii?Q?FwuGwnyoSU1B277O2g5kwlp1dzvBqoZE/r3GFxUw2xyWMQzbJFPD0AO0M7Of?=
 =?us-ascii?Q?SVG1anLshqrWOf+jhQg+99O3xCkSHsloEuwrGvlZ7DZqJvaLPD9jY4vqbC2J?=
 =?us-ascii?Q?VmmCZ1AQoLp4qfYFk8NiBi1g8iWNWXIEOzFeeZOuoFteVrzYfZj1rV5ao7pT?=
 =?us-ascii?Q?T8Y041akPohoc6mO7Jo9tPGxO+v+1dZFx7xVuZYxB1gaUt6fpun3j476bqIn?=
 =?us-ascii?Q?V+79Gh1NdozgGAWBm6tFiY853WsT+2e6y8eP8mYK8rg70NGne/nXgkdG+QsP?=
 =?us-ascii?Q?xUIwW2FsR2YScFviK2DgcwkFUv/M2o2xvEl29lsleGYurC38Zs6KAPNFfuOe?=
 =?us-ascii?Q?joDCDQD5i+81orF0HMK/YfCwfy+eI0rcuQ2hVp85WiC6f7nrUBetN/MI162Z?=
 =?us-ascii?Q?5BxPr+R7sUjcslyG0d/jBiUapwq92R8TJGvVeHB6M1Rqzvm1RXCVSzkknfk7?=
 =?us-ascii?Q?U6JL9jsDq63BMeNgtmauTQo1sp2C1s/PmOZ7lLgN2jPFc+TIQkqmApTZZHSx?=
 =?us-ascii?Q?mc+r9RF39huz9METB/0toCGhoPTF1fu1/4SAFCV0U6QecSTb1zohO98z+X5R?=
 =?us-ascii?Q?uLvx53P83ddtJ7Rf2HNcMrw4b+D8r/kDdDEWtUc8XNMXBoRyQGqbm99i/y8u?=
 =?us-ascii?Q?iANv0ybJBwNsG2IZV7vVpXmXO1Z3btBwfJYH5B15RWUBJ97uVUw3GWSYD6Eh?=
 =?us-ascii?Q?+EFpw3g9xzeHfKFzrlRftEVaYmt6jAb0dBiOw3DuDCdGpRqqy7WH9yigbgnm?=
 =?us-ascii?Q?6OcqeO5/aU1hd0t95c6KhoEzl1PRpJM1/5K/5xseX/a+Yt17th43rOgPMwYt?=
 =?us-ascii?Q?LJrLeHGLkRmKR5xiHofbKTfzE5J1FbLmlpUzPjJtbe/slKcsR6J4Y3GeZL27?=
 =?us-ascii?Q?wzW47bLSB9258+zn9engY/+I6cryGlyRLAHX/dy1GZXLpuOlmGt7aJluNKk7?=
 =?us-ascii?Q?aIxvVkICyQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ce575008-41ee-45cb-47de-08df3458edae
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 18:34:26.1469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4cJlffvuGFJp0CrK/21xrnyWm5DfAa9lvqQvnbm/ANzyWg9o5jdoFHAbeqqejx0SDdEq7nixxDLbri2YJsWVAzRB62bKSbcZgc2wF+rk9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 18:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248759
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
