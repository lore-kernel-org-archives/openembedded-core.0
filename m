Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1341.1792476639174107572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 23:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=rfKTHiWy;
 spf=pass (domain: est.tech, ip: 52.101.66.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I93FARFY/IXb9g4QieC+ixfBwWfRGcLoSdkQf4bexiW3HtKbwiNRRq0BRhhw3UFIUh8iG1NljvwVYr9NAAb+vl0BOU/vPxWYqZ7y9OKXAVUhRrBxVyOhVfp5KxfpcVKIpLRrFr3BkxnkQ4n9l4Hzn9IunNKfn7j0mcR1oPFw+UJF7J0fQ2yVzjByhzZhQtvaFAo0e9hqQtm3P2/jwBamlgquEq7melWXL19UIhFrpKS39ipiPwCMtmDM+u3jU2s/QERarVwGqGyC3JAyy1IjBPXrdki2P0Wwo7yoTGGjMWOiE+as2gRsGLdSA4wWdZFe9kbG7x30nf4iRKKQoYYf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fuct3sWOmstiFCXnXqlylsqaqpEKl8hHSY3GvLgxXrU=;
 b=U+p0Ls8ZAzLG0Rfxt6NwlAOn13y/K+bpNTwCbVH8Q52PUX4Uf54FjJbhzlrNqkOVf4oX07FRLKMLSaM0QIkIDkaIro5HXF1YbKIn1Y9SKrfj0bwSxm5YCgrlcRfq/k6XnpnXLLG4xWlMys4Z3Pk3dQ8YahEZJj3/3kww45dw6eHc0EAvZNS9i2yA6eOs7f77mMD61e/j9y9oR4cFrS6fsdPmCItF+J/8hmupYqWMZ3V3P7We+79Gic00b0uCA+kJtnFFBXd1hqac1g+4hYxgaqtjiwGCcyF6D1m5dV6tmoquvnzln2iQTzCf0I7AdK1S0HemeYRPBrywKEcXoFa15Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fuct3sWOmstiFCXnXqlylsqaqpEKl8hHSY3GvLgxXrU=;
 b=rfKTHiWyV3JYCkiM1T6ZQSb9xA/fZWp6TPTAxG8Zvelqk/8xrPlE10j+JSk9Zk9doj0a5Vq++/wENp3ec4ZMWDf03UyZn90rb09609kC+Xd7Vfxcty+zMMJEeU9GpOqEF6MCCydNqIGpAxhnCfpefnMEeBPrAbQMCponNzA4pB1kp+ezOzrvCt+tGjOT6QYyAoj9q/4iHaTWzQFP5S/oDEyvZEY5FUdL2FRHEuz7eif/10AZErY9jviVyQtU0oN74TMDptP8du6J2GxIXoftUKGBXWucX+gGUygVCLhRsDyL2yxstkJWEGJ25COdslPYEKgNcHKKLQDckF49uPRxqQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA1P189MB3628.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 06:10:34 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 06:10:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] python3-libarchive-c: fix tests for libarchive 3.8.10
