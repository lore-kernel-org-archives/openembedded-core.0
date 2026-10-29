Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7330.1793264058525593677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 01:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=OUMLWdrk;
 spf=pass (domain: est.tech, ip: 52.101.69.18, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8oO7iW4hrCqlLSGcOAtuzm/egJdEiw7f/smirmc4a/t4wa19NHhOzlfvQ70M3rDjsFZxaWMkYQVv3SBONtVqva8DQD3jlr/rUv1vbDJCwH4powilVewVkccU1ppje0ooj7AxOPxfffSVThEGsL6lsGqVb3aeXnSgkOAlNp7pu5BzQXPhLNlZd6ayNffHO99KPY19VTfOUMwqepMxAluJAipsU2hs4P4aCIvehtR/X0lq3IXJSU+8nc3AKF9ivoYr8YsVCB6FYQea8mobT0lydNBPAHPsE0U8CoyYyYbheoWp1dvH2hALKvjKMYMikjikeCJ++1YRXbW+0cI9CbH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fry3pubTc0moZMznDcH6G6IwJ49EAkys2waFU8u7gDM=;
 b=rKfOTYFU1w1H6gg5XDl/TLyE7+w73euzvMkDwOq6RqugTCBj6CJ2oHm8cAuyA2TpTpp4fLnKaieDKJ81G6EYxtb08wAadFI5f0Q73wHzElTDpFXv6u5SB4TZnJRMyIXDr/HpEbUJKvWkm4nWjqpRuAm2HSxAAmsPlrb+G0ye6UX1ZaXILrutP/f3lS/rpUZGzk/f3l1pUWSV4+W+yosTplTcbVCNnN+2aPZn093qO7ohcUgiSmNrtPMC1MQThyVIl0BtiACwFv5gxhWTxE/9ezUS4kXwSeUhtp2IQSMZ+qwZLnXcXUvl/3KinOqNGT6Nfx9oXaDxB6AgL+vb4+TLwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fry3pubTc0moZMznDcH6G6IwJ49EAkys2waFU8u7gDM=;
 b=OUMLWdrkjXhqMh6Eu+1zzSRzZjcTyEcve/t+HUjP9RViX9GHZoFmplpfRTFKN9mKg6oM+9d44LKwGQbluxuu58/5BfBiJNGAwNZWhxbU2By2IXzXlkXyloUbg2zAfmO1CAd0xDq39UQHDux6IHz6I8g20kSDKDGHcJfEyS7dgkkPyNUu4dfkzVXOWcpGCOn8Jn7CA7J1ZpTiwIg7DjalVAcQFtS2lw4M8igyQALSpBMHcx1oavlV9+GkzMOmdY5TDbooDsrH18DZ17+iCcWCCQ7Go+lmrmwcHSKFxv5kQjINtZhctVeDkENtSfdgRTXZjIRU8xcNZdGdIhs2yhSCnA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2605.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 08:54:06 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 08:54:06 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/3] python3-pyopenssl: Add patch to return None for TLS 1.3
