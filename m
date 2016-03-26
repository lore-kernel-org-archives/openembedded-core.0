Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E01026612D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Mar 2016 22:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2QMkuvJ028213; Sat, 26 Mar 2016 22:46:56 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HaVk5TISI6Bv; Sat, 26 Mar 2016 22:46:56 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2QMkpuV028206
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 26 Mar 2016 22:46:52 GMT
Message-ID: <1459032411.21672.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Liu <net147@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 26 Mar 2016 22:46:51 +0000
In-Reply-To: <1458905600-21185-1-git-send-email-net147@gmail.com>
References: <1458905600-21185-1-git-send-email-net147@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] gdb-cross-canadian: use PACKAGECONFIG for python and readline
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
X-List-Received-Date: Sat, 26 Mar 2016 22:46:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-03-25 at 22:33 +1100, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> index ae97759..6e42af1 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> @@ -5,15 +5,17 @@ SUMMARY = "GNU debugger (cross-canadian gdb for
> ${TARGET_ARCH} target)"
>  PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>  BPN = "gdb"
>  
> -DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext
> nativesdk-readline nativesdk-python \
> +DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext \
>             virtual/${HOST_PREFIX}gcc-crosssdk
> virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk
> -${HOST_PREFIX}libc-for-gcc"
>  
> -RDEPENDS_${PN} += "nativesdk-python-core nativesdk-python-lang
> nativesdk-python-re \
> -                   nativesdk-python-codecs nativesdk-python
> -netclient"
> -
>  GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
>  
> -EXTRA_OECONF_append = " --with-python=${WORKDIR}/python"
> +# Overrides PACKAGECONFIG variables in gdb-common.inc
> +PACKAGECONFIG ??= "python readline"
> +PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without
> -python,nativesdk-python, \
> +                         nativesdk-python-core nativesdk-python-lang
> nativesdk-python-re \
> +                         nativesdk-python-codecs nativesdk-python
> -netclient"
> +PACKAGECONFIG[readline] = "--with-system-readline,--without-system
> -readline,nativesdk-readline"
>  
>  SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"

Sadly this breaks multilib tests on the autobuilder:

https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/bui
lds/719/steps/BuildImages/logs/stdio

I'll have to remove this from the queue until we can figure out a
fix...

Cheers,

Richard

