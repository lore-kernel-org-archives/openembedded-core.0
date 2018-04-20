Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 6E04072EB3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 12:07:45 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id D2DE62E892B;
	Fri, 20 Apr 2018 07:07:45 -0500 (CDT)
Date: Fri, 20 Apr 2018 07:07:40 -0500
From: Seebs <seebs@seebs.net>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20180420070740.45cb22b9@seebsdell>
In-Reply-To: <20180420082526.24648-1-Martin.Jansa@gmail.com>
References: <20180420082526.24648-1-Martin.Jansa@gmail.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: use latest SRCREV
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
X-List-Received-Date: Fri, 20 Apr 2018 12:07:45 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Apr 2018 08:25:26 +0000
Martin Jansa <martin.jansa@gmail.com> wrote:

> * the pseudo.log is significantly shorter with this revision

There's also an actually fairly significant bug fix in here. At one
point, long ago, I made a function that expands paths, and takes a flag
argument which may or may not be AT_SYMLINK_NOFOLLOW.

And then for openat(2), it gets called with "flags", whatever those are.

And it turns out that this means that any flag value other than 0
caused pseudo not to follow a terminal symlink when expanding path,
which caused a number of very strange problems. And mostly those got
corrected, but this should reduce errors.

The change to drop the usually-harmless "path mismatch [%d links]"
messages for N>1 is purely cosmetic, but we're talking about 4MB of
cosmetic messages in a glibc locale build...

-s

