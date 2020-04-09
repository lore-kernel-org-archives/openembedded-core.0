Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web12.3622.1586409960229344454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 22:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 4CAED2E8925;
	Thu,  9 Apr 2020 00:25:59 -0500 (CDT)
Date: Thu, 9 Apr 2020 00:25:56 -0500
From: "Seebs" <seebs@seebs.net>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: <openembedded-core@lists.openembedded.org>,
 <randy.macleod@windriver.com>, <pavelmn@axis.com>
Subject: Re: [OE-core] [pseudo][PATCH] pseudo_util.c: Open file with O_CLOEXEC to avoid fd leak
Message-ID: <20200409002556.4eb074a2@seebsdell>
In-Reply-To: <1586399921-418794-1-git-send-email-mingli.yu@windriver.com>
References: <1586399921-418794-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Apr 2020 10:38:41 +0800
"Yu, Mingli" <mingli.yu@windriver.com> wrote:

> -	fd = open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT, 0644);
> +	fd = open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT |
> O_CLOEXEC, 0644);

I'm not confident in this.

This code is shared between the pseudo client and the pseudo server. In
the pseudo server, it's possible that we coincidentally end up with fd
being 2 already. In that case, we'd end up with this fd on 2, but then
on exec (such as when execing the server) we'd possibly end up with it
closed?

Looking more closely, dup2 will clear the CLOEXEC flag, so in the
server path, if prefer_fd is 2 and fd doesn't start out as 2, we end up
with it cleared...

But also so far as I can tell the code around the dup2 call there is
probably generally wrong; it's explicitly closing the previous holder of
that descriptor, which is unnecessary, and checking whether the file
descriptor is already the desired one, which is also unnecessary. So
this might need to be revisited.

Looking at it more, the only time this seems like it should be relevant
would be in the case where we're in the pseudo client, but
PSEUDO_DEBUG_FILE is set in the environment. Otherwise, the client
should end up just using stderr, and the server shouldn't care because
it's expecting this to be fd 2 and we probably want the child process
to end up with fd 2 open.

What's the observed failure mode that we're fixing?

-s
