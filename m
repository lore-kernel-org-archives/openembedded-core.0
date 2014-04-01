Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7A39E6F89F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 16:23:50 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hi2so4068042wib.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 09:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FZJHraiqI2VpzVEAGwbitQTCfptVs0XsUqZ8J7mRPxI=;
	b=h3zFzdhu9YJcKOt3kFS1ZkrKXOKm7x150fQGfoJm/QkiQq9vuScss2T415gZuGz/6i
	VDiLqvxYH/PhyemnJT6in/PNPyIHlOtim4MxtzwRHDzNr1nv0B2EbBcXTeG6sfOHZPuC
	Wpoq1h4QZY4HSbT2Fs3tFyrQZlAmeUNQw4zISVCCQLQ/kS1+UoU0/WuDQxuSCsfPAqXH
	tCIhiXUriVni2AKx2vroK3gLmmau4lmikJcLAobW9r1K/eYZw6obYGQM5g0AXLvcbCBQ
	7pKeR17d0nU8Ea77ye6P+seEvpiLB7GejthFmkUkv6P6z/8hGw7g8lwhrb3N/Y2vietc
	V0PA==
X-Gm-Message-State: ALoCoQlHE1qUFqjqlzOBtBgAvXKDwNfqGIP2YThfl8iq1c/L1tyMvyElha0h1GxqmktOEgm1xlUZ
X-Received: by 10.180.93.133 with SMTP id cu5mr21155250wib.47.1396369431292;
	Tue, 01 Apr 2014 09:23:51 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fs16sm34072579wic.18.2014.04.01.09.23.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 09:23:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Apr 2014 17:23:36 +0100
Message-Id: <1396369417-22019-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] gdk-pixbuf: add an option so that loader errors are fatal
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
X-List-Received-Date: Tue, 01 Apr 2014 16:23:55 -0000

So that gdk-pixbuf-query-loader failures can be identified as such (and executed
later, or run on the target) add a magic environment variable return loader
failures from main().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch       |   79 ++++++++++++++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb |    1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
new file mode 100644
index 0000000..70146c6
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -0,0 +1,79 @@
+If an environment variable is specified set the return value from main() to
+non-zero if the loader had errors (missing libraries, generally).
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/gdk-pixbuf/queryloaders.c b/gdk-pixbuf/queryloaders.c
+index a9ca015..395674a 100644
+--- a/gdk-pixbuf/queryloaders.c
++++ b/gdk-pixbuf/queryloaders.c
+@@ -146,7 +146,7 @@ write_loader_info (GString *contents, const char *path, GdkPixbufFormat *info)
+         g_string_append_c (contents, '\n');
+ }
+ 
+-static void
++static gboolean
+ query_module (GString *contents, const char *dir, const char *file)
+ {
+         char *path;
+@@ -155,6 +155,7 @@ query_module (GString *contents, const char *dir, const char *file)
+         void                    (*fill_vtable)   (GdkPixbufModule *module);
+         gpointer fill_info_ptr;
+         gpointer fill_vtable_ptr;
++        gboolean ret = TRUE;
+ 
+         if (g_path_is_absolute (file))
+                 path = g_strdup (file);
+@@ -204,10 +205,13 @@ query_module (GString *contents, const char *dir, const char *file)
+                                    g_module_error());
+                 else
+                         g_fprintf (stderr, "Cannot load loader %s\n", path);
++                ret = FALSE;
+         }
+         if (module)
+                 g_module_close (module);
+         g_free (path);
++
++        return ret;
+ }
+ 
+ #ifdef G_OS_WIN32
+@@ -257,6 +261,7 @@ int main (int argc, char **argv)
+         GString *contents;
+         gchar *cache_file = NULL;
+         gint first_file = 1;
++        gboolean success = TRUE;
+ 
+ #ifdef G_OS_WIN32
+         gchar *libdir;
+@@ -360,7 +365,8 @@ int main (int argc, char **argv)
+                                 gint len = strlen (dent);
+                                 if (len > SOEXT_LEN &&
+                                     strcmp (dent + len - SOEXT_LEN, SOEXT) == 0) {
+-                                        query_module (contents, path, dent);
++                                        if (!query_module (contents, path, dent))
++                                                success = FALSE;
+                                 }
+                         }
+                         g_dir_close (dir);
+@@ -378,7 +384,8 @@ int main (int argc, char **argv)
+                         infilename = g_locale_to_utf8 (infilename,
+                                                        -1, NULL, NULL, NULL);
+ #endif
+-                        query_module (contents, cwd, infilename);
++                        if (!query_module (contents, cwd, infilename))
++                                success = FALSE;
+                 }
+                 g_free (cwd);
+         }
+@@ -394,5 +401,8 @@ int main (int argc, char **argv)
+         else
+                 g_print ("%s\n", contents->str);
+ 
+-        return 0;
++        if (g_getenv ("GDK_PIXBUF_FATAL_LOADER"))
++                return success ? 0 : 1;
++        else
++                return 0;
+ }
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
index 85a7b43..50e54d8 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://extending-libinstall-dependencies.patch \
            file://run-ptest \
            file://tests-check.patch \
+           file://fatal-loader.patch \
            "
 
 SRC_URI[md5sum] = "81161cc895eb43afd9ae7354b87e2261"
-- 
1.7.10.4


