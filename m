Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TO2Wp-0004gZ-5V
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 10:29:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9G8GBWD000414
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Oct 2012 01:16:11 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 16 Oct 2012 01:16:12 -0700
Message-ID: <507D17CA.9060309@windriver.com>
Date: Tue, 16 Oct 2012 16:16:10 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: "Purdie, Richard" <richard.purdie@intel.com>
References: <cover.1350300631.git.kai.kang@windriver.com>
	<b2e451207c62285312f27eb6a6d2003ecbc534f2.1350300631.git.kai.kang@windriver.com>
In-Reply-To: <b2e451207c62285312f27eb6a6d2003ecbc534f2.1350300631.git.kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] nativesdk-perl: fix dependecy
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
X-List-Received-Date: Tue, 16 Oct 2012 08:29:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Richard,

Here are more details for this problem:

RRECOMMENDS_perl-modules = "${@d.getVar('PACKAGES', True)...}"

The PACKAGES would be reset by do_split_packages since:

PACKAGES_DYNAMIC = "perl-module-*"
PACKAGES_DYNAMIC_virtclass-nativesdk = "nativesdk-perl-module-*"

Then:
1) The target perl-modules RRECOMMENDS on perl-module-*, this is what
    we expect.

2) But the nativesdk-perl-modules doesn't RRECOMMENDS on
    nativesdk-perl-module-*, this is not what we expect.

I have checked the value of PACKAGES after do_split_packages, it has been
set correctly (it contains the nativesdk-perl-module-* packages)

But the:

RRECOMMENDS_perl-modules = "${@d.getVar('PACKAGES', True)...}"

doesn't work correctly for nativesdk, the d.getVar('RRECOMMENDS_perl-modules', 
True) doesn't get the new value of the PACKAGES, it gets the value of PACKAGES
before the do_split_packages.

The current patch would fix the problem, but I don't know the root cause,
do you have any comments or directions, please?

// Robert

On 10/15/2012 07:32 PM, Kang Kai wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
>
> perl use variable "PACKAGES" to calculate dependency of perl-modules. It
> works for target perl-modules package, but doesn't work for
> nativesdk-perl-modules.
>
> It seems value of "PACKAGES" is cached and doesn't be re-calculate for
> nativesdk build. The root cause is still searching.
>
> This patch is a work around to add each single nativesdk perl modules to
> be nativesdk-perl-modules's dependencies.
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>   meta/recipes-devtools/perl/perl_5.14.2.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
> index d9206d8..643ec0d 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>   # We need gnugrep (for -I)
>   DEPENDS = "virtual/db grep-native"
>   DEPENDS += "gdbm zlib"
> -PR = "r11"
> +PR = "r12"
>
>   # 5.10.1 has Module::Build built-in
>   PROVIDES += "libmodule-build-perl"
> @@ -294,7 +294,6 @@ FILES_perl-module-unicore += "${libdir}/perl/${PV}/unicore"
>   # packages (actually the non modules packages and not created too)
>   ALLOW_EMPTY_perl-modules = "1"
>   PACKAGES_append = " perl-modules "
> -RRECOMMENDS_perl-modules = "${@d.getVar('PACKAGES', True).replace('${PN}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ', '').replace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc ', '')}"
>
>   python populate_packages_prepend () {
>       libdir = d.expand('${libdir}/perl/${PV}')
> @@ -302,6 +301,7 @@ python populate_packages_prepend () {
>       do_split_packages(d, libdir, 'auto/([^/]*)/.*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
>       do_split_packages(d, libdir, 'Module/([^\/]*).*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
>       do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
> +    d.setVar("RRECOMMENDS_${PN}-modules", d.getVar('PACKAGES', True).replace('${PN}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ', '').replace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc ', ''))
>   }
>
>   PACKAGES_DYNAMIC = "perl-module-*"
>


