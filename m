Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SCe9q-0000Jv-No
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 23:42:26 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2012 23:33:24 +0200
Message-Id: <1332884004-5175-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] procps: don't print error message with kernel 3.0+
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
X-List-Received-Date: Tue, 27 Mar 2012 21:42:26 -0000

* All procps tools print a message like this when the kernel
  version consists of only two numbers:

| Non-standard uts for running kernel:
| release ... gives version code ...

* Import a patch from Debian to quieten this message.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../procps/procps-3.2.8/gnu-kbsd-version.patch     |   44 ++++++++++++++++++++
 meta/recipes-extended/procps/procps_3.2.8.bb       |    3 +-
 2 files changed, 46 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/procps/procps-3.2.8/gnu-kbsd-version.patch

diff --git a/meta/recipes-extended/procps/procps-3.2.8/gnu-kbsd-version.patch b/meta/recipes-extended/procps/procps-3.2.8/gnu-kbsd-version.patch
new file mode 100644
index 0000000..2582857
--- /dev/null
+++ b/meta/recipes-extended/procps/procps-3.2.8/gnu-kbsd-version.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Inappropriate [not author, no upstream]
+
+Imported from Debian.
+Source: http://anonscm.debian.org/gitweb/?p=collab-maint/procps.git;a=blob;f=debian/patches/gnu-kbsd-version.patch;h=fe5489fc772a3355ff8c0dcf9b953bf0c05aa9f8;hb=b460cfd726b019f8d918b380f78af4c19c5f3e50
+Bugtracker: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=632749
+
+Stops procps utilities from printing a warning when used with
+kernels having only two digit versions, e.g. 3.0.
+
+Author: <csmall@debian.org>
+Description: Rework version parsing so its ok with other OSes
+--- a/proc/version.c
++++ b/proc/version.c
+@@ -35,15 +35,23 @@
+ 
+ static void init_Linux_version(void) __attribute__((constructor));
+ static void init_Linux_version(void) {
+-    static struct utsname uts;
+-    int x = 0, y = 0, z = 0;	/* cleared in case sscanf() < 3 */
++    int x = 0, y = 0, z = 0;	/* cleared in case sscanf() < 2 */
++    FILE *fp;
++    char buf[256];
+     
+-    if (uname(&uts) == -1)	/* failure implies impending death */
+-	exit(1);
+-    if (sscanf(uts.release, "%d.%d.%d", &x, &y, &z) < 3)
++    if ( (fp=fopen("/proc/version","r")) == NULL) /* failure implies impending death */
++      exit(1);
++    if (fgets(buf, 256, fp) == NULL) {
++      fprintf(stderr, "Cannot read kernel version from /proc/version\n");
++      fclose(fp);
++      exit(1);
++    }
++    fclose(fp);
++    if (sscanf(buf, "Linux version %d.%d.%d", &x, &y, &z) < 2)
+ 	fprintf(stderr,		/* *very* unlikely to happen by accident */
+ 		"Non-standard uts for running kernel:\n"
+-		"release %s=%d.%d.%d gives version code %d\n",
+-		uts.release, x, y, z, LINUX_VERSION(x,y,z));
++        "release %s=%d.%d.%d gives version code %d\n",
++        buf,
++        x, y, z, LINUX_VERSION(x,y,z));
+     linux_version_code = LINUX_VERSION(x, y, z);
+ }
diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index 683badc..dfae0b8 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -1,6 +1,6 @@
 require procps.inc
 
-PR = "r6"
+PR = "r7"
 
 inherit update-alternatives
 
@@ -14,6 +14,7 @@ SRC_URI += "file://procmodule.patch \
             file://linux-limits.patch \
             file://sysctl.conf \
             file://procps-3.2.8+gmake-3.82.patch \
+            file://gnu-kbsd-version.patch \
            "
 
 SRC_URI[md5sum] = "9532714b6846013ca9898984ba4cd7e0"
-- 
1.7.5.4



