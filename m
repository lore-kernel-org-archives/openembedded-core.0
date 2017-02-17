Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0360C71BD4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 10:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 63C2E31C1723;
	Fri, 17 Feb 2017 11:31:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id EX0sWVjmsJwI; Fri, 17 Feb 2017 11:31:04 +0100 (CET)
Received: from t510.zcs.saftware.de (p57A61904.dip0.t-ipconnect.de
	[87.166.25.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 1A95531C15EE;
	Fri, 17 Feb 2017 11:31:04 +0100 (CET)
Date: Fri, 17 Feb 2017 11:31:03 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170217113103.31b0f456@t510.zcs.saftware.de>
In-Reply-To: <CAMKF1sqB+nL1kRny7e9JCfdYO7fkOEKQoqCngm09hgSURLeR=Q@mail.gmail.com>
References: <1487241290-6188-1-git-send-email-obi@opendreambox.org>
	<1487241290-6188-3-git-send-email-obi@opendreambox.org>
	<CAMKF1sqB+nL1kRny7e9JCfdYO7fkOEKQoqCngm09hgSURLeR=Q@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] ffmpeg: Build libpostproc even if global gpl flag is unset
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
X-List-Received-Date: Fri, 17 Feb 2017 10:31:08 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 16 Feb 2017 07:39:17 -0800 Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Feb 16, 2017 at 2:34 AM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
> > The libpostproc package has an explicit GPLv2+ license tag.
> >
> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > ---
> >  ...figure-allow-libpostproc-without-gpl-flag.patch | 34 ++++++++++++++++++++++
> >  meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb     |  1 +
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0002-configure-allow-libpostproc-without-gpl-flag.patch
> >
> > diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-configure-allow-libpostproc-without-gpl-flag.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-configure-allow-libpostproc-without-gpl-flag.patch
> > new file mode 100644
> > index 0000000..dc11f34
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-configure-allow-libpostproc-without-gpl-flag.patch
> > @@ -0,0 +1,34 @@
> > +Upstream-Status: inappropriate [distro-specific]
> > +
> > +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > +
> > +From 9c28ed17d1184ee95819e4c576373c20fe2c3600 Mon Sep 17 00:00:00 2001
> > +From: Andreas Oberritter <obi@opendreambox.org>
> > +Date: Sat, 11 Feb 2017 22:57:42 +0100
> > +Subject: [PATCH] configure: allow libpostproc without gpl flag
> > +
> > +There may be GPL'ed programs in a distribution which want libpostproc,
> > +while other GPL-incompatible programs use some of the other libraries
> > +provided by ffmpeg.
> > +
> > +Since we know the license of libpostproc, we mark the resulting binary
> > +package accordingly instead of refusing to build it.  
> 
> 
> this changes the documented behavior IMO we should discuss it upstream
> otherwise it will be hard to explain this to legal people.

Really? I don't see why. There's no difference to any other GPL package we
build. The documentation says libpostroc is GPL'ed. The recipe does the same.
No surprises for legal people involved.

I'm not going to annoy upstream with this, because this change is not suitable
for upstream. That's why it carries the 'inappropriate' tag.

Regards,
Andreas

> 
> > +
> > +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > +---
> > + configure | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/configure b/configure
> > +index d60ffd8..cd53e6c 100755
> > +--- a/configure
> > ++++ b/configure
> > +@@ -3135,7 +3135,7 @@ avdevice_deps="avformat avcodec avutil"
> > + avfilter_deps="avutil"
> > + avformat_deps="avcodec avutil"
> > + avresample_deps="avutil"
> > +-postproc_deps="avutil gpl"
> > ++postproc_deps="avutil"
> > + swresample_deps="avutil"
> > + swscale_deps="avutil"
> > +
> > diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
> > index dc33bb4..555c72b 100644
> > --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
> > +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
> > @@ -26,6 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> >  SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
> >             file://mips64_cpu_detection.patch \
> >             file://0001-avutil-log-avoid-build-error-if-valgrind-was-removed.patch \
> > +           file://0002-configure-allow-libpostproc-without-gpl-flag.patch \
> >            "
> >  SRC_URI[md5sum] = "e34d1b92c5d844f2a3611c741a6dba18"
> >  SRC_URI[sha256sum] = "3f01bd1fe1a17a277f8c84869e5d9192b4b978cb660872aa2b54c3cc8a2fedfc"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core  


