Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B23E81BD6
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 15:08:20 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47940.1770645677833553644
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 06:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xAshj0CK;
 spf=pass (domain: est.tech, ip: 40.107.162.32, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0tO1AB7lnnCvrAemT+s5+5JE/M2dpQEKGn3I94dCRwJihlzZM1A4x1IYEUYXD25myYNq05k2tPZb/CFSuk9bpnBYnkx9MbcNquaxfiVFgM2Sv/9ElU3Y/2m0Ukx0GRJItj8yhQBhkAdDJMLRZln6bgIhuUvb/dNFIWZMk2qGnN+qiPCAoUDLN5anGKMsRFfArgh/y/dqC4ICDOfEXuesaX++H9//aeLzm4iEjZvV2zIQv1F+cl6J1lws8XBZHBeC1Che6VvxsfNZK9JYgJG7ghlwbBTF7+vz4fbLoEoF2Q2nGd6XSkBpl4uWAotBIfUsJMlVbU8yX2QElOrTMjIaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQLpJapQDU9GSNRh8fE/kGYNTwvex7GVr4jrk4dO5A4=;
 b=BpX9Fe8dUvERCBwKcOgkBrEFUqa5TtEbIxItY0iTtzsAjVPolwXEGJeucJxUpxk0DAT3k9j/yy56kiAw5LNvH9nExXBuF/Wxt35DvzNF/mtELwwv3EXsoLsakWd9IUiVQWlVaINWIAZyhLHYCDo6W+A9HoaI0qHoFVpWkyC8bE0i7WfDL37Cxv9GZcdQZ3I0K3ryrw37jjwp8ugjvWJGynEIqfTMGfrSYYoMGBmuiKFUZWBAhIZoxTxDJ8hzUxrIXDH1u5fZmFxFpus2E0PPsBqdjd6Fwq4kZrgC/zZIrTMbPJxkVHCBmj42wWixSeJc+bJkMDS4Cqt1xV2aYtTLmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQLpJapQDU9GSNRh8fE/kGYNTwvex7GVr4jrk4dO5A4=;
 b=xAshj0CK0Efht7MOkQHAJCWf1Sb4feBpYyJKCb/r6f3yO5UG5LdIDccHIIMjCD83/Ylp34KpLLtQ86enZuCtMMnJDh93kweGjI9Ay17aqONUQ64vnkErh0ZTmKkErCOWq0E/ku7nNoSGvAo9XHuBjRnTaqryUlZFzaTWfbZL8EaoCAZo0KBFX7S6Hs51RDhsMadZJu+A+9wCaHqEMplZKLijpylaJDag1rfErpJcFN1qfUkXwl4g6ZT/J+1xzkoISjLOu7Tg1Kl5qiIRCrpLUbuTwSFlLT1JeXkjSmackgNZ1HuqhFWEV8oAZnP2iXEUI09AHloQPmyI0mt9sUko2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV4P189MB3726.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Mon, 9 Feb
 2026 14:01:12 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 14:01:12 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH] python3-pip: patch CVE-2026-1703
