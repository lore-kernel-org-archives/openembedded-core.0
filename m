Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id F3D3C71D90
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id AF18131C6930;
	Tue, 31 Jan 2017 00:40:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 71QBzuAh8RTx; Tue, 31 Jan 2017 00:40:09 +0100 (CET)
Received: from t510.zcs.saftware.de (55d41ba8.access.ecotel.net
	[85.212.27.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 356A631C698F;
	Tue, 31 Jan 2017 00:40:09 +0100 (CET)
Date: Tue, 31 Jan 2017 00:40:08 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20170131004008.3b3f2cf0@t510.zcs.saftware.de>
In-Reply-To: <20170130232110.GH15833@denix.org>
References: <1485813590-22370-1-git-send-email-obi@opendreambox.org>
	<20170130232110.GH15833@denix.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ffmpeg: disable cpu autodetection
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
X-List-Received-Date: Mon, 30 Jan 2017 23:40:12 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 30 Jan 2017 18:21:10 -0500
Denys Dmytriyenko <denis@denix.org> wrote:

> On Mon, Jan 30, 2017 at 10:59:50PM +0100, Andreas Oberritter wrote:
> > Just pass the correct -mcpu= configure switch (fallback to generic).
> > 
> > Avoids warnings like:
> > | warning: switch -mcpu=cortex-a15 conflicts with -march=armv7-a switch  
> 
> That is actually a valid warning - cortex-a15 is armv7ve, not armv7a...

Agreed. That's why I decided to fix it with this patch.

Regards,
Andreas

> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > ---
> >  meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
> > index 66718c4..c376d82 100644
> > --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
> > +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
> > @@ -66,6 +66,12 @@ PACKAGECONFIG[xv] = "--enable-outdev=xv,--disable-outdev=xv,libxv"
> >  # Check codecs that require --enable-nonfree
> >  USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'openssl' ], 'yes', '', d)}"
> >  
> > +def cpu(d):
> > +    for arg in (d.getVar('TUNE_CCARGS') or '').split():
> > +        if arg.startswith('-mcpu='):
> > +            return arg[6:]
> > +    return 'generic'
> > +
> >  EXTRA_OECONF = " \
> >      --disable-stripping \
> >      --enable-pic \
> > @@ -90,6 +96,7 @@ EXTRA_OECONF = " \
> >      --shlibdir=${libdir} \
> >      --datadir=${datadir}/ffmpeg \
> >      ${@bb.utils.contains('AVAILTUNES', 'mips32r2', '', '--disable-mipsdsp --disable-mipsdspr2', d)} \
> > +    --cpu=${@cpu(d)} \
> >  "
> >  
> >  EXTRA_OECONF_append_linux-gnux32 = " --disable-asm"
> > -- 
> > 2.7.4
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core  


