Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A4CCC7DFBE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 17:44:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x97HiixQ019092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Oct 2019 10:44:44 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 7 Oct 2019 10:44:44 -0700
To: <openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <20191007133836.1307-1-ross.burton@intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <2d8ef388-4ec5-3142-4769-2d038f7d7773@windriver.com>
Date: Mon, 7 Oct 2019 13:44:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007133836.1307-1-ross.burton@intel.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [PATCH] pango: add PACKAGECONFIGs for all the optional dependencies
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
X-List-Received-Date: Mon, 07 Oct 2019 17:44:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/7/19 9:38 AM, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   .../recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb | 17 ++++++-----------
>   1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
> index b0f565b9b07..b8a89d005e5 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
> @@ -7,24 +7,19 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=e11f5c3149cdec4bb309babb020b32b9 \
>                       file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc"
>   
> -DEPENDS = "glib-2.0 cairo fontconfig freetype"
> -
>   SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.xz"
>   SRC_URI[md5sum] = "89b758a2eb14d56a94406cf914b62388"
>   SRC_URI[sha256sum] = "c651fb3faaa338aeb280726837c2384064cdc17ef40539228d88a1260960844f"
>   
>   inherit autotools pkgconfig lib_package gtk-doc
>   
> -PACKAGECONFIG ??= "icu"
> -PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
> +PACKAGECONFIG ??= "cairo fontconfig freetype glib icu"
> +PACKAGECONFIG[cairo] = "--with-cairo,--without-cairo,cairo"
> +PACKAGECONFIG[fontconfig] = "--with-fontconfig,--without-fontconfig,fontconfig"
> +PACKAGECONFIG[freetype] = "--with-freetype,--without-freetype,freetype"
> +PACKAGECONFIG[glib] = "--with-glib,--without-glib,glib-2.0"
>   PACKAGECONFIG[graphite] = "--with-graphite2,--without-graphite2,graphite2"
> -
> -EXTRA_OECONF = " \
> -    --with-cairo \
> -    --with-fontconfig \
> -    --with-freetype \
> -    --with-glib \
> -"
> +PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"

Hi Ross,

PACKAGECONFIG has been nagging at me for years.
This is mostly me just blowing off steam but I would
like to hear your opinion.

While this is technically correct and seeing as oe-core is
a distribution building system rather than a distro, this change
makes sense, I do wonder how we're going to keep up with
the testing that such flexibility requires. We could
test each package's default config and then toggle each
PACKAGECONFIG individually, hopefully with an automated tool.

In theory for N PACKAGECONFIGs, we'd need to do not just N
toggles but for pairs of interacting configs: N * N-1 builds
and so on for triplets, quadruplets, etc. For dependencies
between packages, the number of combinations explodes rapidly.

The status quo seems to be that we enable the options, pick
reasonable defaults, and hope that distros and users test their
configs and report errors. That'll work for detecting some errors
even if it can take a while to get feedback. We recently tested
a variety of configurations and found > 30 configurations that
didn't work at all at build time.

So for this package, are there use cases that you know of where
the old, hard-coded defaults are a problem?

It's also interesting to see that the README.md for pango says:

    The Cairo backend is the preferred backend to use Pango with and is
    subject of most of the development in the future.  It has the
    advantage that the same code can be used for display and printing.

    We suggest using Pango with Cairo as described above, but ...

so it would seem that even our defaults are not the ones recommended
by upstream.

Does pango build if you drop glib? The README.md says:
    Dependencies
    ------------
    Pango depends on the GLib library; more information about GLib can
    be found at https://www.gtk.org/.

../Randy
>   
>   PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
>   
> 


-- 
# Randy MacLeod
# Wind River Linux

