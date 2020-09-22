Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web12.4744.1600797155113742553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 10:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 571432E8918
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2020 12:52:34 -0500 (CDT)
Date: Tue, 22 Sep 2020 12:52:31 -0500
From: "Seebs" <seebs@seebs.net>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] pseudo: Remove mismatched inodes from the db
Message-ID: <20200922125231.01ec8555@seebsdell>
In-Reply-To: <849dc8348735a3682a6de4be9f76138a73567dc8.camel@linuxfoundation.org>
References: <20200922131825.2496981-1-richard.purdie@linuxfoundation.org>
	<20200922110610.29c2c97d@seebsdell>
	<849dc8348735a3682a6de4be9f76138a73567dc8.camel@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Sep 2020 18:22:18 +0100
"Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

> The "fun" here is that "make install" is rewriting Makefiles within
> the source code tree. The install step runs under pseudo, earlier
> ones do not.

> If we rerun earlier non-pseudo steps, the Makefiles get reset to their
> original state, then "make install" modifies them again.

ugh.

Okay, so. A vague thought about how to perhaps approach this: A
post-install step, which basically does:
	pseudo cp Makefile Makefile.pseudo
	pseudo rm Makefile
	[not-pseudo] cp Makefile.pseudo Makefile
	pseudo rm Makefile.pseudo

So that, at the end of the post-install, the files pseudo doesn't want
to know about are forgotten. Possibly there ought to be a "forget about
this directory" option/command.

-s
