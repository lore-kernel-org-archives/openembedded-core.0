Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11EDC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 14:30:26 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web10.53594.1699021817251564322
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 07:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=Soz9U1tZ;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=oY/1V7W1;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: s.zhmylev@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 989B1C0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1699021812; bh=N2+ryPpfTkxu5Xgr2zM1EUoBVxJhAPOpwtDk3P46EUg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Soz9U1tZFU+Ix2MwsWAc1phmWwJ31NYaJDzAYyd24eAo7Xe9Dx9k94Tp0W95rBBuS
	 sAdzoIZ14oecK+tW3lHUUT0M0EMyC+U+54aNqBJIp+yMUeSZFpNT1kOMfhFfKWpOYQ
	 UJJigommiPfuv4rhiAbnT/LLy2rcNWoZ2PrrK+ISVnDX0wZQw+SKaDyLQVc86ufRXd
	 rBHw6s7gLjCnxhkACNzs7R1Iqk85Qna+IOpkz3iB9BaZslvFVkOGC4sbkB7VCNYiPa
	 cmVM+7S1dy3+NjKMr8DlrdwrhdEDiN+xDHRTPTqk28QYn8uv4a3rN/WUphY0NT/IiQ
	 0oH3NZbZwkXjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1699021812; bh=N2+ryPpfTkxu5Xgr2zM1EUoBVxJhAPOpwtDk3P46EUg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=oY/1V7W1aIOiPczg/cpgi295SGLihqP0CHNHTsg120eEBXpzJOReEyGQSCv4R1BSB
	 Mm6boZwRjLpt9MDqCQTE+ipN1ymFNnW3jL9mEYaeQaSM7Q1uxn94/XlMn9tU9b2bWa
	 g7YxykaCXpcnf66Gt6I2ahaIaMh6w7X62qnmkDex/q9qVuCBjhXF1gRAQ/zKsUl/NZ
	 7GO+qqzPgKZlxlF/pB3Nx9ozT8RzECI4WvqyrZdbqDe+oWWK82kLtd4KDrmeqB/9aR
	 NlhYEddohHYum9e//akoVlSy81RG3KssF47aeLcFn0SXsEpyL5niu6QTZcorRy11XE
	 DJKA868tDMGug==
From: <s.zhmylev@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sergei Zhmylev <s.zhmylev@yadro.com>
Subject: [PATCH v2] classes: Move package RDEPENDS processing out of debian.bbclass
Date: Fri, 3 Nov 2023 17:29:57 +0300
Message-ID: <20231103142957.2625840-1-s.zhmylev@yadro.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-06.corp.yadro.com (172.17.10.110) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 14:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190162

From: Sergei Zhmylev <s.zhmylev@yadro.com>

INHERIT_DIRSTO by default includes debian.bbclass which in turn properly
establishes dependencies between package management tasks and build
process. Debian class also unconditionally renames several packages in a
Debian way. In order to allow disabling of such renaming rules, the logic
of RDEPENDS handling is moved to a package.bbclass.
This commit also solves the SDK building issue without debian.bbclass.

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
---
 meta/classes-global/debian.bbclass  | 18 +++---------------
 meta/classes-global/package.bbclass | 20 +++++++++++++++++++-
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/meta/classes-global/debian.bbclass b/meta/classes-global/deb=
ian.bbclass
index 7135d74837c..c34e04112c5 100644
--- a/meta/classes-global/debian.bbclass
+++ b/meta/classes-global/debian.bbclass
@@ -14,26 +14,14 @@
 #
 # Better expressed as ensure all RDEPENDS package before we package
 # This means we can't have circular RDEPENDS/RRECOMMENDS
+#
+# Logic of processing dependencies moved to a package.bbclass to
+# allow removing inheritance on debian.bbclass
=20
 AUTO_LIBNAME_PKGS =3D "${PACKAGES}"
=20
 inherit package
=20
-DEBIANRDEP =3D "do_packagedata"
-do_package_write_ipk[deptask] =3D "${DEBIANRDEP}"
-do_package_write_deb[deptask] =3D "${DEBIANRDEP}"
-do_package_write_tar[deptask] =3D "${DEBIANRDEP}"
-do_package_write_rpm[deptask] =3D "${DEBIANRDEP}"
-do_package_write_ipk[rdeptask] =3D "${DEBIANRDEP}"
-do_package_write_deb[rdeptask] =3D "${DEBIANRDEP}"
-do_package_write_tar[rdeptask] =3D "${DEBIANRDEP}"
-do_package_write_rpm[rdeptask] =3D "${DEBIANRDEP}"
-
-python () {
-    if not d.getVar("PACKAGES"):
-        d.setVar("DEBIANRDEP", "")
-}
-
 python debian_package_name_hook () {
     import glob, copy, stat, errno, re, pathlib, subprocess
=20
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pa=
ckage.bbclass
index 7787042e213..820920eadff 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -60,7 +60,6 @@ ALL_MULTILIB_PACKAGE_ARCHS =3D "${@all_multilib_tune_va=
lues(d, 'PACKAGE_ARCHS')}"
 # dwarfsrcfiles is used to determine the list of debug source files
 PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native"
=20
-
 # If your postinstall can execute at rootfs creation time rather than on
 # target but depends on a native/cross tool in order to execute, you nee=
d to
 # list that tool in PACKAGE_WRITE_DEPS. Target package dependencies belo=
ng
@@ -614,3 +613,22 @@ python do_packagedata_setscene () {
 }
 addtask do_packagedata_setscene
=20
+# This part ensures all the runtime packages built by the time
+# dynamic renaming occures, if any.
+# This part moved here from debian.bbclass (see for reference) in
+# order to allow disabling default inheritance on debian package renamin=
g.
+
+PKGRDEP =3D "do_packagedata"
+do_package_write_ipk[deptask] =3D "${PKGRDEP}"
+do_package_write_deb[deptask] =3D "${PKGRDEP}"
+do_package_write_tar[deptask] =3D "${PKGRDEP}"
+do_package_write_rpm[deptask] =3D "${PKGRDEP}"
+do_package_write_ipk[rdeptask] =3D "${PKGRDEP}"
+do_package_write_deb[rdeptask] =3D "${PKGRDEP}"
+do_package_write_tar[rdeptask] =3D "${PKGRDEP}"
+do_package_write_rpm[rdeptask] =3D "${PKGRDEP}"
+
+python () {
+    if not d.getVar("PACKAGES"):
+        d.setVar("PKGRDEP", "")
+}
--=20
2.40.0


