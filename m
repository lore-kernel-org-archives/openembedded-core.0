Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1USDM9-0006EX-JY for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 23:24:05 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3GL6i8X021418; Tue, 16 Apr 2013 22:06:44 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UgUT4dCfHDGV; Tue, 16 Apr 2013 22:06:43 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3GL6avr021409
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 16 Apr 2013 22:06:38 +0100
Message-ID: <1366146366.8670.102.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 16 Apr 2013 22:06:06 +0100
In-Reply-To: <20130416170909.GR10628@jama.dyndns-home.com>
References: <cover.1365797632.git.paul.eggleton@linux.intel.com>
	<30edf2f0744b6ce209455d2c5c63015e06f09265.1365797632.git.paul.eggleton@linux.intel.com>
	<20130412211005.GY2477@jama> <1365802242.16702.71.camel@ted>
	<20130416170909.GR10628@jama.dyndns-home.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] classes/sanity: fix handling of bblayers.conf updating
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
X-List-Received-Date: Tue, 16 Apr 2013 21:24:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-16 at 19:09 +0200, Martin Jansa wrote:
> OK, so it's different than hangs I'm seeing here, because I'm still seeing them with latest oe-core

Yes, that was almost certainly a different issue.

> $ . ./oe-init-bitbake-build-env && bitbake my-image
> Altered environment for machine@distro development (this is from oe-init-bitbake-build-env)
> # and nothing else is shown after that

So just to ensure I understand this, it never prints any messages at
all?

> ps auxf (shortened paths and ascii tree)
> 
> bitbake  17625  0.0  0.0   4396   612 pts/18   S+   18:31   0:00  \_ /bin/sh -c . ./oe-init-bitbake-build-env && bitbake  my-image
> bitbake  17626  0.0  0.0   4396   700 pts/18   S+   18:31   0:00     \_ /bin/sh /OE/build/oe-core/scripts/bitbake my-image
> bitbake  17656  0.2  1.0 219356 168120 pts/18  S+   18:31   0:02        \_ python /OE/build/bitbake/bin/bitbake my-image
> bitbake  18504  0.0  1.0 289044 166556 pts/18  Sl+  18:31   0:00           \_ python /OE/build/bitbake/bin/bitbake my-image
> 
> Not sure if there is better way to see what's going on in those python processes, here is strace:
> 
> # strace -p 17656
> Process 17656 attached
> wait4(18504, 
> 
> # strace -p 18504
> Process 18504 attached
> recvfrom(12, 
> 
> Hitting Ctrl+C with strace still running:
> # strace -p 17656
> Process 17656 attached
> wait4(18504, 0x7fffd2abdf80, 0, NULL)   = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
> --- SIGINT {si_signo=SIGINT, si_code=SI_KERNEL, si_value={int=12337, ptr=0x3031}} ---
> wait4(18504,
> 
> Process 18504 attached
> recvfrom(12, 0xb773684, 8192, 0, 0, 0)  = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
> --- SIGINT {si_signo=SIGINT, si_code=SI_KERNEL, si_value={int=12337, ptr=0x3031}} ---
> rt_sigreturn()                          = -1 EINTR (Interrupted system call)
> futex(0xb16e5a0, FUTEX_WAIT_PRIVATE, 0, NULL
> 
> More Ctrl+C only repeats it in both processes but bitbake does not quit
> 
> One more python process is created and disowned by parent and becames child of init and dies later
> bitbake  18524  0.0  1.0 289044 165128 ?       S    18:31   0:00 python /OE/build/bitbake/bin/bitbake my-image
> but bitbake is still hanging until I send kill 18504 from another terminal
> 
> Process 18504:
> futex(0xb16e5a0, FUTEX_WAIT_PRIVATE, 0, NULL) = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
> --- SIGINT {si_signo=SIGINT, si_code=SI_KERNEL, si_value={int=12337, ptr=0x3031}} ---
> rt_sigreturn()                          = -1 EINTR (Interrupted system call)
> futex(0xb16e5a0, FUTEX_WAIT_PRIVATE, 0, NULL) = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
> --- SIGTERM {si_signo=SIGTERM, si_code=SI_USER, si_pid=23837, si_uid=1026} ---
> +++ killed by SIGTERM +++
> 
> Process 17656: (iirc you said that python-logging module is not safe with multiple processes and it looks like logging something)
> # strace -p 17656
> Process 17656 attached
> wait4(18504, 0x7fffd2abdf80, 0, NULL)   = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
> --- SIGINT {si_signo=SIGINT, si_code=SI_KERNEL, si_value={int=12337, ptr=0x3031}} ---
> wait4(18504, 0x7fffd2abdf80, 0, NULL)   = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
> --- SIGINT {si_signo=SIGINT, si_code=SI_KERNEL, si_value={int=12337, ptr=0x3031}} ---
> 
> read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 554) = 554
> select(5, [4], NULL, NULL, {0, 0})      = 1 (in [4], left {0, 0})
> read(4, "\0\0\2\34", 4)                 = 4

These look like pickled python LogRecord objects being passed between
the processes. If this happens again, pass the -s 8912 option to strace
(increases the size of the string dumped) and lets see if we can get the
complete log record. We should be able to unpickle them and get some
idea what log messages it was passing around at least...

> I'll put this in bug report later, but if you see what other information could be useful,
> I'll add it next time I see bitbake hanging like this (it doesn't happen every time, probably more
> with machine under higher load).

Ideally we need to turn this into a 100% reproducer somehow. Failing
that, perhaps more of the LogRecord can give us some clue what is going
on. I'm struggling for other ideas...

Cheers,

Richard



