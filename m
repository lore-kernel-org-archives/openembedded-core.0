Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web12.247.1616520469786754993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 10:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4F4dc33MR5z5tlB;
	Tue, 23 Mar 2021 18:27:47 +0100 (CET)
Date: Tue, 23 Mar 2021 18:27:46 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Yann Dirson <yann.dirson@blade-group.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Yann Dirson <yann@blade-group.com>
Subject: Re: [OE-core] [PATCH] [RFC] ffmpeg: make LICENSE_FLAGS fine-grained
Message-ID: <20210323172746.ovdldryxjlupqvdj@qschulz>
References: <20210323163742.810094-1-yann@blade-group.com>
 <CANNYZj8fm0vTpB-p0PFJNmF4S8oOBmKGhK+R7PBhOdKZXy4R7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8fm0vTpB-p0PFJNmF4S8oOBmKGhK+R7PBhOdKZXy4R7A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On Tue, Mar 23, 2021 at 05:42:20PM +0100, Alexander Kanavin wrote:
> Is it possible to further split the NONCOMMERCIAL_PACKAGECONFIGS into ones
> that are enabled and disabled, and use the former in PACKAGECONFIG itself?
> 
> Alex
> 
> On Tue, 23 Mar 2021 at 17:38, Yann Dirson <yann.dirson@blade-group.com>
> wrote:
> 
> > From: Yann Dirson <yann@blade-group.com>
> >
> > The rationale here is that if the user can only whitelist "commercial"
> > to use any part of ffmpeg, even it the list of features is carefully
> > reviewed when switching the whitelisting on, there was nothing to
> > guard from inadvertently activating a new feature that would not have
> > been reviewed.
> >
> > This patch adds one LICENSE_FLAGS value for each feature, except for
> > those that bring no codec, trying to be on the same level of legal
> > safety - but then I may miss something.
> >
> > I tried to leave out of the safe NONCOMMERCIAL_PACKAGECONFIGS list
> > anything that brings a codec, notably libavcodec.  I also did not look
> > at non-default features yet.
> >
> > There may still be a problem if any feature in ffmpeg gets activated
> > by default upstream and not registed as a PACKAGECONFIG feature.  At
> > least any of those that depend on another lib would not be enabled,
> > that could be seen as a sufficient safeguard.
> > ---
> >  meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> > b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> > index 08be38ca50..3a36c95151 100644
> > --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> > +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> > @@ -16,7 +16,17 @@ LICENSE_libavutil =
> > "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGP
> >  LICENSE_libpostproc = "GPLv2+"
> >  LICENSE_libswresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> > 'GPLv2+', 'LGPLv2.1+', d)}"
> >  LICENSE_libswscale = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> > 'GPLv2+', 'LGPLv2.1+', d)}"
> > -LICENSE_FLAGS = "commercial"
> > +
> > +# PACKAGECONFIG features that do not pull codecs
> > +NONCOMMERCIAL_PACKAGECONFIGS = " \
> > + alsa bzlib drm gpl lzma zlib xcb xv \
> > + avdevice avfilter avformat swresample swscale postproc avresample \
> > +"
> > +# An ffmpeg feature not in NONCOMMERCIAL_PACKAGECONFIGS should be
> > explicitly whitelisted.
> > +# See https://ffmpeg.org/legal.html
> > +LICENSE_FLAGS = "${@' '.join('commercial_' + cfg \
> > +                             for cfg in '${PACKAGECONFIG}'.split() \

I would at least make it commercial_ffmpeg- + cfg. To make it obvious
that it belongs to ffmpeg recipe/packages.

I guess it breaks backward compatibility, which IMO is fine unless there
is a possibility someone who blacklisted this commercial license in some
way now has it enabled. I don't know enough about the inner workings of
LICENSE_FLAGS so cannot say if this is covered or not.

Quentin
