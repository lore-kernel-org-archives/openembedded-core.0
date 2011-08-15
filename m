Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QsyLr-0002BI-Ee for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 16:41:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FEaaY8017722
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:36:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17517-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:36:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FEaU9j017716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:36:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <6da4b426f8aa96335542deb671a21f99b8e0f398.1313141568.git.xiaofeng.yan@windriver.com>
References: <cover.1313141568.git.xiaofeng.yan@windriver.com>
	<6da4b426f8aa96335542deb671a21f99b8e0f398.1313141568.git.xiaofeng.yan@windriver.com>
Date: Mon, 15 Aug 2011 15:36:28 +0100
Message-ID: <1313418988.14274.593.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] qt3: fix bug 1348
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
X-List-Received-Date: Mon, 15 Aug 2011 14:41:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-12 at 18:18 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> [YOCTO #1348]
> 
> The variable is different when building qt-x11-free-native and qt-x11-free. The
> different cause this bug.
> $ bitbake qt-x11-free-native -e | grep ^TARGET_OS
> TARGET_OS="linux"
> $ bitbake qt-x11-free -e | grep ^TARGET_OS
> TARGET_OS="linux-gnueabi"
> 
> So I add a task function before do_configure for linking ${TARGET_OS} to linux-g++.
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  recipes-qt3/qt3/qt-x11-free-common.inc |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes-qt3/qt3/qt-x11-free-common.inc b/recipes-qt3/qt3/qt-x11-free-common.inc
> index e486c52..9e6cc81 100644
> --- a/recipes-qt3/qt3/qt-x11-free-common.inc
> +++ b/recipes-qt3/qt3/qt-x11-free-common.inc
> @@ -3,7 +3,7 @@ SECTION = "x11/libs"
>  PRIORITY = "optional"
>  LICENSE = "GPL | QPL"
>  HOMEPAGE = "http://www.trolltech.com"
> -PR = "r0"
> +PR = "r1"
>  
>  S = "${WORKDIR}/qt-x11-free-${PV}"
>  
> @@ -24,6 +24,12 @@ EXTRA_ENV = 'QMAKE="${STAGING_BINDIR_NATIVE}/qmake -after INCPATH+=${STAGING_INC
>               AR="${TARGET_PREFIX}ar cqs" \
>               MOC="${STAGING_BINDIR_NATIVE}/moc3" UIC="${STAGING_BINDIR_NATIVE}/uic3" MAKE="make -e"'
>  
> +do_configure_prepend() {
> +    if [ ! -L ${QMAKE_MKSPEC_PATH}/${TARGET_OS}-oe-g++ ]; then
> +        ln -sf ${QMAKE_MKSPEC_PATH}/linux-g++ ${QMAKE_MKSPEC_PATH}/${TARGET_OS}-oe-g++
> +    fi
> +}
> +
>  do_configure() {
>  	echo "yes" | ./configure -prefix ${prefix} ${QT_CONFIG_FLAGS} -no-fast \
>  		-L${STAGING_LIBDIR} -I${STAGING_INCDIR} -I${STAGING_INCDIR}/freetype2 -I${STAGING_INCDIR}/mysql

Thanks, this looks like a better fix to me. I've merged this with an
updated commit message. The commit message summary needs to state what
the problem is, not just a bug number.

Cheers,

Richard





