Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TPEIJ-0007A5-4Y for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 17:15:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9JF22NQ031939;
	Fri, 19 Oct 2012 16:02:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31641-05; Fri, 19 Oct 2012 16:01:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9JF1rZk031932
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 19 Oct 2012 16:01:54 +0100
Message-ID: <1350658913.2520.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kang Kai <kai.kang@windriver.com>
Date: Fri, 19 Oct 2012 16:01:53 +0100
In-Reply-To: <44a03f4c870063fd0405695db1de2bfaae976a71.1350645464.git.kai.kang@windriver.com>
References: <cover.1350645464.git.kai.kang@windriver.com>
	<44a03f4c870063fd0405695db1de2bfaae976a71.1350645464.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] nativesdk-autoconf: add dependencies
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
X-List-Received-Date: Fri, 19 Oct 2012 15:15:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-10-19 at 19:22 +0800, Kang Kai wrote:
> When use toolchain gmae to compile iptables, autoreconf needs perl and
> some perl modules. It is too many item to put in the .bb file, so just
> add nativesdk-perl-modules to provide them.
> 
> [Yocto 3100]
> 
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/autoconf/autoconf.inc     |    4 +++-
>  meta/recipes-devtools/autoconf/autoconf_2.69.bb |    2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
> index 315e773..29d67a0 100644
> --- a/meta/recipes-devtools/autoconf/autoconf.inc
> +++ b/meta/recipes-devtools/autoconf/autoconf.inc
> @@ -10,7 +10,9 @@ DEPENDS_virtclass-native = "m4-native gnu-config-native"
>  DEPENDS_virtclass-nativesdk = "nativesdk-m4 nativesdk-gnu-config"
>  RDEPENDS_${PN} = "m4 gnu-config"
>  RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
> -RDEPENDS_${PN}_virtclass-nativesdk = "nativesdk-m4 nativesdk-gnu-config"
> +RDEPENDS_${PN}_virtclass-nativesdk = "nativesdk-m4 nativesdk-gnu-config \
> +                                      nativesdk-perl nativesdk-perl-modules \
> +                                     "
>  

Ok, this is getting closer but I'm still not 100% convinced we have
everything fixed properly. For example, if the above is true, isn't
RDEPENDS_${PN} wrong? Do we need everything in perl-modules?

I also took a look at the automake recipe which in some ways looks
better behaved. It does:

RDEPENDS_${PN} += "\
    autoconf \
    perl \
    perl-module-bytes \
    perl-module-constant \
    perl-module-cwd \
    perl-module-data-dumper \
    perl-module-dynaloader \
    perl-module-errno \
    perl-module-exporter-heavy \
    perl-module-file-basename \
    perl-module-file-compare \
    perl-module-file-copy \
    perl-module-file-glob \
    perl-module-file-spec-unix \
    perl-module-file-stat \
    perl-module-getopt-long \
    perl-module-io \
    perl-module-io-file \
    perl-module-posix \
    perl-module-strict \
    perl-module-text-parsewords \
    perl-module-vars "

RDEPENDS_${PN}_virtclass-native = "autoconf-native perl-native-runtime"
RDEPENDS_${PN}_virtclass-nativesdk = "nativesdk-autoconf"

which at least seems to list the modules it really needs. The fact we
then set a virtclass-nativesdk version which is wrong is worrying.

I think the assumption has been that for nativesdk, we'd use the system
perl.

So I think we need to

a) Decide whether the sdk should be using the nativesdk perl or the host
system one. I'm fine with deciding we should use the nativesdk perl
b) Fix RDEPENDS_${PN} for autoconf so that it lists the right perl
modules.
c) At this pooint we might be able to simply remove RDEPENDS_
${PN}_virtclass-nativesdk and the code should figure things out
automagically itself.
d) We should verify the list of modules for automake is correct
e) We should also see if we can simply remove the RDEPENDS_
${PN}_virtclass-nativesdk line from automake.

Does that make sense?

Cheers,

Richard











