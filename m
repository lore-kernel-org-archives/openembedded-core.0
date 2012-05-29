Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZSkG-0002jR-2e
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 22:10:20 +0200
Received: by pbbrq2 with SMTP id rq2so6835495pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GMtkovPtGYg23Txad71vG8lAjY3SnR23Bba+xUrsbME=;
	b=RaUl2ALpENto4NuwX9M8m9fLcqz+D7vNipfVKX9ntNRCxq6FBO2UOSuAmZ3Hvb4fRG
	QrLjjNRYRlUUFWsVholsew9wkm2h3wE5JBtMcAmNMDJZuhuxumEC7+Y80X16gxMLq14U
	6eWAJ9NSQ+efT3INiO+xw6saDNR5+WTO6PCwHVTOVCAO+wZdrOM3qxC8Ie6VMGvfgKIG
	o8mBfUPBAjM0/KZ+ajK2ZnXLeBHPuvW2y41KIBmv5LdKQE2wWZrQElh6Vnjuqm9gZkIa
	SoVPznfYM+hNJi/1ADSPRHW3GrutAY3KGMMZMdoVwinA08+1aX2eY+Yh2vFwWW4Nvj9Y
	esxQ==
Received: by 10.68.197.231 with SMTP id ix7mr41452278pbc.103.1338321601125;
	Tue, 29 May 2012 13:00:01 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id wi8sm23804807pbc.11.2012.05.29.12.59.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 May 2012 13:00:00 -0700 (PDT)
Date: Tue, 29 May 2012 12:59:32 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120529195932.GB5528@sakrah.homelinux.org>
References: <1337749401-27198-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1337749401-27198-1-git-send-email-jason.wessel@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] perl: Allow perl to cross build and native build in a directory named "t"
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
X-List-Received-Date: Tue, 29 May 2012 20:10:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/05/12 00:03), Jason Wessel wrote:
> If any directory in leading up to your tmp directory has the name "t"
> perl will fail to build with a very cryptic error shown below:
> 
> pod/buildtoc: no pods at pod/buildtoc line 305.
> make[1]: *** [pod/perltoc.pod] Error 255
> 
> This is a result of the perl file checking making an assumption
> that it is only looking at files and directories with in the perl
> source directory.  This assumption fails with the way bitbake
> sets up perl to properly cross compile.

Bump PR too please.


> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  .../perl/perl-5.14.2/perl-build-in-t-dir.patch     |   35 ++++++++++++++++++++
>  meta/recipes-devtools/perl/perl-native_5.14.2.bb   |    3 +-
>  meta/recipes-devtools/perl/perl_5.14.2.bb          |    1 +
>  3 files changed, 38 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch
> 
> diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch b/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch
> new file mode 100644
> index 0000000..cd36ec5
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch
> @@ -0,0 +1,35 @@
> +Upstream-Status:Pending
> +
> +Perl cannot cross build in a path containing a directory that
> +has the name of "t".
> +
> +You get an error like:
> +
> +
> +Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> +---
> + pod/buildtoc |    4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +--- a/pod/buildtoc
> ++++ b/pod/buildtoc
> +@@ -274,8 +274,10 @@ if ($Build{toc}) {
> +   find \&getpods => abs_from_top('lib/');
> + 
> +   sub getpods {
> ++    my $Top = $FindBin::Bin;
> +     if (/\.p(od|m)$/) {
> +       my $file = $File::Find::name;
> ++      $file =~ s!^$Top!!;
> +       return if $file =~ qr!/lib/Pod/Functions.pm\z!; # Used only by pod itself
> +       return if $file =~ m!(?:^|/)t/!;
> +       return if $file =~ m!lib/Attribute/Handlers/demo/!;
> +@@ -283,7 +285,7 @@ if ($Build{toc}) {
> +       return if $file =~ m!lib/Math/BigInt/t/!;
> +       return if $file =~ m!/Devel/PPPort/[Hh]arness|lib/Devel/Harness!i;
> +       return if $file =~ m!XS/(?:APItest|Typemap)!;
> +-      my $pod = $file;
> ++      my $pod = $file = $File::Find::name;
> +       return if $pod =~ s/pm$/pod/ && -e $pod;
> +       unless (open my $f, '<', $_) {
> + 	warn "$0: bogus <$file>: $!";
> diff --git a/meta/recipes-devtools/perl/perl-native_5.14.2.bb b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
> index c904c37..429a029 100644
> --- a/meta/recipes-devtools/perl/perl-native_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
> @@ -14,7 +14,8 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
>             file://perl-configpm-switch.patch \
>             file://native-nopacklist.patch \
>             file://native-perlinc.patch \
> -           file://MM_Unix.pm.patch"
> +           file://MM_Unix.pm.patch \
> +           file://perl-build-in-t-dir.patch"
>  
>  SRC_URI[md5sum] = "3306fbaf976dcebdcd49b2ac0be00eb9"
>  SRC_URI[sha256sum] = "6488359573bd7d41761bf935f66f827dc220fb3df961ef9b775d51fbd66548d3"
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
> index 809fc72..2149b30 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -65,6 +65,7 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
>          file://perl-enable-gdbm.patch \
>          file://cross-generate_uudmap.patch \
>  	file://fix_bad_rpath.patch \
> +	file://perl-build-in-t-dir.patch \
>  	\
>          file://config.sh \
>          file://config.sh-32 \
> -- 
> 1.6.6.2
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


