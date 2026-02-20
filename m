Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B22CC55163
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 08:39:51 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34406.1771576781116936794
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 00:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=pUK/bXx2;
 spf=pass (domain: est.tech, ip: 52.101.72.37, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5kYpe+v0hHh7sDP3g++vGHC1mw7ERCXPhBWUKnZ5oeAVZoK/e/NqhtoPxiNCXjrY1fEgNHUmKXGU4fwFBUpR19p8jFAP3aY70N05ZxZKOP96AN3eBhVwei61YdPSYBQpcTmpukR02/fMNbbnwtgMR4129tYBgw7McYnx9Afq2UDHf5pq1sE5rEsFWLlKPnFA/bAWelGzeS5aMnoxGHschTmCJbc5l92emqegD4YFtUBfM/3Cotmas5K11RlPsniLY4DjVP6VwSeO9Bgk2h4CwI1HyEuzE/BqNQD4jTt1AWjG7TnAVVLbCu+2HPtrMz4vGV95CdwGpNO9GYJ43xvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+0I426xrVDiTTRGmz4eYGxvSxWmdJhV9q9Z7lTp6Ck=;
 b=tPTNc0xmjws5i7IFoaE1V1/L5F3YXErrZoAGO51qS6JvIb1oTsU2TiFfeWpwBpet5OTxU921xTNuigXAizbcK57S/0LR1lzxgCNforbDL+K5DumMZGH3Yvk5PVBMtF336cDxoDzAgn5nEgLc6As7EZPYG1hjrtI3Ni+jNXu83dVPSz9pD8zBuhU/qffbbUNq/DHE+Kv0cafbCBdFwj4rWZbGe1qceosf0TrCH7CHY42l7pqFl8omERWkamri0qtWIKqqQDBtLZqtvx+SqAHhnotj0kO1bY2flqAwLsAic6MOQOad5ukvP+DeyxhdYmLk+2RAh3NfRVUtK59ZerIxwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+0I426xrVDiTTRGmz4eYGxvSxWmdJhV9q9Z7lTp6Ck=;
 b=pUK/bXx23oNlsID8ZZWGp7A8IV+YtMRdV6Cd3lbRFtApizLcLx01LLNoK7TJ+6kzlU5JNp97UitpVIpd/nhlkgeoRZ2szQjuuaOSv3m3z1/NDxjSRk7r8XdAhqTo2NDlIAPSJiAvCc1V/iUQXJf+ALoLaDKDcnDwP5NxH/bRfXEaRWoqX1bbqpG0VOVkTYb9GY43TTguW8DMNT5G4wZGh9vaeaOmNUMf8aricynmL4ZchAFs2Utu0aG8sXQPpbpeSTwc8v4T1UIqNVtjQRroeVDxE2yVuey2230uA4wUUrR2ZmS6or3aRrUud22kGMBvhDHQLETTshw4wp1xH9Yw5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AM4P189MB3524.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:39:35 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 08:39:34 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	steve@sakoman.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][scarthgap][PATCH v1] libarchive: adapt ptest support from master to scarthgap
