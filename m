Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id F23D76C132
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 17:07:35 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 6A3262E892B;
	Fri,  2 Aug 2019 12:07:36 -0500 (CDT)
Date: Fri, 2 Aug 2019 12:07:33 -0500
From: Seebs <seebs@seebs.net>
To: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <20190802120733.4a24ca3f@seebsdell>
In-Reply-To: <f991e41b-39c6-a088-63aa-07553cae131b@windriver.com>
References: <20190801200354.119252-1-jason.wessel@windriver.com>
	<8934e4e0-aaf6-5eb6-5d1b-355063bee94a@windriver.com>
	<20190801185725.139cfa73@seebsdell>
	<f991e41b-39c6-a088-63aa-07553cae131b@windriver.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] pseudo: Upgrade to latest to fix openat() with a directory symlink [NAK]
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
X-List-Received-Date: Fri, 02 Aug 2019 17:07:36 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 2 Aug 2019 11:27:45 -0500
Jason Wessel <jason.wessel@windriver.com> wrote:

> The sequence of openat() followed by an fstat() on the opened file
> handle, will erase the pseudo uid entry for the symlink, as shown by
> the following lstat() in test 5. The culprit appears to be the
> fstat(), but it could be something much more complex than that...
> The next step is to figure out why the recent change to openat() to
> address test case 1, caused this new problem.

I suspect I know that one, although I'm not sure I know the details.

Pseudo will destroy entries of incompatible directory-entry types; for
instance, if it has the same path listed as both a plain file and a
directory. But consider, from openat.c:

#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
                rc = real___xstat64(_STAT_VER, path, &buf);
#else           
                rc = real___fxstatat64(_STAT_VER, dirfd, path, &buf, 0);
#endif

Note that there's no lstat, and no AT_SYMLINK_NOFOLLOW. Which is to say,
these stats will be following the symlink even though O_NOFOLLOW was
set. I can probably patch this in a bit.

-s

