Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0245F76FB8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 15:32:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Sep 2015 08:32:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,462,1437462000"; d="scan'208";a="797539476"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2015 08:32:47 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 18:34:11 +0300
Message-Id: <bf025b0ff543f0b7239d0b46099cda8b01c52cef.1441293149.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 02/12] mailx: update to 12.5-5
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
X-List-Received-Date: Thu, 03 Sep 2015 15:32:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This means adding new patches from Debian[1] and tweaking build options
that were previously set by patching Makefile.

[1] ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...e-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch |  59 +++++++++++
 ...-SSL2-support-since-it-is-no-longer-suppo.patch |  41 ++++++++
 ...ntian-warning-warning-macro-N-not-defined.patch |  25 +++++
 .../0011-outof-Introduce-expandaddr-flag.patch     |  70 +++++++++++++
 ...ble-option-processing-for-email-addresses.patch |  79 ++++++++++++++
 ...c-Unconditionally-require-wordexp-support.patch | 113 +++++++++++++++++++++
 ...4-globname-Invoke-wordexp-with-WRDE_NOCMD.patch |  30 ++++++
 .../mailx/files/0015-usr-sbin-sendmail.patch       |  38 +++++++
 .../explicitly.disable.krb5.support.patch          |   0
 .../mailx/{mailx_12.5.bb => mailx_12.5-5.bb}       |  21 ++--
 10 files changed, 469 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
 create mode 100644 meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
 create mode 100644 meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
 create mode 100644 meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch
 create mode 100644 meta/recipes-extended/mailx/files/0012-unpack-Disable-option-processing-for-email-addresses.patch
 create mode 100644 meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-require-wordexp-support.patch
 create mode 100644 meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
 create mode 100644 meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
 rename meta/recipes-extended/mailx/{mailx-12.5 => files}/explicitly.disable.krb5.support.patch (100%)
 rename meta/recipes-extended/mailx/{mailx_12.5.bb => mailx_12.5-5.bb} (48%)

