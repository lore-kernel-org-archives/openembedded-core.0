Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13386601A8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 03:44:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s983iuDo012538
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Oct 2014 20:44:57 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 7 Oct 2014 20:44:56 -0700
Message-ID: <5434B337.4050509@windriver.com>
Date: Wed, 8 Oct 2014 11:44:55 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: "Peter A. Bigot" <pab@pabigot.com>,
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 08 Oct 2014 03:45:03 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Peter,

On 09/20/2014 01:44 AM, Peter A. Bigot wrote:
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

We can't use the ${libdir} to replace of the {D}${exec_prefix}/lib as
the comment said that:

# ${libdir} is not applicable here, perl-native files are always
# installed to /usr/lib on both 32/64 bits targets.

Other wise we would get errors when:
MACHINE = qemux86-64 and libdir = /usr/lib64:
     mv: cannot stat `/path/to/image/usr/lib64/perl-native/perl': No such file 
or directory

I will send a patch to fix it.

// Robert

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
>

