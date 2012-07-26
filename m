Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SuU2x-0002Xb-Bu for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:48:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QJb00K025181
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 20:37:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24423-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 20:36:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QJaogM025175
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 20:36:53 +0100
Message-ID: <1343331410.7600.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 20:36:50 +0100
In-Reply-To: <1343329298-29586-1-git-send-email-yao.zhao@windriver.com>
References: <1343329298-29586-1-git-send-email-yao.zhao@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2] bzip2-native: handling native path issue
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
X-List-Received-Date: Thu, 26 Jul 2012 19:48:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-26 at 15:01 -0400, Yao Zhao wrote:
> follow Richard's approach, modify bzip2-native recipe to install bzip2 package
> binaries to STAGING_BINDIR_NATIVE/bzip2-native to avoid problems when other
> package is doing upack to reference bzip2. libbz2.so* still installs to
> STAGING_LIBDIR_NATIVE.
> 
> add bzip2native.bbclass to let other packages to inherit and add dependency
> to bzip2-replacement-native.
> 
> change python-native to inherit bzip2native class and remove the old
> bzip2-full-native dependency.
> 
> Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ---
>  meta/classes/bzip2native.bbclass                   |    2 ++
>  .../recipes-devtools/python/python-native_2.7.3.bb |    4 ++--
>  meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |    4 +++-
>  3 files changed, 7 insertions(+), 3 deletions(-)
>  create mode 100644 meta/classes/bzip2native.bbclass
> 
> diff --git a/meta/classes/bzip2native.bbclass b/meta/classes/bzip2native.bbclass
> new file mode 100644
> index 0000000..a2a7b31
> --- /dev/null
> +++ b/meta/classes/bzip2native.bbclass
> @@ -0,0 +1,2 @@
> +EXTRANATIVEPATH += "bzip2-native"
> +DEPENDS += "bzip2-replacement-native"
> diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
> index c89f9f9..904dc80 100644
> --- a/meta/recipes-devtools/python/python-native_2.7.3.bb
> +++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
> @@ -1,5 +1,5 @@
>  require python.inc
> -DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
> +DEPENDS = "openssl-native zlib-native readline-native sqlite3-native"
>  PR = "${INC_PR}.1"
>  
>  SRC_URI += "file://04-default-is-optimized.patch \
> @@ -16,7 +16,7 @@ SRC_URI += "file://04-default-is-optimized.patch \
>             "
>  S = "${WORKDIR}/Python-${PV}"
>  
> -inherit native
> +inherit native bzip2native
>  
>  RPROVIDES += "python-distutils-native python-compression-native python-textutils-native python-core-native"

In this case, since we have a single user I'd just add:

EXTRANATIVEPATH += "bzip2-native"

to the python-native recipe and no need for the bbclass and change
DEPENDS to include bzip2-replacement-native instead of
bzip2-full-native. So nearly there, just one more tweak needed.

Cheers,

Richard


> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> index 43b462a..e0c710b 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> @@ -24,6 +24,8 @@ inherit autotools update-alternatives
>  ALTERNATIVE_PRIORITY = "100"
>  ALTERNATIVE_${PN} = "bunzip2 bzcat"
>  
> +#install binaries to bzip2-native under sysroot for replacement-native
> +EXTRA_OECONF_virtclass-native += "--bindir=${STAGING_BINDIR_NATIVE}/${PN}"
>  do_configure_prepend () {
>  	cp ${WORKDIR}/configure.ac ${S}/
>  	cp ${WORKDIR}/Makefile.am ${S}/
> @@ -40,5 +42,5 @@ FILES_libbz2-staticdev = "${libdir}/*.a"
>  SECTION_libbz2-staticdev = "devel"
>  RDEPENDS_libbz2-staticdev = "libbz2-dev (= ${EXTENDPKGV})"
>  
> -PROVIDES_append_virtclass-native = " bzip2-full-native"
> +PROVIDES_append_virtclass-native = " bzip2-replacement-native"
>  BBCLASSEXTEND = "native"




