Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B98C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 17:32:26 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16992.1785346336600857221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 10:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=sFVVACIk;
 spf=pass (domain: est.tech, ip: 52.101.72.30, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6WLWwPemKPcoFTpalNthNhFV0FOUCDUhgQinY0RpFzFgrhxZ/BTvJc+lYONA35cPYDLD9FovtRLD+JLUyIzk97jWK8S76Qjp/r5/+Lu+r7VySQgot510toLxCT652ou1LcBggFdBAom96vbiQHNMNLnWIqqEYho7MxjQLZ/7BHpE/GiOd7vnEibgGZVZVHwagwgBI1yJlvQvwVbuFKMLM76D/si3B9yhxeQdymV6NnTODco7o8HbEZ7FZ6U9JAS6rOP7XGc9pZSbmkULg2R+mqpiyUZj2JXsY2ajWXZpFEuc2FdY2tf8RfiRyRhDULtATOCo/lrA7JKfroGUk4uRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tj0lxpiVTN6unbFxIo/tpMz3BIIxbgRQnhX5Wn0Kbcg=;
 b=gmbHFCoSWIjm3OwpptAuo7Q2eBUWgiZNLoh4n0188cytw2inLf7v4pEnxTqwJMr6u0x/QzD7GH+ue2RkshgUeOrQ9aw4WyPTknkHxNaXKNA3/toHr0BD7RL6hdi6zl3Sac1kmhI4ryxh6ff3zUB699tTEAIncZCX6OUVOg2giCxoTB+oRuwRc+LmKa/GSuHuuEzaH/bH9uGCfTL7wrM9kCTIWqhv9b9uvF4qBkFFFppIxm5DSpE60kJnfe+QkiMBAHBqrKyqcOFZouew7Mx5sHTb3AXtAJA6xZZcZeOXxXatH/vF1RkO3Vkg7nlCH5q5L1+/GbnQe6HFpgwj7OlRcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tj0lxpiVTN6unbFxIo/tpMz3BIIxbgRQnhX5Wn0Kbcg=;
 b=sFVVACIkMCc+nQ744OaHfNqlEXGtboPfImy4K/lHwAHpEnLfo7/n81RKWBWpEFRvIcFFpRSi+IfF0MKAaR96zJHF2/7d2HaWAbyYEJ01EBGl6YVFzKs6q7XJ3O9pSecAbwSIx2QWc6Z5vr8cxQoNnWtBxOlBhgCOi+oNLa/czl8+uMZeIneb4+dOv99EcOo6ufSNLpfKnom5jpV0JqSm+Fy99ZCF/emdk6y/alpXLwZA6B435+Yj1wa5zft3ymwm/BEy1Kpi/dPdT5sjM15laSppBVKfUCtlRVhm0uCy1/pgKfky0Bt+sCvy8PnvGgQIoV2ZX4yRlIQDOe22iVuL8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PAWP189MB2609.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:335::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 17:32:14 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.005; Wed, 29 Jul 2026
 17:32:14 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 2/2] libarchive: fix ptest failure when built without crypto library
