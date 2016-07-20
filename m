Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id D3D33607F8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 22:14:59 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 0758F203EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 18:15:00 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute1.internal (MEProxy); Wed, 20 Jul 2016 18:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Blzh7ot4wO6sLk+
	lQI6pD5tnJZw=; b=PhAexXV4Q7zv8GgTL0w4z9YiuPnDNETLRhgbH5cX8exK/Lt
	7v/Ga4q0nFbkNeBg4sbgOro0/4DnE2k/YHdwhSo1gdDdxH/SXwKAhoiftI0ii8HT
	asUoQqhCRrqBr+CaWy4nDqZFxp5OJ6o5npMNCeaDkkPH94+FZu+nv9HqWhKA=
X-Sasl-enc: oTcJ+/VtpCuPXiAqi6jED9tfFYQXiNpPt1IVwivERrxq 1469052899
Received: from laptop (a88-113-211-72.elisa-laajakaista.fi [88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 828AEF29FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 18:14:59 -0400 (EDT)
Message-ID: <1469052898.3210.214.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2016 01:14:58 +0300
In-Reply-To: <1468977534.3210.168.camel@iki.fi>
References: <cover.1468973641.git.tanuk@iki.fi>
	<425887ce6e0187155974cabc2071f5189f7cc1a1.1468973641.git.tanuk@iki.fi>
	<CAMKF1sr8p21xDXNMScg8MUdRFh3=8O+zuxL--_A-jV52Dez1wQ@mail.gmail.com>
	<1468977534.3210.168.camel@iki.fi>
X-Mailer: Evolution 3.20.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] pulseaudio: disable WebRTC code
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
X-List-Received-Date: Wed, 20 Jul 2016 22:15:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-07-20 at 04:18 +0300, Tanu Kaskinen wrote:
> On Tue, 2016-07-19 at 17:54 -0700, Khem Raj wrote:
> > On Tue, Jul 19, 2016 at 5:20 PM, Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > When updating pulseaudio to 9.0, I noticed webrtc-audio-processing is
> > > a potential floating dependency. It's not an issue right now, because
> > > webrtc-audio-processing isn't packaged for OpenEmbedded, but it would
> > > become an issue if anyone added the library to OE.
> > > 
> > > Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
> > > ---
> > >  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> > > index accafe1..2cf3fb4 100644
> > > --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> > > +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> > > @@ -37,6 +37,10 @@ EXTRA_OECONF = "\
> > >  # oe-core nor meta-oe, so let's not add a PACKAGECONFIG entry for it for now.
> > >  EXTRA_OECONF += "--without-soxr"
> > > 
> > > +# The WebRTC echo canceller depends on the webrtc-audio-processing library,
> > > +# which is not yet packaged for OpenEmbedded.
> > > +EXTRA_OECONF += "--disable-webrtc-aec"
> > > +
> > 
> > may be turn it into a packageconfig ?
> 
> Ok, I can do that. I felt uncomfortable adding a packageconfig for
> this, because I'd have to reference a non-existing recipe, and who
> knows what the recipe will actually be named when it gets packaged, but
> I suppose a potential naming mismatch isn't a big risk.

I sent a patch for this now.

Assuming that there are no further comments, please apply the first two
patches of this series and ignore the third one.

-- 
Tanu

