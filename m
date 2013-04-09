Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPdJD-0000el-0C
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 20:30:24 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Apr 2013 11:12:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,441,1363158000"; d="scan'208";a="319850361"
Received: from unknown (HELO helios.localnet) ([10.255.13.195])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2013 11:12:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 09 Apr 2013 19:12:56 +0100
Message-ID: <1900245.DLqfxs0so2@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-26-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAHUNapTps6emz9UTtLgKer5yuLzh8haJyg3V=8yTzfxbZRd8rQ@mail.gmail.com>
References: <cover.1365179842.git.pkj@axis.com>
	<CAHUNapTSbxqXuj7LOsNSrZL5Ank+ngvkXF=cnhvM7aUK-DQZZA@mail.gmail.com>
	<CAHUNapTps6emz9UTtLgKer5yuLzh8haJyg3V=8yTzfxbZRd8rQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] oe-buildenv-internal: Only add to $PATH if needed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2013 18:30:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 April 2013 13:34:43 Trevor Woerner wrote:
> On Tue, Apr 9, 2013 at 1:29 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> > Under which shells do we expect a Yocto build to succeed?
> 
> Whoops! My bad.
> 
> sh -> yes
> bash -> not so much
> 
> Let me rephrase: are bash-specific features to be so feared?

If we can avoid them, yes. The stuff we absolutely must not have is:

* bashisms in scripts that start with #!/bin/sh as opposed to #!/bin/bash (and 
for scripts that are installed on the target we try to avoid the latter as it 
just means bash has to be installed on the target as well, which is often not 
desirable)

* bashisms in shell functions within recipes since these are executed under 
/bin/sh

Even if we were to ignore alternative shells such as zsh and tcsh, bashisms in 
the above cases will cause breakages on Ubuntu (where /bin/sh is dash by 
default). From the denzil (Yocto Project 1.2) release onwards we have been 
stamping out bashisms and trying to avoid introducing any new ones.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


