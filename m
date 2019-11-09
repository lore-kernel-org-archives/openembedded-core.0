Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF5574598
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2019 16:07:12 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 510852E890F;
	Sat,  9 Nov 2019 10:07:12 -0600 (CST)
Date: Sat, 9 Nov 2019 10:07:10 -0600
From: Seebs <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191109100710.66530547@seebsdell>
In-Reply-To: <20191109153559.15847-1-richard.purdie@linuxfoundation.org>
References: <20191109153559.15847-1-richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Sat, 09 Nov 2019 16:07:12 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  9 Nov 2019 15:35:59 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> Back in 2010[1] we made pseudo statically link against sqlite3. Since
> then the world has changed, pseudo now has separate processes for the
> database in the server and the client and they have separate linking
> commands.

I'm not sure what that has to do with the reasons for it being
static? Not that I remember exactly anymore, but I think we were hitting
problems caused if pseudo was dynamically linked to sqlite, but I
don't remember what they were.

I'm not entirely sure I know what you mean by "separate processes for
the database in the server and the client". I don't think libpseudo.so
should ever do any database things at all, and it shouldn't need to link
to sqlite.

> which occurs if sqlite3-native was built on a machine with glibc 2.28
> or later and pseudo-native is being built on glibc before that.

I don't think pseudo's ever been *expected* to work when built linked
against things built against different libc. It is *way* too full of
unholy magics that depend on knowing which libc it's using. That said,
the pseudo server also shouldn't really need to be statically-linked,
the only times it ever runs under pseudo, it just immediately tries to
escape and not run that way.

> There appears to be no easy way to avoid this other than adding a
> copy of sqlite3 into the pseudo recipe. Given the static linking
> doesn't seem to be required any longer due to the separate processes,
> drop that to fix those issues.

I don't understand the "separate processes" thing. So far as I know,
pseudo has never talked to sqlite from the client. I think Jason Wessel
had experimental patches at one point to do client-local sqlite work
to avoid the IPC overhead, but I don't think it ever got merged because
it turns out the IPC overhead is insignificant compared to everything
else.

-s