Date: Wed, 29 Jul 2026 19:31:57 +0200
Message-ID: <20260729173157.71731-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260729173157.71731-1-jaipaul.cheernam@est.tech>
References: <20260729173157.71731-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF0005F6F7.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::24c) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PAWP189MB2609:EE_
X-MS-Office365-Filtering-Correlation-Id: 866f8d24-33c5-4221-61db-08deed975409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|23010399003|366016|1800799024|13003099007|10067099003|11063799006|56012099006|12006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	G/w+Pf9zk6ekJXtqNVYUYSv+AyLWyluRhwJ0aRJyZSUk40JFu4sX0xjCXJBtnY1sROo6bKv8GjrjFXKjms53jq+dPTk2Pd++aj/KOLeygjwkmBo2FgdIzhY3QFIXudRYa6iwpqLDXtTU/xtv6p/EjAGpqV2QzYt8BFBYQaMCGDuD+YJqFEAdiFZmQSTrmtH4CXGiFHJtua5XmPV2m6yrBpnYW2k8WinoFzxsNli9EGeqhWqBI2PUgWYhOVmsPQuH61GEQYnVIHEBudbAp57yINDHcyiTtA3DK2ioKQLGRl6rAGQQChXX0SwpXri3q1NuhkBi6Yl42jEcjxZlur2ZoaMp1HIY3mid5RiAd5YcYpw96QPv5ACla9emtxS/MNUd1DH9X8lfDRE5NWnpH6+NuQ4044reTmCz/m6Kx/GE5ID/I0JED/OUb2hQZRS/Poi98X5+dcNaIXCq6VG0YQdELmH6gEUQQ6NvvgNT3JLjKU92qeP9olajQX81uTz6HrYVTCLddIQ/xNzbbhGB9Fot1cNhZHu2UkI8wJ+LVfHwwEUEPIxe8PuieHt4leJlIVztUKSrSq6QQYzByjYkifqxjDs6xdRP3NILJUetrp6Fih8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(366016)(1800799024)(13003099007)(10067099003)(11063799006)(56012099006)(12006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4lZcqUP9HxVNYuLBzTXfIEceD5SeG80k4MLeL0cev+uFW9FetbqRjw1waCXr?=
 =?us-ascii?Q?eEmPA0Wl5WevujVu0JmT58N/3aJWzCJFWsyBum2JM9z+q32MpZOpX6axDLXs?=
 =?us-ascii?Q?sn8gvY2kMgW6AAoZQmiyPVx1zlL8qJ0Pe6a+6uQLHWiq2LSxe1kvFLe1lk33?=
 =?us-ascii?Q?YAoDVQsKiyaFbnXgp4p9C4gyDBYbt54f5ZXifV9ZqJ2757f5DAj7EVTKrGiv?=
 =?us-ascii?Q?VO49KGZNYJHVqlxEiMZ/gS+n2OQiB9arxZDcw5rsz0ufAxNB2u75T/MTCCBl?=
 =?us-ascii?Q?nIBZY2TT44e4cvKxT2QS7vxlHgWuEO3hmdZV6Zz5peTMunp67VE990hH4LEc?=
 =?us-ascii?Q?/viLhw5zIueJRqX4RZeS/7A9PXkcxwLrIG0ym94W+e0M37nX+Y/t1A6TZpel?=
 =?us-ascii?Q?QJGQeLUIkp7/cowUi8r28OgPlZVIYNSV03W13hpfq02PwOAVpzF2CFWhkd32?=
 =?us-ascii?Q?sfE8IKiL4T3719TojIy6uQQ23QIS9uCrfHvIg2KExSqUn8fq3Sq8l7OB63qQ?=
 =?us-ascii?Q?dnoVtll80P6IPjJ3FJ0ycwZtppGAibptqsYW42bOokDb59+l7cZDr87IhWDi?=
 =?us-ascii?Q?1IVp7Fd/UKgAcZL5cQI1nXPvAvQfsb2u2EKDLsei9bXmGSy1dyFsywtlEp4j?=
 =?us-ascii?Q?scg3CWT3scss/pjsa1fRY/AxUm8kpwSTVKeCJxbH8dlCpFt+ajnTIOVTT65c?=
 =?us-ascii?Q?1P5HLCzEkVGkSUS9yKMI58EPdiyZ5QYp2TSMtpnz9BgDQ3Inql2o8CDNvunC?=
 =?us-ascii?Q?pjpekRVqbix0ojcwZqDjWbTIVJ7atRwepj7hNcsMhRb1NVO/ydUJXTdyLHkP?=
 =?us-ascii?Q?Q1Kg/g/evFhOnwiVzgxevYRXbS+tECU9XdBusYD/itOicR9NPNhdFMsTiQO/?=
 =?us-ascii?Q?s4b8jIw6cvO8/eYpRyxWKrYAJQLOy0yX/H2zaIvCd5wog4AmqEOEL1JMgXpY?=
 =?us-ascii?Q?ffdYGltzTuHo9Uv4vXmn0xHDgDSyT9lAtlGw7SV86W9fERtpwU8b4F8mDcRD?=
 =?us-ascii?Q?O8k3sJEDJX7U6znnjry7gVPdisiBql9jqbkauzE7Rihmh1LNa6C8dfMC8K5r?=
 =?us-ascii?Q?As6W2dm8RdMz40iXthrTRz47rlB7r15MT2H67g42S1jTFX7Qj//tNM3Ay2Ek?=
 =?us-ascii?Q?8V+Bd+zI5IcTk1GXezAbgu26d3S3sH1mzU5/VIQNPjta2WR7KNsTefTHq4QL?=
 =?us-ascii?Q?4JrAYeQY28SgxokhVtZ7Z/dIG7Ser0em4gP9K9TNSMKQyovTD7VaUSeYiyLN?=
 =?us-ascii?Q?ZZw5ZFPTM8LZAP8OjuBiltYeNfSnHS1ixZN2wit0PywZtKQvftsAuE6wCmHx?=
 =?us-ascii?Q?w2APDqGD3pI/z14KTjOGY45jiOOQM1tOPDy+jiR869QR1CDe0X9i76bzPGc0?=
 =?us-ascii?Q?aprpP8FV/EsWZLFQ/ja/bjzJL6qPB8C+FoZllvaEEmKdnHmXcKzPbCnr08QH?=
 =?us-ascii?Q?ugJL3rARlB4uU/S9Ge/tCqYOuuNzjSCWOZCxOcn0Vmuv4SDuQD81uzW0Phlq?=
 =?us-ascii?Q?OxCA2FbWcQ07FeptMRX8hdcTYvxYc/7UbUgJfVJCO0Ml2CT87atmXE9rPgCH?=
 =?us-ascii?Q?qf+lcKnNPW+kejXE3bJ0sJiICYNQabPhEBXpBJ7Tb3p/kIw3MPREQ17Tkyql?=
 =?us-ascii?Q?vkLMPkvm8DuJVQV3xXeAoF20F+fhBl6G949o4sKPqbqEQH4Kma87n+1WjyCr?=
 =?us-ascii?Q?ss5Rq/ZHM21I1yGnZ5a+hZWFe3nlxxyUEtZtv0YDOUui3jfEVzlPv83/Q00j?=
 =?us-ascii?Q?8yi651AVk4TIJnhAP5MWctie9BLhzd9mwCNFYNrMxAndmMu7qMQMTNpf0kUQ?=
X-MS-Exchange-AntiSpam-MessageData-1: N5hoHZy514JWguOVosF9KcLjLXvCZ6Eog4s=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 866f8d24-33c5-4221-61db-08deed975409
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 17:32:14.0384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OS4CHj9YOWoRuEiA2HI3Kt9W4DBub8pKwKRMKVxfn+tjsckBXzjzEQ0AQqScVCwzNYbm/Mz4DHWDRummaJ6P1iIT1GSNmUa6bmU8bROkzrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2609
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 17:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242283

test_read_format_zip_ppmd8_aes256_streaming (added in 3.8.9) fails
with 6 assertion failures because it attempts to decrypt an AES256
encrypted zipx file without first checking if a crypto library is
available. The default PACKAGECONFIG does not include openssl/nettle/mbedtl=
s.

Add a patch to skip the test when no crypto library is present, using
the same guard as other encrypted zip tests in the same file.

Upstream: https://github.com/libarchive/libarchive/pull/3335

ptest results (qemux86-64):
                        3.8.8       3.8.9       diff
  Tests run:              797         847        +50
  Tests failed:             0           0          0
  Assertions checked:32184686    32472682   +287996
  Assertions failed:        0           0          0
  Skips reported:         237         244         +7

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...aes256-streaming-test-when-no-crypto.patch | 46 +++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-test-s=
kip-ppmd8-aes256-streaming-test-when-no-crypto.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-test-skip-ppm=
d8-aes256-streaming-test-when-no-crypto.patch b/meta/recipes-extended/libar=
chive/libarchive/0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.=
patch
new file mode 100644
index 0000000000..fc96225141
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-test-skip-ppmd8-aes2=
56-streaming-test-when-no-crypto.patch
@@ -0,0 +1,46 @@
+From c2b00a5fff659bbe8d70b5e00cb6abb831170aeb Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Wed, 29 Jul 2026 13:33:10 +0000
+Subject: [PATCH] test: skip ppmd8 aes256 streaming test when no crypto lib=
rary
+ is present
+
+test_read_format_zip_ppmd8_aes256_streaming fails with 6 assertion
+failures on systems without a crypto library (openssl/nettle/mbedtls)
+because it tries to decrypt a pre-built encrypted zipx file without
+checking crypto availability first.
+
+Add the same guard used by the other encrypted zip tests in this file.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/=
3335]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ .../test/test_read_format_zip_zipx_encrypted.c     | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/libarchive/test/test_read_format_zip_zipx_encrypted.c b/libar=
chive/test/test_read_format_zip_zipx_encrypted.c
+index f07e1e5c..a0a431fb 100644
+--- a/libarchive/test/test_read_format_zip_zipx_encrypted.c
++++ b/libarchive/test/test_read_format_zip_zipx_encrypted.c
+@@ -257,8 +257,22 @@ DEFINE_TEST(test_read_format_zip_zipx_zstd_encrypted_=
streaming)
+ DEFINE_TEST(test_read_format_zip_ppmd8_aes256_streaming)
+ {
+ 	const char *refname =3D "test_read_format_zip_ppmd8_aes256_streaming.zip=
x";
++	struct archive *a;
+ 	size_t used;
+ 	char buff[600];
++
++	/* Check if running system has cryptographic functionality. */
++	assert((a =3D archive_write_new()) !=3D NULL);
++	assertEqualIntA(a, ARCHIVE_OK, archive_write_set_format_zip(a));
++	assertEqualIntA(a, ARCHIVE_OK, archive_write_add_filter_none(a));
++	if (ARCHIVE_OK !=3D archive_write_set_options(a,
++			"zip:encryption=3Daes256")) {
++		skipping("This system does not have cryptographic library");
++		archive_write_free(a);
++		return;
++	}
++	archive_write_free(a);
++
+ 	extract_reference_file(refname);
+ 	FILE *f =3D fopen(refname, "rb");
+ 	used =3D fread(buff, 1, sizeof(buff), f);
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.9.bb
index da792374cf..63c66eea81 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -31,6 +31,7 @@ EXTRA_OECONF +=3D "--enable-largefile --without-iconv"
=20
 SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
+           file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypt=
o.patch \
           "
 UPSTREAM_CHECK_URI =3D "https://www.libarchive.org/"
=20

