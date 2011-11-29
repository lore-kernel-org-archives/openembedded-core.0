Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVMr9-0001Da-2J for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 13:32:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATCPZAJ012728;
	Tue, 29 Nov 2011 12:25:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12473-03; Tue, 29 Nov 2011 12:25:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATCPQDf012722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 29 Nov 2011 12:25:28 GMT
Message-ID: <1322569535.3166.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 12:25:35 +0000
In-Reply-To: <CAEsOVNfRuMJfh3HW-6=0ivjngv+e8Dxk7fKo_ySUSgB4EYDrLg@mail.gmail.com>
References: <1322521031-26849-1-git-send-email-msm@freescale.com>
	<CAEsOVNfRuMJfh3HW-6=0ivjngv+e8Dxk7fKo_ySUSgB4EYDrLg@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] eglibc-initial: Fix kernel headers symlink being wrong
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
X-List-Received-Date: Tue, 29 Nov 2011 12:32:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-28 at 23:15 +0000, McClintock Matthew-B29882 wrote:
> On Mon, Nov 28, 2011 at 4:57 PM, Matthew McClintock <msm@freescale.com> wrote:
> > symlinks to the kernel headers were pointing at the wrong
> > location when being used from cache. Just copy the kernel
> > headers instead
> >
> > Signed-off-by: Matthew McClintock <msm@freescale.com>
> > ---
> > Do we need something to depend on the kernel version too since we
> > are copying instead of symlinking? Something like:
> >
> > do_install[vardeps] += "virtual/kernel:do_populate_sysroot"
> >
> >  meta/recipes-core/eglibc/eglibc-common.inc  |    2 +-
> >  meta/recipes-core/eglibc/eglibc-initial.inc |    2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-core/eglibc/eglibc-common.inc b/meta/recipes-core/eglibc/eglibc-common.inc
> > index 4fa6488..6a93968 100644
> > --- a/meta/recipes-core/eglibc/eglibc-common.inc
> > +++ b/meta/recipes-core/eglibc/eglibc-common.inc
> > @@ -3,7 +3,7 @@ DESCRIPTION = "Embedded GLIBC (EGLIBC) is a variant of the GNU C Library (GLIBC)
> >  HOMEPAGE = "http://www.eglibc.org/home"
> >  SECTION = "libs"
> >  LICENSE = "GPLv2 & LGPLv2.1"
> > -INC_PR = "r11"
> > +INC_PR = "r12"
> >  LIC_FILES_CHKSUM ?= "file://LICENSES;md5=07a394b26e0902b9ffdec03765209770 \
> >       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
> >       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
> > diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-core/eglibc/eglibc-initial.inc
> > index 448f73a..f154d64 100644
> > --- a/meta/recipes-core/eglibc/eglibc-initial.inc
> > +++ b/meta/recipes-core/eglibc/eglibc-initial.inc
> > @@ -48,7 +48,7 @@ do_install () {
> >
> >        # add links to linux-libc-headers: gcc-{cross,crossdk}-intermediate need this.
> >        for t in linux asm asm-generic; do
> > -               ln -s ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
> > +               cp -ar ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
> 
> For reference, it looked something like this when used from cache:
> 
> /home/mattsm/git/poky/build/tmp/sysroots/${MACHINE_A}-tcbootstrap/usr/include/linux:
> broken symbolic link to
> `../../../..//sysroots/${MACHINE_B}/usr/include/linux'
> 
> And ${MACHINE_B} did not exist...

Yes, good catch. I'm going to propose a different fix though as the
builds take up a lot of disk space and I'd prefer not to continue to
grow the disk footprint unnecessarily.

Cheers,

Richard



