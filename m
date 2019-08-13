Return-Path: <bounces+12060237-dea2-openembedded-core=lists.openembedded.org@sendgrid.net>
Received: from o1.f.az.sendgrid.net (o1.f.az.sendgrid.net [208.117.55.132])
	by mail.openembedded.org (Postfix) with ESMTP id 73D357E467
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 23:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.me;
	h=from:subject:in-reply-to:references:mime-version:to:cc:
	content-transfer-encoding:content-type;
	s=smtpapi; bh=BN8cu+a1tG19gqVw1IbTj53/t+QGPf/YptO+l3GURAs=;
	b=GDXVIcYFutpLJUba85EwdQGpQet99k3otPxYHTnstBckmlgcZ6uCcHmPzTH7pRxaV/Tx
	iBuYvrAKx7HkVc7KJ9eiKRZj/AB/T0fa/GtAeljjjdV5rivV8g0TYd6ioiFxoznffw+BAt
	Ug0RqUfvx7mEkCxOTBx3pQgYYCYxLrtKQ=
Received: by filter0058p3iad2.sendgrid.net with SMTP id
	filter0058p3iad2-31931-5D534705-18
	2019-08-13 23:25:57.550588211 +0000 UTC m=+1571843.465128705
Received: from
	t-keweng-westus2-ubuntu.sthawock52fuzp14qwoa2ht3of.xx.internal.cloudapp.net
	(unknown [52.143.72.184])
	by ismtpd0008p1hnd1.sendgrid.net (SG) with ESMTP id
	bRwfMJTlTGe0MEyoHdg2_Q Tue, 13 Aug 2019 23:25:57.118 +0000 (UTC)
From: Kevin Weng <t-keweng@microsoft.com>
Date: Tue, 13 Aug 2019 23:25:57 +0000 (UTC)
Message-Id: <20190813232542.16955-3-t-keweng@microsoft.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813232542.16955-1-t-keweng@microsoft.com>
References: <20190813232542.16955-1-t-keweng@microsoft.com>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?5plbwHlDV1x0k2R0bHwCzxXjHeGg9GIuX3p3eyxUEIsO2BVtB=2F3iyHMXziEfDg?=
	=?us-ascii?Q?PZfL8EzAFZJc88Bp7OZWZwRaMTvBrc5or5QiXp9?=
	=?us-ascii?Q?ccXww4WBTPNj0=2FwK76b9YLa6R10ShvtvtXgclOO?=
	=?us-ascii?Q?UEiU7M3uc01o5uZs07uVf2dg3AnluJBtfgC7alD?=
	=?us-ascii?Q?V3adhjmpYXDnQo91J5c6IsozyUP048LC3Nvcv3g?=
	=?us-ascii?Q?Q8dFyEhB9tDLQiLpFXyfyF98wP38GCvP6BdlKX0?=
	=?us-ascii?Q?4+lFaPiIyr0yox7KNpcIA=3D=3D?=
To: openembedded-core@lists.openembedded.org
Cc: Kevin Weng <t-keweng@microsoft.com>
Subject: [thud][PATCH v2 3/4] glib-2.0: fix CVE-2019-13012
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Aug 2019 23:25:56 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii

Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
---
 .../glib-2.0/glib-2.0/CVE-2019-13012.patch    | 47 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch
new file mode 100644
index 0000000000..29c5d98402
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch
@@ -0,0 +1,47 @@
+From c7f7fd53780f8caebccc903d61ffc21632b46a6c Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Tue, 22 Jan 2019 13:26:31 -0500
+Subject: [PATCH] keyfile settings: Use tighter permissions
+
+When creating directories, create them with 700 permissions,
+instead of 777.
+
+Closes: #1658
+
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/glib/commit
+/5e4da714f00f6bfb2ccd6d73d61329c6f3a08429]
+
+CVE: CVE-2019-13012
+
+Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
+---
+ gio/gkeyfilesettingsbackend.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gio/gkeyfilesettingsbackend.c b/gio/gkeyfilesettingsbackend.c
+index a37978e83..580a0b0a1 100644
+--- a/gio/gkeyfilesettingsbackend.c
++++ b/gio/gkeyfilesettingsbackend.c
+@@ -89,7 +89,8 @@ g_keyfile_settings_backend_keyfile_write (GKeyfileSettingsBackend *kfsb)
+ 
+   contents = g_key_file_to_data (kfsb->keyfile, &length, NULL);
+   g_file_replace_contents (kfsb->file, contents, length, NULL, FALSE,
+-                           G_FILE_CREATE_REPLACE_DESTINATION,
++                           G_FILE_CREATE_REPLACE_DESTINATION |
++                           G_FILE_CREATE_PRIVATE,
+                            NULL, NULL, NULL);
+ 
+   compute_checksum (kfsb->digest, contents, length);
+@@ -640,7 +641,7 @@ g_keyfile_settings_backend_new (const gchar *filename,
+ 
+   kfsb->file = g_file_new_for_path (filename);
+   kfsb->dir = g_file_get_parent (kfsb->file);
+-  g_file_make_directory_with_parents (kfsb->dir, NULL, NULL);
++  g_mkdir_with_parents (g_file_peek_path (kfsb->dir), 0700);
+ 
+   kfsb->file_monitor = g_file_monitor (kfsb->file, 0, NULL, NULL);
+   kfsb->dir_monitor = g_file_monitor (kfsb->dir, 0, NULL, NULL);
+-- 
+2.22.0
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
index f007596968..611abd8eb8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2019-12450.patch \
            file://CVE-2019-9633_p1.patch \
            file://CVE-2019-9633_p2.patch \
+           file://CVE-2019-13012.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.22.0


