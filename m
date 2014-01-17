Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6496AF54
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 17:45:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2014 09:41:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,675,1384329600"; d="scan'208";a="468382179"
Received: from unknown (HELO [10.255.12.195]) ([10.255.12.195])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2014 09:45:01 -0800
Message-ID: <52D96C1D.1050706@linux.intel.com>
Date: Fri, 17 Jan 2014 09:45:01 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Jason Wessel <jason.wessel@windriver.com>, 
	Openembedded-core@lists.openembedded.org
References: <1389976685-25802-1-git-send-email-jason.wessel@windriver.com>
	<1389976685-25802-2-git-send-email-jason.wessel@windriver.com>
In-Reply-To: <1389976685-25802-2-git-send-email-jason.wessel@windriver.com>
Subject: Re: [PATCH 1/6] unfs3: Add a NFSv3 user mode server for use with runqemu
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
X-List-Received-Date: Fri, 17 Jan 2014 17:45:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2014 08:37 AM, Jason Wessel wrote:
> The user mode nfs server allows the use of runqemu without any root
> privileges and may even be accelerated with kvm.
>
> Example:
>
> runqemu-extract-sdk tmp-eglibc/deploy/images/qemux86-64/core-image-minimal-qemux86-64.tar.bz2 rootfs
>
> runqemu qemux86-64 `pwd`/rootfs nographic slirp kvm
>
> [YOCTO #5639]
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>   meta/files/common-licenses/unfs3                   |   24 +++
>   .../unfs3/unfs3/alternate_rpc_ports.patch          |  156 ++++++++++++++++++++
>   .../unfs3/unfs3/fix_compile_warning.patch          |   16 ++
>   .../fix_pid_race_parent_writes_child_pid.patch     |   47 ++++++
>   .../unfs3/unfs3/fix_warnings.patch                 |   51 +++++++
>   .../unfs3/force_4_byte_long_on_64_bit_host.patch   |   39 +++++
>   .../unfs3/unfs3/relative_max_socket_path_len.patch |   70 +++++++++
>   .../unfs3/unfs3/rename_fh_cache.patch              |   62 ++++++++
>   .../unfs3/unfs3/tcp_no_delay.patch                 |   50 +++++++
>   .../unfs3/unfs3/unfs3_parallel_build.patch         |   36 +++++

Jason:

These unfs3 patches are missing Upstream-Status: Tag.

Thanks
	Sau!

>   meta/recipes-devtools/unfs3/unfs3_0.9.22.bb        |   48 ++++++
>   11 files changed, 599 insertions(+)
>   create mode 100644 meta/files/common-licenses/unfs3
>   create mode 100644 meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
>   create mode 100644 meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
>   create mode 100644 meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch
>   create mode 100644 meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch
>   create mode 100644 meta/recipes-devtools/unfs3/unfs3/force_4_byte_long_on_64_bit_host.patch
>   create mode 100644 meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
>   create mode 100644 meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
>   create mode 100644 meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
>   create mode 100644 meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
>   create mode 100644 meta/recipes-devtools/unfs3/unfs3_0.9.22.bb
>
> diff --git a/meta/files/common-licenses/unfs3 b/meta/files/common-licenses/unfs3
> new file mode 100644
> index 0000000..7f2b53f
> --- /dev/null
> +++ b/meta/files/common-licenses/unfs3
> @@ -0,0 +1,24 @@
> +UNFS3 user-space NFSv3 server
> +(C) 2003, Pascal Schmidt <unfs3-server@ewetel.net>
> +
> +Redistribution and use in source and binary forms, with or without
> +modification, are permitted provided that the following conditions are met:
> +
> +1. Redistributions of source code must retain the above copyright notice,
> +   this list of conditions and the following disclaimer.
> +2. Redistributions in binary form must reproduce the above copyright notice,
> +   this list of conditions and the following disclaimer in the documentation
> +   and/or other materials provided with the distribution.
> +3. The name of the author may not be used to endorse or promote products
> +   derived from this software without specific prior written permission.
> +
> +THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
> +WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> +MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
> +EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> +SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> +PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
> +OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
> +WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
> +OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> +ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> diff --git a/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch b/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
> new file mode 100644
> index 0000000..8634121
> --- /dev/null
> +++ b/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
> @@ -0,0 +1,156 @@
> +Add ability to specify rcp port numbers
> +
> +In order to run more than one unfs server on a host system, you must
> +be able to specify alternate rpc port numbers.
> +
> +Jason Wessel <jason.wessel@windriver.com>
> +
> +---
> + daemon.c |   44 +++++++++++++++++++++++++++++++-------------
> + mount.c  |    4 ++--
> + 2 files changed, 33 insertions(+), 15 deletions(-)
> +
> +--- a/daemon.c
> ++++ b/daemon.c
> +@@ -75,6 +75,8 @@ int opt_testconfig = FALSE;
> + struct in_addr opt_bind_addr;
> + int opt_readable_executables = FALSE;
> + char *opt_pid_file = NULL;
> ++int nfs_prog = NFS3_PROGRAM;
> ++int mount_prog = MOUNTPROG;
> +
> + /* Register with portmapper? */
> + int opt_portmapper = TRUE;
> +@@ -202,7 +204,7 @@ static void remove_pid_file(void)
> + static void parse_options(int argc, char **argv)
> + {
> +     int opt = 0;
> +-    char *optstring = "bcC:de:hl:m:n:prstTuwi:";
> ++    char *optstring = "bcC:de:hl:m:n:prstTuwi:x:y:";
> +
> +     while (opt != -1) {
> + 	opt = getopt(argc, argv, optstring);
> +@@ -257,8 +259,24 @@ static void parse_options(int argc, char
> + 		printf
> + 		    ("\t-r          report unreadable executables as readable\n");
> + 		printf("\t-T          test exports file and exit\n");
> ++		printf("\t-x <port>   alternate NFS RPC port\n");
> ++		printf("\t-y <port>   alternate MOUNTD RPC port\n");
> + 		exit(0);
> + 		break;
> ++	    case 'x':
> ++		nfs_prog = strtol(optarg, NULL, 10);
> ++		if (nfs_prog == 0) {
> ++		    fprintf(stderr, "Invalid NFS RPC port\n");
> ++		    exit(1);
> ++		}
> ++		break;
> ++	    case 'y':
> ++		mount_prog = strtol(optarg, NULL, 10);
> ++		if (mount_prog == 0) {
> ++		    fprintf(stderr, "Invalid MOUNTD RPC port\n");
> ++		    exit(1);
> ++		}
> ++		break;
> + 	    case 'l':
> + 		opt_bind_addr.s_addr = inet_addr(optarg);
> + 		if (opt_bind_addr.s_addr == (unsigned) -1) {
> +@@ -343,12 +361,12 @@ void daemon_exit(int error)
> + #endif				       /* WIN32 */
> +
> +     if (opt_portmapper) {
> +-	svc_unregister(MOUNTPROG, MOUNTVERS1);
> +-	svc_unregister(MOUNTPROG, MOUNTVERS3);
> ++	svc_unregister(mount_prog, MOUNTVERS1);
> ++	svc_unregister(mount_prog, MOUNTVERS3);
> +     }
> +
> +     if (opt_portmapper) {
> +-	svc_unregister(NFS3_PROGRAM, NFS_V3);
> ++	svc_unregister(nfs_prog, NFS_V3);
> +     }
> +
> +     if (error == SIGSEGV)
> +@@ -653,13 +671,13 @@ static void mountprog_3(struct svc_req *
> + static void register_nfs_service(SVCXPRT * udptransp, SVCXPRT * tcptransp)
> + {
> +     if (opt_portmapper) {
> +-	pmap_unset(NFS3_PROGRAM, NFS_V3);
> ++	pmap_unset(nfs_prog, NFS_V3);
> +     }
> +
> +     if (udptransp != NULL) {
> + 	/* Register NFS service for UDP */
> + 	if (!svc_register
> +-	    (udptransp, NFS3_PROGRAM, NFS_V3, nfs3_program_3,
> ++	    (udptransp, nfs_prog, NFS_V3, nfs3_program_3,
> + 	     opt_portmapper ? IPPROTO_UDP : 0)) {
> + 	    fprintf(stderr, "%s\n",
> + 		    "unable to register (NFS3_PROGRAM, NFS_V3, udp).");
> +@@ -670,7 +688,7 @@ static void register_nfs_service(SVCXPRT
> +     if (tcptransp != NULL) {
> + 	/* Register NFS service for TCP */
> + 	if (!svc_register
> +-	    (tcptransp, NFS3_PROGRAM, NFS_V3, nfs3_program_3,
> ++	    (tcptransp, nfs_prog, NFS_V3, nfs3_program_3,
> + 	     opt_portmapper ? IPPROTO_TCP : 0)) {
> + 	    fprintf(stderr, "%s\n",
> + 		    "unable to register (NFS3_PROGRAM, NFS_V3, tcp).");
> +@@ -682,14 +700,14 @@ static void register_nfs_service(SVCXPRT
> + static void register_mount_service(SVCXPRT * udptransp, SVCXPRT * tcptransp)
> + {
> +     if (opt_portmapper) {
> +-	pmap_unset(MOUNTPROG, MOUNTVERS1);
> +-	pmap_unset(MOUNTPROG, MOUNTVERS3);
> ++	pmap_unset(mount_prog, MOUNTVERS1);
> ++	pmap_unset(mount_prog, MOUNTVERS3);
> +     }
> +
> +     if (udptransp != NULL) {
> + 	/* Register MOUNT service (v1) for UDP */
> + 	if (!svc_register
> +-	    (udptransp, MOUNTPROG, MOUNTVERS1, mountprog_3,
> ++	    (udptransp, mount_prog, MOUNTVERS1, mountprog_3,
> + 	     opt_portmapper ? IPPROTO_UDP : 0)) {
> + 	    fprintf(stderr, "%s\n",
> + 		    "unable to register (MOUNTPROG, MOUNTVERS1, udp).");
> +@@ -698,7 +716,7 @@ static void register_mount_service(SVCXP
> +
> + 	/* Register MOUNT service (v3) for UDP */
> + 	if (!svc_register
> +-	    (udptransp, MOUNTPROG, MOUNTVERS3, mountprog_3,
> ++	    (udptransp, mount_prog, MOUNTVERS3, mountprog_3,
> + 	     opt_portmapper ? IPPROTO_UDP : 0)) {
> + 	    fprintf(stderr, "%s\n",
> + 		    "unable to register (MOUNTPROG, MOUNTVERS3, udp).");
> +@@ -709,7 +727,7 @@ static void register_mount_service(SVCXP
> +     if (tcptransp != NULL) {
> + 	/* Register MOUNT service (v1) for TCP */
> + 	if (!svc_register
> +-	    (tcptransp, MOUNTPROG, MOUNTVERS1, mountprog_3,
> ++	    (tcptransp, mount_prog, MOUNTVERS1, mountprog_3,
> + 	     opt_portmapper ? IPPROTO_TCP : 0)) {
> + 	    fprintf(stderr, "%s\n",
> + 		    "unable to register (MOUNTPROG, MOUNTVERS1, tcp).");
> +@@ -718,7 +736,7 @@ static void register_mount_service(SVCXP
> +
> + 	/* Register MOUNT service (v3) for TCP */
> + 	if (!svc_register
> +-	    (tcptransp, MOUNTPROG, MOUNTVERS3, mountprog_3,
> ++	    (tcptransp, mount_prog, MOUNTVERS3, mountprog_3,
> + 	     opt_portmapper ? IPPROTO_TCP : 0)) {
> + 	    fprintf(stderr, "%s\n",
> + 		    "unable to register (MOUNTPROG, MOUNTVERS3, tcp).");
> +--- a/mount.c
> ++++ b/mount.c
> +@@ -155,8 +155,8 @@ mountres3 *mountproc_mnt_3_svc(dirpath *
> +     /* error out if not version 3 */
> +     if (rqstp->rq_vers != 3) {
> + 	logmsg(LOG_INFO,
> +-	       "%s attempted mount with unsupported protocol version",
> +-	       inet_ntoa(get_remote(rqstp)));
> ++	       "%s attempted mount with unsupported protocol version: %i",
> ++	       inet_ntoa(get_remote(rqstp)), rqstp->rq_vers);
> + 	result.fhs_status = MNT3ERR_INVAL;
> + 	return &result;
> +     }
> diff --git a/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch b/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
> new file mode 100644
> index 0000000..658bd39
> --- /dev/null
> +++ b/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
> @@ -0,0 +1,16 @@
> +---
> + daemon.c |    3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +--- a/daemon.c
> ++++ b/daemon.c
> +@@ -964,7 +964,8 @@ int main(int argc, char **argv)
> + 	sigaction(SIGALRM, &act, NULL);
> +
> + 	/* don't make directory we started in busy */
> +-	chdir("/");
> ++	if(chdir("/") < 0)
> ++	    daemon_exit(0);
> +
> + 	/* detach from terminal */
> + 	if (opt_detach) {
> diff --git a/meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch b/meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch
> new file mode 100644
> index 0000000..4bdab00
> --- /dev/null
> +++ b/meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch
> @@ -0,0 +1,47 @@
> +---
> + daemon.c |   12 +++++++++---
> + 1 file changed, 9 insertions(+), 3 deletions(-)
> +
> +--- a/daemon.c
> ++++ b/daemon.c
> +@@ -150,7 +150,7 @@ int get_socket_type(struct svc_req *rqst
> + /*
> +  * write current pid to a file
> +  */
> +-static void create_pid_file(void)
> ++static void create_pid_file(int pid)
> + {
> +     char buf[16];
> +     int fd, res, len;
> +@@ -172,7 +172,7 @@ static void create_pid_file(void)
> +     }
> + #endif
> +
> +-    sprintf(buf, "%i\n", backend_getpid());
> ++    sprintf(buf, "%i\n", pid);
> +     len = strlen(buf);
> +
> +     res = backend_pwrite(fd, buf, len, 0);
> +@@ -938,6 +938,10 @@ int main(int argc, char **argv)
> + 	    fprintf(stderr, "could not fork into background\n");
> + 	    daemon_exit(0);
> + 	}
> ++	if (pid)
> ++	    create_pid_file(pid);
> ++    } else {
> ++	create_pid_file(backend_getpid());
> +     }
> + #endif				       /* WIN32 */
> +
> +@@ -974,8 +978,10 @@ int main(int argc, char **argv)
> + 	/* no umask to not screw up create modes */
> + 	umask(0);
> +
> ++#ifdef WIN32
> + 	/* create pid file if wanted */
> +-	create_pid_file();
> ++	create_pid_file(backend_getpid());
> ++#endif
> +
> + 	/* initialize internal stuff */
> + 	fh_cache_init();
> diff --git a/meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch b/meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch
> new file mode 100644
> index 0000000..88394c7
> --- /dev/null
> +++ b/meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch
> @@ -0,0 +1,51 @@
> +exports.*: fix warnings.
> +
> +Fix these warnings:
> +lex.yy.c:1207: warning: 'yyunput' defined but not used
> +lex.yy.c:1248: warning: 'input' defined but not used
> +exports.y: In function 'set_hostname':
> +exports.y:334: warning: large integer implicitly truncated to unsigned type
> +exports.y: In function 'set_ipaddr':
> +exports.y:350: warning: large integer implicitly truncated to unsigned type
> +
> +Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> +
> +---
> + Config/exports.l |    3 +++
> + Config/exports.y |    6 ++++--
> + 2 files changed, 7 insertions(+), 2 deletions(-)
> +
> +--- a/Config/exports.l
> ++++ b/Config/exports.l
> +@@ -48,6 +48,9 @@ NETCOMP [0-9]{1,2}
> + NET {IP}"/"{NETCOMP}
> + OLDNET {IP}"/"{IP}
> +
> ++%option nounput
> ++%option noinput
> ++
> + %%
> +
> + ^{WHITE}*\n		{ /* eat empty line */ }
> +--- a/Config/exports.y
> ++++ b/Config/exports.y
> +@@ -331,7 +331,8 @@ static void set_hostname(const char *nam
> + 	if (ent) {
> + 		memcpy(&cur_host.addr, ent->h_addr_list[0],
> + 		       sizeof(struct in_addr));
> +-		cur_host.mask.s_addr = ~0UL;
> ++		cur_host.mask.s_addr = 0;
> ++		cur_host.mask.s_addr = ~cur_host.mask.s_addr;
> + 	} else {
> + 		logmsg(LOG_CRIT, "could not resolve hostname '%s'", name);
> + 		e_error = TRUE;
> +@@ -347,7 +348,8 @@ static void set_ipaddr(const char *addr)
> + 	
> + 	if (!inet_aton(addr, &cur_host.addr))
> + 		e_error = TRUE;
> +-	cur_host.mask.s_addr = ~0UL;
> ++	cur_host.mask.s_addr = 0;
> ++	cur_host.mask.s_addr = ~cur_host.mask.s_addr;
> + }
> +
> + /*
> diff --git a/meta/recipes-devtools/unfs3/unfs3/force_4_byte_long_on_64_bit_host.patch b/meta/recipes-devtools/unfs3/unfs3/force_4_byte_long_on_64_bit_host.patch
> new file mode 100644
> index 0000000..07f189f
> --- /dev/null
> +++ b/meta/recipes-devtools/unfs3/unfs3/force_4_byte_long_on_64_bit_host.patch
> @@ -0,0 +1,39 @@
> +Fix RPC marshalling problem with failed setattr calls
> +
> +On modern 64 bit hosts you cannot use xdr_u_long to translate a 32 bit
> +quantity.  Normally rpcgen would be here to re-write the xdr file, but
> +because this is hard coded and has to work on a large number of hosts,
> +the xdr_u_int is selected for the highest portability for hosts that
> +exist at the current time.
> +
> +Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> +---
> + xdr.c |    8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +--- a/xdr.c
> ++++ b/xdr.c
> +@@ -192,19 +192,19 @@ bool_t xdr_uint64(XDR * xdrs, uint64 * o
> + #endif
> + #endif
> +
> +-#if HAVE_XDR_UINT32 == 0 && HAVE_XDR_U_LONG == 1
> ++#if HAVE_XDR_UINT32 == 0
> + bool_t xdr_uint32(XDR * xdrs, uint32 * objp)
> + {
> +-    if (!xdr_u_long(xdrs, objp))
> ++    if (!xdr_u_int(xdrs, (unsigned int *)objp))
> + 	return FALSE;
> +     return TRUE;
> + }
> + #endif
> +
> +-#if HAVE_XDR_INT32 == 0 && HAVE_XDR_LONG == 1
> ++#if HAVE_XDR_INT32 == 0
> + bool_t xdr_int32(XDR * xdrs, int32 * objp)
> + {
> +-    if (!xdr_long(xdrs, objp))
> ++    if (!xdr_int(xdrs, (int *)objp))
> + 	return FALSE;
> +     return TRUE;
> + }
> diff --git a/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch b/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
> new file mode 100644
> index 0000000..cc46b7b
> --- /dev/null
> +++ b/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
> @@ -0,0 +1,70 @@
> +Allow max sa.sun_path for a localdomain socket with the user nfs-server
> +
> +There is a hard limit for the kernel of 108 characters for a
> +localdomain socket name.  To avoid problems with the user nfs
> +server it should maximize the number of characters by using
> +a relative path on the server side.
> +
> +Previously the nfs-server used the absolute path name passed to
> +the sa.sunpath arg for binding the socket and this has caused
> +problems for both the X server and UST binaries which make
> +heavy use of named sockets with long names.
> +
> +Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> +
> +Index: unfs3-0.9.22/nfs.c
> +===================================================================
> +--- unfs3-0.9.22.orig/nfs.c
> ++++ unfs3-0.9.22/nfs.c
> +@@ -672,6 +672,7 @@ SYMLINK3res *nfsproc3_symlink_3_svc(SYML
> + }
> +
> + #ifndef WIN32
> ++static char pathbuf_tmp[NFS_MAXPATHLEN + NFS_MAXNAMLEN + 1];
> +
> + /*
> +  * create Unix socket
> +@@ -680,17 +681,41 @@ static int mksocket(const char *path, mo
> + {
> +     int res, sock;
> +     struct sockaddr_un addr;
> ++    unsigned int len = strlen(path);
> +
> +     sock = socket(PF_UNIX, SOCK_STREAM, 0);
> +-    addr.sun_family = AF_UNIX;
> +-    strcpy(addr.sun_path, path);
> +     res = sock;
> +     if (res != -1) {
> ++	addr.sun_family = AF_UNIX;
> ++	if (len < sizeof(addr.sun_path) -1) {
> ++	    strcpy(addr.sun_path, path);
> ++	} else {
> ++	    char *ptr;
> ++	    res = -1;
> ++	    if (len >= sizeof(path))
> ++		goto out;
> ++	    strcpy(pathbuf_tmp, path);
> ++	    ptr = strrchr(pathbuf_tmp,'/');
> ++	    if (ptr) {
> ++		*ptr = '\0';
> ++		ptr++;
> ++		if (chdir(pathbuf_tmp))
> ++		    goto out;
> ++	    } else {
> ++		ptr = pathbuf_tmp;
> ++	    }
> ++	    if (strlen(ptr) >= sizeof(addr.sun_path))
> ++		goto out;
> ++	    strcpy(addr.sun_path, ptr);
> ++	}
> + 	umask(~mode);
> + 	res =
> + 	    bind(sock, (struct sockaddr *) &addr,
> + 		 sizeof(addr.sun_family) + strlen(addr.sun_path));
> + 	umask(0);
> ++out:
> ++	if (chdir("/"))
> ++	    fprintf(stderr, "Internal failure to chdir /\n");
> + 	close(sock);
> +     }
> +     return res;
> diff --git a/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch b/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
> new file mode 100644
> index 0000000..d32609f
> --- /dev/null
> +++ b/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
> @@ -0,0 +1,62 @@
> +From: Jason Wessel <jason.wessel@windriver.com>
> +Date: Sat, 23 Feb 2013 08:49:08 -0600
> +Subject: [PATCH] fh_cache: fix statle nfs handle on rename problem
> +
> +The following test case fails with modern linunx kernels which cache
> +the renamed inode.
> +
> +  % mkdir a;mkdir b;mv b a/;ls -l a
> +  ls: a/b: Stale NFS file handle
> +
> +The issue is that nfserver was not update the fh_cache with the new
> +location of the inode, when it moves directories.
> +
> +Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> +
> +---
> + fh_cache.c |   12 ++++++++++++
> + fh_cache.h |    1 +
> + nfs.c      |    2 ++
> + 3 files changed, 15 insertions(+)
> +
> +--- a/fh_cache.c
> ++++ b/fh_cache.c
> +@@ -199,6 +199,18 @@ static char *fh_cache_lookup(uint32 dev,
> + }
> +
> + /*
> ++ * update a fh inode cache for an operation like rename
> ++ */
> ++void fh_cache_update(nfs_fh3 fh, char *path)
> ++{
> ++    unfs3_fh_t *obj = (void *) fh.data.data_val;
> ++    backend_statstruct buf;
> ++
> ++    if (backend_lstat(path, &buf) != -1) {
> ++	fh_cache_add(obj->dev, buf.st_ino, path);
> ++    }
> ++}
> ++/*
> +  * resolve a filename into a path
> +  * cache-using wrapper for fh_decomp_raw
> +  */
> +--- a/fh_cache.h
> ++++ b/fh_cache.h
> +@@ -19,5 +19,6 @@ unfs3_fh_t fh_comp(const char *path, str
> + unfs3_fh_t *fh_comp_ptr(const char *path, struct svc_req *rqstp, int need_dir);
> +
> + char *fh_cache_add(uint32 dev, uint64 ino, const char *path);
> ++void fh_cache_update(nfs_fh3 fh, char *path);
> +
> + #endif
> +--- a/nfs.c
> ++++ b/nfs.c
> +@@ -876,6 +876,8 @@ RENAME3res *nfsproc3_rename_3_svc(RENAME
> + 	    res = backend_rename(from_obj, to_obj);
> + 	    if (res == -1)
> + 		result.status = rename_err();
> ++	    /* Update the fh_cache with moved inode value */
> ++	    fh_cache_update(argp->to.dir, to_obj);
> + 	}
> +     }
> +
> diff --git a/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch b/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
> new file mode 100644
> index 0000000..9ea4641
> --- /dev/null
> +++ b/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
> @@ -0,0 +1,50 @@
> +---
> + daemon.c |    9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +--- a/daemon.c
> ++++ b/daemon.c
> +@@ -17,6 +17,7 @@
> + #ifndef WIN32
> + #include <sys/socket.h>
> + #include <netinet/in.h>
> ++#include <netinet/tcp.h>
> + #include <arpa/inet.h>
> + #include <syslog.h>
> + #else				       /* WIN32 */
> +@@ -72,6 +73,7 @@ unsigned int opt_mount_port = NFS_PORT;
> + int opt_singleuser = FALSE;
> + int opt_brute_force = FALSE;
> + int opt_testconfig = FALSE;
> ++int opt_tcp_nodelay = FALSE;
> + struct in_addr opt_bind_addr;
> + int opt_readable_executables = FALSE;
> + char *opt_pid_file = NULL;
> +@@ -204,7 +206,7 @@ static void remove_pid_file(void)
> + static void parse_options(int argc, char **argv)
> + {
> +     int opt = 0;
> +-    char *optstring = "bcC:de:hl:m:n:prstTuwi:x:y:";
> ++    char *optstring = "bcC:de:hl:m:Nn:prstTuwi:x:y:";
> +
> +     while (opt != -1) {
> + 	opt = getopt(argc, argv, optstring);
> +@@ -291,6 +293,9 @@ static void parse_options(int argc, char
> + 		    exit(1);
> + 		}
> + 		break;
> ++	    case 'N':
> ++		opt_tcp_nodelay = TRUE;
> ++		break;
> + 	    case 'n':
> + 		opt_nfs_port = strtol(optarg, NULL, 10);
> + 		if (opt_nfs_port == 0) {
> +@@ -760,6 +765,8 @@ static SVCXPRT *create_udp_transport(uns
> + 	sin.sin_addr.s_addr = opt_bind_addr.s_addr;
> + 	sock = socket(PF_INET, SOCK_DGRAM, 0);
> + 	setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, (char *) &on, sizeof(on));
> ++	if (opt_tcp_nodelay)
> ++	    setsockopt(sock, IPPROTO_TCP, TCP_NODELAY, &on, sizeof(on));
> + 	if (bind(sock, (struct sockaddr *) &sin, sizeof(struct sockaddr))) {
> + 	    perror("bind");
> + 	    fprintf(stderr, "Couldn't bind to udp port %d\n", port);
> diff --git a/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch b/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
> new file mode 100644
> index 0000000..a5942fe
> --- /dev/null
> +++ b/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
> @@ -0,0 +1,36 @@
> +Fix parallel build dependency issue
> +
> +If building with make -j2 the lib.a will not get built in time.
> +
> +Jason Wessel <jason.wessel@windriver.com>
> +
> +---
> + Config/Makefile.in |    4 +++-
> + Makefile.in        |    3 ++-
> + 2 files changed, 5 insertions(+), 2 deletions(-)
> +
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -25,7 +25,8 @@ SUBDIRS = Config @SUBDIRS@
> +
> + DESTDIR =
> +
> +-all: subdirs unfsd$(EXEEXT)
> ++all: subdirs
> ++	$(MAKE) unfsd$(EXEEXT)
> +
> + unfsd$(EXEEXT): $(OBJS) $(CONFOBJ) $(EXTRAOBJ)
> + 	$(CC) -o $@ $(OBJS) $(CONFOBJ) $(EXTRAOBJ) $(LDFLAGS)
> +--- a/Config/Makefile.in
> ++++ b/Config/Makefile.in
> +@@ -12,7 +12,9 @@ all: lib.a
> + lib.a: $(OBJS)
> + 	$(AR) crs lib.a $(OBJS)
> +
> +-y.tab.h y.tab.c: exports.y
> ++y.tab.h: y.tab.c
> ++
> ++y.tab.c: exports.y
> + 	$(YACC) -d exports.y
> +
> + y.tab.o: y.tab.c exports.h ../nfs.h ../mount.h ../daemon.h
> diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.bb b/meta/recipes-devtools/unfs3/unfs3_0.9.22.bb
> new file mode 100644
> index 0000000..6c8f033
> --- /dev/null
> +++ b/meta/recipes-devtools/unfs3/unfs3_0.9.22.bb
> @@ -0,0 +1,48 @@
> +DESCRIPTION = "Userspace NFS server v3 protocol"
> +SECTION = "console/network"
> +LICENSE = "unfs3"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9475885294e17c0cc0067820d042792e"
> +
> +RDEPENDS_${PN} = "pseudo"
> +RDEPENDS_${PN}_class-native = "pseudo-native"
> +RDEPENDS_${PN}_class-nativesdk = "pseudo-nativesdk"
> +DEPENDS = "flex-native bison-native"
> +DEPENDS_class-nativesdk += "flex-nativesdk"
> +
> +SRC_URI[md5sum] = "ddf679a5d4d80096a59f3affc64f16e5"
> +SRC_URI[sha256sum] = "482222cae541172c155cd5dc9c2199763a6454b0c5c0619102d8143bb19fdf1c"
> +
> +SRC_URI = "http://sourceforge.net/projects/unfs3/files/unfs3/0.9.22/unfs3-0.9.22.tar.gz \
> +           file://unfs3_parallel_build.patch \
> +           file://alternate_rpc_ports.patch \
> +           file://fix_pid_race_parent_writes_child_pid.patch \
> +           file://fix_compile_warning.patch \
> +           file://rename_fh_cache.patch \
> +           file://relative_max_socket_path_len.patch \
> +           file://force_4_byte_long_on_64_bit_host.patch \
> +           file://fix_warnings.patch \
> +           file://tcp_no_delay.patch \
> +          "
> +BBCLASSEXTEND = "native nativesdk"
> +
> +inherit autotools
> +
> +# Turn off these header detects else the inode search
> +# will walk entire file systems and this is a real problem
> +# if you have 2 TB of files to walk in your file system
> +CACHED_CONFIGUREVARS = "ac_cv_header_mntent_h=no ac_cv_header_sys_mnttab_h=no"
> +
> +do_configure() {
> +	# Skip running autoconf because it wants old m4 macros
> +	oe_runconf
> +}
> +
> +# This recipe is intended for -native and -nativesdk builds only,
> +# not target installs:
> +python __anonymous () {
> +    import re
> +
> +    pn = d.getVar("PN", True)
> +    if not pn.endswith('-native') and not pn.startswith('nativesdk-'):
> +        raise bb.parse.SkipPackage("unfs3 is intended for native/nativesdk builds only")
> +}
>

