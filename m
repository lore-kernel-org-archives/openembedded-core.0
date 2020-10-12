Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web10.6764.1602530448354727406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 12:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 9CBB22E8922;
	Mon, 12 Oct 2020 14:20:47 -0500 (CDT)
Date: Mon, 12 Oct 2020 14:20:45 -0500
From: "Seebs" <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/9] pseudo: Add may unlink patch
Message-ID: <20201012142045.66f28cb8@seebsdell>
In-Reply-To: <20201007101449.3132127-6-richard.purdie@linuxfoundation.org>
References: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
	<20201007101449.3132127-6-richard.purdie@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 Oct 2020 11:14:46 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> +Some operations may call unlink() on an open fd, then call
> fchown/fchmod/fstat +on that fd. This would currently readd its entry
> to the database, which +is necessary to preserve its permissions
> information however since that +file will be lost when it is closed,
> we don't want the DB entry to persist. +Marking it as may_unlink
> means the code will know its likely been deleted +and ignore the
> entry later, giving improved behaviour that simple path +mismatch
> warnings. We can use an nlink of zero to detect this.

Eww.

This seems like it could create a bug. I would argue that calling
fchown/fchmod on an unlinked thing is almost always a sign that
something's wrong. I guess fstat is reasonable, but in the fstat case,
it seems to me that there's a risk that the newly created entry won't
match the properties the file last had. If you have a file in the
database owned by root, and then you unlink it, and then call fstat on
it, the fstat entry would show it being owned by the user, and if we
then create a DB entry with the user's ownership, that's actually sort
of wrong.

But I can't immediately see a way to create a new link from just a
file descriptor, so it should be short-lived, anyway.

-s
