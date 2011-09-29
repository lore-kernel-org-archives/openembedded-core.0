Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9LiE-00034x-P9 for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 20:52:02 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TIqSG5012570; Thu, 29 Sep 2011 19:52:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fNRJziO1estb; Thu, 29 Sep 2011 19:52:28 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TIqQB9012560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 29 Sep 2011 19:52:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 19:46:00 +0100
In-Reply-To: <CAEsOVNd7317kDeGBNB6HLy2bpQB102piFtAMxVriX1GocaCXew@mail.gmail.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
	<1317270070-14250-7-git-send-email-msm@freescale.com>
	<1317311457.12332.99.camel@ted>
	<CAEsOVNd7317kDeGBNB6HLy2bpQB102piFtAMxVriX1GocaCXew@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317321967.12332.113.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 07/16] Fix lttng-ust for powerpc64
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
X-List-Received-Date: Thu, 29 Sep 2011 18:52:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-29 at 18:21 +0000, McClintock Matthew-B29882 wrote:
> On Thu, Sep 29, 2011 at 10:50 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2011-09-28 at 23:21 -0500, Matthew McClintock wrote:
> >> Signed-off-by: Matthew McClintock <msm@freescale.com>
> >> ---
> >>  meta/recipes-kernel/lttng/fix-powerpc64.patch |   17 +++++++++++++++++
> >>  meta/recipes-kernel/lttng/lttng-ust_0.15.bb   |    3 ++-
> >>  2 files changed, 19 insertions(+), 1 deletions(-)
> >>  create mode 100644 meta/recipes-kernel/lttng/fix-powerpc64.patch
> >>
> >> diff --git a/meta/recipes-kernel/lttng/fix-powerpc64.patch b/meta/recipes-kernel/lttng/fix-powerpc64.patch
> >> new file mode 100644
> >> index 0000000..d347979
> >> --- /dev/null
> >> +++ b/meta/recipes-kernel/lttng/fix-powerpc64.patch
> >> @@ -0,0 +1,17 @@
> >> +Upstream-Status: Inappropriate configuration
> >
> > Is this really inappropriate for upstream? It looks reasonable to me...
> 
> Seems reasonable. What is the policy on this? Can I mark it "this
> should be upstreamed" or must I mark it "this was sent upstream" and
> then upstream the change?

There is some marking for "should be upstreamed"/upstreamable.

> >> +Add bit to detect if we are running on powerpc64 and treat it the
> >> +same as ppc64
> >> +
> >> +Index: ust-0.15/configure.ac
> >> +===================================================================
> >> +--- ust-0.15.orig/configure.ac
> >> ++++ ust-0.15/configure.ac
> >> +@@ -111,6 +111,7 @@ changequote([,])dnl
> >> +     x86_64) LIBFORMAT="elf64-x86-64" ;;
> >> +     powerpc) LIBFORMAT="elf32-powerpc" ;;
> >> +     ppc64) LIBFORMAT="elf64-powerpc" ;;
> >> ++    powerpc64) LIBFORMAT="elf64-powerpc" ;;
> >> +     s390) LIBFORMAT="elf32-s390" ;;
> >> +     s390x) LIBFORMAT="elf64-s390" ;;
> >> +         armv5) LIBFORMAT="elf32-littlearm"; NO_UNALIGNED_ACCESS=1 ;;
> >> diff --git a/meta/recipes-kernel/lttng/lttng-ust_0.15.bb b/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
> >> index 915e619..9dd4658 100644
> >> --- a/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
> >> +++ b/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
> >> @@ -10,9 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e647752e045a8c45b6f583771bd561ef \
> >>
> >>  DEPENDS = "liburcu"
> >>
> >> -PR = "r2"
> >> +PR = "r3"
> >>
> >>  SRC_URI = "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz"
> >> +SRC_URI_append_powerpc64 = " file://fix-powerpc64.patch"
> >
> > Does this really need to be conditional on powerppc64? Looks like it can
> > be applied unconditionally...
> 
> True, was trying to minimally effect other stuff. But I take it by the
> comment you prefer this be done away with.

Sometimes minimally affecting other code is good. In this its obviously
not going to break anything else so it can be universal. The risk of
minimal application is fewer people testing it, e.g. when versions get
upgraded.

Cheers,

Richard