diff --git a/meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch b/meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
new file mode 100644
index 0000000..126f505
--- /dev/null
+++ b/meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
@@ -0,0 +1,59 @@
+From: Luk Claes <luk@debian.org>
+Date: Sat, 4 Jul 2009 10:54:53 +0200
+Subject: Don't reuse weak symbol optopt to fix FTBFS on mips*
+
+This patch is taken from 
+ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
+
+Upstream-status: Inappropriate [upstream is dead]
+---
+ getopt.c |   10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/getopt.c b/getopt.c
+index 83ce628..82e983c 100644
+--- a/getopt.c
++++ b/getopt.c
+@@ -43,7 +43,7 @@ typedef	int	ssize_t;
+ char	*optarg;
+ int	optind = 1;
+ int	opterr = 1;
+-int	optopt;
++int	optoptc;
+ 
+ static void
+ error(const char *s, int c)
+@@ -69,7 +69,7 @@ error(const char *s, int c)
+ 		*bp++ = *s++;
+ 	while (*msg)
+ 		*bp++ = *msg++;
+-	*bp++ = optopt;
++	*bp++ = optoptc;
+ 	*bp++ = '\n';
+ 	write(2, buf, bp - buf);
+ 	ac_free(buf);
+@@ -101,13 +101,13 @@ getopt(int argc, char *const argv[], const char *optstring)
+ 		}
+ 		curp = &argv[optind][1];
+ 	}
+-	optopt = curp[0] & 0377;
++	optoptc = curp[0] & 0377;
+ 	while (optstring[0]) {
+ 		if (optstring[0] == ':') {
+ 			optstring++;
+ 			continue;
+ 		}
+-		if ((optstring[0] & 0377) == optopt) {
++		if ((optstring[0] & 0377) == optoptc) {
+ 			if (optstring[1] == ':') {
+ 				if (curp[1] != '\0') {
+ 					optarg = (char *)&curp[1];
+@@ -127,7 +127,7 @@ getopt(int argc, char *const argv[], const char *optstring)
+ 					optind++;
+ 				optarg = 0;
+ 			}
+-			return optopt;
++			return optoptc;
+ 		}
+ 		optstring++;
+ 	}
diff --git a/meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch b/meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
new file mode 100644
index 0000000..f70f8fc
--- /dev/null
+++ b/meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
@@ -0,0 +1,41 @@
+From: Hilko Bengen <bengen@debian.org>
+Date: Wed, 27 Apr 2011 00:18:42 +0200
+Subject: Patched out SSL2 support since it is no longer supported by OpenSSL.
+
+This patch is taken from
+ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
+
+Upstream-status: Inappropriate [upstream is dead]
+---
+ mailx.1   |    2 +-
+ openssl.c |    4 +---
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/mailx.1 b/mailx.1
+index 417ea04..a02e430 100644
+--- a/mailx.1
++++ b/mailx.1
+@@ -3575,7 +3575,7 @@ Only applicable if SSL/TLS support is built using OpenSSL.
+ .TP
+ .B ssl-method
+ Selects a SSL/TLS protocol version;
+-valid values are `ssl2', `ssl3', and `tls1'.
++valid values are `ssl3', and `tls1'.
+ If unset, the method is selected automatically,
+ if possible.
+ .TP
+diff --git a/openssl.c b/openssl.c
+index b4e33fc..44fe4e5 100644
+--- a/openssl.c
++++ b/openssl.c
+@@ -216,9 +216,7 @@ ssl_select_method(const char *uhp)
+ 
+ 	cp = ssl_method_string(uhp);
+ 	if (cp != NULL) {
+-		if (equal(cp, "ssl2"))
+-			method = SSLv2_client_method();
+-		else if (equal(cp, "ssl3"))
++		if (equal(cp, "ssl3"))
+ 			method = SSLv3_client_method();
+ 		else if (equal(cp, "tls1"))
+ 			method = TLSv1_client_method();
diff --git a/meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch b/meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
new file mode 100644
index 0000000..0ee133a
--- /dev/null
+++ b/meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
@@ -0,0 +1,25 @@
+From: Hilko Bengen <bengen@debian.org>
+Date: Sat, 14 Apr 2012 20:22:43 +0200
+Subject: Fixed Lintian warning (warning: macro `N' not defined)
+
+This patch is taken from
+ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
+
+Upstream-status: Inappropriate [upstream is dead]
+---
+ mailx.1 |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mailx.1 b/mailx.1
+index a02e430..b0723bd 100644
+--- a/mailx.1
++++ b/mailx.1
+@@ -3781,7 +3781,7 @@ you could examine the first message by giving the command:
+ .sp
+ .fi
+ which might cause
+-.N mailx
++.I mailx
+ to respond with, for example:
+ .nf
+ .sp
diff --git a/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch b/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch
new file mode 100644
index 0000000..fdce13f
--- /dev/null
+++ b/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch
@@ -0,0 +1,70 @@
+From 9984ae5cb0ea0d61df1612b06952a61323c083d9 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 17 Nov 2014 11:13:38 +0100
+Subject: [PATCH 1/4] outof: Introduce expandaddr flag
+
+Document that address expansion is disabled unless the expandaddr
+binary option is set.
+
+This has been assigned CVE-2014-7844 for BSD mailx, but it is not
+a vulnerability in Heirloom mailx because this feature was documented.
+
+This patch is taken from
+ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
+
+Upstream-status: Inappropriate [upstream is dead]
+---
+ mailx.1 | 14 ++++++++++++++
+ names.c |  3 +++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/mailx.1 b/mailx.1
+index 70a7859..22a171b 100644
+--- a/mailx.1
++++ b/mailx.1
+@@ -656,6 +656,14 @@ but any reply returned to the machine
+ will have the system wide alias expanded
+ as all mail goes through sendmail.
+ .SS "Recipient address specifications"
++If the
++.I expandaddr
++option is not set (the default), recipient addresses must be names of
++local mailboxes or Internet mail addresses.
++.PP
++If the
++.I expandaddr
++option is set, the following rules apply:
+ When an address is used to name a recipient
+ (in any of To, Cc, or Bcc),
+ names of local mail folders
+@@ -2391,6 +2399,12 @@ and exits immediately.
+ If this option is set,
+ \fImailx\fR starts even with an empty mailbox.
+ .TP
++.B expandaddr
++Causes
++.I mailx
++to expand message recipient addresses, as explained in the section,
++Recipient address specifications.
++.TP
+ .B flipr
+ Exchanges the
+ .I Respond
+diff --git a/names.c b/names.c
+index 66e976b..c69560f 100644
+--- a/names.c
++++ b/names.c
+@@ -268,6 +268,9 @@ outof(struct name *names, FILE *fo, struct header *hp)
+ 	FILE *fout, *fin;
+ 	int ispipe;
+ 
++	if (value("expandaddr") == NULL)
++		return names;
++
+ 	top = names;
+ 	np = names;
+ 	time(&now);
+-- 
+1.9.3
+
+
diff --git a/meta/recipes-extended/mailx/files/0012-unpack-Disable-option-processing-for-email-addresses.patch b/meta/recipes-extended/mailx/files/0012-unpack-Disable-option-processing-for-email-addresses.patch
new file mode 100644
index 0000000..b51472f
--- /dev/null
+++ b/meta/recipes-extended/mailx/files/0012-unpack-Disable-option-processing-for-email-addresses.patch
@@ -0,0 +1,79 @@
+From e34e2ac67b80497080ebecccec40c3b61456167d Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 17 Nov 2014 11:14:06 +0100
+Subject: [PATCH 2/4] unpack: Disable option processing for email addresses
+ when calling sendmail
+
+This patch is taken from
+ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
+
+Upstream-status: Inappropriate [upstream is dead]
+---
+ extern.h  | 2 +-
+ names.c   | 8 ++++++--
+ sendout.c | 2 +-
+ 3 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/extern.h b/extern.h
+index 6b85ba0..8873fe8 100644
+--- a/extern.h
++++ b/extern.h
+@@ -396,7 +396,7 @@ struct name *outof(struct name *names, FILE *fo, struct header *hp);
+ int is_fileaddr(char *name);
+ struct name *usermap(struct name *names);
+ struct name *cat(struct name *n1, struct name *n2);
+-char **unpack(struct name *np);
++char **unpack(struct name *smopts, struct name *np);
+ struct name *elide(struct name *names);
+ int count(struct name *np);
+ struct name *delete_alternates(struct name *np);
+diff --git a/names.c b/names.c
+index c69560f..45bbaed 100644
+--- a/names.c
++++ b/names.c
+@@ -549,7 +549,7 @@ cat(struct name *n1, struct name *n2)
+  * Return an error if the name list won't fit.
+  */
+ char **
+-unpack(struct name *np)
++unpack(struct name *smopts, struct name *np)
+ {
+ 	char **ap, **top;
+ 	struct name *n;
+@@ -564,7 +564,7 @@ unpack(struct name *np)
+ 	 * the terminating 0 pointer.  Additional spots may be needed
+ 	 * to pass along -f to the host mailer.
+ 	 */
+-	extra = 2;
++	extra = 3 + count(smopts);
+ 	extra++;
+ 	metoo = value("metoo") != NULL;
+ 	if (metoo)
+@@ -581,6 +581,10 @@ unpack(struct name *np)
+ 		*ap++ = "-m";
+ 	if (verbose)
+ 		*ap++ = "-v";
++	for (; smopts != NULL; smopts = smopts->n_flink)
++		if ((smopts->n_type & GDEL) == 0)
++			*ap++ = smopts->n_name;
++	*ap++ = "--";
+ 	for (; n != NULL; n = n->n_flink)
+ 		if ((n->n_type & GDEL) == 0)
+ 			*ap++ = n->n_name;
+diff --git a/sendout.c b/sendout.c
+index 7b7f2eb..c52f15d 100644
+--- a/sendout.c
++++ b/sendout.c
+@@ -835,7 +835,7 @@ start_mta(struct name *to, struct name *mailargs, FILE *input,
+ #endif	/* HAVE_SOCKETS */
+ 
+ 	if ((smtp = value("smtp")) == NULL) {
+-		args = unpack(cat(mailargs, to));
++		args = unpack(mailargs, to);
+ 		if (debug || value("debug")) {
+ 			printf(catgets(catd, CATSET, 181,
+ 					"Sendmail arguments:"));
+-- 
+1.9.3
+
+
diff --git a/meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-require-wordexp-support.patch b/meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-require-wordexp-support.patch
new file mode 100644
index 0000000..5bf3cdd
--- /dev/null
+++ b/meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-require-wordexp-support.patch
@@ -0,0 +1,113 @@
+From 2bae8ecf04ec2ba6bb9f0af5b80485dd0edb427d Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 17 Nov 2014 12:48:25 +0100
+Subject: [PATCH 3/4] fio.c: Unconditionally require wordexp support
+
+This patch is taken from
+ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
+
+Upstream-status: Inappropriate [upstream is dead]
+---
+ fio.c | 67 +++++--------------------------------------------------------------
+ 1 file changed, 5 insertions(+), 62 deletions(-)
+
+diff --git a/fio.c b/fio.c
+index 65e8f10..1529236 100644
+--- a/fio.c
++++ b/fio.c
+@@ -43,12 +43,15 @@ static char sccsid[] = "@(#)fio.c	2.76 (gritter) 9/16/09";
+ #endif /* not lint */
+ 
+ #include "rcv.h"
++
++#ifndef HAVE_WORDEXP
++#error wordexp support is required
++#endif
++
+ #include <sys/stat.h>
+ #include <sys/file.h>
+ #include <sys/wait.h>
+-#ifdef	HAVE_WORDEXP
+ #include <wordexp.h>
+-#endif	/* HAVE_WORDEXP */
+ #include <unistd.h>
+ 
+ #if defined (USE_NSS)
+@@ -481,7 +484,6 @@ next:
+ static char *
+ globname(char *name)
+ {
+-#ifdef	HAVE_WORDEXP
+ 	wordexp_t we;
+ 	char *cp;
+ 	sigset_t nset;
+@@ -527,65 +529,6 @@ globname(char *name)
+ 	}
+ 	wordfree(&we);
+ 	return cp;
+-#else	/* !HAVE_WORDEXP */
+-	char xname[PATHSIZE];
+-	char cmdbuf[PATHSIZE];		/* also used for file names */
+-	int pid, l;
+-	char *cp, *shell;
+-	int pivec[2];
+-	extern int wait_status;
+-	struct stat sbuf;
+-
+-	if (pipe(pivec) < 0) {
+-		perror("pipe");
+-		return name;
+-	}
+-	snprintf(cmdbuf, sizeof cmdbuf, "echo %s", name);
+-	if ((shell = value("SHELL")) == NULL)
+-		shell = SHELL;
+-	pid = start_command(shell, 0, -1, pivec[1], "-c", cmdbuf, NULL);
+-	if (pid < 0) {
+-		close(pivec[0]);
+-		close(pivec[1]);
+-		return NULL;
+-	}
+-	close(pivec[1]);
+-again:
+-	l = read(pivec[0], xname, sizeof xname);
+-	if (l < 0) {
+-		if (errno == EINTR)
+-			goto again;
+-		perror("read");
+-		close(pivec[0]);
+-		return NULL;
+-	}
+-	close(pivec[0]);
+-	if (wait_child(pid) < 0 && WTERMSIG(wait_status) != SIGPIPE) {
+-		fprintf(stderr, catgets(catd, CATSET, 81,
+-				"\"%s\": Expansion failed.\n"), name);
+-		return NULL;
+-	}
+-	if (l == 0) {
+-		fprintf(stderr, catgets(catd, CATSET, 82,
+-					"\"%s\": No match.\n"), name);
+-		return NULL;
+-	}
+-	if (l == sizeof xname) {
+-		fprintf(stderr, catgets(catd, CATSET, 83,
+-				"\"%s\": Expansion buffer overflow.\n"), name);
+-		return NULL;
+-	}
+-	xname[l] = 0;
+-	for (cp = &xname[l-1]; *cp == '\n' && cp > xname; cp--)
+-		;
+-	cp[1] = '\0';
+-	if (strchr(xname, ' ') && stat(xname, &sbuf) < 0) {
+-		fprintf(stderr, catgets(catd, CATSET, 84,
+-				"\"%s\": Ambiguous.\n"), name);
+-		return NULL;
+-	}
+-	return savestr(xname);
+-#endif	/* !HAVE_WORDEXP */
+ }
+ 
+ /*
+-- 
+1.9.3
+
+
diff --git a/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch b/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
new file mode 100644
index 0000000..6f162ea
--- /dev/null
+++ b/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
@@ -0,0 +1,30 @@
+From 73fefa0c1ac70043ec84f2d8b8f9f683213f168d Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 17 Nov 2014 13:11:32 +0100
+Subject: [PATCH 4/4] globname: Invoke wordexp with WRDE_NOCMD (CVE-2004-2771)
+
+This patch is taken from
+ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
+
+Upstream-status: Inappropriate [upstream is dead]
+---
+ fio.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fio.c b/fio.c
+index 1529236..774a204 100644
+--- a/fio.c
++++ b/fio.c
+@@ -497,7 +497,7 @@ globname(char *name)
+ 	sigemptyset(&nset);
+ 	sigaddset(&nset, SIGCHLD);
+ 	sigprocmask(SIG_BLOCK, &nset, NULL);
+-	i = wordexp(name, &we, 0);
++	i = wordexp(name, &we, WRDE_NOCMD);
+ 	sigprocmask(SIG_UNBLOCK, &nset, NULL);
+ 	switch (i) {
+ 	case 0:
+-- 
+1.9.3
+
+
diff --git a/meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch b/meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
new file mode 100644
index 0000000..7e33789
--- /dev/null
+++ b/meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
@@ -0,0 +1,38 @@
+Description: Sendmail is at /usr/sbin/sendmail
+ As per Debian Policy §11.6
+Author: Ryan Kavanagh <rak@debian.org>
+Origin: Debian
+Forwarded: no
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+Index: heirloom-mailx-12.5/Makefile
+===================================================================
+This patch is taken from
+ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
+
+Upstream-status: Inappropriate [upstream is dead]
+
+--- heirloom-mailx-12.5.orig/Makefile	2011-04-26 17:23:22.000000000 -0400
++++ heirloom-mailx-12.5/Makefile	2015-01-27 13:20:04.733542801 -0500
+@@ -13,7 +13,7 @@
+ 
+ MAILRC		= $(SYSCONFDIR)/nail.rc
+ MAILSPOOL	= /var/mail
+-SENDMAIL	= /usr/lib/sendmail
++SENDMAIL	= /usr/sbin/sendmail
+ 
+ DESTDIR		=
+ 
+Index: heirloom-mailx-12.5/mailx.1
+===================================================================
+--- heirloom-mailx-12.5.orig/mailx.1	2015-01-27 13:18:49.000000000 -0500
++++ heirloom-mailx-12.5/mailx.1	2015-01-27 13:20:32.382336867 -0500
+@@ -4922,7 +4922,7 @@
+ which just acts as a proxy.
+ .PP
+ \fIMailx\fR immediately contacts the SMTP server (or
+-.IR \%/usr/lib/sendmail )
++.IR \%/usr/sbin/sendmail )
+ even when operating in
+ .I disconnected
+ mode.
diff --git a/meta/recipes-extended/mailx/mailx-12.5/explicitly.disable.krb5.support.patch b/meta/recipes-extended/mailx/files/explicitly.disable.krb5.support.patch
similarity index 100%
rename from meta/recipes-extended/mailx/mailx-12.5/explicitly.disable.krb5.support.patch
rename to meta/recipes-extended/mailx/files/explicitly.disable.krb5.support.patch
diff --git a/meta/recipes-extended/mailx/mailx_12.5.bb b/meta/recipes-extended/mailx/mailx_12.5-5.bb
similarity index 48%
rename from meta/recipes-extended/mailx/mailx_12.5.bb
rename to meta/recipes-extended/mailx/mailx_12.5-5.bb
index a53da3a..ffa9049 100644
--- a/meta/recipes-extended/mailx/mailx_12.5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5-5.bb
@@ -6,28 +6,35 @@ for MIME, IMAP, POP3, SMTP, and S/MIME."
 
 HOMEPAGE = "http://heirloom.sourceforge.net/mailx.html"
 SECTION = "console/network"
-PR = "r2"
 LICENSE = "BSD & MPL-1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4202a0a62910cf94f7af8a3436a2a2dd"
 
 DEPENDS = "openssl"
 
-SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/heirloom-mailx_12.5.orig.tar.gz;name=archive \
-           https://launchpad.net/ubuntu/+archive/primary/+files/heirloom-mailx_12.5-1.diff.gz;name=patch \
+SRC_URI = "${DEBIAN_MIRROR}/main/h/heirloom-mailx/heirloom-mailx_12.5.orig.tar.gz;name=archive \
+           file://0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch \
+           file://0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch \
+           file://0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch \
+           file://0011-outof-Introduce-expandaddr-flag.patch \
+           file://0012-unpack-Disable-option-processing-for-email-addresses.patch \
+           file://0013-fio.c-Unconditionally-require-wordexp-support.patch \
+           file://0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch \
+           file://0015-usr-sbin-sendmail.patch \
            file://explicitly.disable.krb5.support.patch \
           "
 
 SRC_URI[archive.md5sum] = "29a6033ef1412824d02eb9d9213cb1f2"
 SRC_URI[archive.sha256sum] = "015ba4209135867f37a0245d22235a392b8bbed956913286b887c2e2a9a421ad"
-SRC_URI[patch.md5sum] = "f466281336183be673bf136dd7096662"
-SRC_URI[patch.sha256sum] = "aaf2a4bbf145e5ca9cdeb0843091ec8cc01df6c9568c997207a5e97b4dc5ba43"
 
-S = "${WORKDIR}/heirloom-mailx-${PV}"
+S = "${WORKDIR}/heirloom-mailx-12.5"
 
 inherit autotools-brokensep
 
 CFLAGS_append = " -D_BSD_SOURCE -DDEBIAN -I${S}/EXT"
-EXTRA_OEMAKE = "SENDMAIL=${sbindir}/sendmail"
+
+# "STRIP=true" means that 'true' command will be used to 'strip' files which will achieve the effect of not stripping them
+# mailx's Makefile doesn't allow a more straightforward way to avoid stripping
+EXTRA_OEMAKE = "SENDMAIL=${sbindir}/sendmail IPv6=-DHAVE_IPv6_FUNCS PREFIX=/usr UCBINSTALL=/usr/bin/install STRIP=true"
 
 # The makeconfig can't run parallelly, otherwise the checking results
 # might be incorrect and lead to errors:
-- 
2.1.4