Date: Fri, 20 Feb 2026 09:39:12 +0100
Message-ID: <20260220083912.8864-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0596.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::10) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|AM4P189MB3524:EE_
X-MS-Office365-Filtering-Correlation-Id: 1452b607-2912-49cd-fe56-08de705b931f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UvwV4tPbVIikTc8j+R6xwdEodThD04HyT12XNN330fM6oJTr8oDCStWfzGOD?=
 =?us-ascii?Q?6SGH7kMzaAAxnGqQdj9IfsD0SttvMrKIBsC4fs5SiJAFbNqE9qZvxBmCUk9i?=
 =?us-ascii?Q?QORGXoKoW7168t7drdJKrXRFxIYe3B2dLz053HPrY/8o+v/3P+GFOhQj59Wp?=
 =?us-ascii?Q?GOtFMLQ5kM4FHzr8xonNyjSCPByW6E0Ovl9MsyMbZKUtbPa01kEZywnX/i/p?=
 =?us-ascii?Q?DVk03EwxBjcVgGr+hUIBNcyUtZGvkPJbKtqU0Ztf+AEealZL6in6i0IeHsoN?=
 =?us-ascii?Q?HmKi20gxS7HCcy5dtWShIjG5uLEcOt9ICqNyHHaPFq7Mpbi/T9+/XePXU+Si?=
 =?us-ascii?Q?ZSFdd0J6q3WcPzn2N61pQExAxRVN8YWebAdb1794SXAyg+8sj+ezpnQSVkXT?=
 =?us-ascii?Q?x3A+xheM25LYkLz8BLba7ZciOI1fYPhfxsZaIgKM1YetZ2eEsGLxLar7cmbq?=
 =?us-ascii?Q?emAPG3XS/wUpOCL8KCqkQ05mNqbCvUbxJxlyawmGcq1oVE9UfesV6nR9yyzc?=
 =?us-ascii?Q?oyL8JklPw684RSQDpuB8znD4v5NCd0yQs3VNAevVAUYzIBCccy7OpPD8DbZv?=
 =?us-ascii?Q?y9zZa2mG3vfiBRBVLs7ggMbTA3vySf2PMDuJojEaIHGJZxM0CG7NS0rRnlOQ?=
 =?us-ascii?Q?h5DWwn5TsHJRr0lI6aX7lHIVj3pM6svwMHlifeAhgla1MDAf1Oa01ECjUVtC?=
 =?us-ascii?Q?mwF/0eACjxnimk1+8+jyxbbjRT57DWQI33HW3/cs8B5Xgpq3MVWoj+MEjxng?=
 =?us-ascii?Q?vZjsmcH0LWHRbs1Lh0idNoSk85nMVRFnJYOvRH1bZuBL7CoF8LLKDxXAx5Qe?=
 =?us-ascii?Q?ZCNNWQZE1xZ/ypYhzMgKjcO+2N54dOfpyeqT1tdKd+7LI5QNKDx1aTE138Og?=
 =?us-ascii?Q?q/LEi47wEKLQ5IXhgvBicXyWrEMOe7iViGo4MhvZii7Ho0a8iQgScszun9f8?=
 =?us-ascii?Q?tMIVANZVsxP7kyLf2GreH+y78KBV/4xcNW5UvPMoNHeqVh6OpJbOMC5jJf6w?=
 =?us-ascii?Q?BqCrBl0NJgP5nqZDqMbMvkt6SKCicP8a1nb+n9BYEmCfxm9SILxw42ATV1EO?=
 =?us-ascii?Q?wJisgTNx6HL1ThcvDkrn3kB7hYhntMpEGkEcmlK9Yaum6DNKVswNXP1wHJqX?=
 =?us-ascii?Q?C3yxAn8m4GxJfzCeeyxmcae5V4p/nv6xI5ZkKnmXw/6XYqI6W8ffh4/iNb0R?=
 =?us-ascii?Q?bTwJX0nVdHmbg6rnDSouZBPSAFz0phV5WpiBb4cy4d8eZkCo78MaNgyWAcg5?=
 =?us-ascii?Q?3Mcoj5kp4XuoWVGkGfaAUiJ1qZTDw0VGXSRrgdjQ1EYnyesbcPM7rKbnE8BD?=
 =?us-ascii?Q?y/WBB/n1el4D2u04KAtUFN5dXSW1CWQ2Lirs4AaSMwxnBmJATfB1dO9XYUj5?=
 =?us-ascii?Q?1gCWJOFlOQByp9eZMWlq+Gss2s5fYeAw3v9+A11xpxnJtD9ExBoIepS3fFYX?=
 =?us-ascii?Q?3T2hw7uwviV6Ty43bgeLLzxqf78Y8xGiKCRVDI5NGZ2MQyIB8OPefI8lxbXm?=
 =?us-ascii?Q?ViaRDpHpzr1Ss4g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Xz5u22yV/snRFo6BYnpKiPVriJ1zjjttQQGk2dl8Kxy2m+vhCWR3Ae8lo6Ae?=
 =?us-ascii?Q?FZsde1XV4Hs8lrGFd2TaLPjZresC81JQZKzAYXHhossU7pedC2eXB8QXvJ6X?=
 =?us-ascii?Q?ckpsuvP0Jo4328B9XFw6sxGmuElwaOuV/gfq0IWDDq/jh12Aqn2Yz4OQKPXR?=
 =?us-ascii?Q?H6hZvRGWkD1x/t33biXKwW0AFGdLD7v5kkGj+9LhE7uFJ6Io5OU4rHTWaozq?=
 =?us-ascii?Q?ZMfFotNYN5GlGuq//nfYgqc6ZNgEQ+84NqZ+o+BP8jmMORHu8Pi/gF0F9y9U?=
 =?us-ascii?Q?Er3n0kSex4mn5Ze4X2zKFFbYa8Nowo/gFXofzOPRFZDCO4xz2H8wifvrzcrM?=
 =?us-ascii?Q?tEFboZz+sfzca0EXcxmX3n+YwQjaXmH5IwSz3AryNTU17JstVgfU2+gy+oh0?=
 =?us-ascii?Q?NyBBVLVy/mwncTX7svDA+NzAULBhNsICjhXgBn2kB4LfgMz0OT/Aw1o4nIhz?=
 =?us-ascii?Q?mAXyDxe+KcEDUgmmvhhF02Kh5IocA17bjEUfjnOhbNvcw2cMggnDQ3BJ3O+7?=
 =?us-ascii?Q?U3UN+vTbjEJskhnO46J4uv+18tDjv1ssxN20sryywqvIshvb4L/HhHfMD1GB?=
 =?us-ascii?Q?Y+p47J2HDcM2gHI1pAW5cCyPPWX4BW0FisE0qYfso2SMGbauoAY3Ws88oUyf?=
 =?us-ascii?Q?LQULo0601CRYAzIL4gPrUPH7fU/ydvbdaS8EpD0KHMZ99bdJQQZumjdSJHqY?=
 =?us-ascii?Q?Unix0NU1H99Dpg9OlqAKWRGaUQ0nEIe1ne4JU0U2o+Zmc8T/lquOY6na5QDp?=
 =?us-ascii?Q?Pk4q8f5ppnURTynGkhaq+iZAkUH0e3v73CJ9HPScqLo3rpTahBB+wSYBRdPL?=
 =?us-ascii?Q?Eue/EplU8ZShw2R63L/94hN14YJlVKvZRpUx/J35bgB8E9NvY7IsTMUMJKcL?=
 =?us-ascii?Q?8FGwAouFWibf7UH3WSVU+jH724HUCuMlQZM52LrdW+G8ZbOImusOsEgodyA1?=
 =?us-ascii?Q?lA9ROzXnbJ2nUkQXZnDaf/LB/nSGXoUtmqXpfvCQkhgBDh1wIMECbAZh2Jc1?=
 =?us-ascii?Q?W1KnnTunQ63IwP2urjUhQOOjcUzfEDST6NO+LRV9CtB0KGw4ScFD0G4KnqmD?=
 =?us-ascii?Q?1VSRJjwHu62r3KJzWL5wjBGNCWVKlFSZFGOxbVrqO4MooFTKEnjJ/6cQ0I3k?=
 =?us-ascii?Q?G+KmrJsBWzyIGn6ktZYV1oCrWQY8oQGKpFH5Gz705ukkS954ef1Wyo6IuBll?=
 =?us-ascii?Q?r/+/zbU8rS8NFcfmrkTVrA84cfZpY8HdEePqbNChart+uAcJZbeWhRwg4FU9?=
 =?us-ascii?Q?hjET4lT4sa/dsUrtpgWfYH+0XHo+cRhC3KaP6zMABxbGFw5ZIInO8QNEzPsj?=
 =?us-ascii?Q?FmmqWwWduBDRnxOR7DLF2QGRW2t+AWDGbNsyHJvhLWlubxYQ5wLLqeP+IUlt?=
 =?us-ascii?Q?xCGX94brjX2Zek1yNYyFCfPB/b+33T1oG6xCQXpbg2ClQbI59uLfDe40Av9W?=
 =?us-ascii?Q?9swBDwPlDW1Oqb6w5ftg19L4cRU122xcLRGeDzn2KcHmUEXfdZhxh0ZjlYrz?=
 =?us-ascii?Q?nXjGFajLnKDlYu54pf4dkuA8rskB6BGJ21XSrys+1IytrPwJGlZktVrUEwvd?=
 =?us-ascii?Q?rjC5o+MHfbNJhjr+XUkshYxNcpiFmuLIGyo08M2SwKfqZfV0B/8+A9m/TFhR?=
 =?us-ascii?Q?OU1/BygcFKrJGwAfKSuwucU+SIPbWULhznOcgGk9YudXrNroBz9W06/xITgz?=
 =?us-ascii?Q?lDXjekTBJyf+zlS98uPi/AeGAFQXtuk0iHBuCSFft1xn6GQjxYiAaBQ0s9I4?=
 =?us-ascii?Q?s42aNemzHA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1452b607-2912-49cd-fe56-08de705b931f
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:39:34.7728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBf7Ca+1ru7fI6xUZ1A1hcb68NzuVmEUPdMI9dWZJmIQxRsdrl7pMSLu5bbF/3LWxdEHFbSGaNrC7eBU3mCMWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3524
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 08:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231494

