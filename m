Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 18F4C6C73E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 14:41:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rATEdAf6010691; Fri, 29 Nov 2013 14:40:50 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ahm_A5sMtH7K; Fri, 29 Nov 2013 14:40:50 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rATEemL0010752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 29 Nov 2013 14:40:49 GMT
Message-ID: <1385736045.11222.64.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 29 Nov 2013 14:40:45 +0000
In-Reply-To: <ADD31F3B-8E62-411A-AE0C-8F3A616BB0FC@dominion.thruhere.net>
References: <F8B3526C-4727-4090-A092-1827AAE52F71@dominion.thruhere.net>
	<ADD31F3B-8E62-411A-AE0C-8F3A616BB0FC@dominion.thruhere.net>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Elias Bakken <elias.bakken@gmail.com>, Tim Orling <ticotimo@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Perl CPAN module install path bug in cpan_build.bbclass?
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
X-List-Received-Date: Fri, 29 Nov 2013 14:41:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-29 at 14:47 +0100, Koen Kooi wrote:
> Op 29 nov. 2013, om 09:45 heeft Koen Kooi <koen@dominion.thruhere.net> het volgende geschreven:
> 
> > Hi,
> > 
> > I've been working on perl modules and I noticed some of them don't work properly and nearly all of the non-working ones are Build.PL based and use cpan_build.bbclass. 
> > 
> > A working module looks like this:
> > 	[koen@rrmbp v2013.06]$ dpkg-deb -c deploy/eglibc/ipk/armv7ahf-vfp-neon/perl-module-test-differences_0.61-r0.1_armv7ahf-vfp-neon.ipk
> > 	-r--r--r-- root/root     19567 2013-11-28 15:20 ./usr/lib/perl/vendor_perl/5.14.3/Test/Differences.pm
> > 
> > A non-working one looks like this:
> > 	[koen@rrmbp v2013.06]$ dpkg-deb -c deploy/eglibc/ipk/armv7ahf-vfp-neon/perl-module-build-withxspp_0.14-r0.0_armv7ahf-vfp-neon.ipk
> > 	-rw-r--r-- root/root       361 2013-11-28 16:50 ./usr/lib/perl/auto/Module/Build/WithXSpp/.packlist
> > 	-r--r--r-- root/root     22557 2013-11-28 16:50 ./usr/share/perl/Module/Build/WithXSpp.pm
> > 
> > Looking through the git logs it looks like Nitin tried to fix it, but stopped halfway and only did cpan.bbclass properly:
> > 
> > 	https://github.com/openembedded/oe-core/commit/83796edd29561f02b6f7b036351711f8def77a4f
> > 
> > Since I don't know anything about perl, should cpan_build.bbclass be changes to install into /usr/lib/perl/vendor_perl/5.14.3 as well or are Build.PL based modules 'special' and need a lot more work? This is what I had in mind:
> > 
> > -        --install_path lib="${datadir}/perl" \
> > +        --install_path lib="${libdir}/perl/vendor_perl/${@get_perl_version(d)}" \
> 
> Thinking "less is more", this seems to work:
> 
> diff --git a/meta/classes/cpan_build.bbclass b/meta/classes/cpan_build.bbclass
> index eaba40a..5b0ad61 100644
> --- a/meta/classes/cpan_build.bbclass
> +++ b/meta/classes/cpan_build.bbclass
> @@ -32,7 +32,6 @@ cpan_build_do_configure () {
>  
>         perl Build.PL --installdirs vendor \
>                                 --destdir ${D} \
> -                               --install_path lib="${datadir}/perl" \
>                                 --install_path arch="${libdir}/perl" \
>                                 --install_path script=${bindir} \
>                                 --install_path bin=${bindir} \
> 
> [koen@rrmbp v2013.06]$ dpkg-deb -c deploy/eglibc/ipk/armv7ahf-vfp-neon/perl-module-build-withxspp_0.14-r*.ipk
> -rw-r--r-- root/root       378 2013-11-29 14:44 ./usr/lib/perl/auto/Module/Build/WithXSpp/.packlist
> -r--r--r-- root/root     22557 2013-11-28 17:22 ./usr/lib/perl/vendor_perl/5.14.3/Module/Build/WithXSpp.pm
> 
> opinions, flames, etc?

What does buildhistory say to that change on a larger set of perl
modules? I have to admit I'm out of touch with perl packaging but this
would seem ok, if the default setting is sane. Does it affect native and
target or just target?

Cheers,

Richard


