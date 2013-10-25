Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id C00D56D364
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 12:31:37 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id ar20so6132637iec.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 05:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jKWXQ6+PEBGRV4lNwDs0Ww2R/o/inug90TWAaY1aZAg=;
	b=mzW6Bjzby8f4d4L/IMQecgHgahQZN+zz5EAAhyISzcODhXIYaO/g2pBPYGmEE7xygN
	l746t7KT0K5nNrc1RKiwpVE231xcm7muiM/zHQ8QWQ2+ghj33dIsmg1AFcA7sPAht12i
	6LGLeo8zMQCe1ZeBea/Xzefbv1VcMVKhjbEV2FLN+VNaV3YizpZ0vU+MJLDEccbPyAuS
	MIEgy+UXEU5VOFj18ZwnaaVe+B/0WcuUFerstcOwuluwjAG7XDgSQjplCI5UIFvzHGc3
	GVSZ4ltsXpr4p3tcYypkYJvCewqaPWTO1ekpD4jqI1dc987b7MDNJUJL4kO5g7DZn4f0
	fYdQ==
X-Received: by 10.50.26.36 with SMTP id i4mr1932286igg.33.1382704299666; Fri,
	25 Oct 2013 05:31:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Fri, 25 Oct 2013 05:31:09 -0700 (PDT)
In-Reply-To: <1382411039-1161-1-git-send-email-qiang.chen@windriver.com>
References: <1382411039-1161-1-git-send-email-qiang.chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2013 05:31:09 -0700
Message-ID: <CAMKF1sqyAqZFrMnM39g=uqOx-QrNbXmwQs2s0tf30HWobKsXXA@mail.gmail.com>
To: qiang.chen@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nfs-utils: Stop rpc.statd correctly
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
X-List-Received-Date: Fri, 25 Oct 2013 12:31:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 21, 2013 at 8:03 PM,  <qiang.chen@windriver.com> wrote:
> From: Qiang Chen <qiang.chen@windriver.com>
>
> An incorrect process name in the nfsserver initscript prevented
> rpc.statd from being shut down.
>
> root@qemux86-64:~# /etc/init.d/nfsserver start
> creating NFS state directory: done
> starting 8 nfsd kernel threads: done
> starting mountd: done
> starting statd: done
>
> root@qemux86-64:~# ps | grep rpc.statd
>   650 root     10532 S    /usr/sbin/rpc.statd
>   654 root      4720 S    grep rpc.statd
>
> root@qemux86-64:~# /etc/init.d/nfsserver stop
> stopping statd: done
> stopping mountd: done
> stopping nfsd: done
>
> root@qemux86-64:~# ps | grep rpc.statd
>   650 root     10532 S    /usr/sbin/rpc.statd
>   662 root      4720 S    grep rpc.statd
>
> As this daemon drops a pid file,simply use that instead.
> Also add some initialization checks so the daemons are not
> left partially started in the absence of kernel nfsd support.
>
> Signed-off-by: Andy Ross <andy.ross@windriver.com>
> Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
> ---

I think this patch is needed for dora branch too.

>  .../nfs-utils/nfs-utils/nfsserver                  |   18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> index 1ac6fec..8ee8d0b 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> @@ -25,6 +25,7 @@ test -r /etc/default/nfsd && . /etc/default/nfsd
>  test -x "$NFS_MOUNTD" || NFS_MOUNTD=/usr/sbin/rpc.mountd
>  test -x "$NFS_NFSD" || NFS_NFSD=/usr/sbin/rpc.nfsd
>  test -x "$NFS_STATD" || NFS_STATD=/usr/sbin/rpc.statd
> +test -z "$STATD_PID" && STATD_PID=/var/run/rpc.statd.pid
>  #
>  # The user mode program must also exist (it just starts the kernel
>  # threads using the kernel module code).
> @@ -77,6 +78,17 @@ stop_mountd(){
>  #
>  #nfsd
>  start_nfsd(){
> +        modprobe -q nfsd
> +       grep -q nfsd /proc/filesystems || {
> +               echo NFS daemon support not enabled in kernel
> +               exit 1
> +        }
> +       grep -q nfsd /proc/mounts || mount -t nfsd nfsd /proc/fs/nfsd
> +       grep -q nfsd /proc/mounts || {
> +               echo nfsd filesystem could not be mounted at /proc/fs/nfsd
> +               exit 1
> +        }
> +
>         echo -n "starting $1 nfsd kernel threads: "
>         start-stop-daemon --start --exec "$NFS_NFSD" -- "$@"
>         echo done
> @@ -115,14 +127,12 @@ stop_nfsd(){
>  #statd
>  start_statd(){
>         echo -n "starting statd: "
> -       start-stop-daemon --start --exec "$NFS_STATD"
> +       start-stop-daemon --start --exec "$NFS_STATD" --pidfile "$STATD_PID"
>         echo done
>  }
>  stop_statd(){
> -       # WARNING: this kills any process with the executable
> -       # name 'statd'.
>         echo -n 'stopping statd: '
> -       start-stop-daemon --stop --quiet --signal 1 --name statd
> +       start-stop-daemon --stop --quiet --signal 1 --pidfile "$STATD_PID"
>         echo done
>  }
>  #----------------------------------------------------------------------
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

