Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RD87y-0006lS-GK
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 07:10:14 +0200
Received: from mail-bw0-f52.google.com ([209.85.214.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 09 Oct 2011 22:04:32 -0700
Received: by bke5 with SMTP id 5so7485932bke.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Oct 2011 22:04:31 -0700 (PDT)
Received: by 10.223.5.3 with SMTP id 3mr29850611fat.4.1318223070018;
	Sun, 09 Oct 2011 22:04:30 -0700 (PDT)
Received: from [192.168.128.188] ([68.178.104.162])
	by mx.google.com with ESMTPS id u6sm29423757faf.3.2011.10.09.22.04.27
	(version=SSLv3 cipher=OTHER); Sun, 09 Oct 2011 22:04:29 -0700 (PDT)
Message-ID: <4E927CD9.2040505@intel.com>
Date: Sun, 09 Oct 2011 22:04:25 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317840239-5290-1-git-send-email-jason.wessel@windriver.com>
In-Reply-To: <1317840239-5290-1-git-send-email-jason.wessel@windriver.com>
Subject: Re: [PATCH] Allow user mode NFS server to run without rpcbind / portmap
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
X-List-Received-Date: Mon, 10 Oct 2011 05:10:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/05/2011 11:43 AM, Jason Wessel wrote:
>> From the 2.6.39 linux kernel and up it is possible to use
> and nfsroot mount without the need to talk to an RPC info
> server as long as the port numbers for mountd and nfsd
> are known in advance.
>
> This patch updates the qemu startup scripts and the
> user mode NFS server to have the ability to start
> without the need to use rpcbind or portmap services.
>
Jason,

I have not fully tested this yet, but if someone has rpcbind and/or 
portmap services are running, what affect will this patch have?

Sau!

> Signed-off-by: Jason Wessel<jason.wessel@windriver.com>
> ---
>   .../023-no-rpc-register.patch                      |   34 ++++++++++++++++++++
>   .../unfs-server/unfs-server_2.1+2.2beta47.bb       |    3 +-
>   scripts/runqemu-export-rootfs                      |    4 ++-
>   scripts/runqemu-internal                           |   16 +++------
>   4 files changed, 44 insertions(+), 13 deletions(-)
>   create mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/023-no-rpc-register.patch
>
> diff --git a/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/023-no-rpc-register.patch b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/023-no-rpc-register.patch
> new file mode 100644
> index 0000000..50f23fc
> --- /dev/null
> +++ b/meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/023-no-rpc-register.patch
> @@ -0,0 +1,34 @@
> +Upstream-Status: Inappropriate [other]
> +Upstream is not making further releases of this software.
> +
> +Signed-off-by: Jason Wessel<jason.wessel@windriver.com>
> +
> +# Allow user mode NFS to work without rpcbind / portmap
> +# Patch origin: Wind River
> +
> +---
> + rpcmisc.c |    6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +--- a/rpcmisc.c
> ++++ b/rpcmisc.c
> +@@ -91,7 +91,8 @@ not_inetd:
> + 		if (transp == NULL)
> + 			Dprintf(L_FATAL, "cannot create udp service.");
> + 		for (i = 0; (vers = verstbl[i]) != 0; i++) {
> +-			if (!svc_register(transp, prog, vers, dispatch, IPPROTO_UDP)) {
> ++			if (!(svc_register(transp, prog, vers, dispatch, IPPROTO_UDP) ||
> ++			      svc_register(transp, prog, vers, dispatch, 0))) {
> + 				Dprintf(L_FATAL,
> + 					"unable to register (%s, %d, udp).",
> + 					name, vers);
> +@@ -110,7 +111,8 @@ not_inetd:
> + 		transp->xp_ops->xp_recv = auth_rendevouser;
> + #endif
> + 		for (i = 0; (vers = verstbl[i]) != 0; i++) {
> +-			if (!svc_register(transp, prog, vers, dispatch, IPPROTO_TCP)) {
> ++			if (!(svc_register(transp, prog, vers, dispatch, IPPROTO_TCP) ||
> ++			      svc_register(transp, prog, vers, dispatch, 0))) {
> + 				Dprintf(L_FATAL,
> + 					"unable to register (%s, %d, tcp).",
> + 					name, vers);
> diff --git a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
> index 8ed2e33..29c7052 100644
> --- a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
> +++ b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
> @@ -7,7 +7,7 @@ RDEPENDS_${PN} = "pseudo"
>   RDEPENDS_${PN}_virtclass-native = "pseudo-native"
>   RDEPENDS_${PN}_virtclass-nativesdk = "pseudo-nativesdk"
>   BASEPV = "2.2beta47"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "ftp://linux.mathematik.tu-darmstadt.de/pub/linux/oldstuff/people/okir/nfs-server-${BASEPV}.tar.gz \
>              file://001-2.2b47-2.2b51.patch \
> @@ -32,6 +32,7 @@ SRC_URI = "ftp://linux.mathematik.tu-darmstadt.de/pub/linux/oldstuff/people/okir
>              file://020-undefined-chmod-fix.patch \
>              file://021-nolibwrap.patch \
>              file://022-add-close-on-exec-descriptors.patch \
> +           file://023-no-rpc-register.patch \
>             "
>
>   SRC_URI[md5sum] = "79a29fe9f79b2f3241d4915767b8c511"
> diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
> index 3ee3112..5cb4bf2 100755
> --- a/scripts/runqemu-export-rootfs
> +++ b/scripts/runqemu-export-rootfs
> @@ -83,10 +83,12 @@ NFS_MOUNTPROG=$[ 21111 + $NFS_INSTANCE ]
>   NFS_NFSPROG=$[ 11111 + $NFS_INSTANCE ]
>   # NFS port number
>   NFS_PORT=$[ 3049 + $NFS_INSTANCE ]
> +# mountd port number
> +MOUNT_PORT=$[ 3048 + $NFS_INSTANCE ]
>
>   ## For debugging you would additionally add
>   ## --debug all
> -MOUNTD_OPTS="--allow-non-root --mount-pid $MOUNTPID -f $EXPORTS --rmtab $RMTAB --prog $NFS_MOUNTPROG -r"
> +MOUNTD_OPTS="--allow-non-root --mount-pid $MOUNTPID -f $EXPORTS --rmtab $RMTAB --prog $NFS_MOUNTPROG -r -P $MOUNT_PORT"
>   NFSD_OPTS="--allow-non-root --nfs-pid $NFSPID -f $EXPORTS --prog $NFS_NFSPROG -P $NFS_PORT -r"
>
>   # Setup the exports file
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index ce3291f..2968ed9 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -258,21 +258,15 @@ fi
>   if [ "$FSTYPE" = "nfs" ]; then
>       NFS_SERVER="192.168.7.1"
>       NFS_DIR=`echo $ROOTFS | sed 's/^[^:]*:\(.*\)/\1/'`
> -    MOUNTD_PORT=$[ 21111 + $NFS_INSTANCE ]
> -    NFSD_PORT=$[ 11111 + $NFS_INSTANCE ]
> -    UNFS_OPTS="nfsvers=2,mountprog=$MOUNTD_PORT,nfsprog=$NFSD_PORT,udp"
> +    MOUNTD_RPCPORT=$[ 21111 + $NFS_INSTANCE ]
> +    NFSD_RPCPORT=$[ 11111 + $NFS_INSTANCE ]
> +    NFSD_PORT=$[ 3049 + $NFS_INSTANCE ]
> +    MOUNTD_PORT=$[ 3048 + $NFS_INSTANCE ]
> +    UNFS_OPTS="nfsvers=2,mountprog=$MOUNTD_RPCPORT,nfsprog=$NFSD_RPCPORT,udp,port=$NFSD_PORT,mountport=$MOUNTD_PORT"
>
>       PSEUDO_LOCALSTATEDIR=~/.runqemu-sdk/pseudo
>       export PSEUDO_LOCALSTATEDIR
>
> -    rpcbind_running=`ps ax | grep rpcbind | grep -v grep | wc -l`
> -    portmap_running=`ps ax | grep portmap | grep -v grep | wc -l`
> -    if [[ $rpcbind_running == 0&&  $portmap_running == 0 ]]; then
> -        echo "You need to be running either rpcbind or portmap to continue"
> -        cleanup
> -        return
> -    fi
> -
>       # Start the userspace NFS server
>       echo "runqemu-export-rootfs restart $ROOTFS"
>       runqemu-export-rootfs restart $ROOTFS



