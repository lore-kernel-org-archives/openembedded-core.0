Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T4oZQ-0001bW-3e
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 09:44:44 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 24 Aug 2012 00:31:30 -0700
Received: by pbcxa7 with SMTP id xa7so2877761pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 00:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=oPNC2yNrk37FVyKhc9cuHDCLF90vpygliOw10hstFZI=;
	b=EB9CLz1jl4o7SPEyPHidLDyJ2xmOn0RItCMJ4YOXrgoRX3kX6gbWw8E1Ug3VvXVAv4
	stPvLsn4ejeYZYFu1rpVWA7LZqsdltX1ceq4sgik3IYOAsiMZNb8PGZ0EjG+MIZeUq05
	Eds6BKe7TiB9fk6u78WROtYvGqhUcdohMlkBnkNqpWxQ+MpwrJ4UPCTXpAv84ERnoTJv
	mG95xHog1xmb8FuNndhR+yFbGzQZk7VXVwQQXKEj86YwNG4xjHIaDx24nH+5L0vojHck
	8JrtNHV786sNgZqEzh1dGHa/0vNRbXUQko8pMbKRucERSzaAqFYQv7GWRHcwa4clXp7u
	G1eQ==
Received: by 10.66.88.40 with SMTP id bd8mr8830445pab.36.1345793490080;
	Fri, 24 Aug 2012 00:31:30 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id os1sm7760337pbc.31.2012.08.24.00.31.28
	(version=SSLv3 cipher=OTHER); Fri, 24 Aug 2012 00:31:29 -0700 (PDT)
Message-ID: <50372DE1.40704@intel.com>
Date: Fri, 24 Aug 2012 00:31:45 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1345686284.git.peter.seebach@windriver.com>
	<eef91770e809fcde924c197427cf4e1e956a29ae.1345686284.git.peter.seebach@windriver.com>
In-Reply-To: <eef91770e809fcde924c197427cf4e1e956a29ae.1345686284.git.peter.seebach@windriver.com>
X-Gm-Message-State: ALoCoQlvgNIS3jirD8yczsn7ooq7UcA3zGlhm0Z4s/EfSVXYdbJzxLi+8RKrD2tJA7i8G47shBUs
Subject: Re: [PATCH 1/1] runqemu-export-rootfs and friends: don't put pseudo db in target fs
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
X-List-Received-Date: Fri, 24 Aug 2012 07:44:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2012 06:47 PM, Peter Seebach wrote:
> In a few places, we have scripts which use <rootfs>/var/pseudo for
> the pseudo state directory controlling a given filesystem. This
> seems possibly risky because it means that stuff running under
> qemu or whatnot could wipe out the data being used to handle that
> rootfs. Move this to:
>    <rootfs>/../pseudo_state_$(basename $rootfs)
> to avoid problems.
>
> This also solves at least one case (not directly hit by yocto's
> tree) wherein you could end up trying to remove a rootfs while
> pseudo was using a database inside that rootfs, and thus the
> remove would fail.
>
> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>

I haven't tested this, but it appears to address the concerns I raised 
earlier.

With Jessica on vacation, could anyone else on the SDK team try this out 
and verify it with some sanity tests? e.g, boot some images using unfs 
and from an installed sdk.

Scott

> ---
>   .../installer/adt-installer/scripts/extract_rootfs |    8 ++++----
>   scripts/runqemu-export-rootfs                      |    2 +-
>   scripts/runqemu-extract-sdk                        |   15 +++++++++------
>   3 files changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/extract_rootfs b/meta/recipes-devtools/installer/adt-installer/scripts/extract_rootfs
> index 62dc170..fee463c 100755
> --- a/meta/recipes-devtools/installer/adt-installer/scripts/extract_rootfs
> +++ b/meta/recipes-devtools/installer/adt-installer/scripts/extract_rootfs
> @@ -28,7 +28,6 @@ extract_rootfs()
>     native_sysroot=$3
>     target_sysroot=$2
>     PSEUDO_COMMAND="$native_sysroot/usr/bin/pseudo"
> -  PSEUDO_OPTS="-P $natvie_sysroot/usr"
>     TAR_OPTS="-xjf"
>     PSEUDO_OPTS="-P $native_sysroot/usr"
>
> @@ -46,9 +45,10 @@ extract_rootfs()
>       mkdir -p "$target_sysroot"
>     fi
>
> -  mkdir -p "$target_sysroot/var/pseudo"
> -  touch "$target_sysroot/var/pseudo/pseudo.pid"
> -  PSEUDO_LOCALSTATEDIR="$target_sysroot/var/pseudo"
> +  pseudo_state_dir="$target_sysroot/../pseudo_state_$(basename "$target_sysroot")"
> +  mkdir -p "$pseudo_state_dir"
> +  touch "$pseudo_state_dir/pseudo.pid"
> +  PSEUDO_LOCALSTATEDIR="$pseudo_state_dir"
>     export PSEUDO_LOCALSTATEDIR
>
>     echo_info "Extracting rootfs: $1, using pseudo..."
> diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
> index f8213ba..0e0d32c 100755
> --- a/scripts/runqemu-export-rootfs
> +++ b/scripts/runqemu-export-rootfs
> @@ -68,7 +68,7 @@ NFSPID=~/.runqemu-sdk/nfs$NFS_INSTANCE.pid
>   MOUNTPID=~/.runqemu-sdk/mount$NFS_INSTANCE.pid
>
>   PSEUDO_OPTS="-P $OECORE_NATIVE_SYSROOT/usr"
> -PSEUDO_LOCALSTATEDIR="$NFS_EXPORT_DIR/var/pseudo"
> +PSEUDO_LOCALSTATEDIR="$NFS_EXPORT_DIR/../pseudo_state/$(basename $NFS_EXPORT_DIR)"
>   export PSEUDO_LOCALSTATEDIR
>
>   if [ ! -d "$PSEUDO_LOCALSTATEDIR" ]; then
> diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
> index 4b52475..88fdf0d 100755
> --- a/scripts/runqemu-extract-sdk
> +++ b/scripts/runqemu-extract-sdk
> @@ -73,15 +73,18 @@ if [ ! -d "$SDK_ROOTFS_DIR" ]; then
>   	mkdir -p "$SDK_ROOTFS_DIR"
>   fi
>
> -if [ -e "$SDK_ROOTFS_DIR/var/pseudo" ]; then
> -	echo "Error: $SDK_ROOTFS_DIR/var/pseudo already exists!"
> -	echo "Please delete the entire rootfs tree manually if this is really what you want"
> +pseudo_state_dir="$SDK_ROOTFS_DIR/../pseudo_state_$(basename "$SDK_ROOTFS_DIR")"
> +
> +if [ -e "$pseudo_state_dir" ]; then
> +	echo "Error: $pseudo_state_dir already exists!"
> +	echo "Please delete the rootfs tree and pseudo directory manually"
> +        echo "if this is really what you want."
>   	exit 1
>   fi
>
> -mkdir -p "$SDK_ROOTFS_DIR/var/pseudo"
> -touch "$SDK_ROOTFS_DIR/var/pseudo/pseudo.pid"
> -PSEUDO_LOCALSTATEDIR="$SDK_ROOTFS_DIR/var/pseudo"
> +mkdir -p "$pseudo_state_dir"
> +touch "$pseudo_state_dir/pseudo.pid"
> +PSEUDO_LOCALSTATEDIR="$pseudo_state_dir
>   export PSEUDO_LOCALSTATEDIR
>
>   echo "Extracting rootfs tarball using pseudo..."
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


