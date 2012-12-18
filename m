Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tl4wE-0004Ni-UA for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 22:43:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBILSEAI031405;
	Tue, 18 Dec 2012 21:28:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30306-04; Tue, 18 Dec 2012 21:28:10 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBILS5Il031399
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 18 Dec 2012 21:28:06 GMT
Message-ID: <1355866085.18874.46.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matthew McClintock <msm@freescale.com>
Date: Tue, 18 Dec 2012 21:28:05 +0000
In-Reply-To: <1355851135-31667-1-git-send-email-msm@freescale.com>
References: <1355851135-31667-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-denzil] bitbake: command: add error to return of runCommand
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
X-List-Received-Date: Tue, 18 Dec 2012 21:43:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-12-18 at 11:18 -0600, Matthew McClintock wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> Currently, command.py can return an error message from runCommand, due to
> being unable to run the command, yet few of our UIs (just hob) can handle it
> today. This can result in seeing a TypeError with traceback in certain rare
> circumstances.
> 
> To resolve this, we need a clean way to get errors back from runCommand,
> without having to isinstance() the return value. This implements such a thing
> by making runCommand also return an error (or None if no error occurred).
> 
> As runCommand now has a method of returning errors, we can also alter the
> getCmdLineAction bits such that the returned value is just the action, not an
> additional message. If a sync command wants to return an error, it raises
> CommandError(message), and the message will be passed to the caller
> appropriately.
> 
> Example Usage:
> 
>     result, error = server.runCommand(...)
>     if error:
>         log.error('Unable to run command: %s' % error)
>         return 1
> 
> (Bitbake rev: 717831b8315cb3904d9b590e633000bc897e8fb6)

This patch has bugs in it. See recent fixes in master.

> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  bitbake/lib/bb/command.py                   |   43 +++++++++++++++----------
>  bitbake/lib/bb/server/process.py            |    2 +-
>  bitbake/lib/bb/ui/crumbs/hobeventhandler.py |    5 ++-
>  bitbake/lib/bb/ui/depexp.py                 |   38 ++++++++++++++--------
>  bitbake/lib/bb/ui/goggle.py                 |   17 +++++-----
>  bitbake/lib/bb/ui/knotty.py                 |   45 ++++++++++++++++++---------
>  bitbake/lib/bb/ui/ncurses.py                |   21 ++++++++-----
>  7 files changed, 112 insertions(+), 59 deletions(-)
> 
> diff --git a/bitbake/lib/bb/command.py b/bitbake/lib/bb/command.py
> index fd8912a..00b854e 100644
> --- a/bitbake/lib/bb/command.py
> +++ b/bitbake/lib/bb/command.py
> @@ -44,6 +44,9 @@ class CommandFailed(CommandExit):
>          self.error = message
>          CommandExit.__init__(self, 1)
>  
> +class CommandError(Exception):
> +    pass
> +
>  class Command:
>      """
>      A queue of asynchronous commands for bitbake
> @@ -57,21 +60,25 @@ class Command:
>          self.currentAsyncCommand = None
>  
>      def runCommand(self, commandline):
> -        try:
> -            command = commandline.pop(0)
> -            if command in CommandsSync.__dict__:
> -                # Can run synchronous commands straight away
> -                return getattr(CommandsSync, command)(self.cmds_sync, self, commandline)
> -            if self.currentAsyncCommand is not None:
> -                return "Busy (%s in progress)" % self.currentAsyncCommand[0]
> -            if command not in CommandsAsync.__dict__:
> -                return "No such command"
> -            self.currentAsyncCommand = (command, commandline)
> -            self.cooker.server_registration_cb(self.cooker.runCommands, self.cooker)
> -            return True
> -        except:
> -            import traceback
> -            return traceback.format_exc()
> +        command = commandline.pop(0)
> +        if hasattr(CommandsSync, command):
> +            # Can run synchronous commands straight away
> +            command_method = getattr(self.cmds_sync, command)
> +            try:
> +                result = command_method(self, commandline)
> +            except CommandError as exc:
> +                return None, exc.args[0]
> +            except Exception:
> +                return None, traceback.format_exc()

Missing import traceback.

> +            else:
> +                return result, None
> +        if self.currentAsyncCommand is not None:
> +            return None, "Busy (%s in progress)" % self.currentAsyncCommand[0]
> +        if command not in CommandsAsync.__dict__:
> +            return None, "No such command"
> +        self.currentAsyncCommand = (command, commandline)
> +        self.cooker.server_registration_cb(self.cooker.runCommands, self.cooker)
> +        return True, None
>  
>      def runAsyncCommand(self):
>          try:
> @@ -139,7 +146,11 @@ class CommandsSync:
>          """
>          Get any command parsed from the commandline
>          """
> -        return command.cooker.commandlineAction
> +        cmd_action = command.cooker.commandlineAction
> +        if cmd_action['msg']:
> +            raise CommandError(msg)

Error, "msg" not defined.

Cheers,

Richard



