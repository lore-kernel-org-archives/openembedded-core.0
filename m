Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <7d10d27431a0d07408dee194eda0106dc945e247.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] OELAYOUT_ABI: bump, avoid tmp/ breakage by removing old cross manifests
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Sat, 26 Feb 2022 00:00:14 +0000
In-Reply-To: <CANNYZj83jSifmia4Vp2FWPzmSNNADbZo95_ge0Y96riMGE8QGg@mail.gmail.com>
References: <20220225195251.2433615-1-alex@linutronix.de>
	 <20220225195251.2433615-2-alex@linutronix.de>
	 <63129c4bef7fbd014cf7563d5cd056ffb757c378.camel@linuxfoundation.org>
	 <CANNYZj83jSifmia4Vp2FWPzmSNNADbZo95_ge0Y96riMGE8QGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org

On Fri, 2022-02-25 at 23:24 +0100, Alexander Kanavin wrote:
> I’m… confused :) Do I need to change something? This particular combination of
> arches is only used for cross manifests, so it shouldn’t touch other things?

Yes, this needs a tweak. Imagine you have a TMPDIR where you build with two
different machines, an x86 one and an arm one.

Your patch as it stands removes the current cross toolchain but not the other
one. The ABI of TMPDIR changes only once so you need to cover all cross recipes
here, not just the current one.

I do worry that globing will uninstall other things too, but I think (I'm not
100% sure) it will then just reinstall them from sstate.

Cheers,

Richard





