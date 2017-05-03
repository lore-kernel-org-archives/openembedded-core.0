Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1C97171B2A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 13:12:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2017 06:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,284,1491289200"; d="scan'208";a="81964863"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2017 06:12:03 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 May 2017 16:11:53 +0300
Message-Id: <20170503131153.1780-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] mailx: remove the recipe
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
X-List-Received-Date: Wed, 03 May 2017 13:12:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This recipe was carried only for LSB compatibility,
with upstream being defunct for a long time; if there is a need
for a modern, supported implementation of mail/mailx, then
s-nail (http://sdaoden.eu/code.html) or mailutils (http://mailutils.org/)
should be used.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...e-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch |  59 -----------
 ...-SSL2-support-since-it-is-no-longer-suppo.patch |  41 --------
 ...ntian-warning-warning-macro-N-not-defined.patch |  25 -----
 .../0011-outof-Introduce-expandaddr-flag.patch     |  71 -------------
 ...ble-option-processing-for-email-addresses.patch |  79 --------------
 ...c-Unconditionally-require-wordexp-support.patch | 113 ---------------------
 ...4-globname-Invoke-wordexp-with-WRDE_NOCMD.patch |  31 ------
 .../mailx/files/0015-usr-sbin-sendmail.patch       |  38 -------
 .../files/explicitly.disable.krb5.support.patch    |  46 ---------
 meta/recipes-extended/mailx/mailx_12.5-5.bb        |  53 ----------
 .../packagegroups/packagegroup-core-lsb.bb         |   1 -
 11 files changed, 557 deletions(-)
 delete mode 100644 meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
 delete mode 100644 meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
 delete mode 100644 meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
 delete mode 100644 meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch
 delete mode 100644 meta/recipes-extended/mailx/files/0012-unpack-Disable-option-processing-for-email-addresses.patch
 delete mode 100644 meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-require-wordexp-support.patch
 delete mode 100644 meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
 delete mode 100644 meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
 delete mode 100644 meta/recipes-extended/mailx/files/explicitly.disable.krb5.support.patch
 delete mode 100644 meta/recipes-extended/mailx/mailx_12.5-5.bb

diff --git a/meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch b/meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
deleted file mode 100644
index 77da33321d3..00000000000
--- a/meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From: Luk Claes <luk@debian.org>
-Date: Sat, 4 Jul 2009 10:54:53 +0200
-Subject: Don't reuse weak symbol optopt to fix FTBFS on mips*
-
-This patch is taken from 
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
----
- getopt.c |   10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/getopt.c b/getopt.c
-index 83ce628..82e983c 100644
---- a/getopt.c
-+++ b/getopt.c
-@@ -43,7 +43,7 @@ typedef	int	ssize_t;
- char	*optarg;
- int	optind = 1;
- int	opterr = 1;
--int	optopt;
-+int	optoptc;
- 
- static void
- error(const char *s, int c)
-@@ -69,7 +69,7 @@ error(const char *s, int c)
- 		*bp++ = *s++;
- 	while (*msg)
- 		*bp++ = *msg++;
--	*bp++ = optopt;
-+	*bp++ = optoptc;
- 	*bp++ = '\n';
- 	write(2, buf, bp - buf);
- 	ac_free(buf);
-@@ -101,13 +101,13 @@ getopt(int argc, char *const argv[], const char *optstring)
- 		}
- 		curp = &argv[optind][1];
- 	}
--	optopt = curp[0] & 0377;
-+	optoptc = curp[0] & 0377;
- 	while (optstring[0]) {
- 		if (optstring[0] == ':') {
- 			optstring++;
- 			continue;
- 		}
--		if ((optstring[0] & 0377) == optopt) {
-+		if ((optstring[0] & 0377) == optoptc) {
- 			if (optstring[1] == ':') {
- 				if (curp[1] != '\0') {
- 					optarg = (char *)&curp[1];
-@@ -127,7 +127,7 @@ getopt(int argc, char *const argv[], const char *optstring)
- 					optind++;
- 				optarg = 0;
- 			}
--			return optopt;
-+			return optoptc;
- 		}
- 		optstring++;
- 	}
diff --git a/meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch b/meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
deleted file mode 100644
index 6bad433ea6c..00000000000
--- a/meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From: Hilko Bengen <bengen@debian.org>
-Date: Wed, 27 Apr 2011 00:18:42 +0200
-Subject: Patched out SSL2 support since it is no longer supported by OpenSSL.
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
----
- mailx.1   |    2 +-
- openssl.c |    4 +---
- 2 files changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/mailx.1 b/mailx.1
-index 417ea04..a02e430 100644
---- a/mailx.1
-+++ b/mailx.1
-@@ -3575,7 +3575,7 @@ Only applicable if SSL/TLS support is built using OpenSSL.
- .TP
- .B ssl-method
- Selects a SSL/TLS protocol version;
--valid values are `ssl2', `ssl3', and `tls1'.
-+valid values are `ssl3', and `tls1'.
- If unset, the method is selected automatically,
- if possible.
- .TP
-diff --git a/openssl.c b/openssl.c
-index b4e33fc..44fe4e5 100644
---- a/openssl.c
-+++ b/openssl.c
-@@ -216,9 +216,7 @@ ssl_select_method(const char *uhp)
- 
- 	cp = ssl_method_string(uhp);
- 	if (cp != NULL) {
--		if (equal(cp, "ssl2"))
--			method = SSLv2_client_method();
--		else if (equal(cp, "ssl3"))
-+		if (equal(cp, "ssl3"))
- 			method = SSLv3_client_method();
- 		else if (equal(cp, "tls1"))
- 			method = TLSv1_client_method();
diff --git a/meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch b/meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
deleted file mode 100644
index 13b73ae593f..00000000000
--- a/meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From: Hilko Bengen <bengen@debian.org>
-Date: Sat, 14 Apr 2012 20:22:43 +0200
-Subject: Fixed Lintian warning (warning: macro `N' not defined)
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
----
- mailx.1 |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mailx.1 b/mailx.1
-index a02e430..b0723bd 100644
---- a/mailx.1
-+++ b/mailx.1
-@@ -3781,7 +3781,7 @@ you could examine the first message by giving the command:
- .sp
- .fi
- which might cause
--.N mailx
-+.I mailx
- to respond with, for example:
- .nf
- .sp
diff --git a/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch b/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch
deleted file mode 100644
index 13b955c4b5c..00000000000
--- a/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 9984ae5cb0ea0d61df1612b06952a61323c083d9 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 17 Nov 2014 11:13:38 +0100
-Subject: [PATCH 1/4] outof: Introduce expandaddr flag
-
-Document that address expansion is disabled unless the expandaddr
-binary option is set.
-
-This has been assigned CVE-2014-7844 for BSD mailx, but it is not
-a vulnerability in Heirloom mailx because this feature was documented.
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
-CVE: CVE-2014-7844
----
- mailx.1 | 14 ++++++++++++++
- names.c |  3 +++
- 2 files changed, 17 insertions(+)
-
-diff --git a/mailx.1 b/mailx.1
-index 70a7859..22a171b 100644
---- a/mailx.1
-+++ b/mailx.1
-@@ -656,6 +656,14 @@ but any reply returned to the machine
- will have the system wide alias expanded
- as all mail goes through sendmail.
- .SS "Recipient address specifications"
-+If the
-+.I expandaddr
-+option is not set (the default), recipient addresses must be names of
-+local mailboxes or Internet mail addresses.
-+.PP
-+If the
-+.I expandaddr
-+option is set, the following rules apply:
- When an address is used to name a recipient
- (in any of To, Cc, or Bcc),
- names of local mail folders
-@@ -2391,6 +2399,12 @@ and exits immediately.
- If this option is set,
- \fImailx\fR starts even with an empty mailbox.
- .TP
-+.B expandaddr
-+Causes
-+.I mailx
-+to expand message recipient addresses, as explained in the section,
-+Recipient address specifications.
-+.TP
- .B flipr
- Exchanges the
- .I Respond
-diff --git a/names.c b/names.c
-index 66e976b..c69560f 100644
---- a/names.c
-+++ b/names.c
-@@ -268,6 +268,9 @@ outof(struct name *names, FILE *fo, struct header *hp)
- 	FILE *fout, *fin;
- 	int ispipe;
- 
-+	if (value("expandaddr") == NULL)
-+		return names;
-+
- 	top = names;
- 	np = names;
- 	time(&now);
--- 
-1.9.3
-
-
diff --git a/meta/recipes-extended/mailx/files/0012-unpack-Disable-option-processing-for-email-addresses.patch b/meta/recipes-extended/mailx/files/0012-unpack-Disable-option-processing-for-email-addresses.patch
deleted file mode 100644
index 8cdbfd8b038..00000000000
--- a/meta/recipes-extended/mailx/files/0012-unpack-Disable-option-processing-for-email-addresses.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From e34e2ac67b80497080ebecccec40c3b61456167d Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 17 Nov 2014 11:14:06 +0100
-Subject: [PATCH 2/4] unpack: Disable option processing for email addresses
- when calling sendmail
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
----
- extern.h  | 2 +-
- names.c   | 8 ++++++--
- sendout.c | 2 +-
- 3 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/extern.h b/extern.h
-index 6b85ba0..8873fe8 100644
---- a/extern.h
-+++ b/extern.h
-@@ -396,7 +396,7 @@ struct name *outof(struct name *names, FILE *fo, struct header *hp);
- int is_fileaddr(char *name);
- struct name *usermap(struct name *names);
- struct name *cat(struct name *n1, struct name *n2);
--char **unpack(struct name *np);
-+char **unpack(struct name *smopts, struct name *np);
- struct name *elide(struct name *names);
- int count(struct name *np);
- struct name *delete_alternates(struct name *np);
-diff --git a/names.c b/names.c
-index c69560f..45bbaed 100644
---- a/names.c
-+++ b/names.c
-@@ -549,7 +549,7 @@ cat(struct name *n1, struct name *n2)
-  * Return an error if the name list won't fit.
-  */
- char **
--unpack(struct name *np)
-+unpack(struct name *smopts, struct name *np)
- {
- 	char **ap, **top;
- 	struct name *n;
-@@ -564,7 +564,7 @@ unpack(struct name *np)
- 	 * the terminating 0 pointer.  Additional spots may be needed
- 	 * to pass along -f to the host mailer.
- 	 */
--	extra = 2;
-+	extra = 3 + count(smopts);
- 	extra++;
- 	metoo = value("metoo") != NULL;
- 	if (metoo)
-@@ -581,6 +581,10 @@ unpack(struct name *np)
- 		*ap++ = "-m";
- 	if (verbose)
- 		*ap++ = "-v";
-+	for (; smopts != NULL; smopts = smopts->n_flink)
-+		if ((smopts->n_type & GDEL) == 0)
-+			*ap++ = smopts->n_name;
-+	*ap++ = "--";
- 	for (; n != NULL; n = n->n_flink)
- 		if ((n->n_type & GDEL) == 0)
- 			*ap++ = n->n_name;
-diff --git a/sendout.c b/sendout.c
-index 7b7f2eb..c52f15d 100644
---- a/sendout.c
-+++ b/sendout.c
-@@ -835,7 +835,7 @@ start_mta(struct name *to, struct name *mailargs, FILE *input,
- #endif	/* HAVE_SOCKETS */
- 
- 	if ((smtp = value("smtp")) == NULL) {
--		args = unpack(cat(mailargs, to));
-+		args = unpack(mailargs, to);
- 		if (debug || value("debug")) {
- 			printf(catgets(catd, CATSET, 181,
- 					"Sendmail arguments:"));
--- 
-1.9.3
-
-
diff --git a/meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-require-wordexp-support.patch b/meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-require-wordexp-support.patch
deleted file mode 100644
index 5558d8639fe..00000000000
--- a/meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-require-wordexp-support.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 2bae8ecf04ec2ba6bb9f0af5b80485dd0edb427d Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 17 Nov 2014 12:48:25 +0100
-Subject: [PATCH 3/4] fio.c: Unconditionally require wordexp support
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
----
- fio.c | 67 +++++--------------------------------------------------------------
- 1 file changed, 5 insertions(+), 62 deletions(-)
-
-diff --git a/fio.c b/fio.c
-index 65e8f10..1529236 100644
---- a/fio.c
-+++ b/fio.c
-@@ -43,12 +43,15 @@ static char sccsid[] = "@(#)fio.c	2.76 (gritter) 9/16/09";
- #endif /* not lint */
- 
- #include "rcv.h"
-+
-+#ifndef HAVE_WORDEXP
-+#error wordexp support is required
-+#endif
-+
- #include <sys/stat.h>
- #include <sys/file.h>
- #include <sys/wait.h>
--#ifdef	HAVE_WORDEXP
- #include <wordexp.h>
--#endif	/* HAVE_WORDEXP */
- #include <unistd.h>
- 
- #if defined (USE_NSS)
-@@ -481,7 +484,6 @@ next:
- static char *
- globname(char *name)
- {
--#ifdef	HAVE_WORDEXP
- 	wordexp_t we;
- 	char *cp;
- 	sigset_t nset;
-@@ -527,65 +529,6 @@ globname(char *name)
- 	}
- 	wordfree(&we);
- 	return cp;
--#else	/* !HAVE_WORDEXP */
--	char xname[PATHSIZE];
--	char cmdbuf[PATHSIZE];		/* also used for file names */
--	int pid, l;
--	char *cp, *shell;
--	int pivec[2];
--	extern int wait_status;
--	struct stat sbuf;
--
--	if (pipe(pivec) < 0) {
--		perror("pipe");
--		return name;
--	}
--	snprintf(cmdbuf, sizeof cmdbuf, "echo %s", name);
--	if ((shell = value("SHELL")) == NULL)
--		shell = SHELL;
--	pid = start_command(shell, 0, -1, pivec[1], "-c", cmdbuf, NULL);
--	if (pid < 0) {
--		close(pivec[0]);
--		close(pivec[1]);
--		return NULL;
--	}
--	close(pivec[1]);
--again:
--	l = read(pivec[0], xname, sizeof xname);
--	if (l < 0) {
--		if (errno == EINTR)
--			goto again;
--		perror("read");
--		close(pivec[0]);
--		return NULL;
--	}
--	close(pivec[0]);
--	if (wait_child(pid) < 0 && WTERMSIG(wait_status) != SIGPIPE) {
--		fprintf(stderr, catgets(catd, CATSET, 81,
--				"\"%s\": Expansion failed.\n"), name);
--		return NULL;
--	}
--	if (l == 0) {
--		fprintf(stderr, catgets(catd, CATSET, 82,
--					"\"%s\": No match.\n"), name);
--		return NULL;
--	}
--	if (l == sizeof xname) {
--		fprintf(stderr, catgets(catd, CATSET, 83,
--				"\"%s\": Expansion buffer overflow.\n"), name);
--		return NULL;
--	}
--	xname[l] = 0;
--	for (cp = &xname[l-1]; *cp == '\n' && cp > xname; cp--)
--		;
--	cp[1] = '\0';
--	if (strchr(xname, ' ') && stat(xname, &sbuf) < 0) {
--		fprintf(stderr, catgets(catd, CATSET, 84,
--				"\"%s\": Ambiguous.\n"), name);
--		return NULL;
--	}
--	return savestr(xname);
--#endif	/* !HAVE_WORDEXP */
- }
- 
- /*
--- 
-1.9.3
-
-
diff --git a/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch b/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
deleted file mode 100644
index ae14b8acfe5..00000000000
--- a/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 73fefa0c1ac70043ec84f2d8b8f9f683213f168d Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 17 Nov 2014 13:11:32 +0100
-Subject: [PATCH 4/4] globname: Invoke wordexp with WRDE_NOCMD (CVE-2004-2771)
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
-CVE: CVE-2004-2771
----
- fio.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/fio.c b/fio.c
-index 1529236..774a204 100644
---- a/fio.c
-+++ b/fio.c
-@@ -497,7 +497,7 @@ globname(char *name)
- 	sigemptyset(&nset);
- 	sigaddset(&nset, SIGCHLD);
- 	sigprocmask(SIG_BLOCK, &nset, NULL);
--	i = wordexp(name, &we, 0);
-+	i = wordexp(name, &we, WRDE_NOCMD);
- 	sigprocmask(SIG_UNBLOCK, &nset, NULL);
- 	switch (i) {
- 	case 0:
--- 
-1.9.3
-
-
diff --git a/meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch b/meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
deleted file mode 100644
index 2b5991425bb..00000000000
--- a/meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Description: Sendmail is at /usr/sbin/sendmail
- As per Debian Policy §11.6
-Author: Ryan Kavanagh <rak@debian.org>
-Origin: Debian
-Forwarded: no
----
-This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
-Index: heirloom-mailx-12.5/Makefile
-===================================================================
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
-
---- heirloom-mailx-12.5.orig/Makefile	2011-04-26 17:23:22.000000000 -0400
-+++ heirloom-mailx-12.5/Makefile	2015-01-27 13:20:04.733542801 -0500
-@@ -13,7 +13,7 @@
- 
- MAILRC		= $(SYSCONFDIR)/nail.rc
- MAILSPOOL	= /var/mail
--SENDMAIL	= /usr/lib/sendmail
-+SENDMAIL	= /usr/sbin/sendmail
- 
- DESTDIR		=
- 
-Index: heirloom-mailx-12.5/mailx.1
-===================================================================
---- heirloom-mailx-12.5.orig/mailx.1	2015-01-27 13:18:49.000000000 -0500
-+++ heirloom-mailx-12.5/mailx.1	2015-01-27 13:20:32.382336867 -0500
-@@ -4922,7 +4922,7 @@
- which just acts as a proxy.
- .PP
- \fIMailx\fR immediately contacts the SMTP server (or
--.IR \%/usr/lib/sendmail )
-+.IR \%/usr/sbin/sendmail )
- even when operating in
- .I disconnected
- mode.
diff --git a/meta/recipes-extended/mailx/files/explicitly.disable.krb5.support.patch b/meta/recipes-extended/mailx/files/explicitly.disable.krb5.support.patch
deleted file mode 100644
index b74fd0472eb..00000000000
--- a/meta/recipes-extended/mailx/files/explicitly.disable.krb5.support.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-krb5 support is autodetected from sysroot making builds undeterministic
-feel free to improve this to support explicitly enabling/disabling it
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
---- a/makeconfig	2013-07-21 15:06:11.177792334 +0200
-+++ b/makeconfig	2013-07-21 15:07:20.028793994 +0200
-@@ -424,36 +424,6 @@
- }
- !
- 
--<$tmp2.c link_check gssapi 'for GSSAPI in libgss' \
--		'#define USE_GSSAPI' '-lgss' ||
--	<$tmp2.c link_check gssapi 'for GSSAPI in libgssapi_krb5' \
--			'#define USE_GSSAPI' '-lgssapi_krb5' ||
--		link_check gssapi 'for GSSAPI in libgssapi_krb5, old-style' \
--				'#define USE_GSSAPI
--#define GSSAPI_OLD_STYLE' '-lgssapi_krb5' <<\! || \
--			link_check gssapi 'for GSSAPI in libgssapi' \
--				'#define USE_GSSAPI
--#define	GSSAPI_REG_INCLUDE' '-lgssapi' <<\%
--#include <gssapi/gssapi.h>
--#include <gssapi/gssapi_generic.h>
--
--int main(void)
--{
--	gss_import_name(0, 0, gss_nt_service_name, 0);
--	gss_init_sec_context(0,0,0,0,0,0,0,0,0,0,0,0,0);
--	return 0;
--}
--!
--#include <gssapi.h>
--
--int main(void)
--{
--	gss_import_name(0, 0, GSS_C_NT_HOSTBASED_SERVICE, 0);
--	gss_init_sec_context(0,0,0,0,0,0,0,0,0,0,0,0,0);
--	return 0;
--}
--%
--
- cat >$tmp2.c <<\!
- #include "config.h"
- #ifdef HAVE_NL_LANGINFO
diff --git a/meta/recipes-extended/mailx/mailx_12.5-5.bb b/meta/recipes-extended/mailx/mailx_12.5-5.bb
deleted file mode 100644
index 9dd710a7181..00000000000
--- a/meta/recipes-extended/mailx/mailx_12.5-5.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "mailx is the traditional command-line-mode mail user agent"
-
-DESCRIPTION = "Mailx is derived from Berkeley Mail and is intended provide the \
-functionality of the POSIX mailx command with additional support \
-for MIME, IMAP, POP3, SMTP, and S/MIME."
-
-HOMEPAGE = "http://heirloom.sourceforge.net/mailx.html"
-SECTION = "console/network"
-LICENSE = "BSD & MPL-1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4202a0a62910cf94f7af8a3436a2a2dd"
-
-DEPENDS = "openssl"
-
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/h/heirloom-mailx/heirloom-mailx_12.5.orig.tar.gz;name=archive \
-           file://0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch \
-           file://0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch \
-           file://0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch \
-           file://0011-outof-Introduce-expandaddr-flag.patch \
-           file://0012-unpack-Disable-option-processing-for-email-addresses.patch \
-           file://0013-fio.c-Unconditionally-require-wordexp-support.patch \
-           file://0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch \
-           file://0015-usr-sbin-sendmail.patch \
-           file://explicitly.disable.krb5.support.patch \
-          "
-
-SRC_URI[archive.md5sum] = "29a6033ef1412824d02eb9d9213cb1f2"
-SRC_URI[archive.sha256sum] = "015ba4209135867f37a0245d22235a392b8bbed956913286b887c2e2a9a421ad"
-
-# for this package we're mostly interested in tracking debian patches,
-# and not in the upstream version where all development has effectively stopped
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/h/heirloom-mailx/"
-UPSTREAM_CHECK_REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
-
-S = "${WORKDIR}/heirloom-mailx-12.5"
-
-inherit autotools-brokensep
-
-CFLAGS_append = " -D_BSD_SOURCE -DDEBIAN -I${S}/EXT"
-
-# "STRIP=true" means that 'true' command will be used to 'strip' files which will achieve the effect of not stripping them
-# mailx's Makefile doesn't allow a more straightforward way to avoid stripping
-EXTRA_OEMAKE = "SENDMAIL=${sbindir}/sendmail IPv6=-DHAVE_IPv6_FUNCS PREFIX=/usr UCBINSTALL=/usr/bin/install STRIP=true"
-
-# The makeconfig can't run parallelly, otherwise the checking results
-# might be incorrect and lead to errors:
-# fio.c:56:17: fatal error: ssl.h: No such file or directory
-# #include <ssl.h>
-PARALLEL_MAKE = ""
-
-# Causes gcc to get stuck and eat all available memory in qemuarm builds
-# http://errors.yoctoproject.org/Errors/Details/20488/
-ARM_INSTRUCTION_SET_armv4 = "arm"
-ARM_INSTRUCTION_SET_armv5 = "arm"
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 112fe7bf11d..5baaf351e18 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -153,7 +153,6 @@ RDEPENDS_packagegroup-core-lsb-core = "\
     localedef \
     lsb \
     m4 \
-    mailx \
     make \
     man \
     man-pages \
-- 
2.11.0


