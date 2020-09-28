Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web10.37482.1601302425221452721
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 07:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 30DF02E891B;
	Mon, 28 Sep 2020 09:13:44 -0500 (CDT)
Date: Mon, 28 Sep 2020 09:13:41 -0500
From: "Seebs" <seebs@seebs.net>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/4] pseudo: Ignore mismatched inodes from the db
Message-ID: <20200928091341.3eebf87c@seebsdell>
In-Reply-To: <20200928133803.2741507-2-richard.purdie@linuxfoundation.org>
References: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
	<20200928133803.2741507-2-richard.purdie@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Sep 2020 14:38:01 +0100
"Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

> This can happen when files are deleted outside of pseudo context and
> the inode is reused by a new file which pseduo then "sees".

I'm just going to say again:

The **ENTIRE REASON** pseudo exists to replace fakeroot is that
fakeroot did this, and it consistently, repeatedly, reliably, resulted
in horrible database corruption.

If files that pseudo knows about are being deleted outside the pseudo
context, that is violating a crucial precondition, and **you cannot
then trust the database to make sense**. Yes, you can throw away some
of the specific files when you detect them -- pseudo already did this
for specific cases, like directory vs plain file mismatches -- but you
should always view it as a serious bug in the rest of the environment.

If it's **really** necessary to allow things to corrupt the filesystem,
we need a way to tell pseudo of **specific** files that it should be
forgetting about or disregarding.

But, in general, "a thing that isn't under pseudo is modifying the part
of the filesystem pseudo thinks it owns" means "your entire database
is presumptively corrupt and you should not be guessing at which parts
of it might have survived that".

I know it seems like this could conceivably be correct, but our
experience with attempts to fix it up in other ways was that it always
ended up resulting in very weird and incomprehensible corruption.

-s
