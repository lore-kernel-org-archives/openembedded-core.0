Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7qEf-0006wv-4N for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 16:35:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EFQlGH009377
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 15:26:47 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09195-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 15:26:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EFQeuX009371
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 15:26:41 GMT
Message-ID: <1331738800.18586.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 15:26:40 +0000
In-Reply-To: <34489f7f0d7f0457df45e2ee4606b51a09ed1704.1331716010.git.liezhi.yang@windriver.com>
References: <cover.1331716010.git.liezhi.yang@windriver.com>
	<34489f7f0d7f0457df45e2ee4606b51a09ed1704.1331716010.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] gcc-cross: aviod creating invalid symlinks
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
X-List-Received-Date: Wed, 14 Mar 2012 15:35:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-14 at 17:13 +0800, Robert Yang wrote:
> There are several invalid symlinks in gcc-cross-initial,
> gcc-cross-intermediate and gcc-cross, these cause the error:(56 errors)
> 
> tmp/work/i586-poky-linux/gcc-cross-initial-4.6.3+svnr184847-r23/temp/log.do_populate_sysroot:
> log.do_populate_sysroot:grep: /path/to/invalid/symlink: No such file or directory
> 
> Avoid creating invalid symlinks would fix this problem.
> 
> Use the:
> [ ! -e file ] || do_something
> But not use:
> [ -e file ] && do_something
> is because that if the "file" doesn't exist, then the whole statement
> would return false, and bitbake treats this an error, so use the "||" to
> let it always be true.
> 
> [YOCTO #2095]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../gcc/gcc-cross-intermediate.inc                 |    3 ++-
>  meta/recipes-devtools/gcc/gcc-package-cross.inc    |    6 ++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> index ea105e6..87d11ab 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> @@ -51,7 +51,8 @@ do_install () {
>  	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
>  	install -d $dest
>  	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
> -		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
> +		[ ! -e ${BINRELPATH}/${TARGET_PREFIX}$t ] || \
> +	        ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
>  	done
>  }
>  
> diff --git a/meta/recipes-devtools/gcc/gcc-package-cross.inc b/meta/recipes-devtools/gcc/gcc-package-cross.inc
> index e32412c..3d52d23 100644
> --- a/meta/recipes-devtools/gcc/gcc-package-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-package-cross.inc
> @@ -19,8 +19,10 @@ do_install () {
>  	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
>  	install -d $dest
>  	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
> -		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
> -		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
> +        if [ -e ${BINRELPATH}/${TARGET_PREFIX}$t ]; then
> +		    ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
> +		    ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
> +        fi
>  	done
>  
>  	# Remove things we don't need but keep share/java


I've had to revert this, it totally broke the mips/ppc/arm toolchains.
See the failures on the autobuilder, e.g.
http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/338/steps/shell_33/logs/stdio in eglibc-initial. The problem is that the location we're symlinking to may not be installed yet. For example, gcc provides "${TARGET_PREFIX}gcc" but it won't be installed at the location we point at until after gcc's populate_sysroot function runs. The tests you're using are therefore not adding as many symlinks as we need.

Cheers,

Richard




