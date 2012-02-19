Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rz8VZ-00006v-KS for openembedded-core@lists.openembedded.org;
	Sun, 19 Feb 2012 16:17:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1JF8fQZ024162;
	Sun, 19 Feb 2012 15:08:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18864-10; Sun, 19 Feb 2012 15:08:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1JF8SBg024155
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 19 Feb 2012 15:08:31 GMT
Message-ID: <1329664108.7006.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Date: Sun, 19 Feb 2012 15:08:28 +0000
In-Reply-To: <CAEsOVNfS-UvJPCR527463OzKJLvVxK7GAnwr_==Lz7sjEOsYbA@mail.gmail.com>
References: <1320883434.10843.244.camel@ted>
	<CAEsOVNfS-UvJPCR527463OzKJLvVxK7GAnwr_==Lz7sjEOsYbA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: useradd: Add missing DEPEND on shadow
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
X-List-Received-Date: Sun, 19 Feb 2012 15:17:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-02-19 at 07:29 +0000, McClintock Matthew-B29882 wrote:
> On Wed, Nov 9, 2011 at 4:03 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Without this rootfs generation fails as an RDEPENDS is added
> > but the package might not have bneen built.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> > index 8cd7f4f..7faf1a7 100644
> > --- a/meta/classes/useradd.bbclass
> > +++ b/meta/classes/useradd.bbclass
> > @@ -2,7 +2,7 @@
> >  # target sysroot, and shadow -native and -sysroot provide the utilities
> >  # and support files needed to add and modify user and group accounts
> >  DEPENDS_append = "${USERADDDEPENDS}"
> > -USERADDDEPENDS = " base-passwd shadow-native shadow-sysroot"
> > +USERADDDEPENDS = " base-passwd shadow-native shadow-sysroot shadow"
> 
> The shadow recipe is a 'PACKAGE_ARCH = "${MACHINE_ARCH}"' recipe. This
> makes all recipes that inherit useradd depend on shadow which will
> depend on the MACHINE being built for. Ideally, we just need a way to
> ensure these packages are deployed - we don't want them to effect
> signatures.
> 
> Can you suggest a better fix here? Some
> bb.exec_func("shadow:do_populate_sysroot") or something equivalent?

This was already fixed:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7c8899662be5623bedaa9a848fafebeafb348cf0

and the new machine specific subpackage is excluded from sstate's
signatures.

Cheers,

Richard



