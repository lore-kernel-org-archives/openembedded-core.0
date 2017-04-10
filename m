Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0FCA872F4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 10:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3AAWNMs010034; 
	Mon, 10 Apr 2017 11:32:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bLdRfPW6uCVd; Mon, 10 Apr 2017 11:32:27 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3A7S00S028161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 10 Apr 2017 08:28:01 +0100
Message-ID: <1491809280.17200.128.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 08:28:00 +0100
In-Reply-To: <20170410031440.32220-1-kai.kang@windriver.com>
References: <20170410031440.32220-1-kai.kang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] libsdl2: disable check gcc -Wdeclaration-after-statement for ppc
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
X-List-Received-Date: Mon, 10 Apr 2017 10:32:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-04-10 at 11:14 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Disable check gcc option -Wdeclaration-after-statement for powerpc
> and
> powerpc64 which causes compile failures:
> 
> > 
> >   CC     build/SDL_blit_N.lo
> > .../tmp/work/ppc7400-wrs-linux/libsdl2/2.0.5-r0/SDL2-
> > 2.0.5/src/video/SDL_blit_N.c: In function 'calc_swizzle32':
> > .../tmp/work/ppc7400-wrs-linux/libsdl2/2.0.5-r0/SDL2-
> > 2.0.5/src/video/SDL_blit_N.c:127:5: error: ISO C90 forbids
> > mixed declarations and code [-Werror=declaration-after-statement]
> >      const vector unsigned char plus = VECUINT8_LITERAL(0x00, 0x00,
> > 0x00, 0x00,
> >      ^~~~~
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  ...able-check-gcc-Wdeclaration-after-statement.patch | 20
> ++++++++++++++++++++
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb       |  2 ++
>  2 files changed, 22 insertions(+)
>  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/disable-
> check-gcc-Wdeclaration-after-statement.patch
> 
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/disable-check-gcc-
> Wdeclaration-after-statement.patch b/meta/recipes-
> graphics/libsdl2/libsdl2/disable-check-gcc-Wdeclaration-after-
> statement.patch
> new file mode 100644
> index 0000000..ad48af7
> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl2/libsdl2/disable-check-gcc-
> Wdeclaration-after-statement.patch
> @@ -0,0 +1,20 @@
> +Upstream-Status: Inappropriate [disable feature]

Given upstream explicitly enable this warning and the issue looks to be
in their code, surely upstream would want to fix this.

Also, would it not be easier to patch the code and fix this than
disabling the warning?

Cheers,

Richard


> +Disable check gcc option -Wdeclaration-after-statement for powerpc
> and
> +powerpc64 which causes compile failures.
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> +diff --git a/configure.in b/configure.in
> +index e2ddc9c..73b10f5 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -2950,7 +2950,7 @@ case "$host" in
> +             *-*-minix*)         ARCH=minix ;;
> +         esac
> +         CheckVisibilityHidden
> +-        CheckDeclarationAfterStatement
> ++#        CheckDeclarationAfterStatement
> +         CheckDummyVideo
> +         CheckDiskAudio
> +         CheckDummyAudio
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> index d747cf1..33963c1 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> @@ -20,6 +20,8 @@ SRC_URI = " \
>      file://0001-prepend-our-sysroot-path-so-that-make-finds-our-
> wayl.patch \
>      file://0002-Avoid-finding-build-host-s-wayland-scanner.patch \
>  "
> +SRC_URI_append_powerpc = " file://disable-check-gcc-Wdeclaration-
> after-statement.patch"
> +SRC_URI_append_powerpc64 = " file://disable-check-gcc-Wdeclaration-
> after-statement.patch"
>  
>  S = "${WORKDIR}/SDL2-${PV}"
>  
> -- 
> 2.10.1
> 

