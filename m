Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U5Nox-00056P-Bu for Openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 22:55:29 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1CLjGoF026979; Tue, 12 Feb 2013 21:45:17 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7T4FJGxMkw77; Tue, 12 Feb 2013 21:45:16 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1CLj8iO026953
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 12 Feb 2013 21:45:11 GMT
Message-ID: <1360705147.30425.70.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Tue, 12 Feb 2013 21:39:07 +0000
In-Reply-To: <1360697804-39039-1-git-send-email-jason.wessel@windriver.com>
References: <1360697804-39039-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libtool-native_2.4.2.bb: Always use /bin/sed for SED
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
X-List-Received-Date: Tue, 12 Feb 2013 21:55:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-02-12 at 13:36 -0600, Jason Wessel wrote:
> If you never use sstate and always build everything from scratch you
> will never see this problem.  However, if you use sstate and build
> directories that last a long time eventually you can end up with the
> scenario where libtool gets a hard coded path in it for sed, and sed
> may not exist.  The reason you don't see this problem to often if you
> generally build from scratch is that libtool builds before sed and
> will pickup the host's /bin/sed.
> 
> The way to reproduce the issue is:
> 
> bitbake some_image
> bitbake -c cleansstate libtool-native
> bitbake sed-native
> bitbake libtool-native
> bitbake -c clean sed-native
> bitbake ANY_PACKAGE_THAT_USES_LIBTOOL_NATIVE
> 
> In my case I used modphp, which doesn't exist in the oe-core. You will
> end up with a strange looking error like:
> 
> | make[1]: *** [buckets/apr_buckets_alloc.lo] Error 1
> | /opt/build/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-libtool: line 981: /opt/build/bitbake_build/tmp/sysroots/x86_64-linux//bin/sed: No such file or directory
> 
> The solution is to always use /bin/sed for libtool-native.
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  .../libtool/libtool-native_2.4.2.bb                |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
> index f12e6a1..18188ef 100644
> --- a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
> +++ b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
> @@ -2,12 +2,13 @@ require libtool-${PV}.inc
>  
>  DEPENDS = ""
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  SRC_URI += "file://prefix.patch"
>  
>  inherit native
>  
>  EXTRA_OECONF = " --with-libtool-sysroot=${STAGING_DIR_NATIVE}"
> +CACHED_CONFIGUREVARS += "ac_cv_path_SED=/bin/sed"

Do we have to set a path for it? Can't we rely on PATH being sane? I'm
wondering if we should actually set this in the core site files.
Hardcoding a path to utilities never usually ends well and this is just
the tip of an iceberg.

If we have to use a path, "${bindir}/env sed"?

Cheers,

Richard



