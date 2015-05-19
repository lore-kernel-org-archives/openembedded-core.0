Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E42CB600B3;
	Tue, 19 May 2015 21:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4JL7TqT028062; Tue, 19 May 2015 22:07:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id X2XJTV9x7wM0; Tue, 19 May 2015 22:07:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4JL7FNk028057
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 19 May 2015 22:07:26 +0100
Message-ID: <1432069635.28910.43.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lucas Dutra Nunes <ldnunes@ossystems.com.br>
Date: Tue, 19 May 2015 22:07:15 +0100
In-Reply-To: <1432044868-9170-1-git-send-email-ldnunes@ossystems.com.br>
References: <1432044868-9170-1-git-send-email-ldnunes@ossystems.com.br>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: bitbake-devel-request@lists.openembedded.org, clarson@kergoth.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cooker: release lockfile on process exit
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
X-List-Received-Date: Tue, 19 May 2015 21:07:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-05-19 at 11:14 -0300, Lucas Dutra Nunes wrote:
> This fixes problems caused by the bitbake process exiting without
> releasing the lockfile. This is most apparent while running scripts that
> call bitbake several times, like the "cleanup-workdir" script on
> oe-core.
> 
> Signed-off-by: Lucas Dutra Nunes <ldnunes@ossystems.com.br>
> ---
>  lib/bb/cooker.py | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/bb/cooker.py b/lib/bb/cooker.py
> index ddf5fed..627ad4a 100644
> --- a/lib/bb/cooker.py
> +++ b/lib/bb/cooker.py
> @@ -40,6 +40,7 @@ import Queue
>  import signal
>  import prserv.serv
>  import pyinotify
> +import atexit
>  
>  logger      = logging.getLogger("BitBake")
>  collectlog  = logging.getLogger("BitBake.Collection")
> @@ -164,6 +165,9 @@ class BBCooker:
>          except:
>              pass
>  
> +        # Register the unlocking of the file at exit:
> +        atexit.register(bb.utils.unlockfile, self.lock)
> +
>          # TOSTOP must not be set or our children will hang when they output
>          fd = sys.stdout.fileno()
>          if os.isatty(fd):

I'm not convinced that atexit is the right way to handle this.

Currently the lock ends up being held by any of the running bitbake
processes and it is released when they all exit. If any processes "get
left behind" accidentally, they continue to hold the lock. In many ways
this is actually quite a desirable behaviour. A common usecase for me is
where qemu breaks in something like a bitbake <image> -c testimage. The
bitbake command returns but qemu is left in the background and the lock
remains since it holds a copy of the original lock fd. I can't run a new
bitbake command until I clean up all the processes. Whilst not intended
as part of the design, this does happen to work quite well.

With the atexit approach, I suspect it will attach to exit of any of the
subprocesses and the first to exit will free the lock, not the last.
This is likely not what we want.

So what is the right way to handle things? I'm not sure.

The question is "who" owns the lock. In the traditional model, its owned
by cooker. As long as the cooker runs, the lock remains. This works well
with memory resident bitbake.

The other model would be the lock being owned by the UI. This breaks
down with memory resident bitbake. The problem is the controlling
terminal is owned by the UI, not cooker so control returns to it before
cooker has necessarily cleaned up and exited, depending on the speed of
the machine and the phase of the moon.

If we switch completely to memory resident bitbake, I'd note the problem
goes away to a large extent since either we connect to an existing
cooker or the cooker gets started.

So having thought more about this, my proposal is actually that rather
than fix this and cause all kinds of other potential problems, we just
make memory resident bitbake the default which is something we'd like to
ideally do in the 1.9 timeframe anyway.

Cheers,

Richard





