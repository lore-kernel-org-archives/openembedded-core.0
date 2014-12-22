Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EB966728D6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 10:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBMAug3C001535; Mon, 22 Dec 2014 10:56:42 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id x6u5pCUnt2Ho; Mon, 22 Dec 2014 10:56:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBMAuTtK001531
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Dec 2014 10:56:41 GMT
Message-ID: <1419245826.13316.72.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kai Kang <kai.kang@windriver.com>
Date: Mon, 22 Dec 2014 10:57:06 +0000
In-Reply-To: <1419241289.13316.67.camel@linuxfoundation.org>
References: <cover.1418885577.git.kai.kang@windriver.com>
	<38c83309734f903e97c3b8e51b0d6c501d1f2ded.1418885581.git.kai.kang@windriver.com>
	<1419241289.13316.67.camel@linuxfoundation.org>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 08/19] libpng 1.6.13: fix build for aarch64
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
X-List-Received-Date: Mon, 22 Dec 2014 10:57:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-12-22 at 09:41 +0000, Richard Purdie wrote:
> On Thu, 2014-12-18 at 16:51 +0800, Kai Kang wrote:
> > From: Koen Kooi <koen.kooi@linaro.org>
> > 
> > The configure override was too restrictive, it needed both 'arm' and
> > 'neon' to trigger, which breaks on aarch64. Since TUNE_FEATURES is the
> > only qualifier that matters, drop the 'arm' override.
> > 
> > Buildtested for 'genericarmv8' and 'qemux86' machines.
> > 
> > Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> > ---
> >  meta/recipes-multimedia/libpng/libpng_1.6.13.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
> > index 0c6fd1f..8798a96 100644
> > --- a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
> > +++ b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
> > @@ -19,7 +19,7 @@ BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
> >  inherit autotools binconfig-disabled pkgconfig
> >  
> >  # Work around missing symbols
> > -EXTRA_OECONF_append_arm = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
> > +EXTRA_OECONF_append = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
> >  
> >  PACKAGES =+ "${PN}-tools"
> >  
> 
> I tried a test build of this series and see:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/136/steps/BuildImages_1/logs/stdio
> 
> in the output. Could someone look into that please? I'm guessing its
> related to this patch although I haven't bisected exactly.

In the interests of expediency, I'm testing:

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
index 8798a96..2c6260a 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
@@ -19,7 +19,7 @@ BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 inherit autotools binconfig-disabled pkgconfig
 
 # Work around missing symbols
-EXTRA_OECONF_append = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
+EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
 
 PACKAGES =+ "${PN}-tools"
 

since the change breaks libpng-native, but only when there is an arm
target. I've also put a couple of fixes in for other arm64 issues in
runqemu and in poky.conf, then I've submitted this to the autobuilder
for another round of testing.

Cheers,

Richard
 


