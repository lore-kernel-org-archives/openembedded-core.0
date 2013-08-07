Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A137E6B53B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 13:15:54 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Aug 2013 06:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,833,1367996400"; d="scan'208";a="342947024"
Received: from sorvi.fi.intel.com ([10.237.72.152])
	by azsmga001.ch.intel.com with ESMTP; 07 Aug 2013 06:15:53 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2013 16:15:52 +0300
Message-Id: <1375881352-12993-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] procps: Add cgroup support
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
X-List-Received-Date: Wed, 07 Aug 2013 13:15:54 -0000


Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
Hi,

I have been using this patch in meta-eca but it might be useful
in oe-core.

Cheers,
Jukka


 .../procps-3.2.8/procps-3.2.8-ps-cgroup.patch      | 74 ++++++++++++++++++++++
 meta/recipes-extended/procps/procps_3.2.8.bb       |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patch

diff --git a/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patch b/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patch
new file mode 100644
index 0000000..eb260d3
--- /dev/null
+++ b/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patch
@@ -0,0 +1,74 @@
+From e529ce0b53f6b73d8b760cd37b23e0397720cede Mon Sep 17 00:00:00 2001
+From: Daniel Novotny <dnovotny@fedoraproject.org>
+Date: Mon, 16 Feb 2009 12:22:20 +0000
+Subject: add cgroup support
+
+Rebased for 3.2.8: Andrei Gherzan <andrei.gherzan@windriver.com>
+
+Index: procps-3.2.8/ps/output.c
+===================================================================
+--- procps-3.2.8.orig/ps/output.c	2012-11-15 17:44:05.501337741 +0200
++++ procps-3.2.8/ps/output.c	2012-11-15 17:48:31.585328231 +0200
+@@ -1099,6 +1099,39 @@
+   return snprintf(outbuf, COLWID, "*");
+ }
+ 
++static int pr_cgroup(char *restrict const outbuf, const proc_t *restrict const pp){
++  char filename[48];
++  FILE *fd;
++  int counter = 0;
++  int c;
++  int is_cgroup = 0;
++
++  outbuf[0]='\0';
++  snprintf(filename, sizeof filename, "/proc/%d/cgroup", pp->tgid);
++  fd = fopen(filename, "r");
++  if (likely(fd == NULL)) goto fail;
++  while (( (c = fgetc(fd)) != EOF) && (counter<665)) {
++    if (is_cgroup == 0) {
++      if (c == ':') {
++        is_cgroup = 1;
++        if (counter>0)
++          outbuf[counter++]=';';
++      }
++    }else
++      if ((c == '\n') || (c == '\0'))
++        is_cgroup = 0;
++      else
++        outbuf[counter++]=c;
++  }
++  outbuf[counter]='\0';
++  close(fd);
++  if (counter>0)
++    return counter;
++fail:
++  outbuf[0] = '-';
++  outbuf[1] = '\0';
++  return 1;
++}
+ 
+ /****************** FLASK & seLinux security stuff **********************/
+ // move the bulk of this to libproc sometime
+@@ -1293,6 +1326,7 @@
+ {"bsdtime",   "TIME",    pr_bsdtime,  sr_nop,     6,   0,    LNX, ET|RIGHT},
+ {"c",         "C",       pr_c,        sr_pcpu,    2,   0,    SUN, ET|RIGHT},
+ {"caught",    "CAUGHT",  pr_sigcatch, sr_nop,     9,   0,    BSD, TO|SIGNAL}, /*sigcatch*/
++{"cgroup",    "CGROUP",  pr_cgroup,   sr_nop,    35,   0,    LNX, PO|LEFT},  /* cgroups*/
+ {"class",     "CLS",     pr_class,    sr_sched,   3,   0,    XXX, TO|LEFT},
+ {"cls",       "CLS",     pr_class,    sr_sched,   3,   0,    HPU, TO|RIGHT}, /*says HPUX or RT*/
+ {"cmaj_flt",  "-",       pr_nop,      sr_cmaj_flt, 1,  0,    LNX, AN|RIGHT},
+Index: procps-3.2.8/ps/ps.1
+===================================================================
+--- procps-3.2.8.orig/ps/ps.1	2012-11-15 17:44:50.845336117 +0200
++++ procps-3.2.8/ps/ps.1	2012-11-15 17:49:09.621326859 +0200
+@@ -904,6 +904,10 @@
+ displayed.  (alias\ \fBsig_catch\fR,\ \fBsigcatch\fR).
+ T}
+ 
++cgroup	CGROUP	T{
++display control groups to which the process belonges.
++t}
++
+ class	CLS	T{
+ scheduling class of the process.  (alias\ \fBpolicy\fR,\ \fBcls\fR).
+ Field's possible values are:
diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index 8436d4a..e4b82e0 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://procmodule.patch \
             file://gnu-kbsd-version.patch \
             file://60_linux_version_init.patch \
             file://procps-3.2.7-top-remcpu.patch \
+            file://procps-3.2.8-ps-cgroup.patch \
            "
 
 SRC_URI[md5sum] = "9532714b6846013ca9898984ba4cd7e0"
-- 
1.7.11.7


