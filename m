Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <d624c0abfb23fb259c9153345bf71c4276b69f74.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] bitbake.conf: mark all directories as safe for git to read
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 26 Apr 2022 14:13:02 +0100
In-Reply-To: <C719A8E0-A570-4745-9FDF-F2B4B055405C@arm.com>
References: <20220426120720.969039-1-ross.burton@arm.com>
	 <C719A8E0-A570-4745-9FDF-F2B4B055405C@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Ross Burton <ross.burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

On Tue, 2022-04-26 at 12:42 +0000, Ross Burton wrote:
> I propose we merge this fix and revert the git intercept changes that are current in master/master-next.
> 
> Whilst a global export is quite a brute force solution, it’s also surgically
> precise in what it does.  Improvements to how git works in devshell and other
> context can be done after release, not when we’re trying to get a release out
> of the door.

I'm not convinced that git is ever going to work well under "fake" root
permissions as people have complained it won't see their local git config, e.g.
for user/email or potentially other credential information.

It is unusual for people to run git under fakeroot tasks but some builds do,
e.g. meson.

The export is more precise but also misses the improvements under devshell that
the intercept offers. I can see arguments for retaining the intercept and just
reverting my master patch to make it global.

The downside to the export is that it will "bloat" all shell task siginfo files,
we really want to be cleaning up the global environment, not adding to it :(. It
leaves differences in behaviour for git under fakeroot.

I'm quite torn on this. I think we have the intercept working in master-next
FWIW. The changes are going to need backporting to all active releases though
which there is an easier case for the export for.

Cheers,

Richard








