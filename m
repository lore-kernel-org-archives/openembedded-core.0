Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id C895E71A38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 13:54:06 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id 70080C495D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 08:54:05 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 08:54:04 -0500
Message-ID: <7474A9CF-FE6A-4700-B71B-B14A638092FF@seebs.net>
In-Reply-To: <20161028060902.1133-1-ejo@pengutronix.de>
References: <20161028060902.1133-1-ejo@pengutronix.de>
MIME-Version: 1.0
X-Mailer: MailMate (1.9.5r5263)
Subject: Re: [PATCH][krogoth] pseudo: backport 'Work around issues with glibc 2.24'
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
X-List-Received-Date: Fri, 28 Oct 2016 13:54:07 -0000
Content-Type: text/plain; format=flowed

On 28 Oct 2016, at 1:09, Enrico Jorns wrote:

> + #else
> +-		if (e != NULL) {
> ++		/*if (e != NULL) {
> + 			pseudo_diag("No real function for %s: %s\n", func->name, e);
> +-		}
> ++		}*/
> + #endif

Looking at upstream, I do have a fix for this apparently, which is to 
add
mknod/mknodat wrappers to ports/linux/mknodat.c, but there may be other 
things that
relies on (my memory's not online yet today), and this is a reasonable 
workaround
for now.

Historical note:
mknod and mknodat have wrappers because I still periodically maintain 
the OS X
port that was fervently demanded on a regular basis until about a week 
after I added
it, and OS X doesn't have the xmknod/xstat/etc thing.

-s

