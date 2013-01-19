Received: from mail-oa0-f52.google.com ([209.85.219.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TwhKH-0006u1-6l
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 23:55:50 +0100
Received: by mail-oa0-f52.google.com with SMTP id o6so4873049oag.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=aUv3t7JRSj45ClTPMYCVRYXwDFJS0rsAAyHZFvUnnto=;
	b=MDiiguxjgkHJTUKFjrHreLMx2fw1lJjDIgKzzGrGfOYyJfL65pHcSAbLSj69seAbu9
	d9HVrzUyRYTgf2tjWHA3etJDtfRtuS7X8te+XC5Vd3SHVJtNnjp++YOFMJ0p3ChaB66/
	4TOyY3kXQqsisZb35SIb5Gj8jbCyGKknSY8zxbwWFlXiQJQ219sYGE7fvPR2mGW2k61q
	cZW0XHQ8VTMkA2ylXKftUxthSLfCGzBiNCqRI4RkcXIk3c2XBY+qxSzvTgkiwv6duokw
	w1lVxgeH4MlIAgFlEfIN8q+JiYQqMxzVRQvq3ij+vOgI6Tk+2+kDYFBafDmM8u9BPG9D
	mhxA==
X-Received: by 10.60.11.130 with SMTP id q2mr10388164oeb.141.1358635222335;
	Sat, 19 Jan 2013 14:40:22 -0800 (PST)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id 7sm6936441obu.4.2013.01.19.14.40.20
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:40:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 14:40:04 -0800
Message-Id: <45d894b5a00300841877376b868fc820a3070043.1358634922.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
References: <613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
In-Reply-To: <cover.1358634922.git.raj.khem@gmail.com>
References: <cover.1358634922.git.raj.khem@gmail.com>
Cc: Khem Raj <kraj@juniper.net>
Subject: [PATCH 2/4] nfs-utils: Upgrade 1.2.3 -> 1.2.8-rc2
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
X-List-Received-Date: Sat, 19 Jan 2013 22:55:51 -0000

From: Khem Raj <kraj@juniper.net>

Disable nfsv4l since it needs LVM2 which
is not available in OE-Core

Disable nfsdcltrack since its configure time check
for sqlite3 is not cross compiling safe

It can support ipv6 but thats disabled since
we disable libtirpc which is needed for ipv6
support in nfs-utils

Patches imported from fedora to take us to 1.2.8-rc2

Signed-off-by: Khem Raj <kraj@juniper.net>
---
 .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         |   37 +-
 .../nfs-utils-1.2.1-exp-subtree-warn-off.patch     |   12 +
 .../nfs-utils/nfs-utils-1.2.1-statdpath-man.patch  |   58 +++
 .../nfs-utils-1.2.3-sm-notify-res_init.patch       |   21 +
 .../nfs-utils/nfs-utils-1.2.5-idmap-errmsg.patch   |   12 +
 .../nfs-utils/nfs-utils-nfsctl-x32-fix.patch       |   30 --
 .../nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch  |  535 ++++++++++++++++++++
 .../nfs-utils/nfs-utils.1.2.8.rc2.patch.1          |  535 ++++++++++++++++++++
 .../{nfs-utils_1.2.3.bb => nfs-utils_1.2.7.bb}     |   28 +-
 9 files changed, 1210 insertions(+), 58 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-exp-subtree-warn-off.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-statdpath-man.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.5-idmap-errmsg.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-nfsctl-x32-fix.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch.1
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.2.3.bb => nfs-utils_1.2.7.bb} (63%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
index 6d46d3a..d3d3ac8 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
@@ -1,22 +1,25 @@
 Upstream-Status: Inappropriate [embedded specific]
 
-Index: nfs-utils-1.2.3/support/nfs/svc_socket.c
+Index: nfs-utils-1.2.6/support/nfs/svc_socket.c
 ===================================================================
---- nfs-utils-1.2.3.orig/support/nfs/svc_socket.c
-+++ nfs-utils-1.2.3/support/nfs/svc_socket.c
-@@ -67,6 +67,7 @@ svc_socket (u_long number, int type, int
-   memset (&addr, 0, sizeof (addr));
-   addr.sin_family = AF_INET;
+--- nfs-utils-1.2.6.orig/support/nfs/svc_socket.c	2012-05-14 07:40:52.000000000 -0700
++++ nfs-utils-1.2.6/support/nfs/svc_socket.c	2012-10-28 02:42:50.179222457 -0700
+@@ -40,8 +40,9 @@
+ 	char rpcdata[1024], servdata[1024];
+ 	struct rpcent rpcbuf, *rpcp;
+ 	struct servent servbuf, *servp = NULL;
+-	int ret;
++	int ret = 0;
  
-+#ifndef __UCLIBC__	/* neither getrpcbynumber() nor getrpcbynumber_r() is SuSv3 */
-   ret = getrpcbynumber_r (number, &rpcbuf, rpcdata, sizeof rpcdata,
- 			  &rpcp);
-   if (ret == 0 && rpcp != NULL)
-@@ -100,6 +101,7 @@ svc_socket (u_long number, int type, int
++#ifndef __UCLIBC__     /* neither getrpcbynumber() nor getrpcbynumber_r() is SuSv3 */
+ 	ret = getrpcbynumber_r(number, &rpcbuf, rpcdata, sizeof rpcdata,
+ 				&rpcp);
+ 	if (ret == 0 && rpcp != NULL) {
+@@ -60,6 +61,7 @@
+ 			}
+ 		}
  	}
-     }
-   else
-+#endif
-     {
- 	  addr.sin_port = 0;
- 	  if (bind (sock, (struct sockaddr *) &addr, len) < 0)
++#endif /* __UCLIBC__ */
+ 
+ 	if (ret == 0 && servp != NULL)
+ 		return ntohs(servp->s_port);
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-exp-subtree-warn-off.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-exp-subtree-warn-off.patch
new file mode 100644
index 0000000..14e376c
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-exp-subtree-warn-off.patch
@@ -0,0 +1,12 @@
+diff -up nfs-utils-1.2.1/support/nfs/exports.c.orig nfs-utils-1.2.1/support/nfs/exports.c
+--- nfs-utils-1.2.1/support/nfs/exports.c.orig	2010-01-15 10:48:49.631894982 -0500
++++ nfs-utils-1.2.1/support/nfs/exports.c	2010-01-15 11:05:02.009874055 -0500
+@@ -483,7 +483,7 @@ static void fix_pseudoflavor_flags(struc
+ static int
+ parseopts(char *cp, struct exportent *ep, int warn, int *had_subtree_opt_ptr)
+ {
+-	int	had_subtree_opt = 0;
++	int	had_subtree_opt = 1;
+ 	char 	*flname = efname?efname:"command line";
+ 	int	flline = efp?efp->x_line:0;
+ 	unsigned int active = 0;
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-statdpath-man.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-statdpath-man.patch
new file mode 100644
index 0000000..8c2e0e2
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-statdpath-man.patch
@@ -0,0 +1,58 @@
+diff -up nfs-utils-1.2.1/utils/statd/sm-notify.man.save nfs-utils-1.2.1/utils/statd/sm-notify.man
+--- nfs-utils-1.2.1/utils/statd/sm-notify.man.save	2010-01-15 11:10:25.096874609 -0500
++++ nfs-utils-1.2.1/utils/statd/sm-notify.man	2010-01-15 11:14:12.636873981 -0500
+@@ -186,7 +186,7 @@ where NSM state information resides.
+ If this option is not specified,
+ .B sm-notify
+ uses
+-.I /var/lib/nfs
++.I /var/lib/nfs/statd
+ by default.
+ .IP
+ After starting,
+@@ -287,13 +287,13 @@ Currently, the
+ command supports sending notification only via datagram transport protocols.
+ .SH FILES
+ .TP 2.5i
+-.I /var/lib/nfs/sm
++.I /var/lib/nfs/statd/sm
+ directory containing monitor list
+ .TP 2.5i
+-.I /var/lib/nfs/sm.bak
++.I /var/lib/nfs/statd/sm.bak
+ directory containing notify list
+ .TP 2.5i
+-.I /var/lib/nfs/state
++.I /var/lib/nfs/statd/state
+ NSM state number for this host
+ .TP 2.5i
+ .I /proc/sys/fs/nfs/nsm_local_state
+diff -up nfs-utils-1.2.1/utils/statd/statd.man.save nfs-utils-1.2.1/utils/statd/statd.man
+--- nfs-utils-1.2.1/utils/statd/statd.man.save	2010-01-15 11:10:25.098906325 -0500
++++ nfs-utils-1.2.1/utils/statd/statd.man	2010-01-15 11:11:03.874769717 -0500
+@@ -232,7 +232,7 @@ where NSM state information resides.
+ If this option is not specified,
+ .B rpc.statd
+ uses
+-.I /var/lib/nfs
++.I /var/lib/nfs/statd
+ by default.
+ .IP
+ After starting,
+@@ -368,13 +368,13 @@ As long as at least one network transpor
+ will operate.
+ .SH FILES
+ .TP 2.5i
+-.I /var/lib/nfs/sm
++.I /var/lib/nfs/statd/sm
+ directory containing monitor list
+ .TP 2.5i
+-.I /var/lib/nfs/sm.bak
++.I /var/lib/nfs/statd/sm.bak
+ directory containing notify list
+ .TP 2.5i
+-.I /var/lib/nfs/state
++.I /var/lib/nfs/statd/state
+ NSM state number for this host
+ .TP 2.5i
+ .I /var/run/run.statd.pid
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
new file mode 100644
index 0000000..3ce55eb
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
@@ -0,0 +1,21 @@
+diff -up nfs-utils-1.2.3/utils/statd/sm-notify.c.orig nfs-utils-1.2.3/utils/statd/sm-notify.c
+--- nfs-utils-1.2.3/utils/statd/sm-notify.c.orig	2010-09-28 08:24:16.000000000 -0400
++++ nfs-utils-1.2.3/utils/statd/sm-notify.c	2010-10-15 16:44:43.487119601 -0400
+@@ -28,6 +28,9 @@
+ #include <netdb.h>
+ #include <errno.h>
+ #include <grp.h>
++#include <netinet/in.h>
++#include <arpa/nameser.h>
++#include <resolv.h>
+ 
+ #include "sockaddr.h"
+ #include "xlog.h"
+@@ -84,6 +87,7 @@ smn_lookup(const char *name)
+ 	};
+ 	int error;
+ 
++	res_init();
+ 	error = getaddrinfo(name, NULL, &hint, &ai);
+ 	if (error != 0) {
+ 		xlog(D_GENERAL, "getaddrinfo(3): %s", gai_strerror(error));
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.5-idmap-errmsg.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.5-idmap-errmsg.patch
new file mode 100644
index 0000000..8e00ed7
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.5-idmap-errmsg.patch
@@ -0,0 +1,12 @@
+diff -up nfs-utils-1.2.5/utils/nfsidmap/nfsidmap.c.orig nfs-utils-1.2.5/utils/nfsidmap/nfsidmap.c
+--- nfs-utils-1.2.5/utils/nfsidmap/nfsidmap.c.orig	2011-12-13 15:01:26.311660000 -0500
++++ nfs-utils-1.2.5/utils/nfsidmap/nfsidmap.c	2011-12-13 15:32:48.167354000 -0500
+@@ -261,7 +261,7 @@ int main(int argc, char **argv)
+ 
+ 	xlog_stderr(0);
+ 	if ((argc - optind) != 2) {
+-		xlog_err("Bad arg count. Check /etc/request-key.conf");
++		xlog_err("Bad arg count. Check /etc/request-key.d/id_resolver.conf");
+ 		xlog_warn(usage, progname);
+ 		return 1;
+ 	}
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-nfsctl-x32-fix.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-nfsctl-x32-fix.patch
deleted file mode 100644
index 26b4631..0000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-nfsctl-x32-fix.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-
-Upstream-Status: Pending
-
-Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
-
---- nfs-utils-1.2.3/support/nfs/nfsctl.c.x32	2010-09-28 05:24:16.000000000 -0700
-+++ nfs-utils-1.2.3/support/nfs/nfsctl.c	2011-11-30 13:34:09.369917161 -0800
-@@ -12,15 +12,22 @@
- 
- #include <unistd.h>
- #include <asm/unistd.h>
-+#include <errno.h>
- #include "nfslib.h"
- 
- /* compatibility hack... */
- #ifndef __NR_nfsctl
-+#ifdef __NR_nfsservctl
- #define __NR_nfsctl	__NR_nfsservctl
- #endif
-+#endif
- 
- int
- nfsctl (int cmd, struct nfsctl_arg * argp, union nfsctl_res * resp)
- {
-+#ifdef __NR_nfsctl
-   return syscall (__NR_nfsctl, cmd, argp, resp);
-+#else
-+  return -ENOSYS;
-+#endif
- }
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch
new file mode 100644
index 0000000..2cda8c6
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch
@@ -0,0 +1,535 @@
+diff --git a/support/export/rmtab.c b/support/export/rmtab.c
+index 31c0f50..d16b3b3 100644
+--- a/support/export/rmtab.c
++++ b/support/export/rmtab.c
+@@ -1,7 +1,7 @@
+ /*
+- * support/export/rmntab.c
++ * support/export/rmtab.c
+  *
+- * Interface to the rmnt file.
++ * Interface to the rmtab file.
+  *
+  */
+ 
+@@ -12,7 +12,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <errno.h>
+-#include "xmalloc.h"
++
+ #include "misc.h"
+ #include "nfslib.h"
+ #include "exportfs.h"
+diff --git a/support/export/xtab.c b/support/export/xtab.c
+index 2a43193..e953071 100644
+--- a/support/export/xtab.c
++++ b/support/export/xtab.c
+@@ -14,7 +14,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include "xmalloc.h"
++
+ #include "nfslib.h"
+ #include "exportfs.h"
+ #include "xio.h"
+diff --git a/support/nfs/cacheio.c b/support/nfs/cacheio.c
+index e641c45..61e07a8 100644
+--- a/support/nfs/cacheio.c
++++ b/support/nfs/cacheio.c
+@@ -162,11 +162,16 @@ int qword_eol(FILE *f)
+ {
+ 	int err;
+ 
+-	fprintf(f,"\n");
+-	err = fflush(f);
+-	if (err) {
+-		xlog_warn("qword_eol: fflush failed: errno %d (%s)",
++	err = fprintf(f,"\n");
++	if (err < 0) {
++		xlog_warn("qword_eol: fprintf failed: errno %d (%s)",
+ 			    errno, strerror(errno));
++	} else {
++		err = fflush(f);
++		if (err) {
++			xlog_warn("qword_eol: fflush failed: errno %d (%s)",
++				  errno, strerror(errno));
++		}
+ 	}
+ 	/*
+ 	 * We must send one line (and one line only) in a single write
+diff --git a/utils/gssd/gssd_proc.c b/utils/gssd/gssd_proc.c
+index ec251fa..d01ba2f 100644
+--- a/utils/gssd/gssd_proc.c
++++ b/utils/gssd/gssd_proc.c
+@@ -52,6 +52,7 @@
+ #include <sys/socket.h>
+ #include <arpa/inet.h>
+ #include <sys/fsuid.h>
++#include <sys/resource.h>
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -250,21 +251,10 @@ read_service_info(char *info_file_name, char **servicename, char **servername,
+ 	if ((p = strstr(buf, "port")) != NULL)
+ 		sscanf(p, "port: %127s\n", port);
+ 
+-	/* check service, program, and version */
+-	if (memcmp(service, "nfs", 3) != 0)
+-		return -1;
++	/* get program, and version numbers */
+ 	*prog = atoi(program + 1); /* skip open paren */
+ 	*vers = atoi(version);
+ 
+-	if (strlen(service) == 3 ) {
+-		if ((*prog != 100003) || ((*vers != 2) && (*vers != 3) &&
+-		    (*vers != 4)))
+-			goto fail;
+-	} else if (memcmp(service, "nfs4_cb", 7) == 0) {
+-		if (*vers != 1)
+-			goto fail;
+-	}
+-
+ 	if (!addrstr_to_sockaddr(addr, address, port))
+ 		goto fail;
+ 
+@@ -398,10 +388,10 @@ process_clnt_dir_files(struct clnt_info * clp)
+ static int
+ get_poll_index(int *ind)
+ {
+-	int i;
++	unsigned int i;
+ 
+ 	*ind = -1;
+-	for (i=0; i<FD_ALLOC_BLOCK; i++) {
++	for (i=0; i<pollsize; i++) {
+ 		if (pollarray[i].events == 0) {
+ 			*ind = i;
+ 			break;
+@@ -483,9 +473,13 @@ fail_keep_client:
+ void
+ init_client_list(void)
+ {
++	struct rlimit rlim;
+ 	TAILQ_INIT(&clnt_list);
+ 	/* Eventually plan to grow/shrink poll array: */
+ 	pollsize = FD_ALLOC_BLOCK;
++	if (getrlimit(RLIMIT_NOFILE, &rlim) < 0 &&
++	    rlim.rlim_cur != RLIM_INFINITY)
++		pollsize = rlim.rlim_cur;
+ 	pollarray = calloc(pollsize, sizeof(struct pollfd));
+ }
+ 
+@@ -567,9 +561,8 @@ process_pipedir(char *pipe_name)
+ 
+ 	update_old_clients(namelist, j, pipe_name);
+ 	for (i=0; i < j; i++) {
+-		if (i < FD_ALLOC_BLOCK
+-				&& !strncmp(namelist[i]->d_name, "clnt", 4)
+-				&& !find_client(namelist[i]->d_name, pipe_name))
++		if (!strncmp(namelist[i]->d_name, "clnt", 4)
++		    && !find_client(namelist[i]->d_name, pipe_name))
+ 			process_clnt_dir(namelist[i]->d_name, pipe_name);
+ 		free(namelist[i]);
+ 	}
+@@ -962,12 +955,6 @@ process_krb5_upcall(struct clnt_info *clp, uid_t uid, int fd, char *tgtname,
+ 
+ 	printerr(1, "handling krb5 upcall (%s)\n", clp->dirname);
+ 
+-	if (tgtname) {
+-		if (clp->servicename) {
+-			free(clp->servicename);
+-			clp->servicename = strdup(tgtname);
+-		}
+-	}
+ 	token.length = 0;
+ 	token.value = NULL;
+ 	memset(&pd, 0, sizeof(struct authgss_private_data));
+@@ -1016,7 +1003,8 @@ process_krb5_upcall(struct clnt_info *clp, uid_t uid, int fd, char *tgtname,
+ 			int success = 0;
+ 			do {
+ 				gssd_refresh_krb5_machine_credential(clp->servername,
+-								     NULL, service);
++								     NULL, service,
++								     tgtname);
+ 				/*
+ 				 * Get a list of credential cache names and try each
+ 				 * of them until one works or we've tried them all
+diff --git a/utils/gssd/krb5_util.c b/utils/gssd/krb5_util.c
+index 60ba594..aeb8f70 100644
+--- a/utils/gssd/krb5_util.c
++++ b/utils/gssd/krb5_util.c
+@@ -774,12 +774,16 @@ gssd_search_krb5_keytab(krb5_context context, krb5_keytab kt,
+ }
+ 
+ /*
+- * Find a keytab entry to use for a given target hostname.
++ * Find a keytab entry to use for a given target realm.
+  * Tries to find the most appropriate keytab to use given the
+  * name of the host we are trying to connect with.
++ *
++ * Note: the tgtname contains a hostname in the realm that we
++ * are authenticating to. It may, or may not be the same as
++ * the server hostname.
+  */
+ static int
+-find_keytab_entry(krb5_context context, krb5_keytab kt, const char *hostname,
++find_keytab_entry(krb5_context context, krb5_keytab kt, const char *tgtname,
+ 		  krb5_keytab_entry *kte, const char **svcnames)
+ {
+ 	krb5_error_code code;
+@@ -795,7 +799,7 @@ find_keytab_entry(krb5_context context, krb5_keytab kt, const char *hostname,
+ 
+ 
+ 	/* Get full target hostname */
+-	retval = get_full_hostname(hostname, targethostname,
++	retval = get_full_hostname(tgtname, targethostname,
+ 				   sizeof(targethostname));
+ 	if (retval)
+ 		goto out;
+@@ -1128,7 +1132,7 @@ gssd_get_krb5_machine_cred_list(char ***list)
+ 		if (ple->ccname) {
+ 			/* Make sure cred is up-to-date before returning it */
+ 			retval = gssd_refresh_krb5_machine_credential(NULL, ple,
+-				NULL);
++				NULL, NULL);
+ 			if (retval)
+ 				continue;
+ 			if (i + 1 > listsize) {
+@@ -1219,7 +1223,8 @@ gssd_destroy_krb5_machine_creds(void)
+ int
+ gssd_refresh_krb5_machine_credential(char *hostname,
+ 				     struct gssd_k5_kt_princ *ple, 
+-					 char *service)
++					 char *service,
++					 char *tgtname)
+ {
+ 	krb5_error_code code = 0;
+ 	krb5_context context;
+@@ -1258,7 +1263,10 @@ gssd_refresh_krb5_machine_credential(char *hostname,
+ 	if (ple == NULL) {
+ 		krb5_keytab_entry kte;
+ 
+-		code = find_keytab_entry(context, kt, hostname, &kte, svcnames);
++		if (tgtname == NULL)
++			tgtname = hostname;
++
++		code = find_keytab_entry(context, kt, tgtname, &kte, svcnames);
+ 		if (code) {
+ 			printerr(0, "ERROR: %s: no usable keytab entry found "
+ 				 "in keytab %s for connection with host %s\n",
+diff --git a/utils/gssd/krb5_util.h b/utils/gssd/krb5_util.h
+index cd6e107..9f41625 100644
+--- a/utils/gssd/krb5_util.h
++++ b/utils/gssd/krb5_util.h
+@@ -31,7 +31,8 @@ void gssd_setup_krb5_machine_gss_ccache(char *servername);
+ void gssd_destroy_krb5_machine_creds(void);
+ int  gssd_refresh_krb5_machine_credential(char *hostname,
+ 					  struct gssd_k5_kt_princ *ple, 
+-					  char *service);
++					  char *service,
++					  char *tgtname);
+ char *gssd_k5_err_msg(krb5_context context, krb5_error_code code);
+ void gssd_k5_get_default_realm(char **def_realm);
+ 
+diff --git a/utils/gssd/svcgssd_krb5.c b/utils/gssd/svcgssd_krb5.c
+index 6c34faf..1d44d34 100644
+--- a/utils/gssd/svcgssd_krb5.c
++++ b/utils/gssd/svcgssd_krb5.c
+@@ -38,6 +38,7 @@
+ 
+ #include <stdio.h>
+ #include <errno.h>
++#include <ctype.h>
+ #include <gssapi/gssapi.h>
+ #include <krb5.h>
+ 
+@@ -98,6 +99,12 @@ parse_enctypes(char *enctypes)
+ 	if (n == 0)
+ 		return ENOENT;
+ 
++	/* Skip pass any non digits */
++	while (*enctypes && isdigit(*enctypes) == 0)
++		enctypes++;
++	if (*enctypes == '\0')
++		return EINVAL;
++
+ 	/* Allocate space for enctypes array */
+ 	if ((parsed_enctypes = (int *) calloc(n, sizeof(int))) == NULL) {
+ 		return ENOMEM;
+diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
+index e80efb4..9d66225 100644
+--- a/utils/idmapd/idmapd.c
++++ b/utils/idmapd/idmapd.c
+@@ -145,7 +145,6 @@ static void svrreopen(int, short, void *);
+ static int  nfsopen(struct idmap_client *);
+ static void nfscb(int, short, void *);
+ static void nfsdcb(int, short, void *);
+-static int  validateascii(char *, u_int32_t);
+ static int  addfield(char **, ssize_t *, char *);
+ static int  getfield(char **, char *, size_t);
+ 
+@@ -642,6 +641,8 @@ out:
+ static void
+ imconv(struct idmap_client *ic, struct idmap_msg *im)
+ {
++	u_int32_t len;
++
+ 	switch (im->im_conv) {
+ 	case IDMAP_CONV_IDTONAME:
+ 		idtonameres(im);
+@@ -652,10 +653,10 @@ imconv(struct idmap_client *ic, struct idmap_msg *im)
+ 			    im->im_id, im->im_name);
+ 		break;
+ 	case IDMAP_CONV_NAMETOID:
+-		if (validateascii(im->im_name, sizeof(im->im_name)) == -1) {
+-			im->im_status |= IDMAP_STATUS_INVALIDMSG;
++		len = strnlen(im->im_name, IDMAP_NAMESZ - 1);
++		/* Check for NULL termination just to be careful */
++		if (im->im_name[len+1] != '\0')
+ 			return;
+-		}
+ 		nametoidres(im);
+ 		if (verbose > 1)
+ 			xlog_warn("%s %s: (%s) name \"%s\" -> id \"%d\"",
+@@ -855,25 +856,6 @@ nametoidres(struct idmap_msg *im)
+ }
+ 
+ static int
+-validateascii(char *string, u_int32_t len)
+-{
+-	u_int32_t i;
+-
+-	for (i = 0; i < len; i++) {
+-		if (string[i] == '\0')
+-			break;
+-
+-		if (string[i] & 0x80)
+-			return (-1);
+-	}
+-
+-	if ((i >= len) || string[i] != '\0')
+-		return (-1);
+-
+-	return (i + 1);
+-}
+-
+-static int
+ addfield(char **bpp, ssize_t *bsizp, char *fld)
+ {
+ 	char ch, *bp = *bpp;
+diff --git a/utils/mount/error.c b/utils/mount/error.c
+index 83ad1d2..f8fc13f 100644
+--- a/utils/mount/error.c
++++ b/utils/mount/error.c
+@@ -225,7 +225,7 @@ void mount_error(const char *spec, const char *mount_point, int error)
+ 	case ENOENT:
+ 		if (spec)
+ 			nfs_error(_("%s: mounting %s failed, "
+-				"reason given by server:\n  %s"),
++				"reason given by server: %s"),
+ 				progname, spec, strerror(error));
+ 		else
+ 			nfs_error(_("%s: mount point %s does not exist"),
+diff --git a/utils/mount/stropts.c b/utils/mount/stropts.c
+index 9b4197b..8ee3024 100644
+--- a/utils/mount/stropts.c
++++ b/utils/mount/stropts.c
+@@ -666,6 +666,7 @@ static int nfs_try_mount_v3v2(struct nfsmount_info *mi)
+ 		case EOPNOTSUPP:
+ 		case EHOSTUNREACH:
+ 		case ETIMEDOUT:
++		case EACCES:
+ 			continue;
+ 		default:
+ 			goto out;
+@@ -761,6 +762,7 @@ static int nfs_try_mount_v4(struct nfsmount_info *mi)
+ 		case ECONNREFUSED:
+ 		case EHOSTUNREACH:
+ 		case ETIMEDOUT:
++		case EACCES:
+ 			continue;
+ 		default:
+ 			goto out;
+diff --git a/utils/mountd/auth.c b/utils/mountd/auth.c
+index 508040a..330cab5 100644
+--- a/utils/mountd/auth.c
++++ b/utils/mountd/auth.c
+@@ -10,10 +10,12 @@
+ #include <config.h>
+ #endif
+ 
++#include <sys/types.h>
+ #include <sys/stat.h>
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ #include <errno.h>
++#include <fcntl.h>
+ #include <unistd.h>
+ 
+ #include "sockaddr.h"
+@@ -21,7 +23,6 @@
+ #include "nfslib.h"
+ #include "exportfs.h"
+ #include "mountd.h"
+-#include "xmalloc.h"
+ #include "v4root.h"
+ 
+ enum auth_error
+diff --git a/utils/mountd/cache.c b/utils/mountd/cache.c
+index e950ec6..45012be 100644
+--- a/utils/mountd/cache.c
++++ b/utils/mountd/cache.c
+@@ -29,7 +29,6 @@
+ #include "nfslib.h"
+ #include "exportfs.h"
+ #include "mountd.h"
+-#include "xmalloc.h"
+ #include "fsloc.h"
+ #include "pseudoflavors.h"
+ 
+@@ -109,12 +108,10 @@ static void auth_unix_ip(FILE *f)
+ 		struct addrinfo *ai = NULL;
+ 
+ 		ai = client_resolve(tmp->ai_addr);
+-		if (ai == NULL)
+-			goto out;
+-		client = client_compose(ai);
+-		freeaddrinfo(ai);
+-		if (!client)
+-			goto out;
++		if (ai) {
++			client = client_compose(ai);
++			freeaddrinfo(ai);
++		}
+ 	}
+ 	qword_print(f, "nfsd");
+ 	qword_print(f, ipaddr);
+@@ -127,7 +124,6 @@ static void auth_unix_ip(FILE *f)
+ 	xlog(D_CALL, "auth_unix_ip: client %p '%s'", client, client?client: "DEFAULT");
+ 
+ 	free(client);
+-out:
+ 	freeaddrinfo(tmp);
+ 
+ }
+@@ -347,6 +343,30 @@ static char *next_mnt(void **v, char *p)
+ 	return me->mnt_dir;
+ }
+ 
++static int is_subdirectory(char *child, char *parent)
++{
++	size_t l = strlen(parent);
++
++	if (strcmp(parent, "/") == 0)
++		return 1;
++
++	return strcmp(child, parent) == 0
++		|| (strncmp(child, parent, l) == 0 && child[l] == '/');
++}
++
++static int path_matches(nfs_export *exp, char *path)
++{
++	if (exp->m_export.e_flags & NFSEXP_CROSSMOUNT)
++		return is_subdirectory(path, exp->m_export.e_path);
++	return strcmp(path, exp->m_export.e_path) == 0;
++}
++
++static int
++export_matches(nfs_export *exp, char *dom, char *path, struct addrinfo *ai)
++{
++	return path_matches(exp, path) && client_matches(exp, dom, ai);
++}
++
+ /* True iff e1 is a child of e2 and e2 has crossmnt set: */
+ static bool subexport(struct exportent *e1, struct exportent *e2)
+ {
+@@ -354,8 +374,7 @@ static bool subexport(struct exportent *e1, struct exportent *e2)
+ 	size_t l2 = strlen(p2);
+ 
+ 	return e2->e_flags & NFSEXP_CROSSMOUNT
+-	       && strncmp(p1, p2, l2) == 0
+-	       && p1[l2] == '/';
++		&& is_subdirectory(p1, p2);
+ }
+ 
+ struct parsed_fsid {
+@@ -756,27 +775,6 @@ static int dump_to_cache(FILE *f, char *domain, char *path, struct exportent *ex
+ 	return qword_eol(f);
+ }
+ 
+-static int is_subdirectory(char *child, char *parent)
+-{
+-	size_t l = strlen(parent);
+-
+-	return strcmp(child, parent) == 0
+-		|| (strncmp(child, parent, l) == 0 && child[l] == '/');
+-}
+-
+-static int path_matches(nfs_export *exp, char *path)
+-{
+-	if (exp->m_export.e_flags & NFSEXP_CROSSMOUNT)
+-		return is_subdirectory(path, exp->m_export.e_path);
+-	return strcmp(path, exp->m_export.e_path) == 0;
+-}
+-
+-static int
+-export_matches(nfs_export *exp, char *dom, char *path, struct addrinfo *ai)
+-{
+-	return path_matches(exp, path) && client_matches(exp, dom, ai);
+-}
+-
+ static nfs_export *
+ lookup_export(char *dom, char *path, struct addrinfo *ai)
+ {
+@@ -830,6 +828,7 @@ lookup_export(char *dom, char *path, struct addrinfo *ai)
+ 
+ #ifdef HAVE_NFS_PLUGIN_H
+ #include <dlfcn.h>
++#include <link.h>
+ #include <nfs-plugin.h>
+ 
+ /*
+@@ -1094,6 +1093,7 @@ static struct exportent *lookup_junction(char *dom, const char *pathname,
+ 		struct addrinfo *ai)
+ {
+ 	struct exportent *exp;
++	struct link_map *map;
+ 	void *handle;
+ 
+ 	handle = dlopen("libnfsjunct.so", RTLD_NOW);
+@@ -1101,6 +1101,11 @@ static struct exportent *lookup_junction(char *dom, const char *pathname,
+ 		xlog(D_GENERAL, "%s: dlopen: %s", __func__, dlerror());
+ 		return NULL;
+ 	}
++
++	if (dlinfo(handle, RTLD_DI_LINKMAP, &map) == 0)
++		xlog(D_GENERAL, "%s: loaded plug-in %s",
++			__func__, map->l_name);
++
+ 	(void)dlerror();	/* Clear any error */
+ 
+ 	exp = invoke_junction_ops(handle, dom, pathname, ai);
+diff --git a/utils/nfsdcltrack/nfsdcltrack.c b/utils/nfsdcltrack/nfsdcltrack.c
+index 9801b9c..4334340 100644
+--- a/utils/nfsdcltrack/nfsdcltrack.c
++++ b/utils/nfsdcltrack/nfsdcltrack.c
+@@ -379,6 +379,17 @@ cltrack_legacy_gracedone(void)
+ 	while ((entry = readdir(v4recovery))) {
+ 		int len;
+ 
++		/* skip "." and ".." */
++		if (entry->d_name[0] == '.') {
++			switch (entry->d_name[1]) {
++			case '\0':
++				continue;
++			case '.':
++				if (entry->d_name[2] == '\0')
++					continue;
++			}
++		}
++
+ 		/* borrow the clientid blob for this */
+ 		len = snprintf((char *)blob, sizeof(blob), "%s/%s", dirname,
+ 				entry->d_name);
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch.1 b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch.1
new file mode 100644
index 0000000..2cda8c6
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch.1
@@ -0,0 +1,535 @@
+diff --git a/support/export/rmtab.c b/support/export/rmtab.c
+index 31c0f50..d16b3b3 100644
+--- a/support/export/rmtab.c
++++ b/support/export/rmtab.c
+@@ -1,7 +1,7 @@
+ /*
+- * support/export/rmntab.c
++ * support/export/rmtab.c
+  *
+- * Interface to the rmnt file.
++ * Interface to the rmtab file.
+  *
+  */
+ 
+@@ -12,7 +12,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <errno.h>
+-#include "xmalloc.h"
++
+ #include "misc.h"
+ #include "nfslib.h"
+ #include "exportfs.h"
+diff --git a/support/export/xtab.c b/support/export/xtab.c
+index 2a43193..e953071 100644
+--- a/support/export/xtab.c
++++ b/support/export/xtab.c
+@@ -14,7 +14,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include "xmalloc.h"
++
+ #include "nfslib.h"
+ #include "exportfs.h"
+ #include "xio.h"
+diff --git a/support/nfs/cacheio.c b/support/nfs/cacheio.c
+index e641c45..61e07a8 100644
+--- a/support/nfs/cacheio.c
++++ b/support/nfs/cacheio.c
+@@ -162,11 +162,16 @@ int qword_eol(FILE *f)
+ {
+ 	int err;
+ 
+-	fprintf(f,"\n");
+-	err = fflush(f);
+-	if (err) {
+-		xlog_warn("qword_eol: fflush failed: errno %d (%s)",
++	err = fprintf(f,"\n");
++	if (err < 0) {
++		xlog_warn("qword_eol: fprintf failed: errno %d (%s)",
+ 			    errno, strerror(errno));
++	} else {
++		err = fflush(f);
++		if (err) {
++			xlog_warn("qword_eol: fflush failed: errno %d (%s)",
++				  errno, strerror(errno));
++		}
+ 	}
+ 	/*
+ 	 * We must send one line (and one line only) in a single write
+diff --git a/utils/gssd/gssd_proc.c b/utils/gssd/gssd_proc.c
+index ec251fa..d01ba2f 100644
+--- a/utils/gssd/gssd_proc.c
++++ b/utils/gssd/gssd_proc.c
+@@ -52,6 +52,7 @@
+ #include <sys/socket.h>
+ #include <arpa/inet.h>
+ #include <sys/fsuid.h>
++#include <sys/resource.h>
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -250,21 +251,10 @@ read_service_info(char *info_file_name, char **servicename, char **servername,
+ 	if ((p = strstr(buf, "port")) != NULL)
+ 		sscanf(p, "port: %127s\n", port);
+ 
+-	/* check service, program, and version */
+-	if (memcmp(service, "nfs", 3) != 0)
+-		return -1;
++	/* get program, and version numbers */
+ 	*prog = atoi(program + 1); /* skip open paren */
+ 	*vers = atoi(version);
+ 
+-	if (strlen(service) == 3 ) {
+-		if ((*prog != 100003) || ((*vers != 2) && (*vers != 3) &&
+-		    (*vers != 4)))
+-			goto fail;
+-	} else if (memcmp(service, "nfs4_cb", 7) == 0) {
+-		if (*vers != 1)
+-			goto fail;
+-	}
+-
+ 	if (!addrstr_to_sockaddr(addr, address, port))
+ 		goto fail;
+ 
+@@ -398,10 +388,10 @@ process_clnt_dir_files(struct clnt_info * clp)
+ static int
+ get_poll_index(int *ind)
+ {
+-	int i;
++	unsigned int i;
+ 
+ 	*ind = -1;
+-	for (i=0; i<FD_ALLOC_BLOCK; i++) {
++	for (i=0; i<pollsize; i++) {
+ 		if (pollarray[i].events == 0) {
+ 			*ind = i;
+ 			break;
+@@ -483,9 +473,13 @@ fail_keep_client:
+ void
+ init_client_list(void)
+ {
++	struct rlimit rlim;
+ 	TAILQ_INIT(&clnt_list);
+ 	/* Eventually plan to grow/shrink poll array: */
+ 	pollsize = FD_ALLOC_BLOCK;
++	if (getrlimit(RLIMIT_NOFILE, &rlim) < 0 &&
++	    rlim.rlim_cur != RLIM_INFINITY)
++		pollsize = rlim.rlim_cur;
+ 	pollarray = calloc(pollsize, sizeof(struct pollfd));
+ }
+ 
+@@ -567,9 +561,8 @@ process_pipedir(char *pipe_name)
+ 
+ 	update_old_clients(namelist, j, pipe_name);
+ 	for (i=0; i < j; i++) {
+-		if (i < FD_ALLOC_BLOCK
+-				&& !strncmp(namelist[i]->d_name, "clnt", 4)
+-				&& !find_client(namelist[i]->d_name, pipe_name))
++		if (!strncmp(namelist[i]->d_name, "clnt", 4)
++		    && !find_client(namelist[i]->d_name, pipe_name))
+ 			process_clnt_dir(namelist[i]->d_name, pipe_name);
+ 		free(namelist[i]);
+ 	}
+@@ -962,12 +955,6 @@ process_krb5_upcall(struct clnt_info *clp, uid_t uid, int fd, char *tgtname,
+ 
+ 	printerr(1, "handling krb5 upcall (%s)\n", clp->dirname);
+ 
+-	if (tgtname) {
+-		if (clp->servicename) {
+-			free(clp->servicename);
+-			clp->servicename = strdup(tgtname);
+-		}
+-	}
+ 	token.length = 0;
+ 	token.value = NULL;
+ 	memset(&pd, 0, sizeof(struct authgss_private_data));
+@@ -1016,7 +1003,8 @@ process_krb5_upcall(struct clnt_info *clp, uid_t uid, int fd, char *tgtname,
+ 			int success = 0;
+ 			do {
+ 				gssd_refresh_krb5_machine_credential(clp->servername,
+-								     NULL, service);
++								     NULL, service,
++								     tgtname);
+ 				/*
+ 				 * Get a list of credential cache names and try each
+ 				 * of them until one works or we've tried them all
+diff --git a/utils/gssd/krb5_util.c b/utils/gssd/krb5_util.c
+index 60ba594..aeb8f70 100644
+--- a/utils/gssd/krb5_util.c
++++ b/utils/gssd/krb5_util.c
+@@ -774,12 +774,16 @@ gssd_search_krb5_keytab(krb5_context context, krb5_keytab kt,
+ }
+ 
+ /*
+- * Find a keytab entry to use for a given target hostname.
++ * Find a keytab entry to use for a given target realm.
+  * Tries to find the most appropriate keytab to use given the
+  * name of the host we are trying to connect with.
++ *
++ * Note: the tgtname contains a hostname in the realm that we
++ * are authenticating to. It may, or may not be the same as
++ * the server hostname.
+  */
+ static int
+-find_keytab_entry(krb5_context context, krb5_keytab kt, const char *hostname,
++find_keytab_entry(krb5_context context, krb5_keytab kt, const char *tgtname,
+ 		  krb5_keytab_entry *kte, const char **svcnames)
+ {
+ 	krb5_error_code code;
+@@ -795,7 +799,7 @@ find_keytab_entry(krb5_context context, krb5_keytab kt, const char *hostname,
+ 
+ 
+ 	/* Get full target hostname */
+-	retval = get_full_hostname(hostname, targethostname,
++	retval = get_full_hostname(tgtname, targethostname,
+ 				   sizeof(targethostname));
+ 	if (retval)
+ 		goto out;
+@@ -1128,7 +1132,7 @@ gssd_get_krb5_machine_cred_list(char ***list)
+ 		if (ple->ccname) {
+ 			/* Make sure cred is up-to-date before returning it */
+ 			retval = gssd_refresh_krb5_machine_credential(NULL, ple,
+-				NULL);
++				NULL, NULL);
+ 			if (retval)
+ 				continue;
+ 			if (i + 1 > listsize) {
+@@ -1219,7 +1223,8 @@ gssd_destroy_krb5_machine_creds(void)
+ int
+ gssd_refresh_krb5_machine_credential(char *hostname,
+ 				     struct gssd_k5_kt_princ *ple, 
+-					 char *service)
++					 char *service,
++					 char *tgtname)
+ {
+ 	krb5_error_code code = 0;
+ 	krb5_context context;
+@@ -1258,7 +1263,10 @@ gssd_refresh_krb5_machine_credential(char *hostname,
+ 	if (ple == NULL) {
+ 		krb5_keytab_entry kte;
+ 
+-		code = find_keytab_entry(context, kt, hostname, &kte, svcnames);
++		if (tgtname == NULL)
++			tgtname = hostname;
++
++		code = find_keytab_entry(context, kt, tgtname, &kte, svcnames);
+ 		if (code) {
+ 			printerr(0, "ERROR: %s: no usable keytab entry found "
+ 				 "in keytab %s for connection with host %s\n",
+diff --git a/utils/gssd/krb5_util.h b/utils/gssd/krb5_util.h
+index cd6e107..9f41625 100644
+--- a/utils/gssd/krb5_util.h
++++ b/utils/gssd/krb5_util.h
+@@ -31,7 +31,8 @@ void gssd_setup_krb5_machine_gss_ccache(char *servername);
+ void gssd_destroy_krb5_machine_creds(void);
+ int  gssd_refresh_krb5_machine_credential(char *hostname,
+ 					  struct gssd_k5_kt_princ *ple, 
+-					  char *service);
++					  char *service,
++					  char *tgtname);
+ char *gssd_k5_err_msg(krb5_context context, krb5_error_code code);
+ void gssd_k5_get_default_realm(char **def_realm);
+ 
+diff --git a/utils/gssd/svcgssd_krb5.c b/utils/gssd/svcgssd_krb5.c
+index 6c34faf..1d44d34 100644
+--- a/utils/gssd/svcgssd_krb5.c
++++ b/utils/gssd/svcgssd_krb5.c
+@@ -38,6 +38,7 @@
+ 
+ #include <stdio.h>
+ #include <errno.h>
++#include <ctype.h>
+ #include <gssapi/gssapi.h>
+ #include <krb5.h>
+ 
+@@ -98,6 +99,12 @@ parse_enctypes(char *enctypes)
+ 	if (n == 0)
+ 		return ENOENT;
+ 
++	/* Skip pass any non digits */
++	while (*enctypes && isdigit(*enctypes) == 0)
++		enctypes++;
++	if (*enctypes == '\0')
++		return EINVAL;
++
+ 	/* Allocate space for enctypes array */
+ 	if ((parsed_enctypes = (int *) calloc(n, sizeof(int))) == NULL) {
+ 		return ENOMEM;
+diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
+index e80efb4..9d66225 100644
+--- a/utils/idmapd/idmapd.c
++++ b/utils/idmapd/idmapd.c
+@@ -145,7 +145,6 @@ static void svrreopen(int, short, void *);
+ static int  nfsopen(struct idmap_client *);
+ static void nfscb(int, short, void *);
+ static void nfsdcb(int, short, void *);
+-static int  validateascii(char *, u_int32_t);
+ static int  addfield(char **, ssize_t *, char *);
+ static int  getfield(char **, char *, size_t);
+ 
+@@ -642,6 +641,8 @@ out:
+ static void
+ imconv(struct idmap_client *ic, struct idmap_msg *im)
+ {
++	u_int32_t len;
++
+ 	switch (im->im_conv) {
+ 	case IDMAP_CONV_IDTONAME:
+ 		idtonameres(im);
+@@ -652,10 +653,10 @@ imconv(struct idmap_client *ic, struct idmap_msg *im)
+ 			    im->im_id, im->im_name);
+ 		break;
+ 	case IDMAP_CONV_NAMETOID:
+-		if (validateascii(im->im_name, sizeof(im->im_name)) == -1) {
+-			im->im_status |= IDMAP_STATUS_INVALIDMSG;
++		len = strnlen(im->im_name, IDMAP_NAMESZ - 1);
++		/* Check for NULL termination just to be careful */
++		if (im->im_name[len+1] != '\0')
+ 			return;
+-		}
+ 		nametoidres(im);
+ 		if (verbose > 1)
+ 			xlog_warn("%s %s: (%s) name \"%s\" -> id \"%d\"",
+@@ -855,25 +856,6 @@ nametoidres(struct idmap_msg *im)
+ }
+ 
+ static int
+-validateascii(char *string, u_int32_t len)
+-{
+-	u_int32_t i;
+-
+-	for (i = 0; i < len; i++) {
+-		if (string[i] == '\0')
+-			break;
+-
+-		if (string[i] & 0x80)
+-			return (-1);
+-	}
+-
+-	if ((i >= len) || string[i] != '\0')
+-		return (-1);
+-
+-	return (i + 1);
+-}
+-
+-static int
+ addfield(char **bpp, ssize_t *bsizp, char *fld)
+ {
+ 	char ch, *bp = *bpp;
+diff --git a/utils/mount/error.c b/utils/mount/error.c
+index 83ad1d2..f8fc13f 100644
+--- a/utils/mount/error.c
++++ b/utils/mount/error.c
+@@ -225,7 +225,7 @@ void mount_error(const char *spec, const char *mount_point, int error)
+ 	case ENOENT:
+ 		if (spec)
+ 			nfs_error(_("%s: mounting %s failed, "
+-				"reason given by server:\n  %s"),
++				"reason given by server: %s"),
+ 				progname, spec, strerror(error));
+ 		else
+ 			nfs_error(_("%s: mount point %s does not exist"),
+diff --git a/utils/mount/stropts.c b/utils/mount/stropts.c
+index 9b4197b..8ee3024 100644
+--- a/utils/mount/stropts.c
++++ b/utils/mount/stropts.c
+@@ -666,6 +666,7 @@ static int nfs_try_mount_v3v2(struct nfsmount_info *mi)
+ 		case EOPNOTSUPP:
+ 		case EHOSTUNREACH:
+ 		case ETIMEDOUT:
++		case EACCES:
+ 			continue;
+ 		default:
+ 			goto out;
+@@ -761,6 +762,7 @@ static int nfs_try_mount_v4(struct nfsmount_info *mi)
+ 		case ECONNREFUSED:
+ 		case EHOSTUNREACH:
+ 		case ETIMEDOUT:
++		case EACCES:
+ 			continue;
+ 		default:
+ 			goto out;
+diff --git a/utils/mountd/auth.c b/utils/mountd/auth.c
+index 508040a..330cab5 100644
+--- a/utils/mountd/auth.c
++++ b/utils/mountd/auth.c
+@@ -10,10 +10,12 @@
+ #include <config.h>
+ #endif
+ 
++#include <sys/types.h>
+ #include <sys/stat.h>
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ #include <errno.h>
++#include <fcntl.h>
+ #include <unistd.h>
+ 
+ #include "sockaddr.h"
+@@ -21,7 +23,6 @@
+ #include "nfslib.h"
+ #include "exportfs.h"
+ #include "mountd.h"
+-#include "xmalloc.h"
+ #include "v4root.h"
+ 
+ enum auth_error
+diff --git a/utils/mountd/cache.c b/utils/mountd/cache.c
+index e950ec6..45012be 100644
+--- a/utils/mountd/cache.c
++++ b/utils/mountd/cache.c
+@@ -29,7 +29,6 @@
+ #include "nfslib.h"
+ #include "exportfs.h"
+ #include "mountd.h"
+-#include "xmalloc.h"
+ #include "fsloc.h"
+ #include "pseudoflavors.h"
+ 
+@@ -109,12 +108,10 @@ static void auth_unix_ip(FILE *f)
+ 		struct addrinfo *ai = NULL;
+ 
+ 		ai = client_resolve(tmp->ai_addr);
+-		if (ai == NULL)
+-			goto out;
+-		client = client_compose(ai);
+-		freeaddrinfo(ai);
+-		if (!client)
+-			goto out;
++		if (ai) {
++			client = client_compose(ai);
++			freeaddrinfo(ai);
++		}
+ 	}
+ 	qword_print(f, "nfsd");
+ 	qword_print(f, ipaddr);
+@@ -127,7 +124,6 @@ static void auth_unix_ip(FILE *f)
+ 	xlog(D_CALL, "auth_unix_ip: client %p '%s'", client, client?client: "DEFAULT");
+ 
+ 	free(client);
+-out:
+ 	freeaddrinfo(tmp);
+ 
+ }
+@@ -347,6 +343,30 @@ static char *next_mnt(void **v, char *p)
+ 	return me->mnt_dir;
+ }
+ 
++static int is_subdirectory(char *child, char *parent)
++{
++	size_t l = strlen(parent);
++
++	if (strcmp(parent, "/") == 0)
++		return 1;
++
++	return strcmp(child, parent) == 0
++		|| (strncmp(child, parent, l) == 0 && child[l] == '/');
++}
++
++static int path_matches(nfs_export *exp, char *path)
++{
++	if (exp->m_export.e_flags & NFSEXP_CROSSMOUNT)
++		return is_subdirectory(path, exp->m_export.e_path);
++	return strcmp(path, exp->m_export.e_path) == 0;
++}
++
++static int
++export_matches(nfs_export *exp, char *dom, char *path, struct addrinfo *ai)
++{
++	return path_matches(exp, path) && client_matches(exp, dom, ai);
++}
++
+ /* True iff e1 is a child of e2 and e2 has crossmnt set: */
+ static bool subexport(struct exportent *e1, struct exportent *e2)
+ {
+@@ -354,8 +374,7 @@ static bool subexport(struct exportent *e1, struct exportent *e2)
+ 	size_t l2 = strlen(p2);
+ 
+ 	return e2->e_flags & NFSEXP_CROSSMOUNT
+-	       && strncmp(p1, p2, l2) == 0
+-	       && p1[l2] == '/';
++		&& is_subdirectory(p1, p2);
+ }
+ 
+ struct parsed_fsid {
+@@ -756,27 +775,6 @@ static int dump_to_cache(FILE *f, char *domain, char *path, struct exportent *ex
+ 	return qword_eol(f);
+ }
+ 
+-static int is_subdirectory(char *child, char *parent)
+-{
+-	size_t l = strlen(parent);
+-
+-	return strcmp(child, parent) == 0
+-		|| (strncmp(child, parent, l) == 0 && child[l] == '/');
+-}
+-
+-static int path_matches(nfs_export *exp, char *path)
+-{
+-	if (exp->m_export.e_flags & NFSEXP_CROSSMOUNT)
+-		return is_subdirectory(path, exp->m_export.e_path);
+-	return strcmp(path, exp->m_export.e_path) == 0;
+-}
+-
+-static int
+-export_matches(nfs_export *exp, char *dom, char *path, struct addrinfo *ai)
+-{
+-	return path_matches(exp, path) && client_matches(exp, dom, ai);
+-}
+-
+ static nfs_export *
+ lookup_export(char *dom, char *path, struct addrinfo *ai)
+ {
+@@ -830,6 +828,7 @@ lookup_export(char *dom, char *path, struct addrinfo *ai)
+ 
+ #ifdef HAVE_NFS_PLUGIN_H
+ #include <dlfcn.h>
++#include <link.h>
+ #include <nfs-plugin.h>
+ 
+ /*
+@@ -1094,6 +1093,7 @@ static struct exportent *lookup_junction(char *dom, const char *pathname,
+ 		struct addrinfo *ai)
+ {
+ 	struct exportent *exp;
++	struct link_map *map;
+ 	void *handle;
+ 
+ 	handle = dlopen("libnfsjunct.so", RTLD_NOW);
+@@ -1101,6 +1101,11 @@ static struct exportent *lookup_junction(char *dom, const char *pathname,
+ 		xlog(D_GENERAL, "%s: dlopen: %s", __func__, dlerror());
+ 		return NULL;
+ 	}
++
++	if (dlinfo(handle, RTLD_DI_LINKMAP, &map) == 0)
++		xlog(D_GENERAL, "%s: loaded plug-in %s",
++			__func__, map->l_name);
++
+ 	(void)dlerror();	/* Clear any error */
+ 
+ 	exp = invoke_junction_ops(handle, dom, pathname, ai);
+diff --git a/utils/nfsdcltrack/nfsdcltrack.c b/utils/nfsdcltrack/nfsdcltrack.c
+index 9801b9c..4334340 100644
+--- a/utils/nfsdcltrack/nfsdcltrack.c
++++ b/utils/nfsdcltrack/nfsdcltrack.c
+@@ -379,6 +379,17 @@ cltrack_legacy_gracedone(void)
+ 	while ((entry = readdir(v4recovery))) {
+ 		int len;
+ 
++		/* skip "." and ".." */
++		if (entry->d_name[0] == '.') {
++			switch (entry->d_name[1]) {
++			case '\0':
++				continue;
++			case '.':
++				if (entry->d_name[2] == '\0')
++					continue;
++			}
++		}
++
+ 		/* borrow the clientid blob for this */
+ 		len = snprintf((char *)blob, sizeof(blob), "%s/%s", dirname,
+ 				entry->d_name);
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb
similarity index 63%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb
index 84b8e76..0fa7989 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb
@@ -4,24 +4,26 @@ NFS server and related tools."
 HOMEPAGE = "http://nfs.sourceforge.net/"
 SECTION = "console/network"
 
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+LICENSE = "MIT & GPLv2+ & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
-DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers"
+DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers sqlite3"
 RDEPENDS_${PN} = "rpcbind"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
-PR = "r5"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.bz2 \
+           file://nfs-utils.1.2.8.rc2.patch \
            file://nfs-utils-1.0.6-uclibc.patch \
            file://nfs-utils-1.2.3-uclibc-libio.h.patch \
-           file://nfs-utils-nfsctl-x32-fix.patch \
+           file://nfs-utils-1.2.1-exp-subtree-warn-off.patch \
+           file://nfs-utils-1.2.3-sm-notify-res_init.patch \
+           file://nfs-utils-1.2.5-idmap-errmsg.patch \
+           file://nfs-utils-1.2.1-statdpath-man.patch \
            file://nfsserver"
 
-SRC_URI[md5sum] = "1131dc5f27c4f3905a6e7ee0d594fd4d"
-SRC_URI[sha256sum] = "5575ece941097cbfa67fbe0d220dfa11b73f5e6d991e7939c9339bd72259ff19"
+SRC_URI[md5sum] = "3b5ca797197765dc0c3a4122720c7716"
+SRC_URI[sha256sum] = "7ef8e0a8b22cd7ff33f3afd28e770d45643fae303468a180640c2967833fe75e"
 
 PARALLEL_MAKE = ""
 
@@ -38,11 +40,15 @@ inherit autotools update-rc.d
 
 # --enable-uuid is need for cross-compiling
 EXTRA_OECONF = "--with-statduser=nobody \
-                --enable-nfsv41 \
+                --enable-mountconfig \
+                --enable-libmount-mount \
+                --disable-nfsv41 \
                 --enable-uuid \
                 --disable-gss \
                 --disable-tirpc \
-                --with-statedir=/var/lib/nfs"
+                --disable-nfsdcltrack \
+                --with-statdpath=/var/lib/nfs/statd \
+               "
 
 INHIBIT_AUTO_STAGE = "1"
 
-- 
1.7.9.5



