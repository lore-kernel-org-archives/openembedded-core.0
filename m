Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <0d85a02855799b6b26757e4e189f7b8b301bbe26.camel@linuxfoundation.org>
Subject: Re: [OE-core] [hardknott 1/2] tune-cortexa72: remove crypto for the default cortex-a72
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Jan 2022 12:01:16 +0000
In-Reply-To: <0062bdc2f2df9661d30b142d00eae710a9afbee1.camel@intel.com>
References: <20220115023747.1154635-1-kexin.hao@windriver.com>
	 <20220115023747.1154635-2-kexin.hao@windriver.com>
	 <0062bdc2f2df9661d30b142d00eae710a9afbee1.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Anuj Mittal <anuj.mittal@intel.com>, "kexin.hao@windriver.com" <kexin.hao@windriver.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, "ross.burton@arm.com" <ross.burton@arm.com>, "jdmason@kudzu.us" <jdmason@kudzu.us>
Cc: "Randy.MacLeod@windriver.com" <Randy.MacLeod@windriver.com>

On Sat, 2022-01-15 at 02:53 +0000, Anuj Mittal wrote:
> On Sat, 2022-01-15 at 10:37 +0800, Kevin Hao wrote:
> > From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
> > 
> > The cryptographic unit is optional for the Cortex-A72, but it was
> > included by default previously.  This breaks building systems that
> > lack this functionality when using tune-cortexa72.inc.
> > 
> > To correct this, add a crypto entry in the tune file.  Since CRC is
> > optional for ARMv8.0, do the same thing while we're at it.
> > 
> > For platforms that had been happily using tune-cortexa72.inc, a
> > slight
> > degradation of performance will occur using the default.  To correct
> > this, simply add:
> > DEFAULTTUNE = "cortexa72-crc-crypto"
> > 
> 
> I am not very familiar with ARM tunes but it sounds like you are
> changing behaviour for people who might already be using these tunes
> with these two patches ... That might not be suitable for stable
> branches.
> 
> Perhaps Ross, Jon or others can comment if this is something that
> should be merged in stable branches.

You're right to be nervous of the change, I was with master. Having looked into
the issue, it is a serious one and probably should be fixed.

That said, I think there is perhaps a patch missing from this series, the one
which removes the cortexa72-crc tune. I think this is fine even for a stable
series since the patch adding it is also in this series. The patches do make
more sense once looked at as a whole, we just didn't get this quite right for
master at first.

Cheers,

Richard

