Received: from mail-bk0-f49.google.com ([209.85.214.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yanglei.fage@gmail.com>) id 1TuzNF-0004gh-J1
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 06:47:58 +0100
Received: by mail-bk0-f49.google.com with SMTP id jm19so2406141bkc.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2013 21:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gNIF3Iq54UO5gmoRHx0gpgOUzFkRqEXY/4bEhEdmurY=;
	b=vxw8KAwjMFCtTZu1N02WPgFzTHFVy2IaCuOdDSGSZO6ABVtIf1bPOEM00jImvb+J6H
	ciXkj0eT3vdIVBl8fR4W2m+Sj8wblGyyHbTYX2rjuCPI4iUYvlcNs7JkLVMXmBhZxCMK
	4jhhw3jmxUar9qi3maIMx1WeCO0tzOhBXVkDdOAUwuIXhFWhsFWmbUhSJKkdB2MRlIrj
	VwcFplrQnwa7ovd8DPup5a1L3G30vVd1kegNrIxtlaJx6mfoGh7TyTz/LsLS+CRtFiI0
	qjAw6KvXF0mFpO/Gly5WCFPTaaOGi2/FDY3xc2b3ZaMYMJ08Ba8wnL1Jad+H5gBnW34D
	JWOA==
MIME-Version: 1.0
Received: by 10.204.8.143 with SMTP id h15mr39606727bkh.115.1358227949590;
	Mon, 14 Jan 2013 21:32:29 -0800 (PST)
Received: by 10.204.11.86 with HTTP; Mon, 14 Jan 2013 21:32:29 -0800 (PST)
In-Reply-To: <96b27c5fa51c35070dda031c81f9ffaf554292bf.1356310727.git.rongqing.li@windriver.com>
References: <cover.1356310727.git.rongqing.li@windriver.com>
	<96b27c5fa51c35070dda031c81f9ffaf554292bf.1356310727.git.rongqing.li@windriver.com>
Date: Tue, 15 Jan 2013 13:32:29 +0800
Message-ID: <CAHsH0E9AQfm7kxziU3RXQKEmOpx18qR=eJ00HMCN0piQs2W2=g@mail.gmail.com>
From: lei yang <yanglei.fage@gmail.com>
To: rongqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] replace portmap with rpcbind.
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
X-List-Received-Date: Tue, 15 Jan 2013 05:47:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Rongqing,

I just find rpcbind introduce some packages conflicts, both rpcbind
and eglibc-utils provides rpcinfo. not sure who is responsible to fix
this.

Lei





On Mon, Dec 24, 2012 at 9:02 AM,  <rongqing.li@windriver.com> wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> Rpcbind has more features, like ipv6 support and nfs4 support;
> Redhat, Fedora, debian, Ubuntu are using rpcbind by default.
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb |    2 +-
>  .../initscripts/initscripts-1.0/mountnfs.sh            |   16 ++++++++--------
>  meta/recipes-core/packagegroups/packagegroup-base.bb   |    2 +-
>  3 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> index 5a4a7e7..84b8e76 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>
>  # util-linux for libblkid
>  DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers"
> -RDEPENDS_${PN} = "portmap"
> +RDEPENDS_${PN} = "rpcbind"
>  RRECOMMENDS_${PN} = "kernel-module-nfsd"
>
>  PR = "r5"
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
> index 82ec7f6..4fffe4e 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
> @@ -1,7 +1,7 @@
>  #!/bin/sh
>  ### BEGIN INIT INFO
>  # Provides:          mountnfs
> -# Required-Start:    $local_fs $network $portmap
> +# Required-Start:    $local_fs $network $rpcbind
>  # Required-Stop:
>  # Default-Start:     S
>  # Default-Stop:
> @@ -17,9 +17,9 @@ test -f /etc/fstab && (
>  #
>  #      Read through fstab line by line. If it is NFS, set the flag
>  #      for mounting NFS filesystems. If any NFS partition is found and it
> -#      not mounted with the nolock option, we start the portmapper.
> +#      not mounted with the nolock option, we start the rpcbind.
>  #
> -portmap=no
> +rpcbind=no
>  mount_nfs=no
>  mount_smb=no
>  mount_ncp=no
> @@ -45,7 +45,7 @@ do
>                         *nolock*)
>                                 ;;
>                         *)
> -                               portmap=yes
> +                               rpcbind=yes
>                                 ;;
>                 esac
>         fi
> @@ -65,12 +65,12 @@ done
>
>  exec 0>&1
>
> -if test "$portmap" = yes
> +if test "$rpcbind" = yes
>  then
> -       if test -x /sbin/portmap
> +       if test -x /usr/sbin/rpcbind
>         then
> -               echo -n "Starting portmapper... "
> -               start-stop-daemon --start --quiet --exec /sbin/portmap
> +               echo -n "Starting rpcbind... "
> +               start-stop-daemon --start --quiet --exec /usr/sbin/rpcbind
>                 sleep 2
>         fi
>  fi
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
> index 347a7e1..b3cdbad 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -328,7 +328,7 @@ RRECOMMENDS_packagegroup-base-cramfs = "\
>  #
>  SUMMARY_packagegroup-base-nfs = "NFS network filesystem support"
>  RDEPENDS_packagegroup-base-nfs = "\
> -    portmap"
> +    rpcbind"
>
>  RRECOMMENDS_packagegroup-base-nfs = "\
>      kernel-module-nfs "
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


