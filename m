Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C3B266B3B7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 16:35:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r83GZ3Lw021052
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Sep 2013 09:35:03 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 3 Sep 2013 09:35:02 -0700
Date: Tue, 3 Sep 2013 10:41:37 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20130903104137.16fd7f6c@e6410-2>
In-Reply-To: <1377477606-17591-1-git-send-email-pab@pabigot.com>
References: <1377477606-17591-1-git-send-email-pab@pabigot.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: fix memory leak and missed privilege drop
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
X-List-Received-Date: Tue, 03 Sep 2013 16:35:03 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Sun, 25 Aug 2013 19:40:06 -0500
"Peter A. Bigot" <pab@pabigot.com> wrote:

> qemu.bbclass adds PSEUDO_UNLOAD=1 in qemu_run_binary to avoid reference to
> pseudo functions that may not exist in the target environment.  This patch
> detects the addition of that variable within the environment to which the
> call applies, even if not present in the parent environment.
> 
> As a side effect it fixes a memory leak.

The memory leak was quasi-intentional -- I was aware of it, but I felt that
freeing memory right before an exec() was probably silly.

I'm currently waffling on a design question: It's obvious that, if execve()
has PSEUDO_UNLOAD=1 in envp, we want pseudo to be unloaded.

What if execve() doesn't have PSEUDO_UNLOAD=1, but some other thing has
happened which caused PSEUDO_UNLOAD to be 1 in the process that's calling
execve(), but which had not yet resulted in pseudo being unloaded? For
instance, I think there's at least one thing (memory is weak today, so I
can't remember at all where, but I think it might have been one of the Python
popen()-relatives) which lets you specify an environment, and if you do, that
is the *entire* environment -- it does not inherit.

My intuition is that if PSEUDO_UNLOAD is 1 in *either* of these, that should
win. But then we want a way to say "no, really, don't unload pseudo", which
means I might need to check for something like PSEUDO_UNLOAD=0 in envp.

So my proposed logic would be:

* if envp contains a value for PSEUDO_UNLOAD, act according to that value
* otherwise if pseudo_get_value("PSEUDO_UNLOAD") exists, use that
* otherwise act as though PSEUDO_UNLOAD is not set

(Where "is not set" implies "make sure pseudo's environment variables are
all present and expected to work.)

... But all of this is secondary. I think we should put this patch in-tree
for now so we can have the bug go away, and I can then spend a while
navel-gazing and deciding what should go into the official pseudo tree, which
is currently in a state of disrepair. Excellent catch!

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

