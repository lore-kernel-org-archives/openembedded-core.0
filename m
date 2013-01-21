Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tx8n4-0007I4-RB
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 05:15:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2013 19:58:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,502,1355126400"; d="scan'208";a="249953340"
Received: from unknown (HELO [10.255.15.40]) ([10.255.15.40])
	by orsmga001.jf.intel.com with ESMTP; 20 Jan 2013 19:59:53 -0800
Message-ID: <50FCBD39.5060306@linux.intel.com>
Date: Sun, 20 Jan 2013 19:59:53 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1358639364.14265.7.camel@ted>
In-Reply-To: <1358639364.14265.7.camel@ted>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl: Add dyanloader build hack
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
X-List-Received-Date: Mon, 21 Jan 2013 04:15:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/19/2013 03:49 PM, Richard Purdie wrote:
> Patch perl to allow builds to work where a native perl running against target modules
> attempts to load a dynamic binary module. We assume that a native version of the
> module exists as it would for the target and perform an appropriate path
> substitution.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/perl/perl-5.14.2/dynaloaderhack.patch b/meta/recipes-devtools/perl/perl-5.14.2/dynaloaderhack.patch
> new file mode 100644
> index 0000000..c3e17f8
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl-5.14.2/dynaloaderhack.patch
> @@ -0,0 +1,23 @@
> +Hack the dynamic module loader so that we use native modules since we can't load
> +the target ones.
> +
> +Upsteam-Status: Inappropriate

Upstream misspelled!

Sau!

> +
> +RP
> +2013/01/13
> +
> +Index: perl-5.14.2/ext/DynaLoader/DynaLoader_pm.PL
> +===================================================================
> +--- perl-5.14.2.orig/ext/DynaLoader/DynaLoader_pm.PL	2011-09-19 13:18:22.000000000 +0000
> ++++ perl-5.14.2/ext/DynaLoader/DynaLoader_pm.PL	2013-01-19 16:09:51.020584945 +0000
> +@@ -310,6 +310,10 @@
> +     foreach (@INC) {
> + 	<<$^O-eq-VMS>>chop($_ = VMS::Filespec::unixpath($_));<</$^O-eq-VMS>>
> + 	    my $dir = "$_/auto/$modpname";
> ++
> ++	if (defined $ENV{PERL_LIB} and defined $ENV{PERLHOSTLIB}) {
> ++	    $dir =~ s/$ENV{PERL_LIB}/$ENV{PERLHOSTLIB}/g;
> ++	}
> + 	
> + 	next unless -d $dir; # skip over uninteresting directories
> + 	
> diff --git a/meta/recipes-devtools/perl/perl-native_5.14.2.bb b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
> index 60fcc18..9a066e2 100644
> --- a/meta/recipes-devtools/perl/perl-native_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
> @@ -19,6 +19,7 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
>              file://native-perlinc.patch \
>              file://MM_Unix.pm.patch \
>              file://debian/errno_ver.diff \
> +           file://dynaloaderhack.patch \
>              file://perl-build-in-t-dir.patch"
>
>   SRC_URI[md5sum] = "3306fbaf976dcebdcd49b2ac0be00eb9"
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
> index f924ebd..ddc9568 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -67,6 +67,7 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
>   	file://fix_bad_rpath.patch \
>   	file://perl-build-in-t-dir.patch \
>   	file://perl-archlib-exp.patch \
> +	file://dynaloaderhack.patch \
>   	\
>           file://config.sh \
>           file://config.sh-32 \
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