Date: Thu, 29 Oct 2026 09:54:00 +0100
Message-ID: <20261029085401.9109-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261029085401.9109-1-jaipaul.cheernam@est.tech>
References: <20261029085401.9109-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0605.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2605:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b1e4c9e-3aa8-449e-80f1-08df359a30a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|260925022911599003|260925021311599003|260925021911599003|11063799006|56012099006|261009223027099003|261026121527099003|261026140227099003|261022105027099003|261021123027099003|261028144727099003|261021121427099003|10067099003|18002099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: oi+NxxSs/BpxjSGwU9qHFt5nmD2XH7E+EkD8qs0C8spgvyftTtEBLyej2StP6tPamgubvCNoCEuhKSOs/o5IqWZULnMXw7sp7JfzC/I93+pQ5YjTEV4TiPE9+bsX9fCRxgMQU6ZHo6OEwy3WXOGu4iwlzaYUDozgmq+h8owG/13zfDw6fpHLTaMavhxdNeRrMaK6Z5HGRkoadIcJ+xJN6/F2bjh9hBQahyqnz3KRH8Gh9fcH1T45XBAziE+Gai77cDoqvpi6oPLMWXnIyga6Frp5d6/dXPaTLaNa5pGNH7eUGOXbfKrsPPCpzw5ZYghmz7ZUTlvVNDsqD5abX44RVm6otA3gConZ9REsUDqgVT24WXLAdoLnVDN2FQwPCIxDPbv8A8xdUzR53GTwiJGKheGHGYh70ZrekwwfLjsOX8HxUYPmIC4OGqi2MdOQXRNW9MsZkJcd+46douq1DbMAd66y1jIzWUMdR72gg9yfD/KD9rp1VlU5GIrYBJQ5NSAjU+RjcxbRRL9w3+AoDuAuf5NqtzSXL//Ph93Rii8guXAdJzlBF3ADeUB8RSsRc1gWXkrGdZY+VaGy/bXb5dfQkzuiY0baCPrBcA3R70QcgFJGQWHDAbYiZllFcpjdqG1JHtgRtA5rodR9o2/frVjRlyDHI4BjT65AFCkmMJuv/8g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021123027099003)(261028144727099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mx+u2I8tN7rLlMtF/SlBfadaZjHeN4z+Aj43+hGZF2Z8gZEXe/m4SxuNRBuz?=
 =?us-ascii?Q?8D5L6Xo/x1W48qcrjJlqcPn3Tyz8HLbqDjcHERjZmni2fM56Ula2G2Ws+wlv?=
 =?us-ascii?Q?t6YnXBWsGmKn6AOshEW9k/SEEoup+GRj8GPpjtlb4nW1hIiitEMyTpQtd11W?=
 =?us-ascii?Q?5HD8hUhqSEQcY20Giu41sm3hax4yNQG9HyuV2iH9xpkH/mYFxtz6MGsyYIRo?=
 =?us-ascii?Q?RDlXypeO4X1Z1pAVnt5o1N+L3MpkLCUvvLKtHX8gCBtXZ7hudkbIyvDfW9f4?=
 =?us-ascii?Q?fufFGqHHphuhEdiZV44pMGnQbAJebdUf4e63HxaPrJdiPY8MnRCxaX/S8rEh?=
 =?us-ascii?Q?8umgTiduJjG5ZGg3Woc0HC/u6kSHvAghcGBZhfE+dFA1OX6rnZvKClEzmzBt?=
 =?us-ascii?Q?6KjJbbWg6uD1FhI7kI8Q8XDL5Ee41W4d6V1zCBLEWMKGPNgF0KkiVEU3ydwd?=
 =?us-ascii?Q?cs2PY6j7ee2cJuM7GbX9IRtulkZTP6xnya7ypEprht8mmkVTpKH0L7QTBDjQ?=
 =?us-ascii?Q?0OMXH7Y4K5vAgbA0j8NvMQzz73JZ0slNBYXY1UI3DmKAqqtYfOQTFQvPtVys?=
 =?us-ascii?Q?kzscOrwzfhwcvZXhdMRzqk+laPi5thFknGM88HEwYaA6/QvJZ2Zp2rGIlkMv?=
 =?us-ascii?Q?jX6UkEFJ58bvcJO7IRUNlS9AlYzJPL4anx4oqXDPWdUHr++1G+YvCcmiIk86?=
 =?us-ascii?Q?KJVFRBM6yHwoeNF3Xc4sI0Nxn9V3nPea786eo1KJ0/RNmMkGFpJ0tutoahVG?=
 =?us-ascii?Q?rzGddEoI2PlzhXWXzUd7OdDkSq+UtNAJJl4QJdF6CVNrpqp8oQcK4b9PFY3J?=
 =?us-ascii?Q?D4iZif4heQ1+zXQ3iI0CqPVw1redt4bzwsUVwidvDy6YieQvXIoXEhqGxHK8?=
 =?us-ascii?Q?lWnfcDHEZreKfRZvNYhPzd43vaGfZKQdHNiTZLGxg6yPXR8LKzWoL9qNKN/8?=
 =?us-ascii?Q?W0gGa4Epd7PH2MNWEZ0xWMO2HK1ceecTaQ4jYGtDLvrCJ5xPKIHyebC1sAYQ?=
 =?us-ascii?Q?8S6FYgBF0Tn6mg4v1tfhAKoyO4jv3aG4co28WhNe5YbfOjyXOIcVyRxBfxdZ?=
 =?us-ascii?Q?aIHKhBCkL3/+Vb5kyhVgGs3G5vJb0YEormIs1YahFx4AYsS5Ec/W3cv0LdNN?=
 =?us-ascii?Q?gOp6Z3IJW5bLwoIwW4DO+EzsUJC7paiKq7nbvkDvo9IHnRuYG1FGGwtPwabo?=
 =?us-ascii?Q?P44WYGjABSbflTS2/1v5A0snmdapfnvmhFFAfdYdLHi+ZxxKzp8tYKYxWD9j?=
 =?us-ascii?Q?EJGkDKurr0eeC7jSdlGH8ir2aWy1fuR3sIFb2DV3QGOBjAvwJY8agandfFBL?=
 =?us-ascii?Q?6HPObi0hzcSLk2TKYg0G137TYuOHSCe8bnS79JYH3F5rTH2hEak27gRGiEqX?=
 =?us-ascii?Q?YjXEHznp4J2jqgvotbcuFEEkpzlTvn13bsui+uqy6fDe2Jb7/2yFWwSQnUD1?=
 =?us-ascii?Q?C08E6CmVwf3a0X7mokS9xBxyMIK1DbAiqzuDRcYXo0/nk8PkM9LiBo9hlmSt?=
 =?us-ascii?Q?wNduamlMrT400sfWNseRQa6MnlPQKALwJM9ks8PpqRK92zz7fAkq5RrcCvGD?=
 =?us-ascii?Q?YbBsJqgd/kxlcvqqoaP4gfyCtBu0a/M46nG8T0p4Kw2AaKKyMKxQGjSYClpR?=
 =?us-ascii?Q?2hJb3+OZdBqEiY2XpVbf3YvvkdzC5CC39RhzYGgRZSXBxJJGFGpaltDUW6Py?=
 =?us-ascii?Q?tOuDaj4RUS6ex4CFfRHL6ZKTK2cx/6fimNGn26+m4Xq+U0WVLt/QlJm8TTHk?=
 =?us-ascii?Q?1poJdAazBA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1e4c9e-3aa8-449e-80f1-08df359a30a2
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:54:06.8482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILRAt8jkZGQ2lxe3/seChhyWcNH3aG23ecj/xWayekFR8cA6c58oQ5QZPoZJPbVKVooDIeJCrGNGLz29vJCYcpWTD8DpNSTl2yAgkNkk8D0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2605
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 08:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248913
Content-Type: text/plain; charset="utf-8"

