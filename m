Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <8f08425feb2cf64938880a9106f7e3bed56c77d5.camel@gmail.com>
Subject: Re: [OE-core] Is BOOTDD_EXTRA_SPACE from misc.py used correctly?
From: "Claus Stovgaard" <claus.stovgaard@gmail.com>
Date: Wed, 18 May 2022 23:44:04 +0200
In-Reply-To: <518dcf32-5623-bbb8-242c-3f82afa86b8d@gmail.com>
References: <0bc27fbcd5ead0feaef26e96be12bd6115b5593c.camel@gmail.com>
	 <518dcf32-5623-bbb8-242c-3f82afa86b8d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Khem Raj <raj.khem@gmail.com>, oe-core <openembedded-core@lists.openembedded.org>

On Wed, 2022-05-18 at 08:48 -0700, Khem Raj wrote:
> 
> 
> On 5/18/22 5:55 AM, Claus Stovgaard wrote:
> > 
> > So would a better solution not be to rename it to
> > BOOTDD_MINIMUM_SIZE
> > or something like this, and change the code to something like
> > below:
> > 
> > 
> >      blocks = int(out.split()[0])
> > 
> >      blocks += part.get_extra_block_count(blocks)
> > 
> >      if blocks < BOOTDD_MINIMUM_SIZE:
> >          blocks = BOOTDD_MINIMUM_SIZE
> > 
> >      logger.debug("Set %s to %d total blocks", part.mountpoint,
> > blocks)
> > 
> > Can see the current behavior is pretty old - from 2014
> > https://git.yoctoproject.org/poky/commit/?id=df634f3b1e02aa18f84b4b74f13c7260a21691aa
> > 
> > Please comment about the BOOTDD_EXTRA_SPACE
> > What do you think about my proposal.
> > 
> 
> I think in your case you can set BOOTDD_EXTRA_SPACE to 0 perhaps to
> get 
> desired behavior. Your analysis is correct. BOOTDD_EXTRA_SPACE
> ensures 
> that much of space it available, but perhaps what we need is minimum
> size.

Thanks for your quick reply Khem.

I guess I can set the BOOTDD_EXTRA_SPACE to a value where it can fit
with my needs.

Currently there will always be 16 MB of free space on a boot partition
for EFI and bios. If we switch to a minimum size we risk that there is
no free space on the partition. I don't know if it could be a issue,
but I don't think so.

If there is a consensus to go in my proposed direction I will make a
patch and send, but if you think that the change of strategy is wrong,
I will just solve it for me, and don't change the current way. (Guess
it is very seldom that you have an issue with not having space for 16
MB free space on a boot partition)


Regards
Claus

