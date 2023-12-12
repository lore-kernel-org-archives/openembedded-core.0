Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EB0C3DA6E
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:09:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2356.1702390157619260728
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B48121474;
	Tue, 12 Dec 2023 06:10:03 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E2B313F738;
	Tue, 12 Dec 2023 06:09:16 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 6/9] gtk-doc: don't use docdir set in environment in gtkdocize
Date: Tue, 12 Dec 2023 14:08:17 +0000
Message-Id: <20231212140820.2900963-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212140820.2900963-1-ross.burton@arm.com>
References: <20231212140820.2900963-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192199

From: Ross Burton <ross.burton@arm.com>

The gtkdocize script was accidentally respecting $docdir from the
environment as the default documentation directory. This is a problem as
bitbake.conf exports $docdir, resulting in configure failures.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...01-Don-t-use-docdir-from-environment.patch | 24 +++++++++++++++++++
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb  |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk-doc/files/0001-Don-t-use-docdi=
r-from-environment.patch

diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Don-t-use-docdir-from-=
environment.patch b/meta/recipes-gnome/gtk-doc/files/0001-Don-t-use-docdi=
r-from-environment.patch
new file mode 100644
index 00000000000..f40124877c3
--- /dev/null
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Don-t-use-docdir-from-environ=
ment.patch
@@ -0,0 +1,24 @@
+From 72dfeec0e49478b0bfb471c4155044391bad8e6c Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 8 Dec 2023 10:35:25 +0000
+Subject: [PATCH] Don't use docdir from environment
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gtk-doc/-/mer=
ge_requests/73]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ buildsystems/autotools/gtkdocize.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/buildsystems/autotools/gtkdocize.in b/buildsystems/autotool=
s/gtkdocize.in
+index 83127bf..76dcbfd 100755
+--- a/buildsystems/autotools/gtkdocize.in
++++ b/buildsystems/autotools/gtkdocize.in
+@@ -39,7 +39,7 @@ set - $args
+=20
+ # assume working directory if srcdir is not set
+ test "$srcdir" || srcdir=3D.
+-test "$docdir" || docdir=3D"$srcdir"
++docdir=3D"$srcdir"
+=20
+ # detect configure script
+ no_configure_found=3D0
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb b/meta/recipes-=
gnome/gtk-doc/gtk-doc_1.33.2.bb
index 2e8ab1c771a..7c366737da5 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
@@ -26,6 +26,7 @@ SRC_URI +=3D "file://0001-Do-not-hardocode-paths-to-per=
l-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
            file://no-clobber.patch \
+           file://0001-Don-t-use-docdir-from-environment.patch \
            "
 SRC_URI:append:class-native =3D " file://pkg-config-native.patch"
=20
--=20
2.34.1


