Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEBDC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 13:15:05 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web11.50699.1699017295031831935
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 06:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=KDdydTpD;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=tE2umLAo;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: s.zhmylev@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 47FC6C0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1699017290; bh=3SMyWq8HEm7stmroRYwxIuiL0lY+u02KlXo3g+E2H7w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=KDdydTpDrILOvB3Nic6f9FkDFwgOXIZj6S0Eg+N98bm8SMjzFhqUTb0fhKuN0eSI1
	 h43iorkTbJ5V8/QNMUfgvenjrdmWa0nx2DMLH2SRDNlbrMEdDPFidsdf+hotR7TPRd
	 Tqf7m8RPozl6sObGy2HL6lcXHpxmUPMwFMw1dV6aq0U04QBO19/BdZlkqpRJWdJbvM
	 RokOJdanbkP/iryGkRpsbMvJrYTCUH9IQnUwdzHm+Pe3lmTKOR1d9hfLrAfaPmI8QS
	 M+neaIIoi0i4793wu+rYx8wOpyyUvJXfi/PdTfvWtUmTzhByGayIUViySWFZvIEI5Q
	 oHOCl69B3QjkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1699017290; bh=3SMyWq8HEm7stmroRYwxIuiL0lY+u02KlXo3g+E2H7w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=tE2umLAozO4+5kojSqssJ4SuQRc1Vbi4A2WvohGxoqWdezSmZKJG7ctdbuHhBVpcy
	 x9b3vFPEgJZd/ZF15R6zn5GtApa7cKWTh3WnHnv/hyf7EHJSLayF6Fpov4QEZk0Ik6
	 aXf5cmvd5ImaezHzi8EZOmohq5JhhJoPq8pzy2KERdnKIKpl5qW71ZB9+PMacScbee
	 y+c2QyFJMw21joNLx15WOfmsiIVi4jVrSn0OAQ8GZocuG5oVDgaNQeqHDfiiWGpY36
	 QnxPkEnU+VUVhn8hfG6yopzSAlx8Qilr8De4toMDUY98Tb7QiPm+rzbjiB9tB23hOf
	 rYyJv/GHZoExQ==
From: <s.zhmylev@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sergei Zhmylev <s.zhmylev@yadro.com>
Subject: [PATCH] classes: Move package RDEPENDS processing out of debian.bbclass
Date: Fri, 3 Nov 2023 16:14:28 +0300
Message-ID: <20231103131428.2620444-1-s.zhmylev@yadro.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-Exch-05.corp.yadro.com (172.17.10.109) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 13:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190153

From: Sergei Zhmylev <s.zhmylev@yadro.com>

INHERIT_DIRSTO by default includes debian.bbclass which in turn properly
establishes dependencies between package management tasks and build
process. Debian class also unconditionally renames several packages in a
Debian way. In order to allow disabling of such renaming rules, the logic
of RDEPENDS handling is moved to a separate package-deptasks.bbclass.
This commit also solves the SDK building issue without debian.bbclass.

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
---
 meta/classes-global/debian.bbclass           | 22 +++-------------
 meta/classes-global/package-deptasks.bbclass | 27 ++++++++++++++++++++
 meta/conf/distro/defaultsetup.conf           |  2 +-
 3 files changed, 32 insertions(+), 19 deletions(-)
 create mode 100644 meta/classes-global/package-deptasks.bbclass

diff --git a/meta/classes-global/debian.bbclass b/meta/classes-global/deb=
ian.bbclass
index 7135d74837c..074c1c306cf 100644
--- a/meta/classes-global/debian.bbclass
+++ b/meta/classes-global/debian.bbclass
@@ -14,25 +14,13 @@
 #
 # Better expressed as ensure all RDEPENDS package before we package
 # This means we can't have circular RDEPENDS/RRECOMMENDS
+#
+# Logic of processing dependencies moved to a separate package-deptasks.=
bbclass
+# to allow removing inheritance on debian.bbclass
=20
 AUTO_LIBNAME_PKGS =3D "${PACKAGES}"
=20
-inherit package
-
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
+inherit package package-deptasks
=20
 python debian_package_name_hook () {
     import glob, copy, stat, errno, re, pathlib, subprocess
@@ -152,5 +140,3 @@ python debian_package_name_hook () {
 }
=20
 EXPORT_FUNCTIONS package_name_hook
-
-DEBIAN_NAMES =3D "1"
diff --git a/meta/classes-global/package-deptasks.bbclass b/meta/classes-=
global/package-deptasks.bbclass
new file mode 100644
index 00000000000..0339cbc3a24
--- /dev/null
+++ b/meta/classes-global/package-deptasks.bbclass
@@ -0,0 +1,27 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# This class ensures all the runtime packages built by the time
+# dynamic renaming occures.
+# This part moved here from debian.bbclass (see for reference) in
+# order to allow disabling default inheritance on debian package renamin=
g.
+
+inherit package
+
+DEBIANRDEP =3D "do_packagedata"
+do_package_write_ipk[deptask] =3D "${DEBIANRDEP}"
+do_package_write_deb[deptask] =3D "${DEBIANRDEP}"
+do_package_write_tar[deptask] =3D "${DEBIANRDEP}"
+do_package_write_rpm[deptask] =3D "${DEBIANRDEP}"
+do_package_write_ipk[rdeptask] =3D "${DEBIANRDEP}"
+do_package_write_deb[rdeptask] =3D "${DEBIANRDEP}"
+do_package_write_tar[rdeptask] =3D "${DEBIANRDEP}"
+do_package_write_rpm[rdeptask] =3D "${DEBIANRDEP}"
+
+python () {
+    if not d.getVar("PACKAGES"):
+        d.setVar("DEBIANRDEP", "")
+}
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaul=
tsetup.conf
index 90b68057ad4..02a874b4198 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -14,7 +14,7 @@ TMPDIR .=3D "${TCLIBCAPPEND}"
=20
 USER_CLASSES ?=3D ""
 PACKAGE_CLASSES ?=3D "package_ipk"
-INHERIT_DISTRO ?=3D "debian devshell sstate license remove-libtool creat=
e-spdx"
+INHERIT_DISTRO ?=3D "package-deptasks debian devshell sstate license rem=
ove-libtool create-spdx"
 INHERIT +=3D "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}"
=20
 INIT_MANAGER ??=3D "none"
--=20
2.40.0