Backport ptest implementation from master branch to enable comprehensive
testing of libarchive functionality in the scarthgap release.

Changes include:
- Inherit ptest class and add ptest support infrastructure
- Add run-ptest script to execute all 5 test suites:
  * libarchive_test (698 tests)
  * bsdtar_test (74 tests)
  * bsdcpio_test (49 tests)
  * bsdcat_test (18 tests)
  * bsdunzip_test (24 tests)
- Install test binaries, test data files, and reference files
- Add bash and locale-base-en-us to RDEPENDS for ptest execution
- Enable nettle in PACKAGECONFIG for ZIP encryption/decryption support

The nettle addition is critical for test compatibility - without it,
the test_P_encryption test fails with "Decryption is unsupported due
to lack of crypto library". With nettle enabled, all 840+ tests pass
successfully.

Testing on qemux86-64:
- All test suites: PASS

This backport ensures the scarthgap branch has the same comprehensive
test coverage as master, improving quality assurance and catching
regressions early.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libarchive/libarchive/run-ptest           | 10 +++++++
 .../libarchive/libarchive_3.7.9.bb            | 29 +++++++++++++++++--
 3 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-extended/libarchive/libarchive/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 9950e46776..a5af7dc079 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -27,6 +27,7 @@ PTESTS_FAST =3D "\
     gzip \
     json-c \
     json-glib \
+    libarchive \
     libconvert-asn1-perl \
     libgpg-error\
     libnl \
diff --git a/meta/recipes-extended/libarchive/libarchive/run-ptest b/meta/r=
ecipes-extended/libarchive/libarchive/run-ptest
new file mode 100755
index 0000000000..36d982917c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+for t in libarchive_test bsdtar_test bsdcpio_test bsdcat_test bsdunzip_tes=
t; do
+    ./$t
+    if [ $? -eq 0 ]; then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+    fi
+done
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.7.9.bb
index b62c3d69b9..6710a0a875 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd499814247adaee0=
8d88080841cb5665"
=20
 DEPENDS =3D "e2fsprogs-native"
