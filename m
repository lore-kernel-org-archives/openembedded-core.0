Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB0796FFCD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 09:01:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0491h9s004984
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jan 2016 01:01:43 -0800 (PST)
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 4 Jan 2016 01:01:42 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1451467081-9635-1-git-send-email-rongqing.li@windriver.com>
From: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <568A34F5.5050003@windriver.com>
Date: Mon, 4 Jan 2016 17:01:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1451467081-9635-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] perl: install Config_heavy-target.pl correctly
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
X-List-Received-Date: Mon, 04 Jan 2016 09:01:42 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Sorry for the noise;

please drop this patch

-Roy

On 2015年12月30日 17:18, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Config_heavy-target.pl is needed by perl-native, not perl; since
> perl-configpm-switch.patch, which uses Config_heavy-target.pl, is
> applied into native package, and Config_heavy-target.pl is used
> when PERLCONFIGTARGET is yes in cpan.bbclass
>
> This fixed a building failure when autoloader is used:
>
> Can't locate Config_heavy-target.pl in @INC (@INC contains: ...) at tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.22.0/Config.pm line 88
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-devtools/perl/perl-native_5.22.0.bb | 2 ++
>   meta/recipes-devtools/perl/perl_5.22.0.bb        | 6 +-----
>   2 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/perl/perl-native_5.22.0.bb b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
> index b4dda31..09d399c 100644
> --- a/meta/recipes-devtools/perl/perl-native_5.22.0.bb
> +++ b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
> @@ -94,6 +94,8 @@ do_install () {
>   		install $i ${D}${libdir}/perl/${PV}/CORE
>   	done
>
> +	ln -s Config_heavy.pl ${D}${libdir}/perl/${PV}/Config_heavy-target.pl
> +
>   	# Those wrappers mean that perl installed from sstate (which may change
>   	# path location) works and that in the nativesdk case, the SDK can be
>   	# installed to a different location from the one it was built for.
> diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
> index 55ce73f..84cc651 100644
> --- a/meta/recipes-devtools/perl/perl_5.22.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
> @@ -241,10 +241,7 @@ do_install() {
>
>           # target config, used by cpan.bbclass to extract version information
>           install config.sh ${D}${libdir}/perl
> -
> -        ln -s Config_heavy.pl ${D}${libdir}/perl/${PV}/Config_heavy-target.pl
>   }
> -
>   do_install_append_class-nativesdk () {
>           create_wrapper ${D}${bindir}/perl \
>               PERL5LIB='$PERL5LIB:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/site_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/vendor_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/${PV}'
> @@ -298,8 +295,7 @@ FILES_${PN}-dev = "${libdir}/perl/${PV}/CORE"
>   FILES_${PN}-lib = "${libdir}/libperl.so* \
>                      ${libdir}/perl5 \
>                      ${libdir}/perl/config.sh \
> -                   ${libdir}/perl/${PV}/Config_heavy.pl \
> -                   ${libdir}/perl/${PV}/Config_heavy-target.pl"
> +                   ${libdir}/perl/${PV}/Config_heavy.pl"
>   FILES_${PN}-pod = "${libdir}/perl/${PV}/pod \
>   		   ${libdir}/perl/${PV}/*.pod \
>                      ${libdir}/perl/${PV}/*/*.pod \
>

-- 
Best Reagrds,
Roy | RongQing Li

