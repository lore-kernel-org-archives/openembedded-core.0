Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web12.8649.1593180357279936209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 07:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id B739B2E8951;
	Fri, 26 Jun 2020 09:05:55 -0500 (CDT)
Date: Fri, 26 Jun 2020 09:05:53 -0500
From: "Seebs" <seebs@seebs.net>
To: "Johannes Beisswenger" <johannes.beisswenger@cetitec.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [pseudo][PATCH 1/2] xattr: Fixed corrupting UID&GID when running setfacl -m on a directory
Message-ID: <20200626090553.6853a571@seebsdell>
In-Reply-To: <20200626094031.9975-1-johannes.beisswenger@cetitec.com>
References: <20200626094031.9975-1-johannes.beisswenger@cetitec.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Jun 2020 11:40:31 +0200
"Johannes Beisswenger" <johannes.beisswenger@cetitec.com> wrote:

> The file mode was accidentally overwritten with only the permission
> bits, causing the server to falsely assume that the database was
> corrupted (because the msg_header.mode did not contain S_IFDIR
> anymore) even though it was the client doing the corruption.
> In practice that had the effect of leaking the UID of the user, into
> the pseudo environment.

Good catch, but we should still be masking in the permissions bits, we
just shouldn't be overwriting the non-permissions bits, I think?

-s