=20
-PACKAGECONFIG ?=3D "zlib bz2 xz zstd ${@bb.utils.filter('DISTRO_FEATURES',=
 'acl xattr', d)}"
+PACKAGECONFIG ?=3D "zlib bz2 xz nettle zstd ${@bb.utils.filter('DISTRO_FEA=
TURES', 'acl xattr', d)}"
=20
 DEPENDS_BZIP2 =3D "bzip2-replacement-native"
 DEPENDS_BZIP2:class-target =3D "bzip2"
@@ -44,12 +44,13 @@ SRC_URI =3D "http://libarchive.org/downloads/libarchive=
-${PV}.tar.gz \
            file://0001-Merge-pull-request-2768-from-Commandoss-master.patc=
h \
            file://CVE-2025-60753-01.patch \
            file://CVE-2025-60753-02.patch \
+           file://run-ptest \
            "
 UPSTREAM_CHECK_URI =3D "http://libarchive.org/"
=20
 SRC_URI[sha256sum] =3D "aa90732c5a6bdda52fda2ad468ac98d75be981c15dde263d7b=
5cf6af66fd009f"
=20
-inherit autotools update-alternatives pkgconfig
+inherit autotools update-alternatives pkgconfig ptest
=20
 CPPFLAGS +=3D "-I${WORKDIR}/extra-includes"
=20
@@ -77,3 +78,27 @@ ALTERNATIVE_LINK_NAME[cpio] =3D "${base_bindir}/cpio"
 ALTERNATIVE_TARGET[cpio] =3D "${bindir}/bsdcpio"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+do_compile_ptest() {
+    oe_runmake check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+
+    for test in libarchive_test bsdtar_test bsdcpio_test bsdcat_test bsdun=
zip_test; do
+            ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/$test ${D}$=
{PTEST_PATH}/$test
+    done
+
+    for dir in libarchive tar cpio cat unzip; do
+            install -d ${D}${PTEST_PATH}/$dir/test
+            cp -r ${S}/$dir/test/* ${D}${PTEST_PATH}/$dir/test/
+    done
+
+    ln -sf ${bindir}/bsdtar ${D}${PTEST_PATH}/bsdtar
+    ln -sf ${bindir}/bsdcpio ${D}${PTEST_PATH}/bsdcpio
+    ln -sf ${bindir}/bsdcat ${D}${PTEST_PATH}/bsdcat
+    ln -sf ${bindir}/bsdunzip ${D}${PTEST_PATH}/bsdunzip
+}
+
+RDEPENDS:${PN}-ptest +=3D "bsdtar bsdcpio locale-base-en-us"
--=20
2.43.0


