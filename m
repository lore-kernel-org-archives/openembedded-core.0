Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web10.2199.1600790775327683595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 09:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 44A182E8918
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2020 11:06:14 -0500 (CDT)
Date: Tue, 22 Sep 2020 11:06:10 -0500
From: "Seebs" <seebs@seebs.net>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] pseudo: Remove mismatched inodes from the db
Message-ID: <20200922110610.29c2c97d@seebsdell>
In-Reply-To: <20200922131825.2496981-1-richard.purdie@linuxfoundation.org>
References: <20200922131825.2496981-1-richard.purdie@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Sep 2020 14:18:24 +0100
"Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

> This can happen when files are deleted outside of pseudo context and
> the inode is reused by a new file which pseduo then "sees".

In terms of the original design: This would be considered a usage bug,
and pseudo issues diagnostics for that. Once files are owned by an
instance of pseudo, it expects to "see" every change to those files,
and if you don't do that, then yes, the database is corrupt. But in
some cases, the behavior was something like "a move within a pseudo
filesystem" or something similar, and losing the data would also be
bad.

Basically, the original design philosophy is that you should *never*
be modifying things pseudo owns outside of pseudo. And that does impose
a performance cost on things, *but*, it also gives us a lot of
confidence in results.

So my preference on "deleting files outside of pseudo context, inode
gets reused" would be "don't do that then"; this is why pseudo reports
diagnostics for those. Being able to tell you what the old path was
in such cases was actually one of the primary reasons pseudo exists.

-s
