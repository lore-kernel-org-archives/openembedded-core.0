Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T4EBO-0001vo-Qp
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 18:53:31 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 22 Aug 2012 09:34:40 -0700
Received: by pbcxa7 with SMTP id xa7so1660673pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 09:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=CJsCvebT4KcUSy5pK4uQWKIXcve/XDKM8rDj1MeGlHc=;
	b=XETgZs0oerwo6s5rAgMWAnspxUzbrrEh4H6c0FJ+i2N7/dvoTVI8678VpBlzz3e1v2
	jAoPRk+2Zbc2vRSrAVLf3PBQD4pinQWfPH9c6qgkwAhAScgUYUaSMzJpmlrAByx/C6If
	Jj7+QuolL5VYYLftO/eYEP5JbR0Roz91qMivkSolOqF41WeBWDtfM5EpIcijqmw4sI+H
	jlaSgFkgkBlhmHfVCnnunBDKoDds1e1tQMP0QWBls1fCn5ulcnmSR8F+k+D0eqPYp7ok
	WgBIrvrqP3XEIYax+5dQ8wgFv4CDw7Zzbf5sxxBNzRyHVmU903X34mD44bFqdwu7Gx3Q
	TYvw==
Received: by 10.66.79.195 with SMTP id l3mr47240690pax.33.1345653279850;
	Wed, 22 Aug 2012 09:34:39 -0700 (PDT)
Received: from [10.1.10.35] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id uy3sm4018826pbc.29.2012.08.22.09.34.37
	(version=SSLv3 cipher=OTHER); Wed, 22 Aug 2012 09:34:39 -0700 (PDT)
Message-ID: <50350A1B.4060505@intel.com>
Date: Wed, 22 Aug 2012 09:34:35 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1345573717.git.peter.seebach@windriver.com>
	<511616ed1761453ec1323aa945c559ca6cafffd1.1345573717.git.peter.seebach@windriver.com>
In-Reply-To: <511616ed1761453ec1323aa945c559ca6cafffd1.1345573717.git.peter.seebach@windriver.com>
X-Gm-Message-State: ALoCoQlo0pqrM71seolubvDMcgaA/d6G+sBJSvZfXB0z6wwbYUF+Ha7y3HoX9Vc91hGBg8+1We+v
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
X-List-Received-Date: Wed, 22 Aug 2012 16:53:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/21/2012 11:31 AM, Peter Seebach wrote:
> In a few places, we have scripts which use <rootfs>/var/pseudo for
> the pseudo state directory controlling a given filesystem. This
> seems possibly risky because it means that stuff running under
> qemu or whatnot could wipe out the data being used to handle that
> rootfs.
>
> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> ---
>   .../installer/adt-installer/scripts/extract_rootfs |    7 +++----
>   scripts/runqemu-export-rootfs                      |    2 +-
>   scripts/runqemu-extract-sdk                        |   13 +++++++------
>   3 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/extract_rootfs b/meta/recipes-devtools/installer/adt-installer/scripts/extract_rootfs
> index 62dc170..0bbbeef 100755
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
> @@ -46,9 +45,9 @@ extract_rootfs()
>       mkdir -p "$target_sysroot"
>     fi
>
> -  mkdir -p "$target_sysroot/var/pseudo"
> -  touch "$target_sysroot/var/pseudo/pseudo.pid"
> -  PSEUDO_LOCALSTATEDIR="$target_sysroot/var/pseudo"
> +  mkdir -p "$target_sysroot/../pseudo_state"
> +  touch "$target_sysroot/../pseudo_state/pseudo.pid"
> +  PSEUDO_LOCALSTATEDIR="$target_sysroot/../pseudo_state"
>     export PSEUDO_LOCALSTATEDIR

This would mean that if someone tried to put multiple rootfs directories 
in the same subdirectory, they could clobber each other's pseudo_state 
data, correct? Putting multiple rootfs directories in the same subdir is 
a common use case already, I don't think we could break that.

If you appended the top-level rootfs directory name to ../pseudo_state, 
e.g, ../pseudo_state_<dirname>, that would keep the pseudo_state 
directories separate and make it fairly obvious what rootfs they 
belonged to.

Also, neither of these schemes would support having $target_sysroot 
directly under / (though I'm not sure why someone would do that).

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


