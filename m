Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B57BD6BC92
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 14:35:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0NEZtpL003498
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 06:35:55 -0800 (PST)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 23 Jan 2014 06:35:55 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 08:32:41 -0600
Message-ID: <1390487566-13569-2-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1390487566-13569-1-git-send-email-jason.wessel@windriver.com>
References: <1390487566-13569-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/6] unfs3: Add a NFSv3 user mode server for use with runqemu
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
X-List-Received-Date: Thu, 23 Jan 2014 14:35:55 -0000
Content-Type: text/plain

The user mode nfs server allows the use of runqemu without any root
privileges and may even be accelerated with kvm.

Example:

runqemu-extract-sdk tmp-eglibc/deploy/images/qemux86-64/core-image-minimal-qemux86-64.tar.bz2 rootfs

runqemu qemux86-64 `pwd`/rootfs nographic slirp kvm

[YOCTO #5639]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/files/common-licenses/unfs3                   |   24 +++
 .../unfs3/unfs3/alternate_rpc_ports.patch          |  158 ++++++++++++++++++++
 .../unfs3/unfs3/fix_compile_warning.patch          |   25 ++++
 .../fix_pid_race_parent_writes_child_pid.patch     |   61 ++++++++
 .../unfs3/unfs3/fix_warnings.patch                 |   53 +++++++
 .../unfs3/unfs3/relative_max_socket_path_len.patch |   74 +++++++++
 .../unfs3/unfs3/rename_fh_cache.patch              |   64 ++++++++
 .../unfs3/unfs3/tcp_no_delay.patch                 |   56 +++++++
 .../unfs3/unfs3/unfs3_parallel_build.patch         |   36 +++++
 meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb   |   44 ++++++
 10 files changed, 595 insertions(+)
 create mode 100644 meta/files/common-licenses/unfs3
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb

diff --git a/meta/files/common-licenses/unfs3 b/meta/files/common-licenses/unfs3
new file mode 100644
index 0000000..7f2b53f
--- /dev/null
+++ b/meta/files/common-licenses/unfs3
@@ -0,0 +1,24 @@
+UNFS3 user-space NFSv3 server
+(C) 2003, Pascal Schmidt <unfs3-server@ewetel.net>
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions are met:
+
+1. Redistributions of source code must retain the above copyright notice,
+   this list of conditions and the following disclaimer.
+2. Redistributions in binary form must reproduce the above copyright notice,
+   this list of conditions and the following disclaimer in the documentation
+   and/or other materials provided with the distribution.
+3. The name of the author may not be used to endorse or promote products
+   derived from this software without specific prior written permission.
+
+THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
+WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
+EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
+OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
+WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
+OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
+ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch b/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
new file mode 100644
index 0000000..029582e
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
@@ -0,0 +1,158 @@
+Add ability to specify rcp port numbers
+
+In order to run more than one unfs server on a host system, you must
+be able to specify alternate rpc port numbers.
+
+Jason Wessel <jason.wessel@windriver.com>
+
+Upstream-Status: Pending
+
+---
+ daemon.c |   44 +++++++++++++++++++++++++++++++-------------
+ mount.c  |    4 ++--
+ 2 files changed, 33 insertions(+), 15 deletions(-)
+
+--- a/daemon.c
++++ b/daemon.c
+@@ -78,6 +78,8 @@ int opt_testconfig = FALSE;
+ struct in_addr opt_bind_addr;
+ int opt_readable_executables = FALSE;
+ char *opt_pid_file = NULL;
++int nfs_prog = NFS3_PROGRAM;
++int mount_prog = MOUNTPROG;
+ 
+ /* Register with portmapper? */
+ int opt_portmapper = TRUE;
+@@ -206,7 +208,7 @@ static void parse_options(int argc, char
+ {
+ 
+     int opt = 0;
+-    char *optstring = "bcC:de:hl:m:n:prstTuwi:";
++    char *optstring = "bcC:de:hl:m:n:prstTuwi:x:y:";
+ 
+     while (opt != -1) {
+ 	opt = getopt(argc, argv, optstring);
+@@ -261,8 +263,24 @@ static void parse_options(int argc, char
+ 		printf
+ 		    ("\t-r          report unreadable executables as readable\n");
+ 		printf("\t-T          test exports file and exit\n");
++		printf("\t-x <port>   alternate NFS RPC port\n");
++		printf("\t-y <port>   alternate MOUNTD RPC port\n");
+ 		exit(0);
+ 		break;
++	    case 'x':
++		nfs_prog = strtol(optarg, NULL, 10);
++		if (nfs_prog == 0) {
++		    fprintf(stderr, "Invalid NFS RPC port\n");
++		    exit(1);
++		}
++		break;
++	    case 'y':
++		mount_prog = strtol(optarg, NULL, 10);
++		if (mount_prog == 0) {
++		    fprintf(stderr, "Invalid MOUNTD RPC port\n");
++		    exit(1);
++		}
++		break;
+ 	    case 'l':
+ 		opt_bind_addr.s_addr = inet_addr(optarg);
+ 		if (opt_bind_addr.s_addr == (unsigned) -1) {
+@@ -347,12 +365,12 @@ void daemon_exit(int error)
+ #endif				       /* WIN32 */
+ 
+     if (opt_portmapper) {
+-	svc_unregister(MOUNTPROG, MOUNTVERS1);
+-	svc_unregister(MOUNTPROG, MOUNTVERS3);
++	svc_unregister(mount_prog, MOUNTVERS1);
++	svc_unregister(mount_prog, MOUNTVERS3);
+     }
+ 
+     if (opt_portmapper) {
+-	svc_unregister(NFS3_PROGRAM, NFS_V3);
++	svc_unregister(nfs_prog, NFS_V3);
+     }
+ 
+     if (error == SIGSEGV)
+@@ -657,13 +675,13 @@ static void mountprog_3(struct svc_req *
+ static void register_nfs_service(SVCXPRT * udptransp, SVCXPRT * tcptransp)
+ {
+     if (opt_portmapper) {
+-	pmap_unset(NFS3_PROGRAM, NFS_V3);
++	pmap_unset(nfs_prog, NFS_V3);
+     }
+ 
+     if (udptransp != NULL) {
+ 	/* Register NFS service for UDP */
+ 	if (!svc_register
+-	    (udptransp, NFS3_PROGRAM, NFS_V3, nfs3_program_3,
++	    (udptransp, nfs_prog, NFS_V3, nfs3_program_3,
+ 	     opt_portmapper ? IPPROTO_UDP : 0)) {
+ 	    fprintf(stderr, "%s\n",
+ 		    "unable to register (NFS3_PROGRAM, NFS_V3, udp).");
+@@ -674,7 +692,7 @@ static void register_nfs_service(SVCXPRT
+     if (tcptransp != NULL) {
+ 	/* Register NFS service for TCP */
+ 	if (!svc_register
+-	    (tcptransp, NFS3_PROGRAM, NFS_V3, nfs3_program_3,
++	    (tcptransp, nfs_prog, NFS_V3, nfs3_program_3,
+ 	     opt_portmapper ? IPPROTO_TCP : 0)) {
+ 	    fprintf(stderr, "%s\n",
+ 		    "unable to register (NFS3_PROGRAM, NFS_V3, tcp).");
+@@ -686,14 +704,14 @@ static void register_nfs_service(SVCXPRT
+ static void register_mount_service(SVCXPRT * udptransp, SVCXPRT * tcptransp)
+ {
+     if (opt_portmapper) {
+-	pmap_unset(MOUNTPROG, MOUNTVERS1);
+-	pmap_unset(MOUNTPROG, MOUNTVERS3);
++	pmap_unset(mount_prog, MOUNTVERS1);
++	pmap_unset(mount_prog, MOUNTVERS3);
+     }
+ 
+     if (udptransp != NULL) {
+ 	/* Register MOUNT service (v1) for UDP */
+ 	if (!svc_register
+-	    (udptransp, MOUNTPROG, MOUNTVERS1, mountprog_3,
++	    (udptransp, mount_prog, MOUNTVERS1, mountprog_3,
+ 	     opt_portmapper ? IPPROTO_UDP : 0)) {
+ 	    fprintf(stderr, "%s\n",
+ 		    "unable to register (MOUNTPROG, MOUNTVERS1, udp).");
+@@ -702,7 +720,7 @@ static void register_mount_service(SVCXP
+ 
+ 	/* Register MOUNT service (v3) for UDP */
+ 	if (!svc_register
+-	    (udptransp, MOUNTPROG, MOUNTVERS3, mountprog_3,
++	    (udptransp, mount_prog, MOUNTVERS3, mountprog_3,
+ 	     opt_portmapper ? IPPROTO_UDP : 0)) {
+ 	    fprintf(stderr, "%s\n",
+ 		    "unable to register (MOUNTPROG, MOUNTVERS3, udp).");
+@@ -713,7 +731,7 @@ static void register_mount_service(SVCXP
+     if (tcptransp != NULL) {
+ 	/* Register MOUNT service (v1) for TCP */
+ 	if (!svc_register
+-	    (tcptransp, MOUNTPROG, MOUNTVERS1, mountprog_3,
++	    (tcptransp, mount_prog, MOUNTVERS1, mountprog_3,
+ 	     opt_portmapper ? IPPROTO_TCP : 0)) {
+ 	    fprintf(stderr, "%s\n",
+ 		    "unable to register (MOUNTPROG, MOUNTVERS1, tcp).");
+@@ -722,7 +740,7 @@ static void register_mount_service(SVCXP
+ 
+ 	/* Register MOUNT service (v3) for TCP */
+ 	if (!svc_register
+-	    (tcptransp, MOUNTPROG, MOUNTVERS3, mountprog_3,
++	    (tcptransp, mount_prog, MOUNTVERS3, mountprog_3,
+ 	     opt_portmapper ? IPPROTO_TCP : 0)) {
+ 	    fprintf(stderr, "%s\n",
+ 		    "unable to register (MOUNTPROG, MOUNTVERS3, tcp).");
+--- a/mount.c
++++ b/mount.c
+@@ -155,8 +155,8 @@ mountres3 *mountproc_mnt_3_svc(dirpath *
+     /* error out if not version 3 */
+     if (rqstp->rq_vers != 3) {
+ 	logmsg(LOG_INFO,
+-	       "%s attempted mount with unsupported protocol version",
+-	       inet_ntoa(get_remote(rqstp)));
++	       "%s attempted mount with unsupported protocol version: %i",
++	       inet_ntoa(get_remote(rqstp)), rqstp->rq_vers);
+ 	result.fhs_status = MNT3ERR_INVAL;
+ 	return &result;
+     }
diff --git a/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch b/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
new file mode 100644
index 0000000..604824a
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
@@ -0,0 +1,25 @@
+daemon.c: Check exit code of chdir()
+
+Stop the compile warning and fix the code to act on a chdir() failure.
+If this one does fail something is very, very wrong.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
+Upstream-Status: Pending
+
+---
+ daemon.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+--- a/daemon.c
++++ b/daemon.c
+@@ -964,7 +964,8 @@ int main(int argc, char **argv)
+ 	sigaction(SIGALRM, &act, NULL);
+ 
+ 	/* don't make directory we started in busy */
+-	chdir("/");
++	if(chdir("/") < 0)
++	    daemon_exit(0);
+ 
+ 	/* detach from terminal */
+ 	if (opt_detach) {
diff --git a/meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch b/meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch
new file mode 100644
index 0000000..76d7555
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch
@@ -0,0 +1,61 @@
+daemon.c: Fix race window for writing of the pid file
+
+The parent process should write the pid file such that the pid file
+will can be checked immediately following exit of the fork from the
+parent.
+
+This allows external monitoring applications to watch the daemon
+without having to add sleep calls to wait for the pid file be written
+on a busy system.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
+Upstream-Status: Pending
+
+---
+ daemon.c |   12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+--- a/daemon.c
++++ b/daemon.c
+@@ -153,7 +153,7 @@ int get_socket_type(struct svc_req *rqst
+ /*
+  * write current pid to a file
+  */
+-static void create_pid_file(void)
++static void create_pid_file(int pid)
+ {
+     char buf[16];
+     int fd, res, len;
+@@ -175,7 +175,7 @@ static void create_pid_file(void)
+     }
+ #endif
+ 
+-    sprintf(buf, "%i\n", backend_getpid());
++    sprintf(buf, "%i\n", pid);
+     len = strlen(buf);
+ 
+     res = backend_pwrite(fd, buf, len, 0);
+@@ -970,6 +970,10 @@ int main(int argc, char **argv)
+ 	    fprintf(stderr, "could not fork into background\n");
+ 	    daemon_exit(0);
+ 	}
++	if (pid)
++	    create_pid_file(pid);
++    } else {
++	create_pid_file(backend_getpid());
+     }
+ #endif				       /* WIN32 */
+ 
+@@ -1006,8 +1010,10 @@ int main(int argc, char **argv)
+ 	/* no umask to not screw up create modes */
+ 	umask(0);
+ 
++#ifdef WIN32
+ 	/* create pid file if wanted */
+-	create_pid_file();
++	create_pid_file(backend_getpid());
++#endif
+ 
+ 	/* initialize internal stuff */
+ 	fh_cache_init();
diff --git a/meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch b/meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch
new file mode 100644
index 0000000..ed61ea1
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch
@@ -0,0 +1,53 @@
+exports.*: fix warnings.
+
+Fix these warnings:
+lex.yy.c:1207: warning: 'yyunput' defined but not used
+lex.yy.c:1248: warning: 'input' defined but not used
+exports.y: In function 'set_hostname':
+exports.y:334: warning: large integer implicitly truncated to unsigned type
+exports.y: In function 'set_ipaddr':
+exports.y:350: warning: large integer implicitly truncated to unsigned type
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
+Upstream-Status: Pending
+
+---
+ Config/exports.l |    3 +++
+ Config/exports.y |    6 ++++--
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+--- a/Config/exports.l
++++ b/Config/exports.l
+@@ -48,6 +48,9 @@ NETCOMP [0-9]{1,2}
+ NET {IP}"/"{NETCOMP}
+ OLDNET {IP}"/"{IP}
+ 
++%option nounput
++%option noinput
++
+ %%
+ 
+ ^{WHITE}*\n		{ /* eat empty line */ }
+--- a/Config/exports.y
++++ b/Config/exports.y
+@@ -331,7 +331,8 @@ static void set_hostname(const char *nam
+ 	if (ent) {
+ 		memcpy(&cur_host.addr, ent->h_addr_list[0],
+ 		       sizeof(struct in_addr));
+-		cur_host.mask.s_addr = ~0UL;
++		cur_host.mask.s_addr = 0;
++		cur_host.mask.s_addr = ~cur_host.mask.s_addr;
+ 	} else {
+ 		logmsg(LOG_CRIT, "could not resolve hostname '%s'", name);
+ 		e_error = TRUE;
+@@ -347,7 +348,8 @@ static void set_ipaddr(const char *addr)
+ 	
+ 	if (!inet_aton(addr, &cur_host.addr))
+ 		e_error = TRUE;
+-	cur_host.mask.s_addr = ~0UL;
++	cur_host.mask.s_addr = 0;
++	cur_host.mask.s_addr = ~cur_host.mask.s_addr;
+ }
+ 
+ /*
diff --git a/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch b/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
new file mode 100644
index 0000000..17ad7b6
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
@@ -0,0 +1,74 @@
+nfs.c: Allow max sa.sun_path for a localdomain socket with the user nfs-server
+
+There is a hard limit for the kernel of 108 characters for a
+localdomain socket name.  To avoid problems with the user nfs
+server it should maximize the number of characters by using
+a relative path on the server side.
+
+Previously the nfs-server used the absolute path name passed to
+the sa.sunpath arg for binding the socket and this has caused
+problems for both the X server and UST binaries which make
+heavy use of named sockets with long names.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
+Upstream-Status: Pending
+
+---
+ nfs.c |   29 +++++++++++++++++++++++++++--
+ 1 file changed, 27 insertions(+), 2 deletions(-)
+
+--- a/nfs.c
++++ b/nfs.c
+@@ -672,6 +672,7 @@ SYMLINK3res *nfsproc3_symlink_3_svc(SYML
+ }
+ 
+ #ifndef WIN32
++static char pathbuf_tmp[NFS_MAXPATHLEN + NFS_MAXNAMLEN + 1];
+ 
+ /*
+  * create Unix socket
+@@ -680,17 +681,41 @@ static int mksocket(const char *path, mo
+ {
+     int res, sock;
+     struct sockaddr_un addr;
++    unsigned int len = strlen(path);
+ 
+     sock = socket(PF_UNIX, SOCK_STREAM, 0);
+-    addr.sun_family = AF_UNIX;
+-    strcpy(addr.sun_path, path);
+     res = sock;
+     if (res != -1) {
++	addr.sun_family = AF_UNIX;
++	if (len < sizeof(addr.sun_path) -1) {
++	    strcpy(addr.sun_path, path);
++	} else {
++	    char *ptr;
++	    res = -1;
++	    if (len >= sizeof(path))
++		goto out;
++	    strcpy(pathbuf_tmp, path);
++	    ptr = strrchr(pathbuf_tmp,'/');
++	    if (ptr) {
++		*ptr = '\0';
++		ptr++;
++		if (chdir(pathbuf_tmp))
++		    goto out;
++	    } else {
++		ptr = pathbuf_tmp;
++	    }
++	    if (strlen(ptr) >= sizeof(addr.sun_path))
++		goto out;
++	    strcpy(addr.sun_path, ptr);
++	}
+ 	umask(~mode);
+ 	res =
+ 	    bind(sock, (struct sockaddr *) &addr,
+ 		 sizeof(addr.sun_family) + strlen(addr.sun_path));
+ 	umask(0);
++out:
++	if (chdir("/"))
++	    fprintf(stderr, "Internal failure to chdir /\n");
+ 	close(sock);
+     }
+     return res;
diff --git a/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch b/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
new file mode 100644
index 0000000..37de8c3
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
@@ -0,0 +1,64 @@
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Sat, 23 Feb 2013 08:49:08 -0600
+Subject: [PATCH] fh_cache: fix statle nfs handle on rename problem
+
+The following test case fails with modern linunx kernels which cache
+the renamed inode.
+
+  % mkdir a;mkdir b;mv b a/;ls -l a
+  ls: a/b: Stale NFS file handle
+
+The issue is that nfserver was not updating the fh_cache with the new
+location of the inode, when it moves directories.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
+Upstream-Status: Pending
+
+---
+ fh_cache.c |   12 ++++++++++++
+ fh_cache.h |    1 +
+ nfs.c      |    2 ++
+ 3 files changed, 15 insertions(+)
+
+--- a/fh_cache.c
++++ b/fh_cache.c
+@@ -199,6 +199,18 @@ static char *fh_cache_lookup(uint32 dev,
+ }
+ 
+ /*
++ * update a fh inode cache for an operation like rename
++ */
++void fh_cache_update(nfs_fh3 fh, char *path)
++{
++    unfs3_fh_t *obj = (void *) fh.data.data_val;
++    backend_statstruct buf;
++
++    if (backend_lstat(path, &buf) != -1) {
++	fh_cache_add(obj->dev, buf.st_ino, path);
++    }
++}
++/*
+  * resolve a filename into a path
+  * cache-using wrapper for fh_decomp_raw
+  */
+--- a/fh_cache.h
++++ b/fh_cache.h
+@@ -19,5 +19,6 @@ unfs3_fh_t fh_comp(const char *path, str
+ unfs3_fh_t *fh_comp_ptr(const char *path, struct svc_req *rqstp, int need_dir);
+ 
+ char *fh_cache_add(uint32 dev, uint64 ino, const char *path);
++void fh_cache_update(nfs_fh3 fh, char *path);
+ 
+ #endif
+--- a/nfs.c
++++ b/nfs.c
+@@ -876,6 +876,8 @@ RENAME3res *nfsproc3_rename_3_svc(RENAME
+ 	    res = backend_rename(from_obj, to_obj);
+ 	    if (res == -1)
+ 		result.status = rename_err();
++	    /* Update the fh_cache with moved inode value */
++	    fh_cache_update(argp->to.dir, to_obj);
+ 	}
+     }
+ 
diff --git a/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch b/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
new file mode 100644
index 0000000..bc78dee
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
@@ -0,0 +1,56 @@
+daemon.c: Add option for tcp no delay
+
+Allow the NFS tcp sockets to conditionally use TCP_NODELAY
+
+Upstream-Status: Pending
+
+---
+ daemon.c |    9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+--- a/daemon.c
++++ b/daemon.c
+@@ -17,6 +17,7 @@
+ #ifndef WIN32
+ #include <sys/socket.h>
+ #include <netinet/in.h>
++#include <netinet/tcp.h>
+ #include <arpa/inet.h>
+ #include <syslog.h>
+ #else				       /* WIN32 */
+@@ -75,6 +76,7 @@ unsigned int opt_mount_port = NFS_PORT;
+ int opt_singleuser = FALSE;
+ int opt_brute_force = FALSE;
+ int opt_testconfig = FALSE;
++int opt_tcp_nodelay = FALSE;
+ struct in_addr opt_bind_addr;
+ int opt_readable_executables = FALSE;
+ char *opt_pid_file = NULL;
+@@ -208,7 +210,7 @@ static void parse_options(int argc, char
+ {
+ 
+     int opt = 0;
+-    char *optstring = "bcC:de:hl:m:n:prstTuwi:x:y:";
++    char *optstring = "bcC:de:hl:m:Nn:prstTuwi:x:y:";
+ 
+     while (opt != -1) {
+ 	opt = getopt(argc, argv, optstring);
+@@ -295,6 +297,9 @@ static void parse_options(int argc, char
+ 		    exit(1);
+ 		}
+ 		break;
++	    case 'N':
++		opt_tcp_nodelay = TRUE;
++		break;
+ 	    case 'n':
+ 		opt_nfs_port = strtol(optarg, NULL, 10);
+ 		if (opt_nfs_port == 0) {
+@@ -802,6 +807,8 @@ static SVCXPRT *create_tcp_transport(uns
+ 	sin.sin_addr.s_addr = opt_bind_addr.s_addr;
+ 	sock = socket(PF_INET, SOCK_STREAM, 0);
+ 	setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, (const char *) &on, sizeof(on));
++	if (opt_tcp_nodelay)
++	    setsockopt(sock, IPPROTO_TCP, TCP_NODELAY, &on, sizeof(on));
+ 	if (bind(sock, (struct sockaddr *) &sin, sizeof(struct sockaddr))) {
+ 	    perror("bind");
+ 	    fprintf(stderr, "Couldn't bind to tcp port %d\n", port);
diff --git a/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch b/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
new file mode 100644
index 0000000..c7fe3d7
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
@@ -0,0 +1,36 @@
+Fix parallel build dependency issue
+
+If building with make -j2 the lib.a will not get built in time.
+
+Jason Wessel <jason.wessel@windriver.com>
+
+Upstream-Status: Pending
+
+---
+ Config/Makefile.in |    2 ++
+ Makefile.in        |    3 ++-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -29,7 +29,8 @@ DESTDIR =
+ 
+ VPATH = $(srcdir)
+ 
+-all: subdirs unfsd$(EXEEXT)
++all: subdirs
++	$(MAKE) unfsd$(EXEEXT)
+ 
+ unfsd$(EXEEXT): $(OBJS) $(CONFOBJ) $(EXTRAOBJ)
+ 	$(CC) -o $@ $(OBJS) $(CONFOBJ) $(EXTRAOBJ) $(LDFLAGS)
+--- a/Config/Makefile.in
++++ b/Config/Makefile.in
+@@ -16,6 +16,8 @@ lib.a: $(OBJS)
+ 	$(AR) crs lib.a $(OBJS)
+ 
+ y.tab.h y.tab.c: $(srcdir)/exports.y
++
++y.tab.c: $(srcdir)/exports.y
+ 	$(YACC) -d $(srcdir)/exports.y
+ 
+ y.tab.o: y.tab.c $(srcdir)/exports.h $(top_srcdir)/nfs.h $(top_srcdir)/mount.h $(top_srcdir)/daemon.h
diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
new file mode 100644
index 0000000..3d88b42
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "Userspace NFS server v3 protocol"
+SECTION = "console/network"
+LICENSE = "unfs3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9475885294e17c0cc0067820d042792e"
+
+RDEPENDS_${PN} = "pseudo"
+RDEPENDS_${PN}_class-native = "pseudo-native"
+RDEPENDS_${PN}_class-nativesdk = "pseudo-nativesdk"
+DEPENDS = "flex-native bison-native"
+DEPENDS_class-nativesdk += "flex-nativesdk"
+
+SRC_URI[md5sum] = "3687acc4ee992e536472365dd99712a7"
+SRC_URI[sha256sum] = "274b43ada9c6eea1da26eb7010d72889c5278984ba0b50dff4e093057d4d64f8"
+
+MOD_PV = "490"
+S = "${WORKDIR}/trunk"
+SRC_URI = "svn://svn.code.sf.net/p/unfs3/code;module=trunk;rev=${MOD_PV} \
+           file://unfs3_parallel_build.patch \
+           file://alternate_rpc_ports.patch \
+           file://fix_pid_race_parent_writes_child_pid.patch \
+           file://fix_compile_warning.patch \
+           file://rename_fh_cache.patch \
+           file://relative_max_socket_path_len.patch \
+           file://fix_warnings.patch \
+           file://tcp_no_delay.patch \
+          "
+BBCLASSEXTEND = "native nativesdk"
+
+inherit autotools
+
+# Turn off these header detects else the inode search
+# will walk entire file systems and this is a real problem
+# if you have 2 TB of files to walk in your file system
+CACHED_CONFIGUREVARS = "ac_cv_header_mntent_h=no ac_cv_header_sys_mnttab_h=no"
+
+# This recipe is intended for -native and -nativesdk builds only,
+# not target installs:
+python __anonymous () {
+    import re
+
+    pn = d.getVar("PN", True)
+    if not pn.endswith('-native') and not pn.startswith('nativesdk-'):
+        raise bb.parse.SkipPackage("unfs3 is intended for native/nativesdk builds only")
+}
-- 
1.7.9.5


