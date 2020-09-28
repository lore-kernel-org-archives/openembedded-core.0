Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web11.40170.1601308580889229116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 08:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id C75702E8961;
	Mon, 28 Sep 2020 10:56:19 -0500 (CDT)
Date: Mon, 28 Sep 2020 10:56:17 -0500
From: "Seebs" <seebs@seebs.net>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/4] pseudo: Ignore mismatched inodes from the db
Message-ID: <20200928105617.11183951@seebsdell>
In-Reply-To: <19cfd5621921a2cf1f19be76bf216c7ac42b2e4e.camel@linuxfoundation.org>
References: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
	<20200928133803.2741507-2-richard.purdie@linuxfoundation.org>
	<20200928091341.3eebf87c@seebsdell>
	<19cfd5621921a2cf1f19be76bf216c7ac42b2e4e.camel@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Sep 2020 15:51:53 +0100
"Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

> I understand. I have strong evidence that the current handling of such
> a case does the wrong thing though as copying the data from the
> original inode leads to pretty bad corruption in its own right.

Yes.

But if you had to choose between (1) discard the possibly-bad data,
and (2) abort(), 2 would be a MUCH better fix.

Don't treat this as a thing to be worked around. Treat it as a giant
red flag that *we no longer have a sound reason to think that the
database is valid*.

> In many ways I'd like to make these corner cases hard errors. In order
> to do that we need to ensure we're not hitting them though and to do
> that we need the next patch.

Yeah.

> Once we have the ability to ignore subtrees, we could just hard error
> for the potential corruption cases and force those issues to be
> addressed properly.

I think that is the right path.

-s
