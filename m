Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB5961220
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 15:50:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Aug 2013 08:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,877,1367996400"; d="scan'208";a="386284760"
Received: from unknown (HELO helios.localnet) ([10.252.122.240])
	by fmsmga002.fm.intel.com with ESMTP; 14 Aug 2013 08:50:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Andre <armccurdy@gmail.com>
Date: Wed, 14 Aug 2013 16:50:18 +0100
Message-ID: <1620077.DtNPbj50LY@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAP71Wjz1HsDcEQcV0MjXDiKLzo7OfE7H=DCuPBf_f0uwe3-+hw@mail.gmail.com>
References: <CAJ86T=UDy7FJWR735GcK3bWZxmwRrGPdinfb+f49Wc1dEmg+ZQ@mail.gmail.com>
	<CAP71Wjz1HsDcEQcV0MjXDiKLzo7OfE7H=DCuPBf_f0uwe3-+hw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dylan]devshell: broken
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
X-List-Received-Date: Wed, 14 Aug 2013 15:50:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre / Nicolas,

On Wednesday 14 August 2013 08:35:18 Nicolas Dechesne wrote:
> On Wed, Aug 14, 2013 at 7:54 AM, Andre <armccurdy@gmail.com> wrote:
> > bitbake -c devshell seems to have stopped working (tested with xterm
> > 
> > and mate-terminal) in dylan since this commit:
> >   a749f06 terminal: Run command using a wrapper script
> > 
> > It looks like the run.do_devshell.<PID> script is generated but then
> > fails to run when passed to a terminal.
> > 
> > A possible clue is that after manually editing the do_devshell script
> > 
> > to replace:
> >   do_terminal() {
> >   exec pseudo /bin/bash
> >   }
> > 
> > with:
> >   do_terminal() {
> >   exec /bin/bash
> >   }
> > 
> > the script runs OK when passed to a terminal manually, such as:
> >   $ xterm -e tmp/work/.../temp/run.do_terminal.25789
> 
> I am observing the same issue here. I have tested 'devshell' against master
> and dylan, and master seems to be working fine.
> 
> Here are the 2 generated run.do_terminal script for bitbake -c devshell
> busybox
> 
> with dylan branch (failing) http://pastebin.com/jyBW2jEf
> 
> with master branch (working) http://pastebin.com/PHxJvj0k
> 
>  The problem when using the detault terminal (hence gnome-terminal in my
> case), is that the gnome terminal windows shows up but very quickly
> disappears. If I set OE_TERMINAL="screen", then i get something like that
> in the failing case:
> Currently 1 running tasks (67 of 67):
> 0: busybox-1.20.2-r8 do_devshell (pid 7566)
> Trying to run: screen -r devshell_7566
> ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
> ignored.
> There is no screen to be resumed matching devshell_7566.
> Trying to run: screen -r devshell_7566
> ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
> ignored.
> There is no screen to be resumed matching devshell_7566.
> Trying to run: screen -r devshell_7566
> ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
> ignored.
> There is no screen to be resumed matching devshell_7566.
> Trying to run: screen -r devshell_7566
> ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
> ignored.
> There is no screen to be resumed matching devshell_7566.
> Trying to run: screen -r devshell_7566
> ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
> ignored.
> There is no screen to be resumed matching devshell_7566.
> Trying to run: screen -r devshell_7566
> ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
> ignored.
> There is no screen to be resumed matching devshell_7566.
> Trying to run: screen -r devshell_7566
> ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
> ignored.
> There is no screen to be resumed matching devshell_7566.
> Trying to run: screen -r devshell_7566
> ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
> ignored.
> There is no screen to be resumed matching devshell_7566.
> Trying to run: screen -r devshell_7566
> ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
> ignored.
> There is no screen to be resumed matching devshell_7566.
> Trying to run: screen -r devshell_7566
> WARNING: Screen started. Please connect in another terminal with "screen -r
> devshell_7566"
> NOTE: Tasks Summary: Attempted 67 tasks of which 66 didn't need to be rerun
> and all succeeded.
> 
> and it stops, and there is no screen session.
> 
> If I revert "a749f06 terminal: Run command using a wrapper script" from
> oe-core dylan, it works again.

This was a failure to test properly on my part, sorry about that.

After some debugging today I've figured out at least what the problem is; 
LD_PRELOAD was in the restored environment (BB_ORIGENV) in dylan whereas in 
master it was not, due to the way pseudo is used there, which explains why the 
change you mentioned worked in master and not in dylan. I have just sent a 
patch for dylan to this list to exclude LD_PRELOAD from the environment which 
fixes the problem in my testing here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

