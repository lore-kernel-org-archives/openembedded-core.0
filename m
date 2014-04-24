Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0049965D34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 16:18:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3OGIXrR025497; Thu, 24 Apr 2014 17:18:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WCgwnSKUQdeZ; Thu, 24 Apr 2014 17:18:33 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3OGIRc7025483
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 24 Apr 2014 17:18:28 +0100
Message-ID: <1398356301.16672.184.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen.kooi@linaro.org>
Date: Thu, 24 Apr 2014 17:18:21 +0100
In-Reply-To: <1398335607-12046-1-git-send-email-koen.kooi@linaro.org>
References: <1398335607-12046-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] git: fix perl binding installation
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
X-List-Received-Date: Thu, 24 Apr 2014 16:18:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-04-24 at 12:33 +0200, Koen Kooi wrote:
> Git.pm wasn't ending up in the package because do_install removed it
> with a misleading comment about multilib. Fix the problem at the source
> so that Git.pm ends up in the correct dir *and* doesn't get deleted.
> 
> The perl.mak file gets updated during the regular do_install, so add an
> extra make install step to install the *.pm files to the correct
> directory.
> 
> This is the first step in making git-perltools actually work.
> 
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  meta/recipes-devtools/git/git.inc | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
> index f5013f1..aa9ca28 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -23,15 +23,24 @@ do_compile_prepend () {
>  	rm -f perl/perl.mak
>  }
>  
> +# The perl portion fails with -j16
> +PARALLEL_MAKEINST = ""
> +
>  do_install () {
>  	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
>  		template_dir=${datadir}/git-core/templates \
>  		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
>  
> +	sed -i -e 's#${STAGING_BINDIR_NATIVE}/perl-native/#${bindir}/#' \
> +	       -e 's#${STAGING_LIBDIR_NATIVE}/#${libdir}/#' \
> +	       -e 's#/lib/perl-native#/lib#g' \
> +	       ${S}/perl/perl.mak

Does this break git-native?

Cheers,

Richard

> +	cd ${S}/perl && oe_runmake install DESTDIR="${D}" bindir=${bindir}
> +
>  	# ${libdir} is not applicable here, perl-native files are always
>  	# installed to /usr/lib on both 32/64 bits targets.
>  	rm -rf ${D}${exec_prefix}/lib/perl-native
> -	rmdir ${D}${exec_prefix}/lib || true
>  }
>  
>  PERLSEDFIXUP = " \
> @@ -75,6 +84,7 @@ PERLTOOLS = " \
>  PACKAGES =+ "${PN}-perltools"
>  FILES_${PN}-perltools += " \
>      ${PERLTOOLS} \
> +    ${prefix}/lib/perl \
>      ${datadir}/perl \
>  "
>  RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
> -- 
> 1.9.0
> 



