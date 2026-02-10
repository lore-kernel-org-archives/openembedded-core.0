Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D8FEB270F
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 20:05:11 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24004.1770741214984780207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 08:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=PAXZAvTX;
 spf=pass (domain: est.tech, ip: 52.101.83.27, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKDhNharE75oFdjTM9/ixxgFjEXt6/bdphpD/kGUxXeVD3/q64pRf/H3JqR94UrZrvY0b9fFBJKOLb00samoT9adjWgGx2or721gDjVSDPFGo6PAJbyskAVlXpR3wEGuAFoz+OdysPYx0ViGdMEAjuFJ+5gI8Ck0zjRqDgOrAg5AX11gjNCWLs2P+QVG2JjBzyRQKvOy/hbURugZPKcTfp0pivGdAa6wBL3+9zVfAMSL6HlEqAFURwnoYe0idMI4tAfmsOFcnj5CBo7fW2eT48t0mFFIxRqt8YnUSJZUdqlWFZIfgj9w8xr+o2vC8c+HTzvdTnt9sNj5IduR8dNV/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4da5lcTU+smsom2NaQMKvKpZ2gQsTfRup+QeTWrc7Nc=;
 b=LBI/ajuwtiypt2S8TbKJ/L/WAHDUmTaY5EPEAu1cUnkAwYb+joLY5+2+2vp7sKHuukSz/3FB1UVE5MmOvDPj8pXhI4JpFE05QUnVABZaCeqf3Yi/hPpT9JZw/CfcXnzv0E7XRt63ot6tmMoHwcKWt7S9qbXnS1ojK6P3l9idqvP4mF2sslDGytrA3Lb22zwF7joTHL+1bzToTW3bjtugu9YibC88Pnk9FU3vDhLGe2w1FP6QA0WugFSL0XvIoOqubwCt3EjW7biXzqs36WN/Dcbz6gvu2s9SrrnTq/zOSRjQ1rhK/Q6b9iIAoS+pPFS4aOOtmKbftgJU+8w/PU6aEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4da5lcTU+smsom2NaQMKvKpZ2gQsTfRup+QeTWrc7Nc=;
 b=PAXZAvTXSokpBpzFqWucDbbp8oEr9FFj0quiXGt4CvYyA9dRdwGBNiEw1abnSRcVuqJNiHmLL93N/GkUx2OdTQKs5AF5ymhyTA9Tpj+o5Z5m19WPc9TyC+95FC+BBVD+AkhoHhtTfD5izgRIFLHczlsrWqbl4N6XKaJX4e7rQv/Uvt3hUWqffT2EDzy6jQI03QYClFaJubLR1/Azs8Nmtb1nkVpBLJ0t7Xgfses9PNrmdIYmAULBykWgGIYAXgIuUcuyf2ma0//DGi1TBb7sYxjGL0A+FCG4GzhnwpyHwbkIPnUZ3g0W+CdXHFpWg/8WcGFKL6+rOJzFWyAoHgm2zA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU2PPF839CF08BF.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a97) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Tue, 10 Feb
 2026 16:33:31 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:33:31 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][whinlatter][PATCH v2] python3-pip: Backport fix CVE-2026-1703
