Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 503546C4D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 16:34:40 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 294932E8919;
	Mon, 11 Nov 2019 10:34:40 -0600 (CST)
Date: Mon, 11 Nov 2019 10:34:38 -0600
From: Seebs <seebs@seebs.net>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <20191111103438.4177e780@seebsdell>
In-Reply-To: <d9dedf00-f8f4-8bf6-5b94-81868de5dc31@kernel.crashing.org>
References: <20191109153559.15847-1-richard.purdie@linuxfoundation.org>
	<20191109100710.66530547@seebsdell>
	<5100e289ac8a5c4d0196e8ec77813859bb7a703d.camel@linuxfoundation.org>
	<d9dedf00-f8f4-8bf6-5b94-81868de5dc31@kernel.crashing.org>
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
X-List-Received-Date: Mon, 11 Nov 2019 16:34:40 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 Nov 2019 08:17:30 -0600
Mark Hatle <mark.hatle@kernel.crashing.org> wrote:

> First (early) version of pseudo would fork for the server, there
> wasn't a seperate executed server and we had all sorts of problems
> with dynamic libraries being loaded and loaded from the correct paths
> (due to the LD_PRELOAD).
> 
> Moving to two process spaces, LD_PRELOAD and the pseudo executable
> happened pretty early in development, but I suspect some of this is
> left over from that.

To be picky:

pseudo *still does this*. If it can't find the server, it clears the
environment and respawns it. There were problems with this for the
longest time, which turned out to be because I was calling setenv to
clean the environment, and bash *overrides setenv*, so if the program
spawning the pseudo server was bash, things went wrong. It should
actually be fixed now and work pretty well.

-s

