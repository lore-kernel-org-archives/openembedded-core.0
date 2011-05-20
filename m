Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QNDAZ-0002b9-To
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 02:02:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 May 2011 16:59:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,239,1304319600"; 
   d="scan'208";a="1237515"
Received: from vorpal.jf.intel.com (HELO [10.7.199.57]) ([10.7.199.57])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2011 16:59:22 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2011 17:02:58 -0700
In-Reply-To: <cover.1305737923.git.chris_larson@mentor.com>
References: <cover.1305737923.git.chris_larson@mentor.com>
X-Mailer: Evolution 3.0.1 (3.0.1-1.fc15) 
Message-ID: <1305849778.9983.29.camel@vorpal.jf.intel.com>
Mime-Version: 1.0
Subject: Re: [PATCH (v2,resend) 0/3] Rework the devshell
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 May 2011 00:02:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-18 at 10:17 -0700, Chris Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> - Adds a utility metaclass for maintaining class registries
> - Shifts the handling of spawning a terminal into a new 'terminal' python
>  module
> - Automatically selects an appropriate terminal based on what you have
>  available on your machine
> - Still allows manual selection, but in a more convenient way, and falls back
>  to auto if you select an invalid or unavailable (not installed) terminal
> - Improves how we spawn screen:
> 
>  - Shows a warning when spawning it, so do_devshell doesn't appear to hang
>  - Spawns a named screen session 'devshell', to avoid confusion when the user
>    already has other screen sessions running
> 
> Example usage of the new API for others (e.g. patch resolver) to use:
> 
>     import oe.terminal
>     oe.terminal.run(command, terminal_title, d)
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: kergoth/devshell
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kergoth/devshell
> 
> Thanks,
>     Chris Larson <chris_larson@mentor.com>

I like this series!

Speaking of devshell, last I tried (and Paul E can correct me here)
Konsole doesn't wait when it's spawned so is currently pretty useless
for devshell (bitbake continues as if the devshell had finished and if a
patch hasn't applied....).

Perhaps we should remove support for it from the class? Or is there some
better way we can work around this?

As an aside: I think somewhere in meta-yocto, to maintain current
behaviour we'd want to set: OE_TERMINAL ?= 'Gnome' to maintain
gnome-terminal as the default (when installed).

Acked-by: Joshua Lock <josh@linux.intel.com>

Cheers,
Joshua

> ---
> 
> 
> Chris Larson (3):
>   oe.classutils: add module
>   Rework how the devshell functions
>   oe.terminal: improve how we spawn screen
> 
>  meta/classes/devshell.bbclass |   25 ++------
>  meta/conf/bitbake.conf        |    9 +++
>  meta/lib/oe/classutils.py     |   45 ++++++++++++++
>  meta/lib/oe/terminal.py       |  131 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 191 insertions(+), 19 deletions(-)
>  create mode 100644 meta/lib/oe/classutils.py
>  create mode 100644 meta/lib/oe/terminal.py
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Joshua Lock
        Yocto Project Build Monkey
        Intel Open Source Technology Centre