Date: Mon,  9 Feb 2026 15:01:04 +0100
Message-ID: <20260209140108.33848-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P265CA0182.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::12) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV4P189MB3726:EE_
X-MS-Office365-Filtering-Correlation-Id: 0090bf1d-0101-4fd2-5f81-08de67e3aec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yTLRGtI8r2O8F+SyYdoy3lpKmdR2aU+UbnBrXbgttHTp5CUD/fGEOzT6RJs0?=
 =?us-ascii?Q?GZST4OeBojCkZjDRKsOQ+QAHZKizUpVTeF1yxa7o6Y0NU0Ld5L1tVR2HlSmO?=
 =?us-ascii?Q?ki22zwCrk0+O6JEi3EdwJ76hA/E+9HDQztiaV1cUD0fyBucp91sv4FqbCFNj?=
 =?us-ascii?Q?4txZXBWc0LDki2nONTj1aE8R+KHzjYAw2lJXnBicWAFg/OdTaZVeTLrj9CAw?=
 =?us-ascii?Q?S2klQIAAUIodL5I8ZyMxKdiYlhY3KjsazNFMGNdOHXLjlkj+mXDySk2BYAM6?=
 =?us-ascii?Q?sSG22fNu6RNIfJm6021fNV7GuDa7rsknvu8tav1aTxz3W2nZpXoDKTrIcP+V?=
 =?us-ascii?Q?JzgPUD0vSGDSojMkujL+N4OV4OGmeRubeSBIBl+VZUWkt2Q7hINwN3sFwjJ8?=
 =?us-ascii?Q?cuncak8W6vNklTlFRCxOQJxsb4ggz5dZzITv1iuZ54hFivtG8OhkijDi/8fo?=
 =?us-ascii?Q?M8K+SNHTR/4snYI0WLf2cYadhOxa8E6CNi2ERJSUxgQph5TGLotKOCxVUAJH?=
 =?us-ascii?Q?grSTO3ebukF0mIUd4r0RxKPzcZ147nrQc/NlO7sTLAUrMCsS2j5pzUy52DJX?=
 =?us-ascii?Q?PMUs/Vz+IkaClp3FE2ICUMt+32LeephFlw6KtbAvi6ILMiSW6LrD7LrjG6Xo?=
 =?us-ascii?Q?kvB6uhwY1QP9m3PN+D/WQIXGRs2vhcBjpX2euHhDmqVs96dqrRW3gAnDzATK?=
 =?us-ascii?Q?+QvIgwIVQzvsRJiW8MJhuCWZl4xQSEY0IBj/QYVvTJFlb6MpAuLdGabbqbYp?=
 =?us-ascii?Q?dsXk74IX7cSgMgEmDgDm72YK6k5kTAWj1eEmi7CzeBMAnoh45z7UNRnEozhN?=
 =?us-ascii?Q?mWnCF3iHcRzhQWlKE67HJby2CAfbg42yyZWGdRolElpGYdxZRnHeKYKZEBU3?=
 =?us-ascii?Q?OLUX0w2oGFDFSKeAaEtulk6Qosb9E2QTaz08R7+NPcUkrhlpAwQ12OiJu3x7?=
 =?us-ascii?Q?LAkKzpDd/WgHvyzeMPlkcEbIIY5v4LmAXG60gqy18D0FBee7wNTx5HBH8EbX?=
 =?us-ascii?Q?hcArw15/DatM1Z5buAwtdh2H0vAdXRBOMUfRd5vkmvtyCO5EpQqXNNgCRGsQ?=
 =?us-ascii?Q?8T1o8xlm6cpUAODPrnB0oScHKhvKTcc6zHh8gGLfcjowWBRwhVbtL+Y41UjQ?=
 =?us-ascii?Q?YkxqafxJKkVYZRjniVUh2OZ0p90+LFfjPpIgvzjzxoswYOzjEZLQG9M1M7yO?=
 =?us-ascii?Q?EBsX/kgm2SgigHQ2O1YXuYndAdtcVWlisCTKFdBZ1WtrTjFBrVGr99GvPD+j?=
 =?us-ascii?Q?iUSdVFutoUvS+aTv/U9vSyts9vOWiAKN8/0wcfsI6BhkfZbed95P2KEJA0l1?=
 =?us-ascii?Q?WmzbsvUVIMb8i58SuYu0Fl5sSZd4e1tGxo6HlIblMJEvUreC1YTMpzP8nTub?=
 =?us-ascii?Q?EAKEauUKiEpZ4MLJLzVQV6s6D7qxmU+rROfzY1Pp8WeIEYtSvDmqA82Ensja?=
 =?us-ascii?Q?1as1RpcqZSuSzVezROYE0CcmzsuugTArTnPOi4KzAho11AQi8J8hqD3DFQYZ?=
 =?us-ascii?Q?m5VFgBH1/3GpaF9mOzBAtBJCGcHaattYI5Lc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AEI2GKM+NzZyzcOHwmpPCPqeD5fhiZtd0DZiGRPNLrMoKhF05BWVC1UFaGDF?=
 =?us-ascii?Q?3PJDN7mY1FstQlEhqZbO52ib63HrVWGkdfAxk4leka5tdaxsvL7Hfg6JibZT?=
 =?us-ascii?Q?X4JGvfeHzsP7JPRon7REPRz/O0CchLb+yG2AKK/46wjrWCVKlPyIvHSsToah?=
 =?us-ascii?Q?neyVEq0XFqAbkLsLMWtSFHcQYfW3urQ5EJ/WYJXyTf3TdarAqOGy0QF0gBfs?=
 =?us-ascii?Q?YAqEnvysX66WcqCAcuU4qmtdaRk7e8EJXmdgOjjwxMeLiMSkMc9NdUUybTNW?=
 =?us-ascii?Q?A88pnyKcI9eZ4AP1mUA3AeZHDjYO0ZjJdBBgop/rInSjmXVReD78iiQDLT7i?=
 =?us-ascii?Q?A9ysneeEwxuh0Ud6uJHoYjuvIKazyVV1laBu9u4DJyN370XYgANHPFG7G7pt?=
 =?us-ascii?Q?rfOQoYEMl9qXkkf9qjZmNIyOxGw7tI7vK0yL2an9iL77IfNPfsZjzi0JAXSJ?=
 =?us-ascii?Q?TDvUx9EByoJo5eMXSKOJVcEzo4qaHqau0+JJKwxYWzG7BFUuOLVCQIGqPmvm?=
 =?us-ascii?Q?2OsnwA35CMfnF1Z10fHBXpu647/DHQhRCBI8ZQo1xtSGnOrZYCzZKxOJd4rB?=
 =?us-ascii?Q?WALdYNWBUvzkI6aTPvKkLAfpFgCAcWO2/rgDMWR4lLmpqXdeHCps9GTdBeTk?=
 =?us-ascii?Q?XuEXLgiejdEVQcfYN90b6+7vyjB/sR8HAXTaLwy6b+l4C3hpfnlZCzH0hUY5?=
 =?us-ascii?Q?3bOxsnVTAE7LHmphisGk/IKHixilEt73ue0ABTh4um5CDbEqlKxLI+8STU8v?=
 =?us-ascii?Q?eFMDIq5YaWJlOv3PrHT265Alj3HIuyg0cdK09s8tA+bA0eMT4RWIJRKp0p3z?=
 =?us-ascii?Q?QoR3vhVxfdE1Pl/M22TnrLHFFZ60R99CVcV8kISSsSbYGkUp0BNZ+1jdOkxq?=
 =?us-ascii?Q?wsjLSNBFdHrBQwAF8hHFoViWpACxRtr0VKvWCivM2yOqurJWB1GmE5cMpAPH?=
 =?us-ascii?Q?Fp5We+fNCJwhhtCjrKFW0/EdTvbQ5EChhq8mdFOhBOiS2Otd122sIG5JyZtk?=
 =?us-ascii?Q?R4q/4j4OPUpqtVgF8MxTbulhCutgzTC3flEEx40Q1rUIsMzpwSWfe1U1rnqb?=
 =?us-ascii?Q?cvWOXacnru/xrrg4uKQnLcXkwixpq21av/7pIRkGuQ4XasJdQCQBmMqcPwXK?=
 =?us-ascii?Q?YWQT2aZ5bbommZSyWY6UBHNCJseq6OJk3ImBizI0ShQINWHJb5VmUwECom6a?=
 =?us-ascii?Q?R7xETeYaVE70HWdrUtzTchhOx0VYbjose4sWehhmNCdKrVXRFmG6zOI6KWgl?=
 =?us-ascii?Q?nr/wQrO9XEkOiUOQwJeA7PCT6OCL7cpG8qW+hh0Cil3CRAWdU9aZBJ7lY83M?=
 =?us-ascii?Q?+Ml2xEYqvDU/AtMabyxUXTpf3EnIyq2W580Hzy1Y8ZE1Xt3rdcfU7+yOMi2g?=
 =?us-ascii?Q?+pGcIKk6+PdILmxReENVm9gP9sdV8YHTLbzN7b6EK1WeF8rYrbaLeRbYuQZK?=
 =?us-ascii?Q?yd51p1KV9kWDgFQW87vJjDm136H4G1yWhAiBm5R9CBcGyvIpX7M1mA7DZLQ/?=
 =?us-ascii?Q?M2JzRQB5CZ4ywlO/gxOFaoFFTEh9YQEjumL0ts4fkcSDXBYzobmJW0CfkqPb?=
 =?us-ascii?Q?24Vz9hJza0Eu+a/NNYLZ2ys+souaNbB5JVhIuD3JPlvKWUb6BtK4HrSpmWFK?=
 =?us-ascii?Q?DLSgmALfWD8JEv6FRsUvzcM7+mzxmr4QH6ojY55ibEGdXzZi6j5mhKRsu3D2?=
 =?us-ascii?Q?VqINLj5vvA7u33fSAxEKeh6Wvgd06RaTIha7dZDBdLKH1JL6aNQ1yu3BYlt7?=
 =?us-ascii?Q?9v+fy/YZxv8yMidWr3hxj4Y9yIquB1k=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0090bf1d-0101-4fd2-5f81-08de67e3aec2
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:01:12.1631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmsYwj3NCAJLB32p06Yed/RzbDtGAGuBko2tNS29zOkArzgugq8u++gKpYRnbvGL2P2Cbz4f52NXvSn7Odhaigs6gK/eVTrCzouwr8ETp9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3726
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 15:08:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230807

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report: https://github.com/pypa/pip/com=
mit/8e227a9be4faa9594e05d02ca05a413a2a4e7735

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
 .../python/python3-pip_24.0.bb                |  3 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
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
index be4a29500a..83f8d869ac 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -31,7 +31,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52baf9=
5163b597008bb46db68030 \
=20
 inherit pypi python_setuptools_build_meta
=20
-SRC_URI +=3D "file://no_shebang_mangling.patch"
+SRC_URI +=3D "file://no_shebang_mangling.patch \
+            file://CVE-2026-1703.patch \"
=20
 SRC_URI[sha256sum] =3D "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b301b=
718fe6f593aba2"
=20
--=20
2.44.0


