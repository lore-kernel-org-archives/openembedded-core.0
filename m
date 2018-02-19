Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 3F94478235
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 17:55:39 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id D443C2E894A;
	Mon, 19 Feb 2018 11:55:40 -0600 (CST)
Date: Mon, 19 Feb 2018 11:55:38 -0600
From: Seebs <seebs@seebs.net>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20180219115538.5081767b@seebsdell>
In-Reply-To: <bb1b003e-9bd3-f438-8ae1-637500d970b5@linux.intel.com>
References: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
	<CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
	<20180216115147.2869fdf2@seebsdell>
	<CA+chaQf=OMV60V7S=C6zaJ3sd_FwQkiojKY5EqAb6gTxXAQmXw@mail.gmail.com>
	<20180216132531.3a1c2398@seebsdell>
	<60cc88e3-577e-de47-e5da-b3cf93c74a2c@linux.intel.com>
	<CA+chaQdGobLWVzZ_YSpdWozrF3ZrYzBNAVusUMFgGFbAX+w90w@mail.gmail.com>
	<CA+chaQeNhb=nPaYz3XZdh_ceQopFKJvEq5Ximu83PykTjoHJWA@mail.gmail.com>
	<bb8be581-a074-b05b-86c6-71e1ee19fdfa@linux.intel.com>
	<20180217141701.229759cf@seebsdell>
	<bb1b003e-9bd3-f438-8ae1-637500d970b5@linux.intel.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: update to latest master
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
X-List-Received-Date: Mon, 19 Feb 2018 17:55:40 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Feb 2018 11:27:56 +0200
Alexander Kanavin <alexander.kanavin@linux.intel.com> wrote:

> > Huh. It's possible that the initial "don't try to close fd 0" was
> > correct, and the real problem is that the attempt is getting made
> > mistakenly. I'll study that more; the epoll code was a contribution
> > and I may not have fully understood it.
> 
> To be honest, it would have been better to apply my epoll patch as it 
> is, and then do additional modifications as separate commits. That
> would make it simpler to isolate the issue. We've used my epoll patch
> for many months without problems on the autobuilder and elsewhere.

... Wow, you know, now that you *mention* it, that is a really good
idea. *sigh* Sorry about that.

Hmm.

> if (clients[events[i].data.u64].fd == listen_fd) {

Just a sanity-check: Should this be equivalent to:
    if (events[[i].data.u64 == 0)
?

The reason I ask is that, looking at the code, we should never, ever,
be getting into close_client(0). The "<=" check was right.

The only call to close_client anywhere in the epoll case is:

> } else {
> 	int n = 0;
> 	ioctl(clients[i].fd, FIONREAD, &n);
> 	if (n == 0) {
> 		close_client(i);
> 	} else {
> 		serve_client(i);
> 	}

And that's the else for clients... oh hey


> if (clients[events[i].data.u64].fd == listen_fd) {
...
> ioctl(clients[i].fd, FIONREAD, &n);

do you see the error? I do.

This gets back to "and one of the problems with testing is that
if I don't actually check the logs, I often don't see problems",
because pseudo does enough internal disaster recovery that things can
explode horribly without observable failures.

Now extracting the data.u64 value and using that consistently as the
index. Pushed fix to master.

-s

