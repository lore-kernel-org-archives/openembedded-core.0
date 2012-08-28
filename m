Received: from [192.55.52.88] (helo=mga01.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T6NRG-00053L-3u
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 17:10:47 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Aug 2012 07:58:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,327,1344236400"; d="scan'208";a="214847635"
Received: from costin-desktop (HELO [10.237.105.156]) ([10.237.105.156])
	by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2012 07:58:30 -0700
Message-ID: <503CCFB1.9070109@intel.com>
Date: Tue, 28 Aug 2012 17:03:29 +0300
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1346162560-30905-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1346162560-30905-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] dpkg: upgrade to 1.16.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2012 15:10:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/28/2012 05:02 PM, Constantin Musca wrote:
> autofoo.patch: removed
> 	- the patch is not used
> check_version: adapted to the new version
> 	- adapt the linux-wrs kernel version, which has character '_'
> 	- remove the first-char-digit-check (as the 1.15.8.5 version does)
> dpkg-deb-avoid-fflush.patch: removed
> 	- the patch is included in the new version
> fix-timestamps.patch: added
> 	- the lutimes function doesn't work properly for all systems
> ignore_extra_fields.patch: adapted to the new version
> nochroot.patch: removed
> 	- the patch is not used
> noman.patch: adapted to the new version
> noupdalt.patch: removed
> 	- the patch is not used
> perllibdir.patch: removed
> 	- in the new version PERL_LIBDIR will be set only if empty
> preinst.patch: adapted to new version
> removed-tar-no-timestamp.patch: added
> 	- the busybox-1.19.4 tar utility doesn't support --warning=no-timestamp
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   meta/recipes-devtools/dpkg/dpkg.inc                |    4 +-
>   meta/recipes-devtools/dpkg/dpkg/autofoo.patch      |   50 -----
>   .../recipes-devtools/dpkg/dpkg/check_version.patch |   23 ++-
>   .../dpkg/dpkg/dpkg-deb-avoid-fflush.patch          |  198 --------------------
>   .../dpkg/dpkg/fix-timestamps.patch                 |   21 +++
>   .../dpkg/dpkg/ignore_extra_fields.patch            |   35 ++--
>   meta/recipes-devtools/dpkg/dpkg/nochroot.patch     |   20 --
>   meta/recipes-devtools/dpkg/dpkg/noman.patch        |    1 -
>   meta/recipes-devtools/dpkg/dpkg/noupdalt.patch     |   18 --
>   meta/recipes-devtools/dpkg/dpkg/perllibdir.patch   |   22 ---
>   meta/recipes-devtools/dpkg/dpkg/preinst.patch      |   75 ++++----
>   .../dpkg/dpkg/remove-tar-no-timestamp.patch        |   16 ++
>   .../dpkg/{dpkg_1.15.8.7.bb => dpkg_1.16.8.bb}      |   10 +-
>   13 files changed, 116 insertions(+), 377 deletions(-)
>   delete mode 100644 meta/recipes-devtools/dpkg/dpkg/autofoo.patch
>   delete mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch
>   create mode 100644 meta/recipes-devtools/dpkg/dpkg/fix-timestamps.patch
>   delete mode 100644 meta/recipes-devtools/dpkg/dpkg/nochroot.patch
>   delete mode 100644 meta/recipes-devtools/dpkg/dpkg/noupdalt.patch
>   delete mode 100644 meta/recipes-devtools/dpkg/dpkg/perllibdir.patch
>   create mode 100644 meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
>   rename meta/recipes-devtools/dpkg/{dpkg_1.15.8.7.bb => dpkg_1.16.8.bb} (49%)
>
> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
> index 7f4f620..723d1b2 100644
> --- a/meta/recipes-devtools/dpkg/dpkg.inc
> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> @@ -2,9 +2,9 @@ DESCRIPTION = "Package maintenance system for Debian."
>   LICENSE = "GPLv2.0+"
>   SECTION = "base"
>   
> -INC_PR = "r17"
> +INC_PR = "r18"
>   
> -SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2 \
> +SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz \
>              file://ignore_extra_fields.patch"
>   
>   DEPENDS = "zlib bzip2 perl"
> diff --git a/meta/recipes-devtools/dpkg/dpkg/autofoo.patch b/meta/recipes-devtools/dpkg/dpkg/autofoo.patch
> deleted file mode 100644
> index 2f1edce..0000000
> --- a/meta/recipes-devtools/dpkg/dpkg/autofoo.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -
> -#
> -# Patch managed by http://www.holgerschurig.de/patcher.html
> -#
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> ---- dpkg-1.10.23/configure.in~autofoo
> -+++ dpkg-1.10.23/configure.in
> -@@ -227,21 +227,36 @@
> - # OpenBSD passes AC_TRY_COMPILE for va_copy even though
> - # it doesn't seem to exist, which is odd. We need to use
> - # AC_TRY_RUN.
> -+#
> -+# If crosscompiling, use AC_TRY_COMPILE. -CL
> - AC_TRY_RUN([
> - #include <stdarg.h>
> - main(){
> - va_list v1,v2;
> - va_copy(v1, v2);
> - exit(0);}
> --], [AC_MSG_RESULT(yes)
> --AC_DEFINE(HAVE_VA_COPY,,[Whether the va_copy macro exists])],[AC_MSG_RESULT(no)
> --AC_MSG_CHECKING([for va_list assignment copy])
> -+], [dpkg_cv_va_copy=yes], [dpkg_cv_va_copy=no],
> - AC_TRY_COMPILE([
> - #include <stdarg.h>
> -+main(){
> -+va_list v1,v2;
> -+va_copy(v1, v2);
> -+exit(0);}
> -+], [dpkg_cv_va_copy=yes], [dpkg_vc_va_copy=no]))
> -+
> -+if test "$dpkg_cv_va_copy" = "yes"; then
> -+	AC_MSG_RESULT(yes)
> -+	AC_DEFINE(HAVE_VA_COPY,,[Whether the va_copy macro exists])
> -+else
> -+	AC_MSG_RESULT(no)
> -+	AC_MSG_CHECKING([for va_list assignment copy])
> -+	AC_TRY_COMPILE([
> -+#include <stdarg.h>
> - ],[
> - va_list v1,v2;
> - v1 = v2;
> --], AC_MSG_RESULT(yes),AC_MSG_ERROR(no))])
> -+], AC_MSG_RESULT(yes), AC_MSG_ERROR(no))
> -+fi
> -
> - DPKG_C_GCC_ATTRIBUTE([,,],supported,[int x],[,,],ATTRIB,[Define if function attributes a la GCC 2.5 and higher are available.],
> -   DPKG_C_GCC_ATTRIBUTE(noreturn,noreturn,[int x],noreturn,NORETURN,[Define if nonreturning functions a la GCC 2.5 and higher are available.])
> diff --git a/meta/recipes-devtools/dpkg/dpkg/check_version.patch b/meta/recipes-devtools/dpkg/dpkg/check_version.patch
> index 524e715..3175731 100644
> --- a/meta/recipes-devtools/dpkg/dpkg/check_version.patch
> +++ b/meta/recipes-devtools/dpkg/dpkg/check_version.patch
> @@ -1,23 +1,28 @@
>   Adapt to linux-wrs kernel version, which has character '_' inside.
> +Remove the first-char-digit-check (as the 1.15.8.5 version does).
>   
>   Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>   
>   Upstream-Status: Inappropriate [embedded specific]
>   
> -diff -ruN dpkg-1.15.8.5-orig/lib/dpkg/parsehelp.c dpkg-1.15.8.5/lib/dpkg/parsehelp.c
> ---- dpkg-1.15.8.5-orig/lib/dpkg/parsehelp.c	2010-10-08 12:27:15.058572774 +0800
> -+++ dpkg-1.15.8.5/lib/dpkg/parsehelp.c	2010-10-09 11:18:15.484190771 +0800
> -@@ -268,11 +268,11 @@
> +Index: dpkg-1.16.8/lib/dpkg/parsehelp.c
> +===================================================================
> +--- dpkg-1.16.8.orig/lib/dpkg/parsehelp.c
> ++++ dpkg-1.16.8/lib/dpkg/parsehelp.c
> +@@ -258,14 +258,12 @@ parseversion(struct dpkg_version *rversi
>    
>      /* XXX: Would be faster to use something like cisversion and cisrevision. */
> -   for (ptr = rversion->version; *ptr; ptr++) {
> +   ptr = rversion->version;
> +-  if (*ptr && !cisdigit(*ptr++))
> +-    return dpkg_put_warn(err, _("version number does not start with digit"));
> +   for (; *ptr; ptr++) {
>   -    if (!cisdigit(*ptr) && !cisalpha(*ptr) && strchr(".-+~:", *ptr) == NULL)
>   +    if (!cisdigit(*ptr) && !cisalpha(*ptr) && strchr(".-+~:_", *ptr) == NULL)
> -       return _("invalid character in version number");
> +       return dpkg_put_warn(err, _("invalid character in version number"));
>      }
>      for (ptr = rversion->revision; *ptr; ptr++) {
> --    if (!cisdigit(*ptr) && !cisalpha(*ptr) && strchr(".-+~", *ptr) == NULL)
> +-    if (!cisdigit(*ptr) && !cisalpha(*ptr) && strchr(".+~", *ptr) == NULL)
>   +    if (!cisdigit(*ptr) && !cisalpha(*ptr) && strchr(".-+~_", *ptr) == NULL)
> -       return _("invalid character in revision number");
> +       return dpkg_put_warn(err, _("invalid character in revision number"));
>      }
> -
> diff --git a/meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch b/meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch
> deleted file mode 100644
> index a5d6b61..0000000
> --- a/meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch
> +++ /dev/null
> @@ -1,198 +0,0 @@
> -From 78eaf928d30d0b16e05d8d63c55a3632a135ed9a Mon Sep 17 00:00:00 2001
> -From: Guillem Jover <guillem@debian.org>
> -Date: Thu, 4 Nov 2010 00:51:13 +0100
> -Subject: [PATCH] dpkg-deb: Use fd instead of stream based buffered I/O
> -
> -Behaviour of fflush() on input streams is undefined per POSIX, avoid
> -mixing stream and file descriptor based I/O, and only use the latter
> -instead.
> -
> -Upstream-Status: Backport of revision 2d420ee1d05033d237462a0075facfe406b08043 (in 1.16.x)
> -
> ----
> - dpkg-deb/extract.c |   83 ++++++++++++++++++++++++++++++++++++++-------------
> - 1 files changed, 62 insertions(+), 21 deletions(-)
> -
> -diff --git a/dpkg-deb/extract.c b/dpkg-deb/extract.c
> -index 22aea98..0f5ac88 100644
> ---- a/dpkg-deb/extract.c
> -+++ b/dpkg-deb/extract.c
> -@@ -31,6 +31,7 @@
> - #include <ctype.h>
> - #include <string.h>
> - #include <dirent.h>
> -+#include <fcntl.h>
> - #include <unistd.h>
> - #include <ar.h>
> - #include <stdbool.h>
> -@@ -61,13 +62,41 @@ static void movecontrolfiles(const char *thing) {
> - }
> -
> - static void DPKG_ATTR_NORET
> --readfail(FILE *a, const char *filename, const char *what)
> -+read_fail(int rc, const char *filename, const char *what)
> - {
> --  if (ferror(a)) {
> --    ohshite(_("error reading %s from file %.255s"), what, filename);
> --  } else {
> -+  if (rc == 0)
> -     ohshit(_("unexpected end of file in %s in %.255s"),what,filename);
> -+  else
> -+    ohshite(_("error reading %s from file %.255s"), what, filename);
> -+}
> -+
> -+static ssize_t
> -+read_line(int fd, char *buf, size_t min_size, size_t max_size)
> -+{
> -+  ssize_t line_size = 0;
> -+  size_t n = min_size;
> -+
> -+  while (line_size < (ssize_t)max_size) {
> -+    ssize_t r;
> -+    char *nl;
> -+
> -+    r = read(fd, buf + line_size, n);
> -+    if (r <= 0)
> -+      return r;
> -+
> -+    nl = strchr(buf + line_size, '\n');
> -+    line_size += r;
> -+
> -+    if (nl != NULL) {
> -+      nl[1] = '\0';
> -+      return line_size;
> -+    }
> -+
> -+    n = 1;
> -   }
> -+
> -+  buf[line_size] = '\0';
> -+  return line_size;
> - }
> -
> - static size_t
> -@@ -115,19 +144,26 @@ void extracthalf(const char *debar, const char *directory,
> -   char versionbuf[40];
> -   float versionnum;
> -   size_t ctrllennum, memberlen= 0;
> -+  ssize_t r;
> -   int dummy;
> -   pid_t c1=0,c2,c3;
> -   int p1[2], p2[2];
> --  FILE *ar;
> -+  int arfd;
> -   struct stat stab;
> -   char nlc;
> -   int adminmember;
> -   bool oldformat, header_done;
> -   struct compressor *decompressor = &compressor_gzip;
> -
> --  ar= fopen(debar,"r"); if (!ar) ohshite(_("failed to read archive `%.255s'"),debar);
> --  if (fstat(fileno(ar),&stab)) ohshite(_("failed to fstat archive"));
> --  if (!fgets(versionbuf,sizeof(versionbuf),ar)) readfail(ar,debar,_("version number"));
> -+  arfd = open(debar, O_RDONLY);
> -+  if (arfd < 0)
> -+    ohshite(_("failed to read archive `%.255s'"), debar);
> -+  if (fstat(arfd, &stab))
> -+    ohshite(_("failed to fstat archive"));
> -+
> -+  r = read_line(arfd, versionbuf, strlen(DPKG_AR_MAGIC), sizeof(versionbuf));
> -+  if (r < 0)
> -+    read_fail(r, debar, _("archive magic version number"));
> -
> -   if (!strcmp(versionbuf, DPKG_AR_MAGIC)) {
> -     oldformat = false;
> -@@ -137,8 +173,9 @@ void extracthalf(const char *debar, const char *directory,
> -     for (;;) {
> -       struct ar_hdr arh;
> -
> --      if (fread(&arh,1,sizeof(arh),ar) != sizeof(arh))
> --        readfail(ar,debar,_("between members"));
> -+      r = read(arfd, &arh, sizeof(arh));
> -+      if (r != sizeof(arh))
> -+        read_fail(r, debar, _("archive member header"));
> -
> -       dpkg_ar_normalize_name(&arh);
> -
> -@@ -153,8 +190,9 @@ void extracthalf(const char *debar, const char *directory,
> -         if (strncmp(arh.ar_name, DEBMAGIC, sizeof(arh.ar_name)) != 0)
> -           ohshit(_("file `%.250s' is not a debian binary archive (try dpkg-split?)"),debar);
> -         infobuf= m_malloc(memberlen+1);
> --        if (fread(infobuf,1, memberlen + (memberlen&1), ar) != memberlen + (memberlen&1))
> --          readfail(ar,debar,_("header info member"));
> -+        r = read(arfd, infobuf, memberlen + (memberlen & 1));
> -+        if ((size_t)r != (memberlen + (memberlen & 1)))
> -+          read_fail(r, debar, _("archive information header member"));
> -         infobuf[memberlen] = '\0';
> -         cur= strchr(infobuf,'\n');
> -         if (!cur) ohshit(_("archive has no newlines in header"));
> -@@ -174,7 +212,8 @@ void extracthalf(const char *debar, const char *directory,
> -           /* Members with `_' are noncritical, and if we don't understand them
> -            * we skip them.
> -            */
> --	stream_null_copy(ar, memberlen + (memberlen&1),_("skipped member data from %s"), debar);
> -+        fd_null_copy(arfd, memberlen + (memberlen & 1),
> -+                     _("skipped archive member data from %s"), debar);
> -       } else {
> - 	if (strncmp(arh.ar_name, ADMINMEMBER, sizeof(arh.ar_name)) == 0)
> - 	  adminmember = 1;
> -@@ -198,7 +237,8 @@ void extracthalf(const char *debar, const char *directory,
> -           ctrllennum= memberlen;
> -         }
> -         if (!adminmember != !admininfo) {
> --	  stream_null_copy(ar, memberlen + (memberlen&1),_("skipped member data from %s"), debar);
> -+          fd_null_copy(arfd, memberlen + (memberlen & 1),
> -+                       _("skipped archive member data from %s"), debar);
> -         } else {
> -           break; /* Yes ! - found it. */
> -         }
> -@@ -221,8 +261,10 @@ void extracthalf(const char *debar, const char *directory,
> -     l = strlen(versionbuf);
> -     if (l && versionbuf[l - 1] == '\n')
> -       versionbuf[l - 1] = '\0';
> --    if (!fgets(ctrllenbuf,sizeof(ctrllenbuf),ar))
> --      readfail(ar, debar, _("control information length"));
> -+
> -+    r = read_line(arfd, ctrllenbuf, 1, sizeof(ctrllenbuf));
> -+    if (r < 0)
> -+      read_fail(r, debar, _("archive control member size"));
> -     if (sscanf(ctrllenbuf,"%zi%c%d",&ctrllennum,&nlc,&dummy) !=2 || nlc != '\n')
> -       ohshit(_("archive has malformatted control length `%s'"), ctrllenbuf);
> -
> -@@ -230,7 +272,8 @@ void extracthalf(const char *debar, const char *directory,
> -       memberlen = ctrllennum;
> -     } else {
> -       memberlen = stab.st_size - ctrllennum - strlen(ctrllenbuf) - l;
> --      stream_null_copy(ar, ctrllennum, _("skipped control area from %s"), debar);
> -+      fd_null_copy(arfd, ctrllennum,
> -+                   _("skipped archive control member data from %s"), debar);
> -     }
> -
> -     if (admininfo >= 2) {
> -@@ -252,13 +295,11 @@ void extracthalf(const char *debar, const char *directory,
> -
> -   }
> -
> --  safe_fflush(ar);
> --
> -   m_pipe(p1);
> -   c1 = subproc_fork();
> -   if (!c1) {
> -     close(p1[0]);
> --    stream_fd_copy(ar, p1[1], memberlen, _("failed to write to pipe in copy"));
> -+    fd_fd_copy(arfd, p1[1], memberlen, _("failed to write to pipe in copy"));
> -     if (close(p1[1]))
> -       ohshite(_("failed to close pipe in copy"));
> -     exit(0);
> -@@ -275,7 +316,7 @@ void extracthalf(const char *debar, const char *directory,
> -     decompress_filter(decompressor, 0, 1, _("data"));
> -   }
> -   close(p1[0]);
> --  fclose(ar);
> -+  close(arfd);
> -   if (taroption) close(p2[1]);
> -
> -   if (taroption && directory) {
> ---
> -1.7.7.6
> -
> diff --git a/meta/recipes-devtools/dpkg/dpkg/fix-timestamps.patch b/meta/recipes-devtools/dpkg/dpkg/fix-timestamps.patch
> new file mode 100644
> index 0000000..d2cabbe
> --- /dev/null
> +++ b/meta/recipes-devtools/dpkg/dpkg/fix-timestamps.patch
> @@ -0,0 +1,21 @@
> +The lutimes function doesn't work properly for all systems.
> +
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Index: dpkg-1.16.8/src/archives.c
> +===================================================================
> +--- dpkg-1.16.8.orig/src/archives.c
> ++++ dpkg-1.16.8/src/archives.c
> +@@ -440,8 +440,10 @@ tarobject_set_mtime(struct tar_entry *te
> +
> +   if (te->type == tar_filetype_symlink) {
> + #ifdef HAVE_LUTIMES
> ++/*
> +     if (lutimes(path, tv) && errno != ENOSYS)
> +       ohshite(_("error setting timestamps of `%.255s'"), path);
> ++*/
> + #endif
> +   } else {
> +     if (utimes(path, tv))
> diff --git a/meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch b/meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch
> index 0ff09e7..4e3eb97 100644
> --- a/meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch
> +++ b/meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch
> @@ -1,22 +1,21 @@
>   Upstream-Status: Inappropriate [workaround]
>   
> -diff -ruN dpkg-1.15.8.5-orig/dpkg-deb/build.c dpkg-1.15.8.5/dpkg-deb/build.c
> ---- dpkg-1.15.8.5-orig/dpkg-deb/build.c	2010-10-08 12:27:15.042083703 +0800
> -+++ dpkg-1.15.8.5/dpkg-deb/build.c	2010-10-08 12:31:53.822534277 +0800
> -@@ -275,14 +275,14 @@
> -               controlfile, checkedinfo->otherpriority);
> -       warns++;
> -     }
> --    for (field= checkedinfo->available.arbs; field; field= field->next) {
> -+    /*for (field= checkedinfo->available.arbs; field; field= field->next) {
> -       if (known_arbitrary_field(field))
> -         continue;
> +Index: dpkg-1.16.8/dpkg-deb/build.c
> +===================================================================
> +--- dpkg-1.16.8.orig/dpkg-deb/build.c
> ++++ dpkg-1.16.8/dpkg-deb/build.c
> +@@ -340,13 +340,13 @@ check_new_pkg(const char *dir)
> +   if (pkg->priority == pri_other)
> +     warning(_("'%s' contains user-defined Priority value '%s'"),
> +             controlfile, pkg->otherpriority);
> +-  for (field = pkg->available.arbs; field; field = field->next) {
> ++  /*for (field = pkg->available.arbs; field; field = field->next) {
> +     if (known_arbitrary_field(field))
> +       continue;
>    
> -       warning(_("'%s' contains user-defined field '%s'"),
> -               controlfile, field->name);
> -       warns++;
> --    }
> -+    }*/
> +     warning(_("'%s' contains user-defined field '%s'"), controlfile,
> +             field->name);
> +-  }
> ++  }*/
>    
> -     if (subdir) {
> -       versionstring= versiondescribe(&checkedinfo->available.version,vdew_never);
> +   free(controlfile);
> diff --git a/meta/recipes-devtools/dpkg/dpkg/nochroot.patch b/meta/recipes-devtools/dpkg/dpkg/nochroot.patch
> deleted file mode 100644
> index c7f2dfe..0000000
> --- a/meta/recipes-devtools/dpkg/dpkg/nochroot.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> ----
> - src/help.c |    2 ++
> - 1 file changed, 2 insertions(+)
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> ---- dpkg-1.13.22.orig/src/help.c
> -+++ dpkg-1.13.22/src/help.c
> -@@ -175,9 +175,11 @@ static const char* preexecscript(const c
> -    */
> -   size_t instdirl;
> -
> -+#if 0
> -   if (*instdir) {
> -     if (chroot(instdir)) ohshite(_("failed to chroot to `%.250s'"),instdir);
> -   }
> -+#endif
> -   if (f_debug & dbg_scripts) {
> -     fprintf(stderr,"D0%05o: fork/exec %s (",dbg_scripts,path);
> -     while (*++argv) fprintf(stderr," %s",*argv);
> diff --git a/meta/recipes-devtools/dpkg/dpkg/noman.patch b/meta/recipes-devtools/dpkg/dpkg/noman.patch
> index 58cb22a..d30c150 100644
> --- a/meta/recipes-devtools/dpkg/dpkg/noman.patch
> +++ b/meta/recipes-devtools/dpkg/dpkg/noman.patch
> @@ -12,4 +12,3 @@ diff -ruN dpkg-1.15.8.5-orig/Makefile.am dpkg-1.15.8.5/Makefile.am
>   +	po
>    
>    ACLOCAL_AMFLAGS = -I m4
> -
> diff --git a/meta/recipes-devtools/dpkg/dpkg/noupdalt.patch b/meta/recipes-devtools/dpkg/dpkg/noupdalt.patch
> deleted file mode 100644
> index a9b3800..0000000
> --- a/meta/recipes-devtools/dpkg/dpkg/noupdalt.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> ----
> - scripts/Makefile.am |    3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> ---- dpkg-1.13.22.orig/scripts/Makefile.am
> -+++ dpkg-1.13.22/scripts/Makefile.am
> -@@ -20,8 +20,7 @@ bin_SCRIPTS = \
> - sbin_SCRIPTS = \
> - 	cleanup-info \
> - 	dpkg-divert \
> --	dpkg-statoverride \
> --	update-alternatives
> -+	dpkg-statoverride
> -
> - changelogdir = $(pkglibdir)/parsechangelog
> - changelog_SCRIPTS = \
> diff --git a/meta/recipes-devtools/dpkg/dpkg/perllibdir.patch b/meta/recipes-devtools/dpkg/dpkg/perllibdir.patch
> deleted file mode 100644
> index 45973f0..0000000
> --- a/meta/recipes-devtools/dpkg/dpkg/perllibdir.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -We want to be able to set PERL_LIBDIR from the environment. This
> -hardcoded assignment prevents us from doing so and obtains an
> -incorrect value.
> -
> -Upstream-Status: Inappropriate [in this form at least]
> -
> -RP 14/11/2011
> -
> -Index: dpkg-1.15.8.7/m4/dpkg-progs.m4
> -===================================================================
> ---- dpkg-1.15.8.7.orig/m4/dpkg-progs.m4	2011-11-14 17:32:21.252053239 +0000
> -+++ dpkg-1.15.8.7/m4/dpkg-progs.m4	2011-11-14 17:32:55.180052455 +0000
> -@@ -9,9 +9,6 @@
> - [AC_ARG_VAR([PERL], [Perl interpreter])dnl
> - AC_PATH_PROG([PERL], [perl], [/usr/bin/perl])dnl
> - AC_ARG_VAR([PERL_LIBDIR], [Perl library directory])dnl
> --PERL_LIBDIR=$($PERL -MConfig -e 'my $r = $Config{vendorlibexp};
> --                                 $r =~ s/$Config{vendorprefixexp}/\$(prefix)/;
> --                                 print $r')dnl
> - ])# DPKG_PROG_PERL
> -
> - # DPKG_PROG_PO4A
> diff --git a/meta/recipes-devtools/dpkg/dpkg/preinst.patch b/meta/recipes-devtools/dpkg/dpkg/preinst.patch
> index 06d2aac..f9cb408 100644
> --- a/meta/recipes-devtools/dpkg/dpkg/preinst.patch
> +++ b/meta/recipes-devtools/dpkg/dpkg/preinst.patch
> @@ -6,41 +6,48 @@ Upstream-Status: Inappropriate [OE Specific]
>   
>   RP 2011/12/07
>   
> -Index: dpkg-1.15.8.7/src/help.c
> +Index: dpkg-1.16.8/src/script.c
>   ===================================================================
> ---- dpkg-1.15.8.7.orig/src/help.c	2010-12-20 01:25:36.000000000 +0000
> -+++ dpkg-1.15.8.7/src/help.c	2011-12-07 14:51:02.783461487 +0000
> -@@ -181,30 +181,9 @@
> -    * FIXME: none of the stuff here will work if admindir isn't inside
> -    * instdir as expected.
> -    */
> --  size_t instdirl;
> +--- dpkg-1.16.8.orig/src/script.c
> ++++ dpkg-1.16.8/src/script.c
> +@@ -102,38 +102,10 @@ setexecute(const char *path, struct stat
> + static const char *
> + preexecscript(struct command *cmd)
> + {
> +-	const char *admindir = dpkg_db_get_dir();
> +-	size_t instdirl = strlen(instdir);
>   -
> --  if (*instdir) {
> --    if (chroot(instdir)) ohshite(_("failed to chroot to `%.250s'"),instdir);
> --    if (chdir("/"))
> --      ohshite(_("failed to chdir to `%.255s'"), "/");
> --  }
> --  if (f_debug & dbg_scripts) {
> --    struct varbuf args = VARBUF_INIT;
> --    const char **argv = cmd->argv;
> + 	if (*instdir) {
> +-		if (strncmp(admindir, instdir, instdirl) != 0)
> +-			ohshit(_("admindir must be inside instdir for dpkg to work properly"));
> +-		if (setenv("DPKG_ADMINDIR", admindir + instdirl, 1) < 0)
> +-			ohshite(_("unable to setenv for subprocesses"));
>   -
> --    while (*++argv) {
> --      varbufaddc(&args, ' ');
> --      varbufaddstr(&args, *argv);
> --    }
> --    varbufaddc(&args, '\0');
> --    debug(dbg_scripts, "fork/exec %s (%s )", cmd->filename, args.buf);
> --    varbuf_destroy(&args);
> --  }
> --  instdirl= strlen(instdir);
> --  if (!instdirl)
> --    return cmd->filename;
> --  assert(strlen(cmd->filename) >= instdirl);
> --  return cmd->filename + instdirl;
> -+  if (*instdir)
> -+    setenv("D", instdir, 1);
> -+  return cmd->filename;
> - }
> +-		if (chroot(instdir))
> +-			ohshite(_("failed to chroot to `%.250s'"), instdir);
> +-		if (chdir("/"))
> +-			ohshite(_("failed to chdir to `%.255s'"), "/");
> ++        setenv("D", instdir, 1);
> + 	}
> +-	if (debug_has_flag(dbg_scripts)) {
> +-		struct varbuf args = VARBUF_INIT;
> +-		const char **argv = cmd->argv;
> +-
> +-		while (*++argv) {
> +-			varbuf_add_char(&args, ' ');
> +-			varbuf_add_str(&args, *argv);
> +-		}
> +-		varbuf_end_str(&args);
> +-		debug(dbg_scripts, "fork/exec %s (%s )", cmd->filename,
> +-		      args.buf);
> +-		varbuf_destroy(&args);
> +-	}
> +-	if (!instdirl)
> +-		return cmd->filename;
> +-
> +-	assert(strlen(cmd->filename) >= instdirl);
> +-	return cmd->filename + instdirl;
> ++	return cmd->filename;
> + }
>    
> - void
> + static int
> diff --git a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
> new file mode 100644
> index 0000000..8d884e5
> --- /dev/null
> +++ b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
> @@ -0,0 +1,16 @@
> +busybox-1.19.4 tar utility doesn't support --warning=no-timestamp
> +
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> +
> +Upstream-Status: Inappropriate [configuration]
> +--- a/dpkg-deb/extract.c
> ++++ b/dpkg-deb/extract.c
> +@@ -319,7 +319,7 @@ extracthalf(const char *debar, const cha
> +         }
> +       }
> +
> +-      execlp(TAR, "tar", buffer, "-", "--warning=no-timestamp", NULL);
> ++      execlp(TAR, "tar", buffer, "-", NULL);
> +       ohshite(_("unable to execute %s (%s)"), "tar", TAR);
> +     }
> +     close(p2[0]);
> diff --git a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.16.8.bb
> similarity index 49%
> rename from meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
> rename to meta/recipes-devtools/dpkg/dpkg_1.16.8.bb
> index 1e7ef25..35fd0ef 100644
> --- a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
> +++ b/meta/recipes-devtools/dpkg/dpkg_1.16.8.bb
> @@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>   SRC_URI += "file://noman.patch \
>               file://check_snprintf.patch \
>               file://check_version.patch \
> -            file://perllibdir.patch \
>               file://preinst.patch \
> -            file://dpkg-deb-avoid-fflush.patch"
> +            file://fix-timestamps.patch \
> +            file://remove-tar-no-timestamp.patch"
>   
> -SRC_URI[md5sum] = "d1731d4147c1ea3b537a4d094519a6dc"
> -SRC_URI[sha256sum] = "1ec1376471b04717a4497e5d7a27cd545248c92116898ce0c53ced8ea94267b5"
> +SRC_URI[md5sum] = "9f8042561ecccd5124e5958a1e181de7"
> +SRC_URI[sha256sum] = "4a1f4611390d93f1f198d910d3a4e4913b3cf81702b31f585a1872ca98df0eaa"
>   
> -PR = "${INC_PR}.4"
> +PR = "${INC_PR}.0"
>   
This is the dpkg 1.15.8.7 -> 1.16.8 package upgrade compiled on all 
architectures
and tested using core-image-sato.

Testing details:
- built a system with PACKAGE_CLASSES = "package_deb"
- installed/removed some packages using core-image-sato
- tested basic dpkg commands