Date: Tue, 20 Oct 2026 08:10:30 +0200
Message-ID: <20261020061031.82332-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261016092025.19560-1-jaipaul.cheernam@est.tech>
References: <20261016092025.19560-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA1P189MB3628:EE_
X-MS-Office365-Filtering-Correlation-Id: 57641783-b50c-448b-4a42-08df2e70d9f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|261009223027099003|56012099006|10067099003|6133799003|22082099003|18002099003|13003099007|11063799006;
X-Microsoft-Antispam-Message-Info: oDNLpg/34YCdXUWONTlqX+KofHjeskkheYPbuv9vVLLVwqsAUiGn7e8HlbflBmxDLnRIPHjML1fcNYgFF5LxVmEQKag4lLVtVj432EzCxTefNrzXcDwwZ7AOdOT8QqDzKq120D9uAOYa6ftOSgkU/8EclFMAVbfooV5iKmQl35EhJ473j4baRyJ8JjVZAr+9FZN6mEJ4Wm6MGHRPAAHkll7BeTO56fr5EQW/SjJJ+8VYsRLvv6wunHnV+e9NE07kZmmP9VpvdJiwO3CqRPZNdx4x+/x1nDleNp7azRDRzfSEPGJZuNd6OviVjHD2nBLC5wO+7n7YIhApb26ZqqO8+ZxPkxntLL5zoNpnyLCR7Vfrbo3tC8cDFV97Cf917cizoidgORmeMbewwZk/zFI7ChLypJRi569iMXqOffscA7qPFe3EFI4GX6AUUsDPFf0pqkmL0/pA2DfRr3YVg1t1ckMgC1vmEeh/v4ieKhUIR21228/raVuEhXhyiDcjc1fSTNi79Ct5mKhiiDGRDCN8EHjchEHtVUjMOw/WnCucJxkmRQZMubiIrTd0QAR4y/9gQRQmaJ0Re3zxbLqAH/sW47kkS7XCOInSBrVPBU4sq33NIg4CC18W1OtK1cpda8AfAHkm3+NmmFXXDOrZZpwDilYyL2/wEF+dKvSlAzxClns=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261009223027099003)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(13003099007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7vIPw5OP85TyiHhlHK5sd7mSKCxDq2aAkCj6qGEtmvByKa6vd9CUdYlqoqG0?=
 =?us-ascii?Q?cz6A7mJ5XQGmSMESBlPnANLRWy82IlSxm61kQ8bumeCocjWQ+t2cofZtunLK?=
 =?us-ascii?Q?bgUVi0bfn8GEwiSjlrSRE2+DossQrJMZfNuyanFIaIbLhtcDardVYPEXi1jw?=
 =?us-ascii?Q?XMR+lmTqdQtw50JXMRoHl7KrFyPfJxIAIRjmSbcphQRKMrJBf/LGhW7WBdMw?=
 =?us-ascii?Q?7uY8Pn9X3RmfIhFw6Xzm+DiLGVUHle8FPDZcm0ldQsjvWk85UevKPFtYutFx?=
 =?us-ascii?Q?U7KHDUgSsDaU2NWWGfLAqB7vCGNgWMkm40mvjc1eAYjgFCwIe/8u/JuoCkzo?=
 =?us-ascii?Q?cirqSP886ncI/H6/3K5WggeYDf5Pex5T0R4PwFM+hJixDIjL22g9AaekJqv5?=
 =?us-ascii?Q?/n7eygut3LawT2Oayh58RD3xPIKK7V02b2YJWc3bpUMdX/u1TPnp12p6bBZe?=
 =?us-ascii?Q?1oSSlwHPEgB4k73RnYyVJyAMftivhKsPAZf/3DUhRpK0brbw9GhS6wqRzvAd?=
 =?us-ascii?Q?nuWCKBO97qI8NGDdqyrEiuMn5yDB0e3hvtko9kRJHZ9BatWep1SZgQwJTapH?=
 =?us-ascii?Q?8+OF4yTjsXE+yzfAfnsfvHnB7js9eewLFK8iQzZpvu4PIMTsQzFpVhIImqxL?=
 =?us-ascii?Q?SlbxE4fGUTWrHOKx8fbxqxNTcB9WatYjGWPh0UZzEvd4J5CxDdA3pdKCQcKC?=
 =?us-ascii?Q?sq5NyNNOc2dXeeO4hhlxd6fJJpLgRKnbgk6nJDOLuAqzs17953cTt9y1tBX2?=
 =?us-ascii?Q?5jG7dF7+/butt9tWYxKXrzB++5ZUGizZA+tPukARGe9gCKqZooSlVM1cMMOq?=
 =?us-ascii?Q?uElIXP619k4r4dGVnc6rlUKhtctdA1w6JwCoLP7BQ5LKiBO0MZzkbjSdMw+q?=
 =?us-ascii?Q?0/XmEBuk41G4cv3FzxPvCLDvL0KOyMUolABpcoRfyVMrY+1Hk00dnD95Jnma?=
 =?us-ascii?Q?sbWLDsOsDb7NiRTcrw4WkB+3Wb+q4tAkkw2SX13wgYsGkWwWX83d/CRgqddq?=
 =?us-ascii?Q?EdL2n48xicUhpHIuONJSf2cv2i3F8+MIcmjBrQRFZyOIdcmj2mDarLge3FGW?=
 =?us-ascii?Q?DGxWOCBkDuiP/pGhk809WHz0Govm8VBi/M2jzrvYX+GfzBS1rPosmijtVIU3?=
 =?us-ascii?Q?Wqwoj3szNefn3STPalCjjkubIFRWDL5KPJF1Ch61TjGOSblvW5gGqZ2pTYcY?=
 =?us-ascii?Q?djfo76/KShUr9Eg48QzOckc56bPqqcBLtJjgSHtqsWssdgGYJPoD5JiRyD6Q?=
 =?us-ascii?Q?wO7dX7d4dVauC1MwAjbz0PJuqpWsT1WwCAI0sneK8Eeh4fbOZXTts0YVoabl?=
 =?us-ascii?Q?151W1syp3Qh4JRX7nJ5c3HonHos0DqJttKZwrT5vqLFckWDzrgbFBR/427F+?=
 =?us-ascii?Q?pymZcDn8tOrInVP/YVlnNgRKF2wFJLUMOLnddI5InnkxWpjrS4bozlY1QeCz?=
 =?us-ascii?Q?GkgkIc/EdB5287HnNocjvqrUEVJFmPPKru9tBh5HtLYh9kY81OBw8ZFh7Htv?=
 =?us-ascii?Q?oa5/iqxwhcRR1XpNRKoKuSzGGvMBZdDxHqHcEUQ7X+glFgAvOGqjX/dY/mcS?=
 =?us-ascii?Q?AN5igqd2VrVa9iaVrKD1oRcNi++fI5FLA/NL0PrnlSDOFQeQSyyPDDzlj3Ao?=
 =?us-ascii?Q?t0o6JR9CLNCNLKCzz9SFpCYn5G6WCfHQPXaK3Y1byiF2cx8u0GmwnJ45VpF/?=
 =?us-ascii?Q?K/HYrX8x5OaKSs0FU9Kg6L7zD53sptUp+QS+YRngheoL/C3jilo7iz7yK1YS?=
 =?us-ascii?Q?ArSD6B22zg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 57641783-b50c-448b-4a42-08df2e70d9f9
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 06:10:33.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwDfY5xP1Jn7dDQozP1QExVOMP0mS9cpk3GLFx3j9i1LavbAWHHrGKjqs/5e0q9koAKdfFlutHKXixtNvLfQMFNSQScKXOAUgKb0AyJ6W74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3628
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 06:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248217
Content-Type: text/plain; charset="utf-8"

Two entry tests broke with libarchive 3.8.10:

- testtar.tar is now rejected with "Unsupported pax global extended
  header attribute 'gname'" rather than "Damaged tar archive" [1], so
  accept either message.

- The ZIP reader now honours the NTFS (0x000A) extra field [2],
  reporting unicode2.zip's mtime in UTC with sub-second precision instead
  of the local-time MS-DOS field stored in the fixture, so ignore mtime
  in that comparison.

Testsuite summary without libarchive upgrade:
 TOTAL: 36
 PASS: 36
 SKIP: 0
 XFAIL: 0
 FAIL: 0
 XPASS: 0
 ERROR: 0

[1] https://github.com/libarchive/libarchive/commit/1769a39ecce23efff9684f3=
6571a998533088df9
[2] https://github.com/libarchive/libarchive/commit/4f16dbc9edcb771a19119ea=
af8634ee6b57287cb

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...0001-fix-tests-for-libarchive-3.8.10.patch | 48 +++++++++++++++++++
 .../python/python3-libarchive-c_5.1.bb        |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-libarchive-c/0001-=
fix-tests-for-libarchive-3.8.10.patch

diff --git a/meta/recipes-devtools/python/python3-libarchive-c/0001-fix-tes=
ts-for-libarchive-3.8.10.patch b/meta/recipes-devtools/python/python3-libar=
chive-c/0001-fix-tests-for-libarchive-3.8.10.patch
new file mode 100644
index 00000000000..66185a7493a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-libarchive-c/0001-fix-tests-for-=
libarchive-3.8.10.patch
@@ -0,0 +1,48 @@
+From 10cf84fb4946d1b7b41401be00d22c80366df348 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Mon, 19 Oct 2026 19:27:01 +0000
+Subject: [PATCH] fix tests for libarchive 3.8.10
+
+Two entry tests broke with libarchive 3.8.10:
+
+- testtar.tar is now rejected with "Unsupported pax global extended
+  header attribute 'gname'" rather than "Damaged tar archive" [1], so
+  accept either message.
+
+- The ZIP reader now honours the NTFS (0x000A) extra field [2],
+  reporting unicode2.zip's mtime in UTC with sub-second precision instead
+  of the local-time MS-DOS field stored in the fixture, so ignore mtime
+  in that comparison.
+
+[1] https://github.com/libarchive/libarchive/commit/1769a39ecce23efff9684f=
36571a998533088df9
+[2] https://github.com/libarchive/libarchive/commit/4f16dbc9edcb771a19119e=
aaf8634ee6b57287cb
+
+Upstream-Status: Submitted [https://github.com/Changaco/python-libarchive-=
c/pull/145]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ tests/test_entry.py | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/tests/test_entry.py b/tests/test_entry.py
+index 7c8afa7..6eaba52 100644
+--- a/tests/test_entry.py
++++ b/tests/test_entry.py
+@@ -65,7 +65,8 @@ def test_check_archiveentry_using_python_testtar():
+     try:
+         check_entries(join(data_dir, 'testtar.tar'))
+     except ArchiveError as e:
+-        assert e.msg =3D=3D "Damaged tar archive"
++        assert e.msg in ("Damaged tar archive",
++                         "Unsupported pax global extended header attribut=
e 'gname'")
+=20
+=20
+ def test_check_archiveentry_with_unicode_and_binary_entries_tar():
+@@ -77,7 +78,7 @@ def test_check_archiveentry_with_unicode_and_binary_entr=
ies_zip():
+=20
+=20
+ def test_check_archiveentry_with_unicode_and_binary_entries_zip2():
+-    check_entries(join(data_dir, 'unicode2.zip'), ignore=3D'mode')
++    check_entries(join(data_dir, 'unicode2.zip'), ignore=3D'mode mtime')
+=20
+=20
+ def test_check_archiveentry_with_unicode_entries_and_name_zip():
diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb b/met=
a/recipes-devtools/python/python3-libarchive-c_5.1.bb
index 791326ba24a..ed2ea91e8c3 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dbcab380227a83=
bc147350b40a81e6ffc"
=20
 SRC_URI +=3D " \
         file://new-libarchive.patch \
+        file://0001-fix-tests-for-libarchive-3.8.10.patch \
         file://0001-ffi-Insert-a-replacable-anchor-for-find_library.patch =
\
         file://run-ptest \
 "
