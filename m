Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D795661222
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 18:52:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7CJ37v4005412; Mon, 12 Aug 2013 20:03:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QgQNsjTJyBb8; Mon, 12 Aug 2013 20:03:06 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7CJ31Bd005392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 12 Aug 2013 20:03:03 +0100
Message-ID: <1376333513.1838.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Francois Retief <fgretief@gmail.com>
Date: Mon, 12 Aug 2013 19:51:53 +0100
In-Reply-To: <CAFpw0gLwDcf-yULb7UDX=MS=PH3=AU0iMf+_0zaG-Ov1mELKyw@mail.gmail.com>
References: <CAFpw0gLwDcf-yULb7UDX=MS=PH3=AU0iMf+_0zaG-Ov1mELKyw@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-mingw] eglibc-initial package getting in the way
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
X-List-Received-Date: Mon, 12 Aug 2013 18:52:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-08-09 at 18:16 +0200, Francois Retief wrote:
> I am working on a MinGW SDK layer for OpenEmbedded.  At this point, I
> got to the 
> point where the "gcc-crosssdk" package builds successfully. 
>
> My next target is to build the "nativesdk-libgcc" package. But the 
> "nativesdk-eglibc-initial package" is getting in the way. As one can
> see from 
> the log output below, eglibc, it complains that the mingw32
> environment is not 
> supported.
>
> So I switched TCLIBC in local.conf to "uclibc" in the hope that it
> would do better, 
> but same error message. Same package gets built.
>
> Also there is a BitBake warning about multiple package that provides
> the same libc-for-gcc package. But when I run gcc-crosssdk, there is
> no such clash.
>
> Thus my question is, where does the eglibc package get included in the
> dependency 
> tree? I worked through the package-depends.dot file to try and find
> what is 
> referencing this package but with no luck.

I had a look at your repository and also tried building with it, looks
good so far. TCLIBC is the wrong thing to play with, the issue is that
you need to totally replace nativesdk-libc* with the mingw-w64-runtime
package. This means it needs to have all the right PROVIDES to do this.
The warning when you run "bitbake meta-toolchain":

ERROR: Multiple .bb files are due to be built which each provide
virtual/nativesdk-x86_64-pokysdk-mingw32-libc-for-gcc
(virtual:nativesdk:/media/build1/poky/meta-mingw/recipes-devtools/mingw-w64/mingw-w64-runtime_2.0.8.bb virtual:nativesdk:/media/build1/poky/meta/recipes-core/eglibc/eglibc_2.18.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide
virtual/nativesdk-libc
(virtual:nativesdk:/media/build1/poky/meta-mingw/recipes-devtools/mingw-w64/mingw-w64-runtime_2.0.8.bb virtual:nativesdk:/media/build1/poky/meta/recipes-core/eglibc/eglibc_2.18.bb).
 This usually means one provides something the other doesn't and should.

clearly shows its trying to build both and is rather confused. I'm going
to poke at this a little further and see if I can give some better
pointers as to how to fix this...

Cheers,

Richard






