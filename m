Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 83CE07D58A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2019 16:46:22 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 5E93D2E890F;
	Sat,  9 Nov 2019 10:46:23 -0600 (CST)
Date: Sat, 9 Nov 2019 10:46:19 -0600
From: Seebs <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191109104619.209d9fcd@seebsdell>
In-Reply-To: <5100e289ac8a5c4d0196e8ec77813859bb7a703d.camel@linuxfoundation.org>
References: <20191109153559.15847-1-richard.purdie@linuxfoundation.org>
	<20191109100710.66530547@seebsdell>
	<5100e289ac8a5c4d0196e8ec77813859bb7a703d.camel@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: Drop static linking to sqlite3
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
X-List-Received-Date: Sat, 09 Nov 2019 16:46:22 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 09 Nov 2019 16:30:41 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> I did talk briefly to Mark (also cc'd) as he wrote the original patch
> and he thought it was possibly because the client was also linking
> against sqlite3 and due to the other things the client does, that was
> problematic.

It *shouldn't* link against sqlite3. But! The commit in question refers
to RHEL5 and LD_LIBRARY_PATH, and I think that shook loose a memory:

I think at one point, we had a Crucial Bug Fix in sqlite3, in our build
system, and if we didn't statically link, there was a risk of getting
the broken version at runtime.

> The client lib doesn't and the server side should behave just like any
> other linux binary afaik so we should be ok with a dynamicly linked
> sqlite3?

Yes.

The issue here was, I believe, not "dynamically-linked sqlite3 per se",
but "dynamic linking, plus LD_LIBRARY_PATH, picking an sqlite3 which
caused us specific problems".

In the Yocto environment, I think we're reasonably sure that we always
get a clean Yocto-built sqlite3, and that *should* be fine.

So I'd say go for it, but if you see weird sqlite3 stuff that happens
only very occasionally, look at this first. :P

-s

