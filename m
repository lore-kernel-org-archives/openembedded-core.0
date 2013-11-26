Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 83D2F6D815
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 15:55:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2013 07:55:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,775,1378882800"; d="scan'208";a="415282225"
Received: from unknown (HELO helios.localnet) ([10.252.122.39])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2013 07:55:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 26 Nov 2013 15:55:20 +0000
Message-ID: <1823390.lKu6Rx7MQ8@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1385476348.11246.4.camel@ted>
References: <1385476348.11246.4.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] beecrypt: Add PACKAGECONFIG for cplusplus
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
X-List-Received-Date: Tue, 26 Nov 2013 15:55:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 26 November 2013 14:32:28 Richard Purdie wrote:
> Add a PACKGECONFIG to control the building of the beecrypt C++
> bindings. The only user of beecrypt in OE-Core is rpm and this doesn't
> need the C++ bindings so default the option to be off. This means
> we can lose the icu dependency by default which is a significant
> performance win.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
> b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb index 0a8ff4b..a917201
> 100644
> --- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
> +++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
> @@ -16,8 +16,6 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=9894370afd5dfe7d02b8d14319e729a1 \
> file://COPYING.LIB;md5=dcf3c825659e82539645da41a7908589 \
> file://include/beecrypt/beecrypt.h;endline=20;md5=47a93eef539aac237eef86297
> a4d71c1"
> 
> -DEPENDS = "icu"
> -
>  PR = "r3"
> 
>  inherit autotools multilib_header
> @@ -29,6 +27,9 @@ do_install_append() {
> 
>  EXTRA_OECONF="--without-python --enable-shared --enable-static
> --disable-openmp --with-java=no"
> 
> +PACKAGECONFIG = ""
> +PACKAGECONFIG[cplusplus] = "--with-cplusplus,--without-cplusplus,icu"
> +
>  FILES_${PN} = "${sysconfdir} ${libdir}/*.so.* ${libdir}/${BPN}/*.so.*"
>  FILES_${PN}-dev += "${libdir}/${BPN}/*.so ${libdir}/${BPN}/*.la"
>  FILES_${PN}-staticdev += "${libdir}/${BPN}/*.a"

Not just a performance win, but a quick test with core-image-minimal + RPM + 
"package-management" in IMAGE_FEATURES showed that this also reduces the size 
of the final image by over 26MB. A nice optimisation all round :)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

