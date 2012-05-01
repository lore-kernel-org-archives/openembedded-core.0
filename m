Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPD7H-0005al-GI for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 15:27:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q41DI0EA014544
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 14:18:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13377-07 for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2012 14:17:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q41DHnP5014500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 14:17:51 +0100
Message-ID: <1335878270.7415.104.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 01 May 2012 14:17:50 +0100
In-Reply-To: <c5a3097cc2507d3fe49f113684912d4804ed02bd.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
	<c5a3097cc2507d3fe49f113684912d4804ed02bd.1335824356.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 19/19] gcc-package-target: add libexec for plugins
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
X-List-Received-Date: Tue, 01 May 2012 13:27:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-30 at 15:21 -0700, Saul Wold wrote:
> Fixes:
> 
> ERROR: For recipe gcc, the following files/directories were installed but not shipped in any package:
> ERROR:   /usr/libexec/gcc/i586-poky-linux/4.7.1/plugin/gengtype
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.7.inc            |    2 +-
>  meta/recipes-devtools/gcc/gcc-package-target.inc |   11 ++++-------
>  2 files changed, 5 insertions(+), 8 deletions(-)

Saul, this patch does other things in addition to what is described
above. Why?

Cheers,

Richard


> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index 784a3be..8adeb8d 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -1,6 +1,6 @@
>  require gcc-common.inc
>  
> -PR = "r0"
> +PR = "r1"
>  
>  # Third digit in PV should be incremented after a minor release
>  # happens from this branch on gcc e.g. currently its 4.7.0
> diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
> index d58e001..392dfc4 100644
> --- a/meta/recipes-devtools/gcc/gcc-package-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
> @@ -1,5 +1,5 @@
>  PACKAGES = "\
> -  ${PN} ${PN}-plugins ${PN}-symlinks \
> +  ${PN} ${PN}-symlinks \
>    g++ g++-symlinks \
>    cpp cpp-symlinks \
>    g77 g77-symlinks \
> @@ -36,20 +36,17 @@ FILES_${PN}-dev = "\
>  "
>  FILES_${PN}-plugin-dev = "\
>    ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
> -  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gengtype \
>    ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.state \
> +  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/gengtype \
>  "
> +ALLOW_EMPTY_${PN}-plugin-dev = "1"
> +
>  FILES_${PN}-symlinks = "\
>    ${bindir}/cc \
>    ${bindir}/gcc \
>    ${bindir}/gccbug \
>  "
>  
> -FILES_${PN}-plugins = "\
> -  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin \
> -"
> -ALLOW_EMPTY_${PN}-plugins = "1"
> -
>  FILES_g77 = "\
>    ${bindir}/${TARGET_PREFIX}g77 \
>    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \




