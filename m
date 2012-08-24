Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T4w0p-0005Of-Mb for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 17:41:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OFTNOa014134;
	Fri, 24 Aug 2012 16:29:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12212-03; Fri, 24 Aug 2012 16:29:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OFTFb1014128
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 24 Aug 2012 16:29:16 +0100
Message-ID: <1345822157.14369.74.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2012 16:29:17 +0100
In-Reply-To: <394E54E4-815B-42CD-BFA2-5CDE2744B1FB@gmail.com>
References: <1345817543.14369.70.camel@ted>
	<394E54E4-815B-42CD-BFA2-5CDE2744B1FB@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.7: Add fix for libtool rpath problems
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 15:41:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-24 at 07:57 -0700, Khem Raj wrote:
> On Aug 24, 2012, at 7:12 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > This avoids problems with libstdc++ having bad rpaths (/usr/lib/../.lib)
> > in its .la file. See the patch for more information.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
> > index 36ce1be..84c230c 100644
> > --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> > @@ -1,6 +1,6 @@
> > require gcc-common.inc
> > 
> > -PR = "r10"
> > +PR = "r11"
> > 
> > # Third digit in PV should be incremented after a minor release
> > # happens from this branch on gcc e.g. currently its 4.7.1
> > @@ -74,6 +74,7 @@ SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};protocol=git \
> > 	   file://gcc-argument-list-too-long.patch \
> > 	   file://fix-g++-sysroot.patch \
> > 	   file://disablesdt.patch \
> > +	   file://libtool.patch \
> > 	  "
> > 
> > S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
> > diff --git a/meta/recipes-devtools/gcc/gcc-4.7/libtool.patch b/meta/recipes-devtools/gcc/gcc-4.7/libtool.patch
> > new file mode 100644
> > index 0000000..9580b23
> > --- a/dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-4.7/libtool.patch
> > @@ -0,0 +1,29 @@
> > +libstdc++ from gcc-runtime gets created with -rpath=/usr/lib/../lib for qemux86-64
> > +when running on am x86_64 build host.
> > +
> > +This patch stops this speading to libdir in the libstdc++.la file within libtool.
> > +Aguably, it shouldn't be passing this into libtool in the first place but
> > +for now this resolves the nastiest problems this causes.
> > +
> > +func_normal_abspath would resolve an empty path to `pwd` so we need
> > +to filter the zero case.
> > +
> > +RP 2012/8/24
> > +
> > +Upstream-Status: Pending
> > +
> > +Index: git/ltmain.sh
> > +===================================================================
> > +--- git.orig/ltmain.sh	2012-08-24 11:45:58.597087961 +0000
> > ++++ git/ltmain.sh	2012-08-24 12:18:37.961042581 +0000
> > +@@ -6359,6 +6359,10 @@
> > + 	func_warning "ignoring multiple \`-rpath's for a libtool library"
> > + 
> > +       install_libdir="$1"
> > ++      if test -n "$install_libdir"; then
> > ++	func_normal_abspath "$install_libdir"
> > ++	install_libdir=$func_normal_abspath_result
> > ++      fi
> > + 
> 
> this looks ok to me. Did we post the libtool patch upstream ?

Not yet. We could do with going and talking to them about our libtool
patchset...

Right now I'm just trying to get the builds working. I shouldn't have
merged that sanity test yet :/.

Cheers,

Richard



