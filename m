Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R7sPA-0004eh-Sf for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 19:22:17 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PHNBM1019678 for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 18:23:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id M6KzrqPetIYM
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 18:23:11 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PHN8l0019675
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 18:23:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 25 Sep 2011 18:16:45 +0100
In-Reply-To: <1316909477-31924-1-git-send-email-raj.khem@gmail.com>
References: <1316909477-31924-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316971012.8185.30.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] intltool: inherit gettext to add missing dependency on gettext
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
X-List-Received-Date: Sun, 25 Sep 2011 17:22:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-09-24 at 17:11 -0700, Khem Raj wrote:
> Fixes the error like below
> 
> | configure: error: GNU gettext tools not found; required for intltool
> | + bbfatal 'oe_runconf failed'
> | + echo 'ERROR: oe_runconf failed'
> | ERROR: oe_runconf failed
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/intltool/intltool.inc       |    2 +-
>  meta/recipes-devtools/intltool/intltool_0.40.6.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
> index 23a1ee9..1e54feb 100644
> --- a/meta/recipes-devtools/intltool/intltool.inc
> +++ b/meta/recipes-devtools/intltool/intltool.inc
> @@ -12,7 +12,7 @@ DEPENDS_virtclass-native = "libxml-parser-perl-native"
>  RRECOMMENDS_${PN} = "perl-modules"
>  RRECOMMENDS_${PN}_virtclass-native = ""
>  
> -inherit autotools pkgconfig perlnative
> +inherit autotools pkgconfig perlnative gettext
>  
>  export PERL = "${bindir}/env perl"
>  PERL_virtclass-native = "/usr/bin/env nativeperl"
> diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
> index e9871fc..eae2b85 100644
> --- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
> +++ b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
> @@ -1,7 +1,7 @@
>  require intltool.inc
>  LICENSE="GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> -PR = "r5"
> +PR = "r6"
>  
>  SRC_URI_append = " file://intltool-nowarn-0.40.0.patch \
>                     ${NATIVEPATCHES} \

I investigated this one and intltool requires gettext at runtime, not
build time. Which package did you see the above error from as I suspect
it wasn't intltool itself but something using it?

Cheers,

Richard



