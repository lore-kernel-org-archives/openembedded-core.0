Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 32D2270178
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 21:16:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 29 Nov 2016 13:16:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,570,1473145200"; d="scan'208";a="11251349"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2016 13:16:03 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2016 15:17:20 -0600
Message-Id: <20161129211720.12594-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] texinfo upgrade to 6.3
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
X-List-Received-Date: Tue, 29 Nov 2016 21:16:04 -0000

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>

---
 .../texinfo/texinfo/dont-depend-on-help2man.patch  | 19 ++++---
 .../texinfo/texinfo/texinfo-4.12-zlib.patch        | 65 +++++++++++++++-------
 .../texinfo/{texinfo_6.0.bb => texinfo_6.3.bb}     |  5 +-
 3 files changed, 56 insertions(+), 33 deletions(-)
 rename meta/recipes-extended/texinfo/{texinfo_6.0.bb => texinfo_6.3.bb} (93%)

diff --git a/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch b/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch
index 0ce47ec..f418439 100644
--- a/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch
+++ b/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch
@@ -1,31 +1,32 @@
-From 6f1f3912fcb900b3a3e6cbe3360306fade333497 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Thu, 6 Aug 2015 14:55:08 +0300
+From e89b1c57d76f5cf5acbb0d0187374f7a77bce1e2 Mon Sep 17 00:00:00 2001
+From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
+Date: Tue, 29 Nov 2016 13:43:24 -0600
 Subject: [PATCH] dont-depend-on-help2man
 
 Upstream-Status: Inappropriate
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
 ---
  doc/Makefile.am |  2 +-
  man/Makefile.am | 12 ++++++------
  2 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/doc/Makefile.am b/doc/Makefile.am
-index 7198a6b..4bba550 100644
+index 39db834..1bb2a4f
 --- a/doc/Makefile.am
 +++ b/doc/Makefile.am
-@@ -40,7 +40,7 @@ refcard_files = refcard/Makefile refcard/txicmdcheck \
+@@ -38,7 +38,7 @@ refcard_files = refcard/Makefile refcard/txicmdcheck \
  # Include our texinfo.tex, not Automake's.
  EXTRA_DIST = epsf.tex texinfo.tex \
               fdl.texi \
 -	     $(man_MANS) $(TXI_XLATE) \
 +	     $(TXI_XLATE) \
- 	     $(refcard_files)
+              $(refcard_files) texinfo-tex-test.texi \
+              texinfo-ja.tex short-sample-ja.texi
  
- if INSTALL_WARNINGS
 diff --git a/man/Makefile.am b/man/Makefile.am
-index a08d603..bdfc9a4 100644
+index 6bfcb3d..a820c96
 --- a/man/Makefile.am
 +++ b/man/Makefile.am
 @@ -13,24 +13,24 @@
@@ -60,5 +61,5 @@ index a08d603..bdfc9a4 100644
  # Maintainers should be able to regenerate.
  MAINTAINERCLEANFILES = $(man_MANS)
 -- 
-2.1.4
+2.9.3
 
diff --git a/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch b/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
index 41bd220..f25352c 100644
--- a/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
+++ b/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
@@ -1,19 +1,22 @@
-From 20e1d8a9481dc13dd1d4d168b90e0ed2ff097b98 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Thu, 6 Aug 2015 14:29:57 +0300
+From fe4f00459601efe0cfa75d92749a32237800a530 Mon Sep 17 00:00:00 2001
+From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
+Date: Tue, 29 Nov 2016 12:27:17 -0600
 Subject: [PATCH] texinfo-4.12-zlib
 
 Upstream-Status: Pending
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
 ---
- install-info/Makefile.in    |  2 +-
- install-info/install-info.c | 67 +++++++++++++++++++++++++++------------------
- 2 files changed, 42 insertions(+), 27 deletions(-)
+ install-info/Makefile.in    | 12 ++-----
+ install-info/install-info.c | 79 +++++++++++++++++++++++++++------------------
+ 2 files changed, 49 insertions(+), 42 deletions(-)
 
 diff --git a/install-info/Makefile.in b/install-info/Makefile.in
-index ad73abb..eaa2153 100644
+index 837d020..ba96579 100644
 --- a/install-info/Makefile.in
 +++ b/install-info/Makefile.in
-@@ -241,7 +241,7 @@ am__installdirs = "$(DESTDIR)$(bindir)" "$(DESTDIR)$(bindir)"
+@@ -216,7 +208,7 @@ am__installdirs = "$(DESTDIR)$(bindir)" "$(DESTDIR)$(bindir)"
  PROGRAMS = $(bin_PROGRAMS)
  am_ginstall_info_OBJECTS = install-info.$(OBJEXT)
  ginstall_info_OBJECTS = $(am_ginstall_info_OBJECTS)
@@ -23,7 +26,7 @@ index ad73abb..eaa2153 100644
  ginstall_info_DEPENDENCIES = $(top_builddir)/gnulib/lib/libgnu.a \
  	$(am__DEPENDENCIES_1)
 diff --git a/install-info/install-info.c b/install-info/install-info.c
-index b454c15..4e39122 100644
+index e58189c..8617787 100644
 --- a/install-info/install-info.c
 +++ b/install-info/install-info.c
 @@ -22,6 +22,7 @@
