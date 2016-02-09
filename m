Return-Path: <mac@mcrowe.com>
Received: from avasout03.plus.net (avasout03.plus.net [84.93.230.244])
	by mail.openembedded.org (Postfix) with ESMTP id 061BC731BA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 15:16:46 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout03 with smtp
	id GFGk1s0030BmcFC01FGlbw; Tue, 09 Feb 2016 15:16:45 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=X8+vUzne c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=jFJIQSaiL_oA:10 a=-An2I_7KAAAA:8 a=sKD8B3dNVUIQrssZlxEA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>)
	id 1aTA1z-00088z-9o; Tue, 09 Feb 2016 15:16:43 +0000
Date: Tue, 9 Feb 2016 15:16:43 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Andrea Adami <andrea.adami@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160209151643.GA30669@mcrowe.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
	<20160202161726.GC2607@jama>
	<CA+chaQdGzUm96SViWvLW8xinxSLrjZbZxi843A282geN+T5Ffw@mail.gmail.com>
	<20160206204110.GA21969@mcrowe.com>
	<20160207220741.GA12339@mcrowe.com>
	<CA+chaQeGfQQ5r=Z+MEzuv1rX93ZLgrVDWzbwx6fXrkaftZ-w-g@mail.gmail.com>
	<CA+chaQfVbnjSV5Casif1b5_vxp4ysThnJLCShGAp89PCXd1tTw@mail.gmail.com>
	<20160209123026.GA22354@mcrowe.com>
	<CAAQYJAsYUc=eZSa7yt4-bpCVRtFOvendDYjaBr5sMGPrK5h2pQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAsYUc=eZSa7yt4-bpCVRtFOvendDYjaBr5sMGPrK5h2pQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Mike Crowe <mac@mcrowe.com>
Subject: Re: [PATCH 0/3] Remove unhelpful default value of EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 09 Feb 2016 15:16:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 09 February 2016 at 13:51:20 +0100, Andrea Adami wrote:
> On Tue, Feb 9, 2016 at 1:30 PM, Mike Crowe <mac@mcrowe.com> wrote:
> > On Tuesday 09 February 2016 at 11:39:17 +0100, Martin Jansa wrote:
> >>   /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb,
> >> do_compile
> >
> > That one builds successfully for me for qemuarm. Strange.
> >
> >>   /home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-support/invensense/invensense_git.bb,
> >> do_package_qa
> >
> > That one seems to be using cmake so I can't immediately see how it could be
> > affected by changing EXTRA_OEMAKE.
> >
> 
> It is unrelated...
> About the do_package_qa, some of them like klibc and invensense come
> after commit 47d38d4d86ec6a "insane: add test for -dev packaging
> containing real libraries" introducing [dev-elf] fatal error.

Thanks. If I revert that commit then I can compile klibc, dovecot,
fakeroot, llvm3.3 and invensense. The build got a bit further which has let
me fix libmatroska, system-setup-keyboard and wmiconfig.

There's still lots of breakage though that isn't fixed by simply
reinstating the old value of EXTRA_OEMAKE in the affected recipes. :(

So, I think that oe-core is in pretty good shape with EXTRA_OEMAKE="". I've
mainly been building qemuarm recently but I did get clean builds for many
of the other default MACHINEs in bitbake.conf. The only problem I found
since then was the QA warning on hdparm. There weren't any other QA
warnings like that on a completely clean qemuarm build.

meta-oe is in less good shape. I'm going to rebase everything on the latest
master and try again.

Mike.

