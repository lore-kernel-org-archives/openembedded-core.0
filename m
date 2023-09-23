Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F946CE7A89
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 09:46:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17518.1695462412435757577
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Sep 2023 02:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAC83DA7;
	Sat, 23 Sep 2023 02:47:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A1EF43F59C;
	Sat, 23 Sep 2023 02:46:51 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][mickledore] linux-yocto: update CVE exclusions
Date: Sat, 23 Sep 2023 10:46:49 +0100
Message-Id: <20230923094649.659621-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 09:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188143

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/cve-exclusion_6.1.inc               | 157 ++++++++++++++----
 1 file changed, 123 insertions(+), 34 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.1.inc
index 4e809940db0..1656ffc8b5e 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-08-25 16:54:59.886795 for version 6.1.38"
+# Generated at 2023-09-23 10:45:45.248445 for version 6.1.46
=20
 python check_kernel_cve_status_version() {
-    this_version =3D "6.1.38"
+    this_version =3D "6.1.46"
     kernel_version =3D d.getVar("LINUX_VERSION")
     if kernel_version !=3D this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
@@ -4839,6 +4839,8 @@ CVE_CHECK_IGNORE +=3D "CVE-2020-27194"
 # fixed-version: Fixed after version 5.6rc4
 CVE_CHECK_IGNORE +=3D "CVE-2020-2732"
=20
+# CVE-2020-27418 has no known resolution
+
 # fixed-version: Fixed after version 5.10rc1
 CVE_CHECK_IGNORE +=3D "CVE-2020-27673"
=20
@@ -6464,7 +6466,8 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-40768"
 # fixed-version: Fixed after version 6.0rc4
 CVE_CHECK_IGNORE +=3D "CVE-2022-4095"
=20
-# CVE-2022-40982 has no known resolution
+# cpe-stable-backport: Backported in 6.1.44
+CVE_CHECK_IGNORE +=3D "CVE-2022-40982"
=20
 # cpe-stable-backport: Backported in 6.1.4
 CVE_CHECK_IGNORE +=3D "CVE-2022-41218"
@@ -6546,9 +6549,9 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-4382"
 # fixed-version: Fixed after version 6.1rc1
 CVE_CHECK_IGNORE +=3D "CVE-2022-43945"
=20
-# CVE-2022-44032 has no known resolution
+# CVE-2022-44032 needs backporting (fixed from 6.4rc1)
=20
-# CVE-2022-44033 has no known resolution
+# CVE-2022-44033 needs backporting (fixed from 6.4rc1)
=20
 # CVE-2022-44034 has no known resolution
=20
@@ -6561,13 +6564,16 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-45869"
=20
 # CVE-2022-45885 has no known resolution
=20
-# CVE-2022-45886 has no known resolution
+# cpe-stable-backport: Backported in 6.1.33
+CVE_CHECK_IGNORE +=3D "CVE-2022-45886"
=20
-# CVE-2022-45887 has no known resolution
+# cpe-stable-backport: Backported in 6.1.33
+CVE_CHECK_IGNORE +=3D "CVE-2022-45887"
=20
 # CVE-2022-45888 needs backporting (fixed from 6.2rc1)
=20
-# CVE-2022-45919 has no known resolution
+# cpe-stable-backport: Backported in 6.1.33
+CVE_CHECK_IGNORE +=3D "CVE-2022-45919"
=20
 # fixed-version: Fixed after version 6.1
 CVE_CHECK_IGNORE +=3D "CVE-2022-45934"
@@ -6629,7 +6635,8 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-48424"
 # cpe-stable-backport: Backported in 6.1.33
 CVE_CHECK_IGNORE +=3D "CVE-2022-48425"
=20
-# CVE-2022-48502 needs backporting (fixed from 6.1.40)
+# cpe-stable-backport: Backported in 6.1.40
+CVE_CHECK_IGNORE +=3D "CVE-2022-48502"
=20
 # fixed-version: Fixed after version 5.0rc1
 CVE_CHECK_IGNORE +=3D "CVE-2023-0030"
@@ -6643,7 +6650,8 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-0047"
 # fixed-version: Fixed after version 6.0rc4
 CVE_CHECK_IGNORE +=3D "CVE-2023-0122"
=20
-# CVE-2023-0160 has no known resolution
+# cpe-stable-backport: Backported in 6.1.28
+CVE_CHECK_IGNORE +=3D "CVE-2023-0160"
=20
 # cpe-stable-backport: Backported in 6.1.7
 CVE_CHECK_IGNORE +=3D "CVE-2023-0179"
@@ -6726,7 +6734,8 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-1192"
 # fixed-version: Fixed after version 6.1rc3
 CVE_CHECK_IGNORE +=3D "CVE-2023-1195"
=20
-# CVE-2023-1206 needs backporting (fixed from 6.1.43)
+# cpe-stable-backport: Backported in 6.1.43
+CVE_CHECK_IGNORE +=3D "CVE-2023-1206"
=20
 # fixed-version: Fixed after version 5.18rc1
 CVE_CHECK_IGNORE +=3D "CVE-2023-1249"
@@ -6809,11 +6818,14 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-2008"
 # fixed-version: Fixed after version 6.0rc1
 CVE_CHECK_IGNORE +=3D "CVE-2023-2019"
=20
-# CVE-2023-20569 has no known resolution
+# cpe-stable-backport: Backported in 6.1.44
+CVE_CHECK_IGNORE +=3D "CVE-2023-20569"
=20
-# CVE-2023-20588 has no known resolution
+# cpe-stable-backport: Backported in 6.1.45
+CVE_CHECK_IGNORE +=3D "CVE-2023-20588"
=20
-# CVE-2023-20593 needs backporting (fixed from 6.1.41)
+# cpe-stable-backport: Backported in 6.1.41
+CVE_CHECK_IGNORE +=3D "CVE-2023-20593"
=20
 # fixed-version: Fixed after version 6.0rc1
 CVE_CHECK_IGNORE +=3D "CVE-2023-20928"
@@ -6922,7 +6934,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-23559"
 # fixed-version: Fixed after version 5.12rc1
 CVE_CHECK_IGNORE +=3D "CVE-2023-23586"
=20
-# CVE-2023-2430 needs backporting (fixed from 6.2rc5)
+# CVE-2023-2430 needs backporting (fixed from 6.1.50)
=20
 # cpe-stable-backport: Backported in 6.1.22
 CVE_CHECK_IGNORE +=3D "CVE-2023-2483"
@@ -6933,6 +6945,8 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-25012"
 # fixed-version: Fixed after version 6.0rc1
 CVE_CHECK_IGNORE +=3D "CVE-2023-2513"
=20
+# CVE-2023-25775 needs backporting (fixed from 6.1.53)
+
 # fixed-version: only affects 6.3rc1 onwards
 CVE_CHECK_IGNORE +=3D "CVE-2023-2598"
=20
@@ -6979,7 +6993,8 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-28772"
 # cpe-stable-backport: Backported in 6.1.22
 CVE_CHECK_IGNORE +=3D "CVE-2023-28866"
=20
-# CVE-2023-2898 needs backporting (fixed from 6.1.39)
+# cpe-stable-backport: Backported in 6.1.39
+CVE_CHECK_IGNORE +=3D "CVE-2023-2898"
=20
 # cpe-stable-backport: Backported in 6.1.16
 CVE_CHECK_IGNORE +=3D "CVE-2023-2985"
@@ -7007,7 +7022,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-3106"
=20
 # CVE-2023-31082 has no known resolution
=20
-# CVE-2023-31083 has no known resolution
+# CVE-2023-31083 needs backporting (fixed from 6.6rc1)
=20
 # CVE-2023-31084 needs backporting (fixed from 6.4rc3)
=20
@@ -7019,7 +7034,8 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-3111"
 # cpe-stable-backport: Backported in 6.1.35
 CVE_CHECK_IGNORE +=3D "CVE-2023-3117"
=20
-# CVE-2023-31248 needs backporting (fixed from 6.1.39)
+# cpe-stable-backport: Backported in 6.1.39
+CVE_CHECK_IGNORE +=3D "CVE-2023-31248"
=20
 # cpe-stable-backport: Backported in 6.1.30
 CVE_CHECK_IGNORE +=3D "CVE-2023-3141"
@@ -7083,7 +7099,8 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-3317"
 # cpe-stable-backport: Backported in 6.1.22
 CVE_CHECK_IGNORE +=3D "CVE-2023-33203"
=20
-# CVE-2023-33250 has no known resolution
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE +=3D "CVE-2023-33250"
=20
 # cpe-stable-backport: Backported in 6.1.22
 CVE_CHECK_IGNORE +=3D "CVE-2023-33288"
@@ -7123,12 +7140,14 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-34255"
 # cpe-stable-backport: Backported in 6.1.29
 CVE_CHECK_IGNORE +=3D "CVE-2023-34256"
=20
-# CVE-2023-34319 has no known resolution
+# cpe-stable-backport: Backported in 6.1.44
+CVE_CHECK_IGNORE +=3D "CVE-2023-34319"
=20
 # fixed-version: Fixed after version 5.18rc5
 CVE_CHECK_IGNORE +=3D "CVE-2023-3439"
=20
-# CVE-2023-35001 needs backporting (fixed from 6.1.39)
+# cpe-stable-backport: Backported in 6.1.39
+CVE_CHECK_IGNORE +=3D "CVE-2023-35001"
=20
 # cpe-stable-backport: Backported in 6.1.11
 CVE_CHECK_IGNORE +=3D "CVE-2023-3567"
@@ -7161,19 +7180,25 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-3609"
 # cpe-stable-backport: Backported in 6.1.36
 CVE_CHECK_IGNORE +=3D "CVE-2023-3610"
=20
-# CVE-2023-3611 needs backporting (fixed from 6.1.40)
+# cpe-stable-backport: Backported in 6.1.40
+CVE_CHECK_IGNORE +=3D "CVE-2023-3611"
=20
 # CVE-2023-3640 has no known resolution
=20
-# CVE-2023-37453 has no known resolution
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE +=3D "CVE-2023-37453"
=20
 # CVE-2023-37454 has no known resolution
=20
-# CVE-2023-3772 has no known resolution
+# CVE-2023-3772 needs backporting (fixed from 6.1.47)
=20
-# CVE-2023-3773 has no known resolution
+# CVE-2023-3773 needs backporting (fixed from 6.1.47)
=20
-# CVE-2023-3776 needs backporting (fixed from 6.1.40)
+# cpe-stable-backport: Backported in 6.1.40
+CVE_CHECK_IGNORE +=3D "CVE-2023-3776"
+
+# cpe-stable-backport: Backported in 6.1.42
+CVE_CHECK_IGNORE +=3D "CVE-2023-3777"
=20
 # fixed-version: Fixed after version 6.1rc4
 CVE_CHECK_IGNORE +=3D "CVE-2023-3812"
@@ -7202,25 +7227,89 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-38431"
 # cpe-stable-backport: Backported in 6.1.36
 CVE_CHECK_IGNORE +=3D "CVE-2023-38432"
=20
-# CVE-2023-3863 needs backporting (fixed from 6.1.39)
+# cpe-stable-backport: Backported in 6.1.39
+CVE_CHECK_IGNORE +=3D "CVE-2023-3863"
=20
-# CVE-2023-4004 needs backporting (fixed from 6.1.42)
+# cpe-stable-backport: Backported in 6.1.36
+CVE_CHECK_IGNORE +=3D "CVE-2023-3865"
+
+# cpe-stable-backport: Backported in 6.1.36
+CVE_CHECK_IGNORE +=3D "CVE-2023-3866"
+
+# cpe-stable-backport: Backported in 6.1.40
+CVE_CHECK_IGNORE +=3D "CVE-2023-3867"
+
+# cpe-stable-backport: Backported in 6.1.42
+CVE_CHECK_IGNORE +=3D "CVE-2023-4004"
=20
 # CVE-2023-4010 has no known resolution
=20
-# CVE-2023-4128 needs backporting (fixed from 6.5rc5)
+# cpe-stable-backport: Backported in 6.1.43
+CVE_CHECK_IGNORE +=3D "CVE-2023-4015"
+
+# cpe-stable-backport: Backported in 6.1.45
+CVE_CHECK_IGNORE +=3D "CVE-2023-40283"
=20
-# CVE-2023-4132 needs backporting (fixed from 6.1.39)
+# cpe-stable-backport: Backported in 6.1.45
+CVE_CHECK_IGNORE +=3D "CVE-2023-4128"
+
+# cpe-stable-backport: Backported in 6.1.39
+CVE_CHECK_IGNORE +=3D "CVE-2023-4132"
=20
 # CVE-2023-4133 needs backporting (fixed from 6.3)
=20
 # CVE-2023-4134 needs backporting (fixed from 6.5rc1)
=20
-# CVE-2023-4147 needs backporting (fixed from 6.1.43)
+# cpe-stable-backport: Backported in 6.1.43
+CVE_CHECK_IGNORE +=3D "CVE-2023-4147"
+
+# cpe-stable-backport: Backported in 6.1.46
+CVE_CHECK_IGNORE +=3D "CVE-2023-4155"
+
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE +=3D "CVE-2023-4194"
+
+# cpe-stable-backport: Backported in 6.1.45
+CVE_CHECK_IGNORE +=3D "CVE-2023-4206"
+
+# cpe-stable-backport: Backported in 6.1.45
+CVE_CHECK_IGNORE +=3D "CVE-2023-4207"
+
+# cpe-stable-backport: Backported in 6.1.45
+CVE_CHECK_IGNORE +=3D "CVE-2023-4208"
+
+# CVE-2023-4244 needs backporting (fixed from 6.5rc7)
+
+# cpe-stable-backport: Backported in 6.1.45
+CVE_CHECK_IGNORE +=3D "CVE-2023-4273"
+
+# fixed-version: Fixed after version 5.19rc1
+CVE_CHECK_IGNORE +=3D "CVE-2023-4385"
+
+# fixed-version: Fixed after version 5.18
+CVE_CHECK_IGNORE +=3D "CVE-2023-4387"
+
+# fixed-version: Fixed after version 5.18rc3
+CVE_CHECK_IGNORE +=3D "CVE-2023-4389"
+
+# fixed-version: Fixed after version 6.0rc3
+CVE_CHECK_IGNORE +=3D "CVE-2023-4394"
+
+# fixed-version: Fixed after version 5.18
+CVE_CHECK_IGNORE +=3D "CVE-2023-4459"
+
+# CVE-2023-4563 needs backporting (fixed from 6.5rc6)
+
+# CVE-2023-4569 needs backporting (fixed from 6.1.47)
+
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE +=3D "CVE-2023-4611"
+
+# CVE-2023-4622 needs backporting (fixed from 6.5rc1)
=20
-# CVE-2023-4155 has no known resolution
+# CVE-2023-4623 needs backporting (fixed from 6.1.53)
=20
-# CVE-2023-4194 needs backporting (fixed from 6.5rc5)
+# CVE-2023-4881 needs backporting (fixed from 6.6rc1)
=20
-# CVE-2023-4273 needs backporting (fixed from 6.5rc5)
+# CVE-2023-4921 needs backporting (fixed from 6.6rc1)
=20
--=20
2.34.1


