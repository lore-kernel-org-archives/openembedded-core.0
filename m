Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-02.prod.phx3.secureserver.net
	(p3plsmtpa08-02.prod.phx3.secureserver.net [173.201.193.103])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF5465CD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 10:32:24 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa08-02.prod.phx3.secureserver.net with 
	id uyYM1o0070BVjqb01yYMLR; Wed, 24 Sep 2014 03:32:22 -0700
Message-ID: <54229DB5.90806@pabigot.com>
Date: Wed, 24 Sep 2014 05:32:21 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1411148655-5500-1-git-send-email-pab@pabigot.com>
In-Reply-To: <1411148655-5500-1-git-send-email-pab@pabigot.com>
Subject: Re: [PATCH] git: add Git perl module to perltools package
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
X-List-Received-Date: Wed, 24 Sep 2014 10:32:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Ping for this one too (it re-opened Yocto #3780 and has 1.7 as a due date).

That's all I expect to have for 1.7, unless u-boot 2014.07 gets in 
(there's a patch needed for BBB in that case, but it's already in 
meta-ti's version).

Peter


On 09/19/2014 12:44 PM, Peter A. Bigot wrote:
> Git perl tools such as add--interactive load the Git module at runtime.
> A previous patch to eliminate a QA error by deleting it instead of
> packaging it was incorrect.
>
>      beaglebone[62]$ git add -i
>      Can't locate Git.pm in @INC (you may need to install the Git module) (@INC contains: /usr/lib/perl/5.20.0 /prj/pab/Utils/lib/perl5/linux-arm/5.020000 /prj/pab/Utils/lib/perl5/ /prj/pab/Utils/lib/perl5/site_perl/linux-arm /prj/pab/Utils/lib/perl5/site_perl /etc/perl /usr/lib/perl/site_perl/5.20.0/ /usr/lib/perl/site_perl/5.20.0 /usr/lib/perl/vendor_perl/5.20.0/ /usr/lib/perl/vendor_perl/5.20.0 /usr/lib/perl/5.20.0/ /usr/local/lib/site_perl .) at /usr/lib/git/git-core/git-add--interactive line 7.
>      BEGIN failed--compilation aborted at /usr/lib/git/git-core/git-add--interactive line 7.
>
> [YOCTO#3780]
>
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>   meta/recipes-devtools/git/git.inc | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
> index 7633577..3580275 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -30,11 +30,6 @@ do_install () {
>   	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
>   		template_dir=${datadir}/git-core/templates \
>   		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
> -
> -	# ${libdir} is not applicable here, perl-native files are always
> -	# installed to /usr/lib on both 32/64 bits targets.
> -	rm -rf ${D}${exec_prefix}/lib/perl-native
> -	rmdir ${D}${exec_prefix}/lib || true
>   }
>   
>   PERLSEDFIXUP = " \
> @@ -48,6 +43,8 @@ REL_GIT_TEMPLATE_DIR = "${@os.path.relpath(datadir, bindir)}/git-core/templates"
>   
>   do_install_append_class-target () {
>   	${PERLSEDFIXUP}
> +	mv ${D}${libdir}/perl-native/perl ${D}${libdir}
> +	rmdir ${D}${libdir}/perl-native || true
>   }
>   
>   do_install_append_class-native() {
> @@ -90,6 +87,7 @@ PERLTOOLS = " \
>   PACKAGES =+ "${PN}-perltools"
>   FILES_${PN}-perltools += " \
>       ${PERLTOOLS} \
> +    ${libdir}/perl \
>       ${datadir}/perl \
>   "
>   RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"


