Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C1C8061222
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 22:04:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7CMF5Ri010485; Mon, 12 Aug 2013 23:15:05 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uUM6z5__DaQd; Mon, 12 Aug 2013 23:15:05 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7CMF0hG010469
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 12 Aug 2013 23:15:02 +0100
Message-ID: <1376345031.1838.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Francois Retief <fgretief@gmail.com>
Date: Mon, 12 Aug 2013 23:03:51 +0100
In-Reply-To: <1376333513.1838.3.camel@ted>
References: <CAFpw0gLwDcf-yULb7UDX=MS=PH3=AU0iMf+_0zaG-Ov1mELKyw@mail.gmail.com>
	<1376333513.1838.3.camel@ted>
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
X-List-Received-Date: Mon, 12 Aug 2013 22:04:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-08-12 at 19:51 +0100, Richard Purdie wrote:
> On Fri, 2013-08-09 at 18:16 +0200, Francois Retief wrote:
> > I am working on a MinGW SDK layer for OpenEmbedded.  At this point, I
> > got to the 
> > point where the "gcc-crosssdk" package builds successfully. 
> >
> > My next target is to build the "nativesdk-libgcc" package. But the 
> > "nativesdk-eglibc-initial package" is getting in the way. As one can
> > see from 
> > the log output below, eglibc, it complains that the mingw32
> > environment is not 
> > supported.
> >
> > So I switched TCLIBC in local.conf to "uclibc" in the hope that it
> > would do better, 
> > but same error message. Same package gets built.
> >
> > Also there is a BitBake warning about multiple package that provides
> > the same libc-for-gcc package. But when I run gcc-crosssdk, there is
> > no such clash.
> >
> > Thus my question is, where does the eglibc package get included in the
> > dependency 
> > tree? I worked through the package-depends.dot file to try and find
> > what is 
> > referencing this package but with no luck.

I played a bit with this and shared some tweaks as:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/meta-mingw

With those applied, "bitbake gcc-cross-canadian-i586
binutils-cross-canadian-i586 -k" results in:

Summary: 6 tasks failed:
  virtual:nativesdk:/media/build1/poky/meta/recipes-core/zlib/zlib_1.2.8.bb, do_compile
  virtual:nativesdk:/media/build1/poky/meta/recipes-devtools/gcc/libgcc_4.8.bb, do_package
[easy to fix, not blocking the build]
  /media/build1/poky/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.2.bb, do_compile
  virtual:nativesdk:/media/build1/poky/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_compile
  virtual:nativesdk:/media/build1/poky/meta/recipes-support/mpfr/mpfr_3.1.2.bb, do_configure
[shared gmp lib is bust, --disable-shared might make mpfr build]
  virtual:nativesdk:/media/build1/poky/meta/recipes-core/gettext/gettext_0.18.2.bb, do_compile

which is progress I guess. I've commented on a couple of the failures,
I've not looked at the others. zlib is probably the one to get building
next.

The root cause was the libintl/libiconv providers being problematic.
I've hacked those for now to make the build work, we can worry about
sorting proper providers later should that be an issue.

Cheers,

Richard