- Patch is needed for openssl 4.1.0 upgrade and working on 4.0.3 as well
- PR is opened upstream https://github.com/pyca/pyopenssl/pull/1545

ptest results:
  PASS: 432
  FAIL: 0
  ERROR: 0
  TOTAL: 1  FAIL: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...m-master_key-for-TLS-1.3-connections.patch | 66 +++++++++++++++++++
 .../python/python3-pyopenssl_26.4.0.bb        |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/0001-Ret=
urn-None-from-master_key-for-TLS-1.3-connections.patch

diff --git a/meta/recipes-devtools/python/python3-pyopenssl/0001-Return-Non=
e-from-master_key-for-TLS-1.3-connections.patch b/meta/recipes-devtools/pyt=
hon/python3-pyopenssl/0001-Return-None-from-master_key-for-TLS-1.3-connecti=
ons.patch
new file mode 100644
index 0000000000..0942cbdc56
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyopenssl/0001-Return-None-from-=
master_key-for-TLS-1.3-connections.patch
@@ -0,0 +1,66 @@
+From a0d7c02047a991ad2bd32621ac5f1b57062dc296 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 29 Oct 2026 07:44:15 +0000
+Subject: [PATCH] Return None from master_key() for TLS 1.3 connections
+
+TLS 1.3 has no master secret, so SSL_SESSION_get_master_key() reports a
+length of 0. master_key() asserted length > 0 and raised
+OpenSSL.SSL.Error([]) for TLS 1.3 connections; return None instead,
+matching the existing bytes | None return type.
+
+Fixes https://github.com/pyca/pyopenssl/issues/1544
+
+Upstream-Status: Submitted [https://github.com/pyca/pyopenssl/pull/1545]
+
+Note: Exclude ChangeLog change for backport
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/OpenSSL/SSL.py | 7 +++++--
+ tests/test_ssl.py  | 8 +++++++-
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py
+index b7d5887..15ac4ab 100644
+--- a/src/OpenSSL/SSL.py
++++ b/src/OpenSSL/SSL.py
+@@ -2803,14 +2803,17 @@ class Connection:
+         """
+         Retrieve the value of the master key for this session.
+=20
+-        :return: A string representing the state
++        :return: The master key, or :obj:`None` if there is no session or=
 the
++            connection uses TLS 1.3, which has no master secret.
+         """
+         session =3D _lib.SSL_get_session(self._ssl)
+         if session =3D=3D _ffi.NULL:
+             return None
+=20
+         length =3D _lib.SSL_SESSION_get_master_key(session, _ffi.NULL, 0)
+-        _openssl_assert(length > 0)
++        # TLS 1.3 has no master secret, so the length is 0.
++        if length =3D=3D 0:
++            return None
+         outp =3D _no_zero_allocator("unsigned char[]", length)
+         _lib.SSL_SESSION_get_master_key(session, outp, length)
+         return _ffi.buffer(outp, length)[:]
+diff --git a/tests/test_ssl.py b/tests/test_ssl.py
+index a551fc7..085ab35 100644
+--- a/tests/test_ssl.py
++++ b/tests/test_ssl.py
+@@ -4259,8 +4259,13 @@ class TestMemoryBIO:
+         # speaking any more.
+         assert interact_in_memory(client_conn, server_conn) is None
+=20
+-        # Now that the handshake is done, there should be a key and nonce=
s.
+-        assert server_conn.master_key() is not None
++        # Now that the handshake is done, there should be nonces. For TLS=
 <=3D
++        # 1.2 there is also a master secret; TLS 1.3 has none, so master_=
key()
++        # may be None there (it is with OpenSSL 4.1+) and must not raise.
++        if server_conn.get_protocol_version() < TLS1_3_VERSION:
++            assert server_conn.master_key() is not None
++        else:
++            server_conn.master_key()
+         assert server_conn.client_random() is not None
+         assert server_conn.server_random() is not None
+         assert server_conn.client_random() =3D=3D client_conn.client_rand=
om()
diff --git a/meta/recipes-devtools/python/python3-pyopenssl_26.4.0.bb b/met=
a/recipes-devtools/python/python3-pyopenssl_26.4.0.bb
index 0aa1e8991e..500027fa25 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_26.4.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_26.4.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f1465=
5fc854ddc3c6bd57"
=20
 DEPENDS +=3D "openssl python3-cryptography"
=20
+SRC_URI +=3D "file://0001-Return-None-from-master_key-for-TLS-1.3-connecti=
ons.patch"
 SRC_URI[sha256sum] =3D "28dfcce0162b9211413e26dfbfdf1d24317fbeba18fc93c124=
00a1856b2a0bc7"
=20
 inherit pypi setuptools3 ptest-python-pytest
