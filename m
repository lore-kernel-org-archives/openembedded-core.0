Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TEKZJ-0007Ge-S3
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 15:43:57 +0200
Received: by eaad12 with SMTP id d12so274166eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 06:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2POP1vp33xRMNjgtQGOuqtFLqfz6NLG/CRcThZfcXR4=;
	b=VUxxI38xkz4E/0te2kXI1RdqresCO6nxfH7ll2scqhDv8TELQKCJTJil+Lg4KmLryI
	CvgXDwNhBjacIrbPf9bdFaGkYg9NFrk4kqDvAS+0vMxsuwYNhjGNI8ibslDZW3yZ77v0
	oYDMxYJ4m+c5HS7tqtRWepZP2PFxBlpD46Yg6N+uJgXkbstvo4Efvs7SCKd5KA/76pqu
	CkW7mhMCozk1gdvQVVNszt5m4gi8KU2mTVGGpjLN4RLqPnPZ76rN7zEXZV2L+L85Hpmn
	rAP7YEJG8JpWJ4oo70dy0D30oVgizPpf6LBLS2jjqfsNlIxJQgmxM/Tw7oRqow+BUloo
	C+rQ==
Received: by 10.14.211.3 with SMTP id v3mr3523338eeo.43.1348061033199; Wed, 19
	Sep 2012 06:23:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 19 Sep 2012 06:23:22 -0700 (PDT)
In-Reply-To: <1348048754-30379-1-git-send-email-constantinx.musca@intel.com>
References: <1348048754-30379-1-git-send-email-constantinx.musca@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Sep 2012 06:23:22 -0700
Message-ID: <CAMKF1spysZ_tcHRu1XoTTdvvMCbSxfjkJnk6xgg1KU_Hm__DBQ@mail.gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] intltool: include intltool.m4 and add missing rdepends
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
X-List-Received-Date: Wed, 19 Sep 2012 13:43:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 19, 2012 at 2:59 AM, Constantin Musca
<constantinx.musca@intel.com> wrote:
> - include /usr/share/aclocal/intltool.m4 into the intltool
> package (the files from intltool-dev must be included into the
> main package, as intltool is a development tool)
> - add missing rdepends: gettext-dev, libxml-parser-perl
>
> [YOCTO #2597]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>  meta/recipes-devtools/intltool/intltool.inc       |    9 ++++++++-
>  meta/recipes-devtools/intltool/intltool_0.50.0.bb |    2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
> index 1c41f0f..59974d8 100644
> --- a/meta/recipes-devtools/intltool/intltool.inc
> +++ b/meta/recipes-devtools/intltool/intltool.inc
> @@ -7,11 +7,18 @@ SRC_URI = "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
>  S = "${WORKDIR}/intltool-${PV}"
>
>  DEPENDS = "libxml-parser-perl-native"
> +RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"

creating a runtime dependency on a dev package seems troublesome to me.
Can you explain why is this being done ?

>  DEPENDS_virtclass-native = "libxml-parser-perl-native"
> -#RDEPENDS_${PN} = "libxml-parser-perl"
> +# gettext is assumed to exist on the host
> +RDEPENDS_${PN}_virtclass-native = "libxml-parser-perl-native"
>  RRECOMMENDS_${PN} = "perl-modules"
>  RRECOMMENDS_${PN}_virtclass-native = ""
>
> +FILES_${PN}-dev = ""
> +FILES_${PN} += "${datadir}/aclocal"
> +
> +INSANE_SKIP_${PN} += "dev-deps"
> +
>  inherit autotools pkgconfig perlnative
>
>  export PERL = "${bindir}/env perl"
> diff --git a/meta/recipes-devtools/intltool/intltool_0.50.0.bb b/meta/recipes-devtools/intltool/intltool_0.50.0.bb
> index d1ee31d..fa9850f 100644
> --- a/meta/recipes-devtools/intltool/intltool_0.50.0.bb
> +++ b/meta/recipes-devtools/intltool/intltool_0.50.0.bb
> @@ -1,7 +1,7 @@
>  require intltool.inc
>  LICENSE="GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> -PR = "r0"
> +PR = "r1"
>
>  SRC_URI += "file://intltool-nowarn-0.50.0.patch \
>             ${NATIVEPATCHES} \
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


