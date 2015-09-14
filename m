Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 0FA246E26B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 19:53:27 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZbZob-0007yh-Hw; Mon, 14 Sep 2015 21:53:25 +0200
Message-ID: <1442260397.2948.87.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Sep 2015 20:53:17 +0100
In-Reply-To: <7D6F58E5-BF37-4757-8B9A-5C37BAE5ED8E@gmail.com>
References: <1442247767-7879-1-git-send-email-juro.bystricky@intel.com>
	<7D6F58E5-BF37-4757-8B9A-5C37BAE5ED8E@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: richard.purdie@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libgcc.inc: package baremetal multilib libraries
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
X-List-Received-Date: Mon, 14 Sep 2015 19:53:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2015-09-14 at 09:38 -0700, Khem Raj wrote:
> > On Sep 14, 2015, at 9:22 AM, Juro Bystricky <juro.bystricky@intel.com> wrote:
> > 
> > When building libgcc for baremetal cross-compilers, some files and libraries
> > may be built but not packaged. This patch fixes errors such as these:
> > 
> > ERROR: QA Issue: libgcc: Files/directories were installed but not shipped in any package:
> >  /usr/lib/arm-poky-eabi/4.9.3/thumb
> >  /usr/lib/arm-poky-eabi/4.9.3/fpu
> >  /usr/lib/arm-poky-eabi/4.9.3/thumb/libgcov.a
> >  /usr/lib/arm-poky-eabi/4.9.3/thumb/crtn.o
> >  /usr/lib/arm-poky-eabi/4.9.3/thumb/crtend.o
> >  /usr/lib/arm-poky-eabi/4.9.3/thumb/crtbegin.o
> >  /usr/lib/arm-poky-eabi/4.9.3/thumb/libgcc.a
> >  /usr/lib/arm-poky-eabi/4.9.3/thumb/crti.o
> >  /usr/lib/arm-poky-eabi/4.9.3/fpu/libgcov.a
> >  /usr/lib/arm-poky-eabi/4.9.3/fpu/crtn.o
> >  /usr/lib/arm-poky-eabi/4.9.3/fpu/crtend.o
> >  /usr/lib/arm-poky-eabi/4.9.3/fpu/crtbegin.o
> >  /usr/lib/arm-poky-eabi/4.9.3/fpu/libgcc.a
> >  /usr/lib/arm-poky-eabi/4.9.3/fpu/crti.o
> > Please set FILES such that these items are packaged. Alternatively if they are unneeded,
> > avoid installing them or delete them within do_install. [installed-vs-shipped]
> > 
> > Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> > ---
> > meta/recipes-devtools/gcc/libgcc.inc | 6 ++++++
> > 1 file changed, 6 insertions(+)
> > 
> > diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
> > index 739adbd..95709e4 100644
> > --- a/meta/recipes-devtools/gcc/libgcc.inc
> > +++ b/meta/recipes-devtools/gcc/libgcc.inc
> > @@ -28,6 +28,12 @@ FILES_${PN}-dev = "\
> >     ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
> > "
> > 
> > +FILES_${PN}-dev_libc-baremetal = "\
> > +    ${base_libdir}/ \
> > +    ${libdir}/* \
> > +    ${libdir}/${TARGET_SYS}/* \
> > +”
> 
> why not put it into libgcc-dev itself 

Agreed.  I think the real issue here is nothing really to do with
baremetal, it's just that the existing FILES_${PN}-dev pattern doesn't
consider multilib for anything other than IA and mips.

p.



