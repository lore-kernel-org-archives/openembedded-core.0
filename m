Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 140786065F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 06:36:13 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VBfY5-0003rL-0W; Tue, 20 Aug 2013 08:36:13 +0200
Message-ID: <1376980561.4083.25.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: jackie.huang@windriver.com
Date: Tue, 20 Aug 2013 07:36:01 +0100
In-Reply-To: <13b92f067594e8aceac11c7964242fafdfb21f8d.1376968627.git.jackie.huang@windriver.com>
References: <cover.1376968627.git.jackie.huang@windriver.com>
	<13b92f067594e8aceac11c7964242fafdfb21f8d.1376968627.git.jackie.huang@windriver.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] nfs-utils: add init.d/nfsserver status command for LSB compliance
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
X-List-Received-Date: Tue, 20 Aug 2013 06:36:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-08-20 at 11:25 +0800, jackie.huang@windriver.com wrote:
> @@ -23,6 +25,7 @@ test -r /etc/default/nfsd && . /etc/default/nfsd
>  test -x "$NFS_MOUNTD" || NFS_MOUNTD=/usr/sbin/rpc.mountd
>  test -x "$NFS_NFSD" || NFS_NFSD=/usr/sbin/rpc.nfsd
>  test -x "$NFS_STATD" || NFS_STATD=/usr/sbin/rpc.statd
> +test -z "$STATD_PID" && STATD_PID=/var/run/rpc.statd.pid
>  #
>  # The user mode program must also exist (it just starts the kernel
>  # threads using the kernel module code).
> @@ -75,6 +78,17 @@ stop_mountd(){
>  #
>  #nfsd
>  start_nfsd(){
> +        modprobe -q nfsd
> +	grep -q nfsd /proc/filesystems || {
> +		echo NFS daemon support not enabled in kernel
> +		exit 1
> +        }
> +	grep -q nfsd /proc/mounts || mount -t nfsd nfsd /proc/fs/nfsd
> +	grep -q nfsd /proc/mounts || {
> +		echo nfsd filesystem could not be mounted at /proc/fs/nfsd
> +		exit 1
> +        }
> +
>  	echo -n "starting $1 nfsd kernel threads: "
>  	start-stop-daemon --start --exec "$NFS_NFSD" -- "$@"
>  	echo done
> @@ -113,14 +127,14 @@ stop_nfsd(){
>  #statd
>  start_statd(){
>  	echo -n "starting statd: "
> -	start-stop-daemon --start --exec "$NFS_STATD"
> +	start-stop-daemon --start --exec "$NFS_STATD" --pidfile "$STATD_PID"
>  	echo done
>  }
>  stop_statd(){
>  	# WARNING: this kills any process with the executable
>  	# name 'statd'.
>  	echo -n 'stopping statd: '
> -	start-stop-daemon --stop --quiet --signal 1 --name statd
> +	start-stop-daemon --stop --quiet --signal 1 --pidfile "$STATD_PID"
>  	echo done
>  }
>  #----------------------------------------------------------------------

This stuff doesn't seem to e directly related to the "status" command.

p.



