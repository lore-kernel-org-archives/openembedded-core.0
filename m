Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9axp-0005Qx-0K for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 13:09:09 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UBA4cu012546 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:10:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NkdLXjFDfCDB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:10:03 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UB9wkg012542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:10:00 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 12:03:32 +0100
In-Reply-To: <2c12e32cc688b78bbaedc026532f5dfb3e118c39.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
	<2c12e32cc688b78bbaedc026532f5dfb3e118c39.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317380619.12332.154.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 11/13] libdrm: improve packaging
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
X-List-Received-Date: Fri, 30 Sep 2011 11:09:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-30 at 09:27 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/drm/libdrm.inc       |    7 ++++---
>  meta/recipes-graphics/drm/libdrm_2.4.26.bb |    2 +-
>  meta/recipes-graphics/drm/libdrm_git.bb    |    2 +-
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
> index 1ad9dc3..20d7f1f 100644
> --- a/meta/recipes-graphics/drm/libdrm.inc
> +++ b/meta/recipes-graphics/drm/libdrm.inc
> @@ -15,7 +15,8 @@ DEPENDS += " libpciaccess"
>  
>  inherit autotools pkgconfig
>  
> -PACKAGES =+ "libdrm-tests"
> -FILES_libdrm-tests = "${bindir}/dr* ${bindir}/mode*"
> +PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-kms"
> +FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode*"
> +FILES_${PN}-drivers = "${libdir}/libdrm_*.so.*"
> +FILES_${PN}-kms = "${libdir}/libkms*.so.*"
>  
> -LEAD_SONAME = "libdrm.so"

I want to make it *really* clear that this breaks anything depending on
libdrm for oe-core users.

This is exactly why I think the whole PR bump thing is stupid, braindead
and simply wrong since the current fix is to go and find anything using
libdrm and bump those PR values too.

Of course we could add a "LIBDRM_INC_PR" in the core and bump that when
libdrm changes.

The trouble is following this path to its logical conclusion, we
basically turn our automated build system into a set of manual changes
where we compute dependency chains by hand.

Sorry to labour this point but I do want people to understand why we
need to take some pain in the short term and improve what we're doing...

I will take the patch since I value getting meta-oe cleaned up and I'll
add in a patch bumping PR for xserver/mesa but I'm not happy.

Cheers,

Richard




