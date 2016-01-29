Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 11204731F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 06:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0T6eXA1001280; Fri, 29 Jan 2016 06:40:33 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id myM2cIxrtn0D; Fri, 29 Jan 2016 06:40:33 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0T6eU4P001264
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Jan 2016 06:40:32 GMT
Message-ID: <1454049630.10340.60.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Fri, 29 Jan 2016 06:40:30 +0000
In-Reply-To: <56AADEEB.6050106@windriver.com>
References: <cover.1453882496.git.hongxu.jia@windriver.com>
	<1453889810.10340.5.camel@linuxfoundation.org>
	<F43BB7C8-5982-46B5-90B1-D11128DEA616@gmail.com>
	<1453932798.10340.11.camel@linuxfoundation.org>
	<56A983DE.6030907@windriver.com>
	<1454000660.10340.52.camel@linuxfoundation.org>
	<56AADEEB.6050106@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] base/bbclass: use target path to replace build ones in debugging info
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
X-List-Received-Date: Fri, 29 Jan 2016 06:40:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-01-29 at 11:39 +0800, Hongxu Jia wrote:
> On 01/29/2016 01:04 AM, Richard Purdie wrote:
> > On Thu, 2016-01-28 at 10:58 +0800, Hongxu Jia wrote:
> > > On 01/28/2016 06:13 AM, Richard Purdie wrote:
> > > > On Wed, 2016-01-27 at 14:34 -0500, Khem Raj wrote:
> > > > > > On Jan 27, 2016, at 5:16 AM, Richard Purdie <
> > > > > > richard.purdie@linuxfoundation.org> wrote:
> > > > > > 
> > > > > > I like the idea of this a lot, I think it makes sense
> > > > > > however
> > > > > > why
> > > > > > not
> > > My original trying was just added them here, but the variable
> > > parsing
> > > at here is too early, the ${BPN}, ${B} and {S} was assigned with
> > > 'defaultpkgname' at this time. Which we have:
> > > ...
> > > > -fdebug-prefix-map=/buildarea/raid0/hjia/build-20160127-yocto
> > > > -buildpath-2/
> > > tmp/work/core2-64-poky-linux/defaultpkgname/1.0-r0/defaultpkgname
> > > -1.0=
> > > /usr/src/defaultpkgname
> > 
> > I think this is just from your debugging technique. By the time
> > these
> > are used in recipes, they will have the correct value for these
> > variables. Expansion happens late, not when the line is parsed.
> 
> For var DEBUG_FLAGS, it indeed has correct value at last, but the
> CFLAGS
> and TARGET_CFLAGS was expanded when DEBUG_FLAGS has 'defaultpkgname'
> 
> The CFLAGS and TARGET_CFLAGS is shell variables (export CFLAGS=), it
> seems shell variable is expanded only once.
> 
> > 
> > Can you be more specific about how you tested this and the problem
> > you
> > saw?
> 
> 1. Modify bitbake.conf
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e80ee18..3ddb9e8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -546,7 +546,14 @@ EXTRA_OEMAKE_prepend_task-install = 
> "${PARALLEL_MAKEINST} "
>   ##################################################################
>   # Optimization flags.
>   ##################################################################
> -DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types"
> +DEBUG_FLAGS ?= "-g \
> +    -feliminate-unused-debug-types \
> +    -fdebug-prefix-map=${B}=/usr/src/${BPN} \
> +    -fdebug-prefix-map=${S}=/usr/src/${BPN} \
> +    -gno-record-gcc-switches \
> +    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
> +    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
> +"
> 
> 2. Build lib32-glibc, there are still buildpath QA Warnings

I investigated this a little. When I tried your patch I saw:

$ bitbake glibc -e | grep TARGET_CFLAGS=
export TARGET_CFLAGS="
-I/media/build1/poky/build/tmp5/sysroots/qemux86/usr/include -O2 -pipe 
-g -feliminate-unused-debug-types -fdebug-prefix
-map=/media/build1/poky/build/tmp5/work/i586-poky
-linux/defaultpkgname/1.0-r0/defaultpkgname-1.0=/usr/src/defaultpkgname
-fdebug-prefix-map=/media/build1/poky/build/tmp5/work/i586-poky
-linux/defaultpkgname/1.0-r0/defaultpkgname-1.0=/usr/src/defaultpkgname
-gno-record-gcc-switches -fdebug-prefix
-map=/media/build1/poky/build/tmp5/sysroots/x86_64-linux= -fdebug
-prefix-map=/media/build1/poky/build/tmp5/sysroots/qemux86= "

and then once I commented out:

SELECTED_OPTIMIZATION := "${@get_optimization(d)}"

in glibc.inc I see:

$ bitbake glibc -e | grep TARGET_CFLAGS=
export TARGET_CFLAGS="
-I/media/build1/poky/build/tmp5/sysroots/qemux86/usr/include -O2 -pipe 
-g -feliminate-unused-debug-types -fdebug-prefix
-map=/media/build1/poky/build/tmp5/work/i586-poky-linux/glibc/2.22
-r0/build-i586-poky-linux=/usr/src/glibc -fdebug-prefix
-map=/media/build1/poky/build/tmp5/work/i586-poky-linux/glibc/2.22
-r0/git=/usr/src/glibc -gno-record-gcc-switches -fdebug-prefix
-map=/media/build1/poky/build/tmp5/sysroots/x86_64-linux= -fdebug
-prefix-map=/media/build1/poky/build/tmp5/sysroots/qemux86= "

I'd much prefer to fix glibc.inc and put the entries in bitbake.conf
than further complicate the variables unnecessarily.

For example, we could do:

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 17fa2d5..8e62b3a 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -10,25 +10,20 @@ TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 
 # glibc can't be built without optimization, if someone tries to compile an
 # entire image as -O0, we override it with -O2 here and give a note about it.
-def get_optimization(d):
+python () {
     selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
-    if bb.utils.contains("SELECTED_OPTIMIZATION", "-O2", "x", "", d) == "x":
-        return selected_optimization
-    elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O", "x", "", d) == "x":
+    if bb.utils.contains("SELECTED_OPTIMIZATION", "-O", "x", "", d) == "x":
         bb.note("glibc can't be built with -O, -O -Wno-error will be used instead.")
-        return selected_optimization.replace("-O", "-O -Wno-error")
+        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
     elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
-        bb.note("glibc can't be built with -O0, -O2 will be used instead.")
-        return selected_optimization.replace("-O0", "-O2")
+        bb.fatal("glibc can't be built with -O0, using -O1 -Wno-error or -O1 instead.")
     elif bb.utils.contains("SELECTED_OPTIMIZATION", "-Os", "x", "", d) == "x":
         bb.note("glibc can't be built with -Os, -Os -Wno-error will be used instead.")
-        return selected_optimization.replace("-Os", "-Os -Wno-error")
+        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
     elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O1", "x", "", d) == "x":
         bb.note("glibc can't be built with -O1, -O1 -Wno-error will be used instead.")
-        return selected_optimization.replace("-O1", "-O1 -Wno-error")
-    return selected_optimization
-
-SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
+        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
+}
 
 # siteconfig.bbclass runs configure which needs a working compiler
 # For the compiler to work we need a working libc yet libc isn't

which will now give an error for -O0 but I think that is reasonable.
I'd even prefer to drop the above entirely and use bitbake.conf to be
honest but I know some people insisted we should have the above.

Cheers,

Richard

