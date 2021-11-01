Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <10b07ed7a89e0dca23bee2c13c6dbcaa9a146597.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate: Consider .lock suffix for when loading sstate file from mirror
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 01 Nov 2021 10:52:53 +0000
In-Reply-To: <14581.1635763639475667832@lists.openembedded.org>
References: 
	<660173710f5a6356f152a2965134bbf0680c9927.camel@linuxfoundation.org>
	 <14581.1635763639475667832@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Manuel Leonhardt <mleonhardt@arri.de>, openembedded-core@lists.openembedded.org

On Mon, 2021-11-01 at 03:47 -0700, Manuel Leonhardt wrote:
> I submitted a patch to fix bb.utils.lockfile to at least break the loop and
> fail
> when a too long filename is passed with
> https://lists.openembedded.org/g/bitbake-devel/message/12850
> 
> Nevertheless, you have a good point here: Fixing the code that constructs the
> filename of the lock files would be the better solution. For the sstate files
> only lockfiles of .siginfo files can overlap, because the filename of the
> actual
> sstate file is already 8 characters shorter than 255 characters. I have one
> though on that:
> 
> From what I have seen, the filename of lockfiles is mostly constructed by
> appending ".lock" without any further check. Truncating the filename of the
> lockfile inside bb.utils.lockfile could be confusing however, since the
> function
> would not use the filename that is was explicitly passed. Hence, I guess
> bb.utils.lockfile should fail when a too long filename was passed, and the
> function building the lockfile's filename should ensure to keep it limited;
> that's bb.fetch2.FetchData.__init__ then if I'm not mistaken. Would you agree?
> Or would you say, changing the filename inside bb.utils.lockfile is ok, as
> long
> as the function is working?
> 
> The drive-by fix I made with using limit instead of 254 when shortening the
> filename is still correct and necessary, right?

I think we just let lockfile truncate the filename if necessary since this could
affect other users of the funciton too. 

Looking at the code you changed with the limit value it isn't correct since
extension is already accounted for in avail (although I agree that code is
confusing and I had to think twice about it).

Cheers,

Richard

