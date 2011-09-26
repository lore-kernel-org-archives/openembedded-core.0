Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8EaP-0002JV-2z for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 19:03:21 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QH4Chn004525 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 18:04:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZoPRlRq9H-vT
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 18:04:12 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QH49av004520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 18:04:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2011 17:57:46 +0100
In-Reply-To: <ED60D3CD-738C-4796-B242-F97880DC74FF@dominion.thruhere.net>
References: <8ad24306d8bc9c2fd73f4b814eb1a64c04707da5.1316963134.git.richard.purdie@linuxfoundation.org>
	<002ad30dae74393120d2391602371116af1bb11d.1316963134.git.richard.purdie@linuxfoundation.org>
	<ED60D3CD-738C-4796-B242-F97880DC74FF@dominion.thruhere.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317056272.26109.66.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 6/9] libtool: Fix an issue where unnecessary rpaths were being injected
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
X-List-Received-Date: Mon, 26 Sep 2011 17:03:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-09-25 at 18:14 +0200, Koen Kooi wrote:
> Op 25 sep. 2011, om 17:56 heeft Richard Purdie het volgende geschreven:
> 
> > libtool was being to aggressive in adding rpath to binaries. This
> > change stops it adding them if that path the default search path.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > meta/recipes-devtools/libtool/libtool-cross_2.4.bb |    2 +-
> > .../recipes-devtools/libtool/libtool-native_2.4.bb |    2 +-
> > .../libtool/libtool-nativesdk_2.4.bb               |    2 +-
> > meta/recipes-devtools/libtool/libtool.inc          |    3 +-
> > meta/recipes-devtools/libtool/libtool/1            |   55 +++++++++++++++++
> > .../libtool/libtool/fix-rpath.patch                |   63 ++++++++++++++++++++
> > meta/recipes-devtools/libtool/libtool_2.4.bb       |    2 +-
> > 7 files changed, 124 insertions(+), 5 deletions(-)
> > create mode 100644 meta/recipes-devtools/libtool/libtool/1
> > create mode 100644 meta/recipes-devtools/libtool/libtool/fix-rpath.patch
> > 
> > diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> > index 25ac580..6d512b1 100644
> > --- a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> > +++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> > @@ -1,6 +1,6 @@
> > require libtool-${PV}.inc
> > 
> > -PR = "r2"
> > +PR = "r4"
> > PACKAGES = ""
> > SRC_URI += "file://prefix.patch"
> > 
> > diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.bb
> > index 423622f..3d0998e 100644
> > --- a/meta/recipes-devtools/libtool/libtool-native_2.4.bb
> > +++ b/meta/recipes-devtools/libtool/libtool-native_2.4.bb
> > @@ -2,7 +2,7 @@ require libtool-${PV}.inc
> > 
> > DEPENDS = ""
> > 
> > -PR = "r2"
> > +PR = "r4"
> > SRC_URI += "file://prefix.patch"
> > 
> > inherit native
> > diff --git a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb b/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
> > index 4f67fed..a96d1d1 100644
> > --- a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
> > +++ b/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
> > @@ -1,6 +1,6 @@
> > require libtool-${PV}.inc
> > 
> > -PR = "r2"
> > +PR = "r4"
> > SRC_URI += "file://prefix.patch"
> > 
> > inherit nativesdk
> > diff --git a/meta/recipes-devtools/libtool/libtool.inc b/meta/recipes-devtools/libtool/libtool.inc
> > index d423e49..ef9095b 100644
> > --- a/meta/recipes-devtools/libtool/libtool.inc
> > +++ b/meta/recipes-devtools/libtool/libtool.inc
> > @@ -15,7 +15,8 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
> >            file://resolve-sysroot.patch \
> >            file://use-sysroot-in-libpath.patch \
> >            file://fix-final-rpath.patch \
> > -           file://avoid_absolute_paths_for_general_utils.patch "
> > +           file://avoid_absolute_paths_for_general_utils.patch \
> > +           file://fix-rpath.patch "
> > 
> > do_compile_prepend () {
> > 	# Sometimes this file doesn't get rebuilt, force the issue
> > diff --git a/meta/recipes-devtools/libtool/libtool/1 b/meta/recipes-devtools/libtool/libtool/1
> > new file mode 100644
> > index 0000000..b3ee955
> > --- /dev/null
> > +++ b/meta/recipes-devtools/libtool/libtool/1
> 
> stray file?

Good catch. I tested this a bit more, liked the results and merged it,
minus this file.

We should notice a lot of the RPATH warnings going away with this
change.

Cheers,

Richard



