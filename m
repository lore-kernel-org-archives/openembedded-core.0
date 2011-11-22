Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RStJ5-0005oQ-Oj for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 17:34:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAMGSLH5020588
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 16:28:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19340-08 for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 16:28:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAMGSErf020582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 16:28:15 GMT
Message-ID: <1321979300.18926.58.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 22 Nov 2011 16:28:20 +0000
In-Reply-To: <d06edef859ff936294d76bc07523f50eaaa5baf4.1321811216.git.raj.khem@gmail.com>
References: <cover.1321811216.git.raj.khem@gmail.com>
	<d06edef859ff936294d76bc07523f50eaaa5baf4.1321811216.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/5] matchbox-stroke: Fix linking error with gold
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
X-List-Received-Date: Tue, 22 Nov 2011 16:34:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-11-20 at 09:50 -0800, Khem Raj wrote:
> Gold defaults to no-add-needed thetefore
> it does not link with librtaries that are not on cmdline
> it needs libXrender but is not on the linker cmdline
> so add it.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../matchbox-stroke/files/ldadd_libXrender.patch   |   25 ++++++++++++++++++++
>  .../matchbox-stroke/matchbox-stroke_git.bb         |    6 +++-
>  2 files changed, 29 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-sato/matchbox-stroke/files/ldadd_libXrender.patch
> 
> diff --git a/meta/recipes-sato/matchbox-stroke/files/ldadd_libXrender.patch b/meta/recipes-sato/matchbox-stroke/files/ldadd_libXrender.patch
> new file mode 100644
> index 0000000..90d2057
> --- /dev/null
> +++ b/meta/recipes-sato/matchbox-stroke/files/ldadd_libXrender.patch
> @@ -0,0 +1,25 @@
> +with GNU binutils-gold the
> +important difference is that --no-add-needed is the default behavior of GNU
> +binutils-gold. Please provide all needed libraries to the linker when building
> +your executables.
> +
> +Otherwise we get link errors like
> +
> +/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.6.2/ld: matchbox-stroke-ui.o: in function mb_stroke_ui_resources_create:matchbox-stroke-ui.c:223: error: undefined reference to 'XRenderCreatePicture'collect2: ld returned 1 exit statusmake[2]: *** [matchbox-stroke] Error 1
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +Index: git/src/Makefile.am
> +===================================================================
> +--- git.orig/src/Makefile.am	2011-10-22 19:25:52.000000000 -0700
> ++++ git/src/Makefile.am	2011-10-22 19:27:07.746428946 -0700
> +@@ -6,7 +6,7 @@
> + 
> + bin_PROGRAMS = matchbox-stroke
> + 
> +-matchbox_stroke_LDADD = $(MBSTROKE_LIBS) $(EXPAT_LIBS) -lm
> ++matchbox_stroke_LDADD = $(MBSTROKE_LIBS) $(EXPAT_LIBS) -lm -lXrender
> + 

I had a look at this and -lXrender is listed in MBSTROKE_LIBS. I'm
therefore a little puzzled on why this patch is needed? I appreciate the
commandline is order sensitive but that order should work?

Cheers,

Richard