@@ -43,7 +46,7 @@ index b454c15..4e39122 100644
  open_possibly_compressed_file (char *filename,
      void (*create_callback) (char *),
 -    char **opened_filename, char **compression_program) 
-+    char **opened_filename, char **compression_program, int *is_pipe) 
++    char **opened_filename, char **compression_program, int *is_pipe)
  {
    char *local_opened_filename, *local_compression_program;
    int nread;
@@ -119,7 +122,7 @@ index b454c15..4e39122 100644
            if (!f)
              return 0;
          }
-@@ -767,12 +768,12 @@ open_possibly_compressed_file (char *filename,
+@@ -767,26 +768,26 @@ open_possibly_compressed_file (char *filename,
  
    /* Read first few bytes of file rather than relying on the filename.
       If the file is shorter than this it can't be usable anyway.  */
@@ -128,14 +131,34 @@ index b454c15..4e39122 100644
 +  nread = gzread (f, data, sizeof (data));
 +  if (nread != sizeof (data))
      {
-       /* Empty files don't set errno.  Calling code can check for
-          this, so make sure errno == 0 just in case it isn't already. */
 -      if (nread == 0)
 +      if (nread >= 0)
-         errno = 0;
-       return 0;
-     }
-@@ -838,35 +839,40 @@ open_possibly_compressed_file (char *filename,
+         {
+           /* Try to create the file if its empty. */
+-          if (feof (f) && create_callback)
++          if (gzeof(f) && create_callback)
+             {
+-              if (fclose (f) != 0)
++              if (gzclose(f) != 0)
+                 return 0; /* unknown error closing file */
+ 
+-              if (remove (filename) != 0)
++              if (remove(filename) != 0)
+                 return 0; /* unknown error deleting file */
+ 
+               (*create_callback) (filename);
+-              f = fopen (*opened_filename, FOPEN_RBIN);
++              f = gzopen (*opened_filename, FOPEN_RBIN);
+               if (!f)
+                 return 0;
+-              nread = fread (data, sizeof (data), 1, f);
+-              if (nread == 0)
++              nread = gzread(f, data, sizeof (data));
++              if (nread >= 0)
+                 return 0;
+               goto determine_file_type; /* success */
+             }
+@@ -857,35 +858,40 @@ determine_file_type:
      *compression_program = NULL;
  
    /* Seek back over the magic bytes.  */
@@ -183,7 +206,7 @@ index b454c15..4e39122 100644
      }
  
    return f;
-@@ -885,7 +891,8 @@ readfile (char *filename, int *sizep,
+@@ -904,7 +910,8 @@ readfile (char *filename, int *sizep,
      void (*create_callback) (char *), char **opened_filename,
      char **compression_program)
  {
@@ -193,7 +216,7 @@ index b454c15..4e39122 100644
    int filled = 0;
    int data_size = 8192;
    char *data = xmalloc (data_size);
-@@ -893,14 +900,20 @@ readfile (char *filename, int *sizep,
+@@ -912,14 +919,20 @@ readfile (char *filename, int *sizep,
    /* If they passed the space for the file name to return, use it.  */
    f = open_possibly_compressed_file (filename, create_callback,
                                       opened_filename,
@@ -216,7 +239,7 @@ index b454c15..4e39122 100644
        if (nread < 0)
          return 0;
        if (nread == 0)
-@@ -919,8 +932,10 @@ readfile (char *filename, int *sizep,
+@@ -938,8 +951,10 @@ readfile (char *filename, int *sizep,
    /* We need to close the stream, since on some systems the pipe created
       by popen is simulated by a temporary file which only gets removed
       inside pclose.  */
@@ -229,5 +252,5 @@ index b454c15..4e39122 100644
    *sizep = filled;
    return data;
 -- 
-2.1.4
+2.9.3
 
diff --git a/meta/recipes-extended/texinfo/texinfo_6.0.bb b/meta/recipes-extended/texinfo/texinfo_6.3.bb
similarity index 93%
rename from meta/recipes-extended/texinfo/texinfo_6.0.bb
rename to meta/recipes-extended/texinfo/texinfo_6.3.bb
index 8638bb1..cd9a844 100644
--- a/meta/recipes-extended/texinfo/texinfo_6.0.bb
+++ b/meta/recipes-extended/texinfo/texinfo_6.3.bb
@@ -30,15 +30,14 @@ TARGET_PATCH_class-native = ""
 
 SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
            file://texinfo-4.12-zlib.patch \
-           file://disable-native-tools.patch \
            file://link-zip.patch \
            file://dont-depend-on-help2man.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            ${TARGET_PATCH} \
           "
 
-SRC_URI[md5sum] = "e1a2ef5dce5018b53f0f6eed45b247a7"
-SRC_URI[sha256sum] = "83d3183290f34e7f958d209d0b20022c6fe9e921eb6fe94c27d988827d4878d2"
+SRC_URI[md5sum] = "9b08daca9bf8eccae9b0f884aba41f9e"
+SRC_URI[sha256sum] = "300a6ba4958c2dd4a6d5ce60f0a335daf7e379f5374f276f6ba31a221f02f606"
 
 tex_texinfo = "texmf/tex/texinfo"
 
-- 
2.9.3


