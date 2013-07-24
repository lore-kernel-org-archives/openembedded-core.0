Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8C460629
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 09:07:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6O97Ud2017455
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 02:07:30 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 24 Jul 2013 02:07:29 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jul 2013 17:07:22 +0800
Message-ID: <32d9436e56b38df1735c4e8b125fcbb304a23a13.1374653739.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1374653739.git.hongxu.jia@windriver.com>
References: <cover.1374653739.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] sysvinit: pidof add -m option for lsbinitscripts
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
X-List-Received-Date: Wed, 24 Jul 2013 09:07:29 -0000
Content-Type: text/plain

When reboot the system on lsb image, some kill processes would print the
following message:
...
pidof: invalid options on command line!
...

The killproc in lsbinitscripts invokes pidof with option -m, but the pidof
in sysvinit package doesn't support this.

Backport from fedora to add -m option on pidof could fix this issue.

[YOCTO #4896]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../sysvinit-2.88dsf/pidof-add-m-option.patch      | 189 +++++++++++++++++++++
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   1 +
 2 files changed, 190 insertions(+)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit-2.88dsf/pidof-add-m-option.patch

diff --git a/meta/recipes-core/sysvinit/sysvinit-2.88dsf/pidof-add-m-option.patch b/meta/recipes-core/sysvinit/sysvinit-2.88dsf/pidof-add-m-option.patch
new file mode 100644
index 0000000..5b5dfdc
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit-2.88dsf/pidof-add-m-option.patch
@@ -0,0 +1,189 @@
+pidof: add -m option
+
+When used with -o, will also omit any processes that have the same
+argv[0] and argv[1] as any explicitly omitted process ids. This can be
+used to avoid multiple shell scripts concurrently calling pidof returning
+each other's pids.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=883856
+
+Upstream-Status: backport
+Imported patch from: https://bugzilla.redhat.com/attachment.cgi?id=658166
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ man/pidof.8    |  6 ++++++
+ src/killall5.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++++++---
+ 2 files changed, 65 insertions(+), 3 deletions(-)
+
+diff --git a/man/pidof.8 b/man/pidof.8
+--- a/man/pidof.8
++++ b/man/pidof.8
+@@ -24,6 +24,7 @@ pidof -- find the process ID of a running program.
+ .RB [ \-c ]
+ .RB [ \-n ]
+ .RB [ \-x ]
++.RB [ \-m ]
+ .RB [ \-o
+ .IR omitpid[,omitpid..] ]
+ .RB [ \-o
+@@ -63,6 +64,11 @@ shells running the named scripts.
+ Tells \fIpidof\fP to omit processes with that process id. The special
+ pid \fB%PPID\fP can be used to name the parent process of the \fIpidof\fP
+ program, in other words the calling shell or shell script.
++.IP -m
++When used with -o, will also omit any processes that have the same
++argv[0] and argv[1] as any explicitly omitted process ids. This can be
++used to avoid multiple shell scripts concurrently calling pidof returning
++each other's pids.
+ .SH "EXIT STATUS"
+ .TP
+ .B 0
+diff --git a/src/killall5.c b/src/killall5.c
+index 5937d98..e73885e 100644
+--- a/src/killall5.c
++++ b/src/killall5.c
+@@ -118,6 +118,7 @@ typedef struct _s_nfs
+ 
+ /* List of processes. */
+ PROC *plist;
++PROC *olist;
+ 
+ /* List of processes to omit. */
+ OMIT *omit;
+@@ -345,6 +346,20 @@ static void clear_mnt(void)
+ 	}
+ }
+ 
++static void clear_omit(void)
++{
++	OMIT *o;
++	PROC *p;
++	for (o = omit; o; o = omit) {
++		omit = omit->next;
++		free(o);
++	}
++	for (p = olist; p; p = olist) {
++		olist = olist->next;
++		free(p);
++	}
++}
++
+ /*
+  *     Check if path is ia shadow off a NFS partition.
+  */
+@@ -452,6 +467,7 @@ int readproc(int do_stat)
+ 	DIR		*dir;
+ 	FILE		*fp;
+ 	PROC		*p, *n;
++	OMIT		*o, *m;
+ 	struct dirent	*d;
+ 	struct stat	st;
+ 	char		path[PATH_MAX+1];
+@@ -624,6 +640,17 @@ int readproc(int do_stat)
+ 		p->next = plist;
+ 		plist = p;
+ 		p->pid = pid;
++		/* Could be smarter, but it's a small list. */
++		m = omit;
++		for (o = omit; m; o = m) {
++			m = o->next;
++			if (o->pid == p->pid) {
++				n = (PROC*)xmalloc(sizeof(PROC));
++				*n = *p;
++				n->next = olist;
++				olist = n;
++			}
++		}
+ 	}
+ 	closedir(dir);
+ 
+@@ -813,6 +840,26 @@ PIDQ_HEAD *pidof(char *prog)
+ 	return q;
+ }
+ 
++int matches(PROC *o, PROC *p)
++{
++	int ret = 0;
++	char *oargv1, *pargv1;
++	if ((o->argv0 && p->argv0 && !strcmp(o->argv0,p->argv0))) {
++		if (o->argv1 && p->argv1) {
++			if ((oargv1 = canonicalize_file_name(o->argv1)) == NULL)
++				oargv1 = strdup(o->argv1);
++			if ((pargv1 = canonicalize_file_name(p->argv1)) == NULL)
++				pargv1 = strdup(p->argv1);
++			if (! strcmp(oargv1, pargv1)) {
++				ret = 1;
++			}
++			free(oargv1);
++			free(pargv1);
++		}
++	}
++	return ret;
++}
++
+ /* Give usage message and exit. */
+ void usage(void)
+ {
+@@ -845,6 +892,7 @@ void nsyslog(int pri, char *fmt, ...)
+ #define PIDOF_SINGLE	0x01
+ #define PIDOF_OMIT	0x02
+ #define PIDOF_NETFS	0x04
++#define PIDOF_OMIT_OMIT_MATCHES	0x08
+ 
+ /*
+  *	Pidof functionality.
+@@ -861,6 +909,7 @@ int main_pidof(int argc, char **argv)
+ 	struct stat	st;
+ 	char		tmp[512];
+ 
++	olist = (PROC*)0;
+ 	omit = (OMIT*)0;
+ 	nlist = (NFS*)0;
+ 	opterr = 0;
+@@ -868,7 +917,7 @@ int main_pidof(int argc, char **argv)
+ 	if ((token = getenv("PIDOF_NETFS")) && (strcmp(token,"no") != 0))
+ 		flags |= PIDOF_NETFS;
+ 
+-	while ((opt = getopt(argc,argv,"hco:sxn")) != EOF) switch (opt) {
++	while ((opt = getopt(argc,argv,"hcmo:sxn")) != EOF) switch (opt) {
+ 		case '?':
+ 			nsyslog(LOG_ERR,"invalid options on command line!\n");
+ 			closelog();
+@@ -907,6 +956,9 @@ int main_pidof(int argc, char **argv)
+ 		case 'x':
+ 			scripts_too++;
+ 			break;
++		case 'm':
++			flags |= PIDOF_OMIT_OMIT_MATCHES;
++			break;
+ 		case 'n':
+ 			flags |= PIDOF_NETFS;
+ 			break;
+@@ -938,10 +990,13 @@ int main_pidof(int argc, char **argv)
+ 			pid_t spid = 0;
+ 			while ((p = get_next_from_pid_q(q))) {
+ 				if ((flags & PIDOF_OMIT) && omit) {
+-					OMIT * optr;
+-					for (optr = omit; optr; optr = optr->next) {
++					PROC * optr;
++					for (optr = olist; optr; optr = optr->next) {
+ 						if (optr->pid == p->pid)
+ 							break;
++						if (flags & PIDOF_OMIT_OMIT_MATCHES)
++							if (matches(optr, p))
++								break;
+ 					}
+ 
+ 					/*
+@@ -977,6 +1032,7 @@ int main_pidof(int argc, char **argv)
+ 	if (!first)
+ 		printf("\n");
+ 
++	clear_omit();
+ 	clear_mnt();
+ 
+ 	closelog();
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 784d538..03bbc1b 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -12,6 +12,7 @@ RDEPENDS_${PN} = "${PN}-inittab"
 SRC_URI = "http://download.savannah.gnu.org/releases-noredirect/sysvinit/sysvinit-${PV}.tar.bz2 \
 	   file://install.patch \
 	   file://crypt-lib.patch \
+	   file://pidof-add-m-option.patch \
            file://need \
            file://provide \
            file://rcS-default \
-- 
1.8.1.2


