Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sstj5-00062k-FC for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 12:49:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6MAc3xp027362;
	Sun, 22 Jul 2012 11:38:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19932-09; Sun, 22 Jul 2012 11:37:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6MAbsZc027356
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 22 Jul 2012 11:37:55 +0100
Message-ID: <1342953478.21788.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jul 2012 11:37:58 +0100
In-Reply-To: <5009F538.6090007@linux.intel.com>
References: <cover.1342772908.git.liezhi.yang@windriver.com>
	<5735964eb9bdb685cf35d2ecdbb1694f5f6a5036.1342772908.git.liezhi.yang@windriver.com>
	<5009F538.6090007@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 2/2] createrepo 0.4.11: fix the RDEPENDS
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
X-List-Received-Date: Sun, 22 Jul 2012 10:49:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-20 at 17:18 -0700, Saul Wold wrote:
> On 07/20/2012 02:49 AM, Robert Yang wrote:
> > The libxml2-native and rpm-native should be ready before createrepo
> > runs since it needs "import libxml2 rpm".
> >
> > The target createrepo needs libxml2-python when run, but the libxml2
> > doesn't generate the python module (disabled). We may need to fix it
> > or rename the recipe to createrepo-native_0.4.11.bb.
> >
> > This recipe is only for the rpm backend system.
> >
> > [YOCTO #2753]
> >
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >   .../createrepo/createrepo_0.4.11.bb                |    4 +++-
> >   1 files changed, 3 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
> > index 060ed59..7a4d059 100644
> > --- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
> > +++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
> > @@ -4,7 +4,9 @@ HOMEPAGE = "http://createrepo.baseurl.org/"
> >   LICENSE = "GPLv2+"
> >   LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
> >
> > -PR = "r3"
> > +RDEPENDS_${PN}_virtclass-native += "libxml2-native rpm-native"
> > +
> This should not be required here since the package_rpm.bbclass contains 
> a line:
> PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
> 
> We might need to add libxml2-native to the PACKAGEINDEXDEPS

FWIW, having correct RDEPENDS in the recipes is important so this fix is
a good one regardless of whether it fixes the other issue or not.

Cheers,

Richard