Date: Tue, 10 Feb 2026 17:33:21 +0100
Message-ID: <20260210163328.91807-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DUZPR01CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::14) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DU2PPF839CF08BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b247e63-52ff-4274-efb8-08de68c2207e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SD47vuBqH+j4BDDVm9X76df5Mrn/aui6Mo3QzM8f2cEwbj0p71glRjF5uI0k?=
 =?us-ascii?Q?ZagwkM7CneY+ax41+EAZpBU9LEKRC8P2Dxw5/g/ctR7/O7wKixu2eabgPGCv?=
 =?us-ascii?Q?N/GVmYJQPFzNpJwsvLYxfw5PxkBPMPkCLO4MkOag9JdUdREaI5HODI/80qjB?=
 =?us-ascii?Q?Or14V/99JuKCW40c4zudnVwWh0d9dXKjnLFgllvLkB4Aex/vRpMv63RPXA6D?=
 =?us-ascii?Q?7Eac4JdKX306lY8/SE2HVxa5wZPMWuUXnE1Zeq21UxOYYH/2HVVaPrKy8zUc?=
 =?us-ascii?Q?E01amcgr1U41IxgC9uCSFOf/LIuAqyZMxNBYU+HvOAlv/GAQAd0ikOw87dy5?=
 =?us-ascii?Q?gbdhxIdBbGRp97Su+3yotnHq7PBpPwo9iuAW7Y6mbNkjMRlTIB6BIUDG/wLZ?=
 =?us-ascii?Q?EZiboIu9FRPpIfGxEZTLovJ6kJvNmjgV1os3LE3E3oftDoGki5duXlFTdHek?=
 =?us-ascii?Q?2ZvQbEMq3ynL2CldWF8RDeI4wQ6/firOT6Brd3pnFmnHGjNWZ8QiPrerITLs?=
 =?us-ascii?Q?V0wIpgxI3Lr/dVqIzAV+Z/SIrjcvID9UZHdVMJrp9iBo/4T+I9j4koix2Ek2?=
 =?us-ascii?Q?c1Y79MyKIikL0hUlL/ZvGsHYBE7BwwYLpCghCMo2Xz2oj/byJApUzpSQ0/yu?=
 =?us-ascii?Q?UoNwKKaLT8Qmi1KySn7S57Jst8Zj+WQzq/pxuvm7gAKv5A7Y3VCZzIM63va+?=
 =?us-ascii?Q?x44+hch4r0xsY98hDNA1+hNQTedRi1DtuZ01aqNlrOWwiUei03MC6vXybOZo?=
 =?us-ascii?Q?Y1ZMy88NxWSh1N/AX5sg0BFlIg/8tO/MIlFyVavXlUjiFVk2xH58kgwvk2R1?=
 =?us-ascii?Q?6EqEvC0s2uiMY+yrTj/k61D034UxFf9jkWLFKf7bsDx902i4qfsT6wVqefkx?=
 =?us-ascii?Q?uH4nMJ48cuSLD1RxU1oaCaGfVBX1RiiD28MsLSuLFNTRhD5AuEHoIapYJMe7?=
 =?us-ascii?Q?FWO/LLGRCz4xh4xro/LqtmLMdFPcSiOd3kosPbKol6S4UUuvWDHFZqVucS+P?=
 =?us-ascii?Q?hQigvwKLkdmH/3nrhrzRjbA8062H64yUKG5chNWBHYcgS0Ol6BQUOUzj2O9f?=
 =?us-ascii?Q?gikB2XKnceAgdQtQX38S7+9GNBQS+vQT+TmGwnVcIRVuuf9FL82xKSDgSyMm?=
 =?us-ascii?Q?OlWH/w0h+/q4PW75VzJJ7L9qbyHgg+lpo49rtZxzMfRU2Kf+e9t0ZaIJx/M1?=
 =?us-ascii?Q?4AsVTSNGpJluizdJq+jvIcbJa7v1N3UvtuI2wDtHs+hShZQja4uFEYnf0laz?=
 =?us-ascii?Q?cQ9QXyMthDl1WC8NO6zc1d77rYWWOfmoBhfIiEq70oS12XJqatbK1pzWWjM8?=
 =?us-ascii?Q?nOuPoE5LQuaIx7vMGAtp5zjUzXtW+657Ci2LWaxEt4FrKrkCeNeZbkiwMOfX?=
 =?us-ascii?Q?RitTjPiqWA7tasiZZL1ZPzEJXi8KuhAJIj3gRtnp8MZBcR10wZyqin1WNyo9?=
 =?us-ascii?Q?Quy7GZoT75XLLj8XHgKF/3wVM8VEgaQCFEUDfKzwfllbaGXgoFC5GD+Hqjeh?=
 =?us-ascii?Q?y3ceUCSTAzViVntV3V31uElRd6m2IMNSnsv+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qedex9bWdbhnh+/f82Y+iAbua0PH+RnGs8npQnyIyMU5vsABF7RdFGBaFXGo?=
 =?us-ascii?Q?ggyqTdqAc/4++o86Q90CVkKeGwTz4PCVmE0ZNV7eTZL8jvV1zrVyw/rVJEPf?=
 =?us-ascii?Q?LRbrURiin5JD3APUArA4KGMxtSzfYlUGG5kyZ+QV2HSwmPyO+WNzkMqFEUrb?=
 =?us-ascii?Q?DUekq7NlTXQbz6yt4/L/ZbqqKfSANyspqUCJ+nI4U4bCGgd6WE4vARt/B/76?=
 =?us-ascii?Q?KSVnxDZn73jBHtcgvTgWvLB1oMdLi+GAfO7DYJUZLD6be3hgqjgJXGe7Uhcc?=
 =?us-ascii?Q?ukKSeI6JdCRVC3tXzh3P9IG/0+SKYm4A8mVC4AOtkiclYKLYTOlqWNxYotob?=
 =?us-ascii?Q?vCuxm1y22mDrAf/9WRKYIul13OXRzNDeidB/RW2S/P07WAihfBpkt8Kpes/T?=
 =?us-ascii?Q?lAzRpUJDXR31BJzL/1EfdRIhEtc6ZAHdPQRTIjURnEK/V/nu8JFmutXxyd9U?=
 =?us-ascii?Q?XTUt8IAyDBJWrcrGlBzOIwLdI3kWNabay3YWCxL24H++J9IY/6b4Y+e2YvMp?=
 =?us-ascii?Q?ZwbglC5+nwE737ZNDm4G7rJWEDaSNbQ42PFJ6p6KvTuK8cKfweuZly76i3mr?=
 =?us-ascii?Q?ViZWd3efSglDqIWYqGYRczmmzaKJ+wcVhCnVb9/nmJVUvHsKccRCfawVBRRm?=
 =?us-ascii?Q?0v2tI9DZ4cs/rIeRiRlbNeAxq8iVqbF5wXeUkHx58YvZ/gMtu4fVgWj1Xi3x?=
 =?us-ascii?Q?m+gdb0bpg06/iaajA7Y8lZrxDczANszL+GuAm4MFAp9TUnK7/6yI28tSaYoS?=
 =?us-ascii?Q?8Zr0j/biLXLmfWV2cJTL7BJ/coXdvx12KSUFdIGYXDSQwn5jzKfy7i7LNJL+?=
 =?us-ascii?Q?0/o/B33TxBLTQ2ZR67PPyWDZu8mSRO8gTBa5Fge/qvkj9+IJgyC0jvaun+5C?=
 =?us-ascii?Q?UBoMD9GQ57SdQyw5NzCwBErkdpHVAUIyLWyDFZzBfVzxdAF81oQmY3mKEuZC?=
 =?us-ascii?Q?xUqNZu8Uejnt0ZjyNJsSurZvk36PuOQwksQsIAc8nWLCFtJvs/ELCO+WJMOI?=
 =?us-ascii?Q?pHK+hlox0I1lsfily8AuJagz9Kkh00ddynRpXSpM2Up27yd/oMXPaS0s+I4S?=
 =?us-ascii?Q?G7k4nkwnsRVjOvRFrPU9FsxNCpGmJdMdEoYZm5DrUNieCsawwcfJ/kIA5fI/?=
 =?us-ascii?Q?zDJd6eXpEZW8vy1vP/a0iy/AQAaqd4zHhZtbf+uca0BDKoD+5Hv91Y91HKRX?=
 =?us-ascii?Q?4vrpdSoMlKcuUqbhFMCJpk7wsa+Lj/3V783IsOm3NLDiWJ0YuY/K5FYAY8ef?=
 =?us-ascii?Q?9ZRQh+yd8lXHGeV9HMdfVRgC5U+MRDyA2VaI/2BIvG1EeUlTwFpPE23hSxzb?=
 =?us-ascii?Q?AaxfuKfLIA792Ryc66svD9vE8FqrcLIgma+yAVPtDvNXZTXpFX1IQHVy3MFR?=
 =?us-ascii?Q?gARjDwD7nqrDCGlgq9GJTUydRvwSQjcRFcRP/oZApOwggZ6wPqmwawr1PoH1?=
 =?us-ascii?Q?/D4SEtANgT+IhHK6+ySZT35qQFvyJBg5WfrBWSMN3a/QmU/GzQjcKLlsM6wK?=
 =?us-ascii?Q?A+J3r5feIqdgMZL70aZ1dbzsTdZ6ekJ2HJwcfkMRKlXiwxFv9O5lVLryWHCC?=
 =?us-ascii?Q?rZuDfP50Pyyj1JypAaJCP1rPguGHn7ZRD0/y5Tk40uUWBPnJYmTwb1+YBwOq?=
 =?us-ascii?Q?4hrNrrR0guoWNFfEQfY89j02FzAYSECrTZEUkQYk5QpYzB1SzE8YyRoosKwy?=
 =?us-ascii?Q?aMR2Po6dOwxuuwzFla6n+21L+A9kRFUUptYwMGTxhiT2fPTwAybHWTJVhXWr?=
 =?us-ascii?Q?NHqRH0HPCsRQlAcGpcfy2qhBYRfUbIk=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b247e63-52ff-4274-efb8-08de68c2207e
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:33:31.2821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcuDY+dwnp4O93zrpF7hR337VuQgfmJckCMDu6hSLZH1f9E2icnOXkKXVrFfQKG9RbIwdXJXTs2rTeuGACj06pbPemp/G8SecByfTcAOvGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF839CF08BF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 20:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230934

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report: https://github.com/pypa/pip/com=
mit/8e227a9be4faa9594e05d02ca05a413a2a4e7735

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
 .../python/python3-pip_24.0.bb                |  4 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.=
patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch b=
/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
new file mode 100644
index 0000000000..8d34d2acb4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
@@ -0,0 +1,55 @@
+From ed41e052ebe78fcf043c43ea05bf16f73dfbb581 Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Fri, 30 Jan 2026 16:27:57 -0500
+Subject: [PATCH] Merge pull request #13777 from sethmlarson/commonpath
+
+Use os.path.commonpath() instead of commonprefix()
+
+CVE: CVE-2026-1703
+
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/8e227a9be4fa=
a9594e05d02ca05a413a2a4e7735]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ news/+1ee322a1.bugfix.rst            | 1 +
+ src/pip/_internal/utils/unpacking.py | 2 +-
+ tests/unit/test_utils_unpacking.py   | 2 ++
+ 3 files changed, 4 insertions(+), 1 deletion(-)
+ create mode 100644 news/+1ee322a1.bugfix.rst
+
+diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst
+new file mode 100644
+index 000000000..edb1b320c
+--- /dev/null
++++ b/news/+1ee322a1.bugfix.rst
+@@ -0,0 +1 @@
++Use a path-segment prefix comparison, not char-by-char.
+diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/util=
s/unpacking.py
+index 78b5c13ce..0b26525fb 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -81,7 +81,7 @@ def is_within_directory(directory: str, target: str) -> =
bool:
+     abs_directory =3D os.path.abspath(directory)
+     abs_target =3D os.path.abspath(target)
+=20
+-    prefix =3D os.path.commonprefix([abs_directory, abs_target])
++    prefix =3D os.path.commonpath([abs_directory, abs_target])
+     return prefix =3D=3D abs_directory
+=20
+=20
+diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_utils_un=
packing.py
+index 1f0b59dbd..724ca0be8 100644
+--- a/tests/unit/test_utils_unpacking.py
++++ b/tests/unit/test_utils_unpacking.py
+@@ -202,6 +202,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -> None:
+         (("parent/", "parent/sub"), True),
+         # Test target outside parent
+         (("parent/", "parent/../sub"), False),
++        # Test target sub-string of parent
++        (("parent/child", "parent/childfoo"), False),
+     ],
+ )
+ def test_is_within_directory(args: Tuple[str, str], expected: bool) -> No=
ne:
+--=20
+2.44.0
+
diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipe=
s-devtools/python/python3-pip_24.0.bb
index be4a29500a..35428260c3 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -31,7 +31,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52baf9=
5163b597008bb46db68030 \
=20
 inherit pypi python_setuptools_build_meta
=20
-SRC_URI +=3D "file://no_shebang_mangling.patch"
+SRC_URI +=3D "file://no_shebang_mangling.patch \
+            file://CVE-2026-1703.patch \
+            "
=20
 SRC_URI[sha256sum] =3D "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b301b=
718fe6f593aba2"
=20
--=20
2.34.1


