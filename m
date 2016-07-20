Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 5A34B6067D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 01:18:56 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id E981A206CE;
	Tue, 19 Jul 2016 21:18:56 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute1.internal (MEProxy); Tue, 19 Jul 2016 21:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=dtO+XuczyfrKfT2
	nKsKfXjM+rjA=; b=LpHmEFxXdei2Gf7Ujq11JIl4N9zb61pSIQrqBxsTOoT2ZQS
	DBB56QrIhDtPsdMpkzrjXpPvcYix6jlxrPfj2d7b3l/xQ7FCyJH4sqRH8ao3dffT
	jYX8CfA32XNxXG6y9rvdUZkEg7hoytcNrHOOM6rPL74ObN0NArVJuL7ix4sE=
X-Sasl-enc: n3emU7YBWPd377GAbLaTqYdhS9qH3BRTsCTlcapA0QCk 1468977536
Received: from laptop (a88-113-211-72.elisa-laajakaista.fi [88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 548E0F29EE;
	Tue, 19 Jul 2016 21:18:56 -0400 (EDT)
Message-ID: <1468977534.3210.168.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jul 2016 04:18:54 +0300
In-Reply-To: <CAMKF1sr8p21xDXNMScg8MUdRFh3=8O+zuxL--_A-jV52Dez1wQ@mail.gmail.com>
References: <cover.1468973641.git.tanuk@iki.fi>
	<425887ce6e0187155974cabc2071f5189f7cc1a1.1468973641.git.tanuk@iki.fi>
	<CAMKF1sr8p21xDXNMScg8MUdRFh3=8O+zuxL--_A-jV52Dez1wQ@mail.gmail.com>
X-Mailer: Evolution 3.20.3-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 20 Jul 2016 01:18:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-07-19 at 17:54 -0700, Khem Raj wrote:
> On Tue, Jul 19, 2016 at 5:20 PM, Tanu Kaskinen <tanuk@iki.fi> wrote:
> > When updating pulseaudio to 9.0, I noticed webrtc-audio-processing is
> > a potential floating dependency. It's not an issue right now, because
> > webrtc-audio-processing isn't packaged for OpenEmbedded, but it would
> > become an issue if anyone added the library to OE.
> > 
> > Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
> > ---
> >  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> > index accafe1..2cf3fb4 100644
> > --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> > +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> > @@ -37,6 +37,10 @@ EXTRA_OECONF = "\
> >  # oe-core nor meta-oe, so let's not add a PACKAGECONFIG entry for it for now.
> >  EXTRA_OECONF += "--without-soxr"
> > 
> > +# The WebRTC echo canceller depends on the webrtc-audio-processing library,
> > +# which is not yet packaged for OpenEmbedded.
> > +EXTRA_OECONF += "--disable-webrtc-aec"
> > +
> 
> may be turn it into a packageconfig ?

Ok, I can do that. I felt uncomfortable adding a packageconfig for
this, because I'd have to reference a non-existing recipe, and who
knows what the recipe will actually be named when it gets packaged, but
I suppose a potential naming mismatch isn't a big risk.

-- 
Tanu

