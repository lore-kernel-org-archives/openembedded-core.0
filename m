Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfuV-0002yu-Q2
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:32 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125511"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:22 -0700
Message-Id: <b1c28667592e736115ab5e603a12c2723b939cf2.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 11/32] dpkg-native: fix deb-based rootfs construction failure on Fedora 16
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2012 21:49:35 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Backport a fix from 1.16.x upstream to use fd instead of stream-based
I/O in dpkg-deb, which avoids the use of fflush() on an input stream
(the behaviour of which is undefined by POSIX, and appears to have
changed in the version of glibc introduced in Fedora 16 and presumably
other systems).

Fixes [YOCTO #1858].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../dpkg/dpkg/dpkg-deb-avoid-fflush.patch          |  198 ++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb        |    5 +-
 2 files changed, 201 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch b/meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch
new file mode 100644
index 0000000..a5d6b61
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch
@@ -0,0 +1,198 @@
+From 78eaf928d30d0b16e05d8d63c55a3632a135ed9a Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@debian.org>
+Date: Thu, 4 Nov 2010 00:51:13 +0100
+Subject: [PATCH] dpkg-deb: Use fd instead of stream based buffered I/O
+
+Behaviour of fflush() on input streams is undefined per POSIX, avoid
+mixing stream and file descriptor based I/O, and only use the latter
+instead.
+
+Upstream-Status: Backport of revision 2d420ee1d05033d237462a0075facfe406b08043 (in 1.16.x)
+
+---
+ dpkg-deb/extract.c |   83 ++++++++++++++++++++++++++++++++++++++-------------
+ 1 files changed, 62 insertions(+), 21 deletions(-)
+
+diff --git a/dpkg-deb/extract.c b/dpkg-deb/extract.c
+index 22aea98..0f5ac88 100644
+--- a/dpkg-deb/extract.c
++++ b/dpkg-deb/extract.c
+@@ -31,6 +31,7 @@
+ #include <ctype.h>
+ #include <string.h>
+ #include <dirent.h>
++#include <fcntl.h>
+ #include <unistd.h>
+ #include <ar.h>
+ #include <stdbool.h>
+@@ -61,13 +62,41 @@ static void movecontrolfiles(const char *thing) {
+ }
+ 
+ static void DPKG_ATTR_NORET
+-readfail(FILE *a, const char *filename, const char *what)
++read_fail(int rc, const char *filename, const char *what)
+ {
+-  if (ferror(a)) {
+-    ohshite(_("error reading %s from file %.255s"), what, filename);
+-  } else {
++  if (rc == 0)
+     ohshit(_("unexpected end of file in %s in %.255s"),what,filename);
++  else
++    ohshite(_("error reading %s from file %.255s"), what, filename);
++}
++
++static ssize_t
++read_line(int fd, char *buf, size_t min_size, size_t max_size)
++{
++  ssize_t line_size = 0;
++  size_t n = min_size;
++
++  while (line_size < (ssize_t)max_size) {
++    ssize_t r;
++    char *nl;
++
++    r = read(fd, buf + line_size, n);
++    if (r <= 0)
++      return r;
++
++    nl = strchr(buf + line_size, '\n');
++    line_size += r;
++
++    if (nl != NULL) {
++      nl[1] = '\0';
++      return line_size;
++    }
++
++    n = 1;
+   }
++
++  buf[line_size] = '\0';
++  return line_size;
+ }
+ 
+ static size_t
+@@ -115,19 +144,26 @@ void extracthalf(const char *debar, const char *directory,
+   char versionbuf[40];
+   float versionnum;
+   size_t ctrllennum, memberlen= 0;
++  ssize_t r;
+   int dummy;
+   pid_t c1=0,c2,c3;
+   int p1[2], p2[2];
+-  FILE *ar;
++  int arfd;
+   struct stat stab;
+   char nlc;
+   int adminmember;
+   bool oldformat, header_done;
+   struct compressor *decompressor = &compressor_gzip;
+   
+-  ar= fopen(debar,"r"); if (!ar) ohshite(_("failed to read archive `%.255s'"),debar);
+-  if (fstat(fileno(ar),&stab)) ohshite(_("failed to fstat archive"));
+-  if (!fgets(versionbuf,sizeof(versionbuf),ar)) readfail(ar,debar,_("version number"));
++  arfd = open(debar, O_RDONLY);
++  if (arfd < 0)
++    ohshite(_("failed to read archive `%.255s'"), debar);
++  if (fstat(arfd, &stab))
++    ohshite(_("failed to fstat archive"));
++
++  r = read_line(arfd, versionbuf, strlen(DPKG_AR_MAGIC), sizeof(versionbuf));
++  if (r < 0)
++    read_fail(r, debar, _("archive magic version number"));
+ 
+   if (!strcmp(versionbuf, DPKG_AR_MAGIC)) {
+     oldformat = false;
+@@ -137,8 +173,9 @@ void extracthalf(const char *debar, const char *directory,
+     for (;;) {
+       struct ar_hdr arh;
+ 
+-      if (fread(&arh,1,sizeof(arh),ar) != sizeof(arh))
+-        readfail(ar,debar,_("between members"));
++      r = read(arfd, &arh, sizeof(arh));
++      if (r != sizeof(arh))
++        read_fail(r, debar, _("archive member header"));
+ 
+       dpkg_ar_normalize_name(&arh);
+ 
+@@ -153,8 +190,9 @@ void extracthalf(const char *debar, const char *directory,
+         if (strncmp(arh.ar_name, DEBMAGIC, sizeof(arh.ar_name)) != 0)
+           ohshit(_("file `%.250s' is not a debian binary archive (try dpkg-split?)"),debar);
+         infobuf= m_malloc(memberlen+1);
+-        if (fread(infobuf,1, memberlen + (memberlen&1), ar) != memberlen + (memberlen&1))
+-          readfail(ar,debar,_("header info member"));
++        r = read(arfd, infobuf, memberlen + (memberlen & 1));
++        if ((size_t)r != (memberlen + (memberlen & 1)))
++          read_fail(r, debar, _("archive information header member"));
+         infobuf[memberlen] = '\0';
+         cur= strchr(infobuf,'\n');
+         if (!cur) ohshit(_("archive has no newlines in header"));
+@@ -174,7 +212,8 @@ void extracthalf(const char *debar, const char *directory,
+           /* Members with `_' are noncritical, and if we don't understand them
+            * we skip them.
+            */
+-	stream_null_copy(ar, memberlen + (memberlen&1),_("skipped member data from %s"), debar);
++        fd_null_copy(arfd, memberlen + (memberlen & 1),
++                     _("skipped archive member data from %s"), debar);
+       } else {
+ 	if (strncmp(arh.ar_name, ADMINMEMBER, sizeof(arh.ar_name)) == 0)
+ 	  adminmember = 1;
+@@ -198,7 +237,8 @@ void extracthalf(const char *debar, const char *directory,
+           ctrllennum= memberlen;
+         }
+         if (!adminmember != !admininfo) {
+-	  stream_null_copy(ar, memberlen + (memberlen&1),_("skipped member data from %s"), debar);
++          fd_null_copy(arfd, memberlen + (memberlen & 1),
++                       _("skipped archive member data from %s"), debar);
+         } else {
+           break; /* Yes ! - found it. */
+         }
+@@ -221,8 +261,10 @@ void extracthalf(const char *debar, const char *directory,
+     l = strlen(versionbuf);
+     if (l && versionbuf[l - 1] == '\n')
+       versionbuf[l - 1] = '\0';
+-    if (!fgets(ctrllenbuf,sizeof(ctrllenbuf),ar))
+-      readfail(ar, debar, _("control information length"));
++
++    r = read_line(arfd, ctrllenbuf, 1, sizeof(ctrllenbuf));
++    if (r < 0)
++      read_fail(r, debar, _("archive control member size"));
+     if (sscanf(ctrllenbuf,"%zi%c%d",&ctrllennum,&nlc,&dummy) !=2 || nlc != '\n')
+       ohshit(_("archive has malformatted control length `%s'"), ctrllenbuf);
+ 
+@@ -230,7 +272,8 @@ void extracthalf(const char *debar, const char *directory,
+       memberlen = ctrllennum;
+     } else {
+       memberlen = stab.st_size - ctrllennum - strlen(ctrllenbuf) - l;
+-      stream_null_copy(ar, ctrllennum, _("skipped control area from %s"), debar);
++      fd_null_copy(arfd, ctrllennum,
++                   _("skipped archive control member data from %s"), debar);
+     }
+ 
+     if (admininfo >= 2) {
+@@ -252,13 +295,11 @@ void extracthalf(const char *debar, const char *directory,
+ 
+   }
+ 
+-  safe_fflush(ar);
+-
+   m_pipe(p1);
+   c1 = subproc_fork();
+   if (!c1) {
+     close(p1[0]);
+-    stream_fd_copy(ar, p1[1], memberlen, _("failed to write to pipe in copy"));
++    fd_fd_copy(arfd, p1[1], memberlen, _("failed to write to pipe in copy"));
+     if (close(p1[1]))
+       ohshite(_("failed to close pipe in copy"));
+     exit(0);
+@@ -275,7 +316,7 @@ void extracthalf(const char *debar, const char *directory,
+     decompress_filter(decompressor, 0, 1, _("data"));
+   }
+   close(p1[0]);
+-  fclose(ar);
++  close(arfd);
+   if (taroption) close(p2[1]);
+ 
+   if (taroption && directory) {
+-- 
+1.7.7.6
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
index f1030fa..1e7ef25 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
@@ -5,10 +5,11 @@ SRC_URI += "file://noman.patch \
             file://check_snprintf.patch \
             file://check_version.patch \
             file://perllibdir.patch \
-            file://preinst.patch"
+            file://preinst.patch \
+            file://dpkg-deb-avoid-fflush.patch"
 
 SRC_URI[md5sum] = "d1731d4147c1ea3b537a4d094519a6dc"
 SRC_URI[sha256sum] = "1ec1376471b04717a4497e5d7a27cd545248c92116898ce0c53ced8ea94267b5"
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
-- 
1.7.9.5



