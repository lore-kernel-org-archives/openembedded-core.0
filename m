Received: from mail-oa0-f48.google.com ([209.85.219.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TxWHN-0004JF-6i
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 06:20:14 +0100
Received: by mail-oa0-f48.google.com with SMTP id h2so6702378oag.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 21:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=sGR+CjV9ZdzI3Po475uVdxjeEkZk5WZ+wcqQtOv9vKg=;
	b=kj/B5TuYaMp9yvaWom2qzmwJbwAY/LJQ9Wt95dsYdEefReI5+2al3f83Y4t1T/m+s9
	o/zc+7HQJefFtPGNqAb3yg3XkKTCUKJ3UW+amYdhyplJ467XlygC2MqxOWpcVrAGd2EB
	gnf/BvHx/1DcM8qmgUMweZnTGbATe2l18PLxKBSG4X+vm58P/GCbO8JAna9XloYMLfJ8
	MaUOQy7LQfNrSFFroV1lm1bqfj5WzuPkKKUT6NunSWu2S6qYj0uQlTgU59gQO9r0plNO
	7FJlYY4nSGBoNndkpbdiMgrv8F4dhm/aVcUS33Mw0x0IU/MLEWLFHXF9kRLChMai2F4O
	orjw==
X-Received: by 10.60.169.133 with SMTP id ae5mr15518408oec.74.1358831081440;
	Mon, 21 Jan 2013 21:04:41 -0800 (PST)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id zz6sm12729989oeb.1.2013.01.21.21.04.40
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 21:04:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 21:04:26 -0800
Message-Id: <e9f39209e9fdf88a6205eb59b482c830eda83aa6.1358830857.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1358830857.git.raj.khem@gmail.com>
References: <cover.1358830857.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] nfs-utils: Upgrade 1.2.3 -> 1.2.8-rc3
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
X-List-Received-Date: Tue, 22 Jan 2013 05:20:17 -0000
X-List-Received-Date: Tue, 22 Jan 2013 05:20:17 -0000

Disable nfsv4l since it needs LVM2 which
is not available in OE-Core

Disable nfsdcltrack since its configure time check
for sqlite3 is not cross compiling safe

It can support ipv6 but thats disabled since
we disable libtirpc which is needed for ipv6
support in nfs-utils

Patches imported from fedora to take us to 1.2.8-rc3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         |   39 +-
 .../nfs-utils-1.2.3-sm-notify-res_init.patch       |   36 ++
 .../nfs-utils/nfs-utils-nfsctl-x32-fix.patch       |   30 -
 .../nfs-utils/nfs-utils/nfs-utils.1.2.8.rc3.patch  |  599 ++++++++++++++++++++
 .../{nfs-utils_1.2.3.bb => nfs-utils_1.2.7.bb}     |   25 +-
 5 files changed, 671 insertions(+), 58 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-nfsctl-x32-fix.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc3.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.2.3.bb => nfs-utils_1.2.7.bb} (67%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
index 6d46d3a..c344238 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
@@ -1,22 +1,27 @@
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
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
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
new file mode 100644
index 0000000..d8f8181
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
@@ -0,0 +1,36 @@
+Fixes errors like
+sm-notify[1070]: DNS resolution of a.b.c.d..com failed; retrying later
+This error will occur anytime sm-notify is run before the network if fully up,
+which is happening more and more with parallel startup systems.
+The res_init() call is simple, safe, quick, and a patch to use it should be
+able to go upstream.  Presumably the whole reason sm-notify tries several
+times is to wait for possible changes to the network configuration, but without
+calling res_init() it will never be aware of those changes
+
+Backported drom Fedora
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
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
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc3.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc3.patch
new file mode 100644
index 0000000..0411b47
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc3.patch
@@ -0,0 +1,599 @@
+Backported from Fedora
+
+This is a cumulative fixes patch between 1.2.7 and 1.2.8 latest rc
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
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
+index e80efb4..beba9c4 100644
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
+@@ -425,7 +424,8 @@ dirscancb(int UNUSED(fd), short UNUSED(which), void *data)
+ 			    pipefsdir, ents[i]->d_name);
+ 
+ 			if ((ic->ic_dirfd = open(path, O_RDONLY, 0)) == -1) {
+-				xlog_warn("dirscancb: open(%s): %s", path, strerror(errno));
++				if (verbose > 0)
++					xlog_warn("dirscancb: open(%s): %s", path, strerror(errno));
+ 				free(ic);
+ 				goto out;
+ 			}
+@@ -642,6 +642,8 @@ out:
+ static void
+ imconv(struct idmap_client *ic, struct idmap_msg *im)
+ {
++	u_int32_t len;
++
+ 	switch (im->im_conv) {
+ 	case IDMAP_CONV_IDTONAME:
+ 		idtonameres(im);
+@@ -652,10 +654,10 @@ imconv(struct idmap_client *ic, struct idmap_msg *im)
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
+@@ -855,25 +857,6 @@ nametoidres(struct idmap_msg *im)
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
+diff --git a/utils/statd/rmtcall.c b/utils/statd/rmtcall.c
+index 4ecb03c..fd576d9 100644
+--- a/utils/statd/rmtcall.c
++++ b/utils/statd/rmtcall.c
+@@ -68,21 +68,19 @@ statd_get_socket(void)
+ {
+ 	struct sockaddr_in	sin;
+ 	struct servent *se;
+-	int loopcnt = 100;
++	const int loopcnt = 100;
++	int i, tmp_sockets[loopcnt];
+ 
+ 	if (sockfd >= 0)
+ 		return sockfd;
+ 
+-	while (loopcnt-- > 0) {
+-
+-		if (sockfd >= 0) close(sockfd);
++	for (i = 0; i < loopcnt; ++i) {
+ 
+ 		if ((sockfd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0) {
+ 			xlog(L_ERROR, "%s: Can't create socket: %m", __func__);
+-			return -1;
++			break;
+ 		}
+ 
+-
+ 		memset(&sin, 0, sizeof(sin));
+ 		sin.sin_family = AF_INET;
+ 		sin.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+@@ -96,7 +94,16 @@ statd_get_socket(void)
+ 		if (se == NULL)
+ 			break;
+ 		/* rather not use that port, try again */
++
++		tmp_sockets[i] = sockfd;
+ 	}
++
++	while (--i >= 0)
++		close(tmp_sockets[i]);
++
++	if (sockfd < 0)
++		return -1;
++
+ 	FD_SET(sockfd, &SVC_FDSET);
+ 	return sockfd;
+ }
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb
similarity index 67%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb
index 84b8e76..5bad6f1 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb
@@ -4,24 +4,23 @@ NFS server and related tools."
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
+           file://nfs-utils.1.2.8.rc3.patch \
            file://nfs-utils-1.0.6-uclibc.patch \
            file://nfs-utils-1.2.3-uclibc-libio.h.patch \
-           file://nfs-utils-nfsctl-x32-fix.patch \
+           file://nfs-utils-1.2.3-sm-notify-res_init.patch \
            file://nfsserver"
 
-SRC_URI[md5sum] = "1131dc5f27c4f3905a6e7ee0d594fd4d"
-SRC_URI[sha256sum] = "5575ece941097cbfa67fbe0d220dfa11b73f5e6d991e7939c9339bd72259ff19"
+SRC_URI[md5sum] = "3b5ca797197765dc0c3a4122720c7716"
+SRC_URI[sha256sum] = "7ef8e0a8b22cd7ff33f3afd28e770d45643fae303468a180640c2967833fe75e"
 
 PARALLEL_MAKE = ""
 
@@ -38,11 +37,15 @@ inherit autotools update-rc.d
 
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



