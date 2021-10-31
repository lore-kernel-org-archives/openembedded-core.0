Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <660173710f5a6356f152a2965134bbf0680c9927.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate: Consider .lock suffix for when loading sstate file from mirror
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Sun, 31 Oct 2021 23:11:03 +0000
In-Reply-To: <20211031200828.80223-1-mleonhardt@arri.de>
References: <20211031200828.80223-1-mleonhardt@arri.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Manuel Leonhardt <mleonhardt@arri.de>, openembedded-core@lists.openembedded.org

On Sun, 2021-10-31 at 21:08 +0100, Manuel Leonhardt wrote:
> When using an sstate mirror over HTTP/S, a lockfile is created during
> download. Previously, this resulted in an OSError (ENAMETOOLONG) in the
> bb.utils.lockfile function because the lockfile has the filename of the
> sstate file plus ".lock". Since this case is also not handled properly
> in bb.utils.lockfile, this caused populate tasks to hang indefinitely.
> 
> Also, previously when generating a shorter filename, the reserved
> characters for .siginfo and now .lock were not considered. This is now
> fixed by using limit instead of 254, which is the maximum length.
> 
> Signed-off-by: Manuel Leonhardt <mleonhardt@arri.de>
> ---
>  meta/classes/sstate.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

I think it may be better to fix the lock function not to use large filenames?
The worst case is two locks overlap with the truncated names but that isn't a
bad fallback situation...

Cheers,

Richard

