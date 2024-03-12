Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4C1C54E49
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 05:22:06 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.1894.1710220922198124918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 22:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout03.t-online.de (Postfix) with SMTP id 4B8421DC62
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 06:22:00 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.43]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rjuaN-2MvcCg0; Tue, 12 Mar 2024 06:21:59 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv3 2/2] vala: fix for gtk4 prior to 4.14
Date: Tue, 12 Mar 2024 06:22:07 +0100
Message-ID: <20240312052207.20685-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312052207.20685-1-f_l_k@t-online.de>
References: <20240312052207.20685-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710220919-FCAAA990-E9AD55E0/0/0 CLEAN NORMAL
X-TOI-MSGID: d065a15c-d6e5-4977-ae61-64c0293c714b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 05:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196970

- add a backport patch to fix compatibility with older gtk4 versions

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...tk4-Preserve-compatibility-with-4.14.patch | 39 +++++++++++++++++++
 meta/recipes-devtools/vala/vala_0.56.15.bb    |  5 ++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-co=
mpatibility-with-4.14.patch

diff --git a/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibi=
lity-with-4.14.patch b/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve=
-compatibility-with-4.14.patch
new file mode 100644
index 0000000000..161474086e
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-wi=
th-4.14.patch
@@ -0,0 +1,39 @@
+From 17349020fb95454d06f827fd555b05248f10a370 Mon Sep 17 00:00:00 2001
+From: Rico Tzschichholz <ricotz@ubuntu.com>
+Date: Thu, 7 Mar 2024 17:56:05 +0100
+Subject: [PATCH] gtk4: Preserve compatibility with < 4.14
+
+Don't prefer new accessor methods for Calendar.day/month/year
+
+Fixes https://gitlab.gnome.org/GNOME/vala/issues/1531
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/vala/-/commit/=
e0c4ea8c4a0bbf859b5341a7465b395892789d9e]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ vapi/gtk4.vapi                 | 3 +++
+ vapi/metadata/Gtk-4.0.metadata | 5 +++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/vapi/gtk4.vapi b/vapi/gtk4.vapi
+index 49f8b2078..51ecea27d 100644
+--- a/vapi/gtk4.vapi
++++ b/vapi/gtk4.vapi
+@@ -7350,11 +7350,14 @@ namespace Gtk {
+ 		[Version (since =3D "4.14")]
+ 		public void set_year (int year);
+ 		public void unmark_day (uint day);
++		[NoAccessorMethod]
+ 		public int day { get; set; }
++		[NoAccessorMethod]
+ 		public int month { get; set; }
+ 		public bool show_day_names { get; set; }
+ 		public bool show_heading { get; set; }
+ 		public bool show_week_numbers { get; set; }
++		[NoAccessorMethod]
+ 		public int year { get; set; }
+ 		public signal void day_selected ();
+ 		public signal void next_month ();
+--=20
+2.44.0
+
diff --git a/meta/recipes-devtools/vala/vala_0.56.15.bb b/meta/recipes-de=
vtools/vala/vala_0.56.15.bb
index a8fdd0a97a..915ddd8e4d 100644
--- a/meta/recipes-devtools/vala/vala_0.56.15.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.15.bb
@@ -18,7 +18,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc09390185=
7fcd118f065f900982c24"
=20
 SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
.')[1]}"
=20
-SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/$=
{BP}.tar.xz"
+SRC_URI =3D " \
+	http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz =
\
+	file://0001-gtk4-Preserve-compatibility-with-4.14.patch \
+"
 SRC_URI[sha256sum] =3D "535b6452ed310fd5fb5c7dd6794b6213dac3b48e645e5bff=
3173741ec2cb3f2b"
=20
 inherit autotools pkgconfig upstream-version-is-even
--=20
2.44.0


