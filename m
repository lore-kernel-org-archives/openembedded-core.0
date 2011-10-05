Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBQ1R-0003XV-GF for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 13:52:25 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95BrKLc017087 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 12:53:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id K45vdZ8BzQWF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 12:53:20 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95BrFlH017079
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 12:53:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 05 Oct 2011 12:46:44 +0100
In-Reply-To: <1317765787-19127-2-git-send-email-msm@freescale.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-2-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317815212.14671.142.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 2/6] Fix perl for powerpc64 build
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
X-List-Received-Date: Wed, 05 Oct 2011 11:52:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-04 at 17:03 -0500, Matthew McClintock wrote:
> Build environment for ARCH was set to powerpc on a powerpc64
> build, this adds an override to set this to powerpc64 when
> doing this type of build
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> No comments on original patch:
> 
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/010340.html
> 
>  meta/recipes-devtools/perl/perl_5.12.3.bb |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/perl/perl_5.12.3.bb b/meta/recipes-devtools/perl/perl_5.12.3.bb
> index e4769a4..d1ac0e8 100644
> --- a/meta/recipes-devtools/perl/perl_5.12.3.bb
> +++ b/meta/recipes-devtools/perl/perl_5.12.3.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>  # We need gnugrep (for -I)
>  DEPENDS = "virtual/db grep-native"
>  DEPENDS += "gdbm zlib"
> -PR = "r5"
> +PR = "r6"
>  
>  # 5.10.1 has Module::Build built-in
>  PROVIDES += "libmodule-build-perl"
> @@ -95,6 +95,8 @@ export LDDLFLAGS = "${LDFLAGS} -shared"
>  # We're almost Debian, aren't we?
>  CFLAGS += "-DDEBIAN"
>  
> +export ARCH_powerpc64 = "powerpc64"
> +

I'm finding it really hard to believe this makes any difference. I just
tried a powerpc64 build here and perl built fine. I can't find any
evidence for any part of the perl build using an ARCH variable
(TARGET_ARCH is used but that isn't ARCH).

Can you give some further information about how/where this is used?

>  do_nolargefile() {
>  	sed -i -e "s,\(uselargefiles=\)'define',\1'undef',g" \
>  		-e "s,\(d_readdir64_r=\)'define',\1'undef',g" \
> @@ -156,7 +158,7 @@ do_configure() {
>              config.sh-${TARGET_ARCH}-${TARGET_OS}
>  
>  	case "${TARGET_ARCH}" in
> -		x86_64 | powerpc | s390)
> +		x86_64 | powerpc | powerpc64 | s390)
>  			sed -i -e "s,\(need_va_copy=\)'undef',\1'define',g" \
>  				config.sh-${TARGET_ARCH}-${TARGET_OS}
>  			;;

This bit is fine...

Cheers,

Richard



