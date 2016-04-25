Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 853F07001D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 16:50:36 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O67004Q483NPD10@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2016 11:50:12 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=0gcC27t9AAAA:8 a=NEAV23lmAAAA:8
	a=5qHv10llErwJLgrJ4ycA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 697e600d; Mon, 25 Apr 2016 16:50:12 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 97D1F161FC8; Mon,
	25 Apr 2016 12:50:11 -0400 (EDT)
Date: Mon, 25 Apr 2016 12:50:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Christopher Larson <clarson@kergoth.com>
Message-id: <20160425165011.GV16135@denix.org>
References: <20160422000519.GR16135@denix.org>
	<CABcZANmiDeW-B13vE3X0gjX_QfxV5iihD9ZnUKAU=wovnEuxBg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CABcZANmiDeW-B13vE3X0gjX_QfxV5iihD9ZnUKAU=wovnEuxBg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: mesa, libgbm and weston
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
X-List-Received-Date: Mon, 25 Apr 2016 16:50:39 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 22, 2016 at 12:27:16AM +0000, Christopher Larson wrote:
> On Thu, Apr 21, 2016 at 5:06 PM Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > All,
> >
> > I've been meaning to ask this for quite some time. It appears that Weston's
> > DRM compositor enabled with "kms" PACKAGECONFIG doesn't really need the
> > entire
> > mesa, but it only needs libgbm. Now, mesa in OE-Core provides libgbm as
> > one of
> > its packages, hence virtual/mesa is added in DEPENDS for kms:
> >
> > PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm
> > udev virtual/mesa mtdev"
> >
> > On TI platforms with SGX GPU we have GLES/EGL stack (provided by
> > proprietary
> > blobs, yeah) and a separate libgbm, based on Rob Clark's
> > https://github.com/robclark/libgbm
> > Since that is enough to run Weston on our platforms, I've been carrying
> > this
> > bbappend for long time:
> >
> > PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm
> > udev libgbm mtdev"
> >
> > It's been working fine for long time, but people keep on asking questions
> > and
> > require cleaner solution, since bbappend in a separate layer is somewhat
> > confusing. Now, the question is what is a proper solution here:
> >
> > 1. Change weston recipe in oe-core to depend on libgbm instead of
> > virtual/mesa
> > assuming that it is provided by mesa recipe and it works for other
> > platforms.
> >
> 
> I'd say this, either libgbm or virtual/libgbm.
> 
> 2. Change our libgbm recipe to declare that it PROVIDES virtual/mesa,
> > although
> > it looks like a hack and is somewhat reverse...
> >
> 
> I think the libgbm recipe would basically be lying if you do that, that
> doesn't sound ideal.

Thanks, Chris.

One other thing I was thinking is how to avoid conflict between separate 
libgbm and the one provided by mesa-gl. As mesa-gl may be useful for providing 
SW rendering for OpenGL, while leaving OpenGLES to a separate provider, like 
SGX. Unfortunately, mesa-gl also provides libgbm - would PACKAGECONFIG to use 
a standalone external libgbm work and be acceptable here?

-- 
Denys

