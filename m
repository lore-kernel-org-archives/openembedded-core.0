Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 95FF260DD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 01:30:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9D1UKfX011468
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 Oct 2014 18:30:20 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 12 Oct 2014 18:30:20 -0700
Date: Sun, 12 Oct 2014 20:30:18 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20141012203018.4874bb1d@e6410-2>
In-Reply-To: <1413157795-1346-3-git-send-email-pab@pabigot.com>
References: <1413157795-1346-1-git-send-email-pab@pabigot.com>
	<1413157795-1346-3-git-send-email-pab@pabigot.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] pseudo: support multiple search directories in PSEUDO_PASSWD
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
X-List-Received-Date: Mon, 13 Oct 2014 01:30:21 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Sun, 12 Oct 2014 18:49:54 -0500
"Peter A. Bigot" <pab@pabigot.com> wrote:

> ++		npasswd_paths = build_passwd_paths(NULL);
> ++		if (npasswd_paths) {
> ++			passwd_paths = malloc(npasswd_paths * sizeof(*passwd_paths));
> ++			if (!passwd_paths) {
> ++				pseudo_diag("couldn't allocate space for passwd paths.\n");
> ++				exit(1);
> ++			}
> ++			build_passwd_paths(passwd_paths);

I'm slightly inclined to think that this might be better done with a function
which counts colons and then builds the path list accordingly. But I
basically like the idea of supporting a path list. As I recall, we talked
about this early on, but for some reason I formed the theory that it wasn't
necessary.

I'd point out that strictly speaking, the change from [] to * doesn't matter
in function parameter lists, and I tend to prefer [] when the argument is
logically an array rather than a pointer to a single item, except that this
preference is not something I'm very consistent about.

But this does seem to me to be correct.

I'll have to think about it a bit because, while the "call once to find out
how much storage you need, again to use the storage" idiom is pretty good, I
think its primary benefit over simpler calling patterns is that it can be
used with arbitrary memory allocation patterns or goals. In this case, with
only one caller, we probably don't need it. That said, if I'm still busy this
week (which looks likely) it's not a bad idea to merge this as-is and wait for
1.6.3 for arguable improvements, since this is pretty clearly correct.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

