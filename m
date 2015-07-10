Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C285D73710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 21:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6ALUYIi027786; Fri, 10 Jul 2015 22:30:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VLYzhoBq_3Hx; Fri, 10 Jul 2015 22:30:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6ALUIUm027783
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 10 Jul 2015 22:30:29 +0100
Message-ID: <1436563818.3310.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 10 Jul 2015 22:30:18 +0100
In-Reply-To: <16a9c9dec5e36b652e35a37a0e6bb4aa78d4ce60.1436431714.git.liezhi.yang@windriver.com>
References: <cover.1436431714.git.liezhi.yang@windriver.com>
	<16a9c9dec5e36b652e35a37a0e6bb4aa78d4ce60.1436431714.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] populate_sdk_base.bbclass: don't inherit toolchain-scripts.bbclass
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
X-List-Received-Date: Fri, 10 Jul 2015 21:30:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-07-09 at 01:49 -0700, Robert Yang wrote:
> Fixed when enable multilib:
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> 
> $ bitbake core-image-minimal
> No lib32 package should be built since we don't build
> lib32-core-image-minimal, but a lot them are built:
> lib32-opkg-utils
> lib32-cryptodev-linux
> lib32-sqlite3
> lib32-libtool-cross
> lib32-ncurses
> lib32-db
> lib32-diffutils
> lib32-zlib
> lib32-gcc-cross-i686
> lib32-gcc-cross-initial-i686
> lib32-flex
> lib32-libgcc-initial
> lib32-libffi
> lib32-linux-libc-headers
> lib32-expat
> lib32-openssl
> lib32-glibc
> lib32-binutils-cross-i686
> lib32-gcc-runtime
> 
> The are introduced by toolchain-scripts.bbclass' anonymous function (the
> MULTILIB_VARIANTS), but it doesn't need toolchain-scripts.bbclass, in
> fact, so remove it to fix the problem.
> 
> [YOCTO #7961]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/populate_sdk_base.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index a4a0193..398e943 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -1,4 +1,4 @@
> -inherit meta toolchain-scripts
> +inherit meta
>  
>  # Wildcards specifying complementary packages to install for every package that has been explicitly
>  # installed into the rootfs


https://autobuilder.yoctoproject.org/main/builders/buildtools/builds/381/steps/BuildImages/logs/stdio

Looks like a missing toolchain-scripts inherit from buildtools-tarball.
I can take care of adding that.

Cheers,

Richard



