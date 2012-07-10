Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SoZTy-0001Bn-GQ for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 14:23:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ACCkCM016642
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 13:12:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15604-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 13:12:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ACCcQf016631
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 13:12:40 +0100
Message-ID: <1341922359.24837.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 13:12:39 +0100
In-Reply-To: <45d7793f0e3092f3ba4e03c52195ea13179ad1d8.1341850982.git.nitin.a.kamble@intel.com>
References: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
	<45d7793f0e3092f3ba4e03c52195ea13179ad1d8.1341850982.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 15/15] pango: fix dependencies to avoid build issue
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
X-List-Received-Date: Tue, 10 Jul 2012 12:23:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-09 at 09:26 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> this commit avoids this build issue:
> 
> | /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.7.1/ld: cannot find -lelf
> | collect2: error: ld returned 1 exit status
> ...
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> NOTE: package pango-1.28.4-r7: task do_compile: Failed
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/recipes-graphics/pango/pango.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
> index fbf5027..754a720 100644
> --- a/meta/recipes-graphics/pango/pango.inc
> +++ b/meta/recipes-graphics/pango/pango.inc
> @@ -10,7 +10,7 @@ SECTION = "libs"
>  LICENSE = "LGPLv2.0+"
>  
>  X11DEPENDS = "virtual/libx11 libxft"
> -DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cairo "
> +DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cairo elfutils"
>  
>  PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>  PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"

I think rather than blindly adding the dependency, we need to figure out
what this is needed for. We had a similar issue with glib-2.0:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=38da655788361e949d605bebfab45cf5830df613

so I'm leaning to disabling this here.

Cheers,

Richard



