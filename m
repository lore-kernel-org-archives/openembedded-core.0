Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 654BC7FBBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:14:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znjr3Zfnz5d
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:14:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579281280;
	bh=ruSpFVy8kgptZoePY0DsylAhbRCCVq6MAPKBF+8Hrkg=;
	h=From:To:Subject:Date:From;
	b=FcUATQC6nVWKYqSDB4MUR7BdlAvbzyFWFog0pcggjeV7wYGWsDhTGsHz5t+00itiv
	bBoaMESY+q5q6LGfdu2z5gPx/GZPw1ETkSxogLoMuHLvkRW/L5qdUPeQeCCfAYvVGm
	ZX6JyVx8gZxOJOfCgAxOtQPsoTOc5ViF8nXKaFU65jYu90mjgTkF/UHNa7Z323IMfR
	KkRv9xXTpF14w36GPvoVICVXHMuogfdUcn4unR9tjBMEdEoK4JzhlE5nyrSy3pkO6U
	g0wfhsZeBCoV74o0yEZVVDMFW6tx4aZR9SKRIcTDSjoOl9e2cBIYYYfuirpIHMlKPg
	bgVsC8LLuUWAGCavyfBMuPIvD/q2mGdpNZC6We+q4nCbIor2LCtFNySLcZnW99SIW7
	m2QppM5TS8OGJuoPFv8C58PR8VZbP7nxCgV1RZklPouThqTPFXYLHKkJlve53RNNok
	3zx9uVzaeC9oQkaE9ssy/JeRkYciKRNsuiqco9i8cAnwvxNyGIFSNyd7ax43MtUqfr
	g3TcWsrOP5MILWdbU/6fd5Ek1VNEqYdsO916wF0vU7CG1hgfnvY4tBz4dYgWeZPDpg
	43yce++EKkPSHbFd2/mOUsXnI3+wNQLt0dlLlaVv5rEt+IqlilVJWMJGFOe4FjSccs
	fC8qJ2m2O8rqS11NhHHRvVKY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:14:29 +0200
Message-Id: <20200117171436.17131-9-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] glib-2.0: Backport the CVE-2019-12450 fix
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
X-List-Received-Date: Fri, 17 Jan 2020 17:14:39 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...e-Limit-access-to-files-when-copying.patch | 57 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gfile-Limit-access-to-files-when-copying.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gfile-Limit-access-to-files-when-copying.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gfile-Limit-access-to-files-when-copying.patch
new file mode 100644
index 0000000000..8fc03d1aed
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gfile-Limit-access-to-files-when-copying.patch
@@ -0,0 +1,57 @@
+From e6b769819d63d2b24b251dbc9f902fe6fd614da3 Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Thu, 23 May 2019 10:41:53 +0200
+Subject: gfile: Limit access to files when copying
+
+file_copy_fallback creates new files with default permissions and
+set the correct permissions after the operation is finished. This
+might cause that the files can be accessible by more users during
+the operation than expected. Use G_FILE_CREATE_PRIVATE for the new
+files to limit access to those files.
+
+CVE: CVE-2019-12450
+Upstream-Status: Backport
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ gio/gfile.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/gio/gfile.c b/gio/gfile.c
+index 1cc69166a..13b435480 100644
+--- a/gio/gfile.c
++++ b/gio/gfile.c
+@@ -3284,12 +3284,12 @@ file_copy_fallback (GFile                  *source,
+         out = (GOutputStream*)_g_local_file_output_stream_replace (_g_local_file_get_filename (G_LOCAL_FILE (destination)),
+                                                                    FALSE, NULL,
+                                                                    flags & G_FILE_COPY_BACKUP,
+-                                                                   G_FILE_CREATE_REPLACE_DESTINATION,
+-                                                                   info,
++                                                                   G_FILE_CREATE_REPLACE_DESTINATION |
++                                                                   G_FILE_CREATE_PRIVATE, info,
+                                                                    cancellable, error);
+       else
+         out = (GOutputStream*)_g_local_file_output_stream_create (_g_local_file_get_filename (G_LOCAL_FILE (destination)),
+-                                                                  FALSE, 0, info,
++                                                                  FALSE, G_FILE_CREATE_PRIVATE, info,
+                                                                   cancellable, error);
+     }
+   else if (flags & G_FILE_COPY_OVERWRITE)
+@@ -3297,12 +3297,13 @@ file_copy_fallback (GFile                  *source,
+       out = (GOutputStream *)g_file_replace (destination,
+                                              NULL,
+                                              flags & G_FILE_COPY_BACKUP,
+-                                             G_FILE_CREATE_REPLACE_DESTINATION,
++                                             G_FILE_CREATE_REPLACE_DESTINATION |
++                                             G_FILE_CREATE_PRIVATE,
+                                              cancellable, error);
+     }
+   else
+     {
+-      out = (GOutputStream *)g_file_create (destination, 0, cancellable, error);
++      out = (GOutputStream *)g_file_create (destination, G_FILE_CREATE_PRIVATE, cancellable, error);
+     }
+ 
+   if (!out)
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
index 2286d03148..f151a3358f 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch \
            file://glib-meson.cross \
            file://CVE-2019-13012.patch \
+           file://0001-gfile-Limit-access-to-files-when-copying.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.17.1


