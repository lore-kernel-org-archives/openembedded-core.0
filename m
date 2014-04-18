Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D230865D3F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 20:25:37 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Apr 2014 13:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,885,1389772800"; d="scan'208";a="420888085"
Received: from rmcintyr-mobl.ger.corp.intel.com (HELO [10.255.12.108])
	([10.255.12.108])
	by azsmga001.ch.intel.com with ESMTP; 18 Apr 2014 13:25:13 -0700
Message-ID: <53518A29.3090802@linux.intel.com>
Date: Fri, 18 Apr 2014 13:25:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
References: <1397725659-9004-1-git-send-email-koen.kooi@linaro.org>
In-Reply-To: <1397725659-9004-1-git-send-email-koen.kooi@linaro.org>
Subject: Re: [PATCH 1/3] git: fix perl binding installation
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
X-List-Received-Date: Fri, 18 Apr 2014 20:25:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/17/2014 02:07 AM, Koen Kooi wrote:
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
>   meta/recipes-devtools/git/git.inc | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
> index f5013f1..888b2a5 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -28,10 +28,16 @@ do_install () {
>   		template_dir=${datadir}/git-core/templates \
>   		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
>
> +	sed -i -e 's#${STAGING_BINDIR_NATIVE}/perl-native/#${bindir}/#' \
> +	       -e 's#${STAGING_LIBDIR_NATIVE}/#${libdir}/#' \
> +	       -e 's#/lib/perl-native#/lib#g' \
> +	       ${S}/perl/perl.mak
> +
> +	cd ${S}/perl && oe_runmake install DESTDIR="${D}" bindir=${bindir}
> +

Koen,

This still seems to have a problem, and yes I have all 3 patches

> | NOTE: make -j 16 NO_PYTHON=1 RUNTIME_PREFIX=1 NO_GETTEXT=1 install DESTDIR=/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/git/1.9.0-r0/image bindir=/usr/bin
> | make[1]: Entering directory `/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/git/1.9.0-r0/git-1.9.0/perl'
> | make[1]: *** No rule to make target `/usr/lib/perl/5.14.3/Config.pm', needed by `perl.mak'.  Stop.
> | make[1]: Leaving directory `/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/git/1.9.0-r0/git-1.9.0/perl'
> | make: *** [install] Error 2
> | ERROR: oe_runmake failed


Sau!



>   	# ${libdir} is not applicable here, perl-native files are always
>   	# installed to /usr/lib on both 32/64 bits targets.
>   	rm -rf ${D}${exec_prefix}/lib/perl-native
> -	rmdir ${D}${exec_prefix}/lib || true
>   }
>
>   PERLSEDFIXUP = " \
> @@ -75,6 +81,7 @@ PERLTOOLS = " \
>   PACKAGES =+ "${PN}-perltools"
>   FILES_${PN}-perltools += " \
>       ${PERLTOOLS} \
> +    ${prefix}/lib/perl \
>       ${datadir}/perl \
>   "
>   RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
>

