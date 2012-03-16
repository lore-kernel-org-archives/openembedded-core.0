Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1S8Tu4-00070K-L7
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 10:56:56 +0100
Received: from [192.168.0.84] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 03B5C2A61E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 09:16:26 +0000 (GMT)
Message-ID: <4F630C67.8070707@communistcode.co.uk>
Date: Fri, 16 Mar 2012 09:48:23 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120314 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1331852164.18586.166.camel@ted>
In-Reply-To: <1331852164.18586.166.camel@ted>
Subject: Re: [PATCH] ui/knotty: Add a footer to the build output for interactive terminals
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
X-List-Received-Date: Fri, 16 Mar 2012 09:56:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 15/03/12 22:56, Richard Purdie wrote:
> I've sent this before, this is an updated version with several bugfixes
> and improvements. Its a major change but one I think people will like
> overall as I hear a lot of complaints about the verbose console
> messages. v0 never got complaints so I will merge this fairly quickly
> unless there are objections.
>
> ---
> On terminals which support it, add summary information to the end of the
> build output about the number of tasks currently running and how many tasks
> we've run so far.
>
> This provides a summary at a glace of what the current state of the build is
> and what the build is currently doing which is lacking in the current UI.
>
> Also disable echo of characters on stdin since this corrupts the disable,
> particularly Crtl+C.
>
> The "waiting for X tasks" code can be merged into this code too since
> that is only useful on interactive terminals and this improves the
> readability of that output too.
>
> Improvements since v0:
>
> * The tasks are ordered in execution order.
> * The display is only updated when the list of tasks changes or there
>    is output above the footer.
> * Errors early in the init process don't corrupt the terminal
> * Running task x of y and package messages are suppressed from the console
>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
> diff --git a/bitbake/lib/bb/ui/knotty.py b/bitbake/lib/bb/ui/knotty.py
> index 14989d4..4a7e6b9 100644
> --- a/bitbake/lib/bb/ui/knotty.py
> +++ b/bitbake/lib/bb/ui/knotty.py
> @@ -72,6 +72,26 @@ def pluralise(singular, plural, qty):
>
>   def main(server, eventHandler):
>
> +    cuu = None
> +    stdinbackup = None
> +
> +    if interactive:
> +        import curses
> +        import termios
> +        import copy
> +        try:
> +            fd = sys.stdin.fileno()
> +            stdinbackup = termios.tcgetattr(fd)
> +            new = copy.deepcopy(stdinbackup)
> +            new[3] = new[3]&  ~termios.ECHO
> +            termios.tcsetattr(fd, termios.TCSADRAIN, new)
> +            curses.setupterm()
> +            ed = curses.tigetstr("ed")
> +            if ed:
> +                cuu = curses.tigetstr("cuu")
> +        except:
> +            cuu = None
> +
>       # Get values of variables which control our output
>       includelogs = server.runCommand(["getVariable", "BBINCLUDELOGS"])
>       loglines = server.runCommand(["getVariable", "BBINCLUDELOGS_LINES"])
> @@ -115,8 +135,56 @@ def main(server, eventHandler):
>       errors = 0
>       warnings = 0
>       taskfailures = []
> +    main.footer_present = False
> +    main.lastpids = []
> +
> +    def updateFooter():
> +        if not cuu:
> +            return
> +        activetasks = helper.running_tasks
> +        failedtasks = helper.failed_tasks
> +        runningpids = helper.running_pids
> +        if main.footer_present and (main.lastpids == runningpids):
> +            return
> +        if main.footer_present:
> +            clearFooter()
> +        if not activetasks:
> +            return
> +        lines = 1
> +        tasks = []
> +        for t in runningpids:
> +            tasks.append("%s (pid %s)" % (activetasks[t]["title"], t))
> +
> +        if shutdown:
> +            print("Waiting for %s running tasks to finish:" % len(activetasks))
> +        else:
> +            print("Currently %s running tasks (%s of %s):" % (len(activetasks), helper.tasknumber_current, helper.tasknumber_total))
> +        for tasknum, task in enumerate(tasks):
> +            print("%s: %s" % (tasknum, task))
> +            lines = lines + 1
> +        main.footer_present = lines
> +        main.lastpids = runningpids[:]
> +
> +    def clearFooter():
> +        if main.footer_present:
> +            lines = main.footer_present
> +            sys.stdout.write(curses.tparm(cuu, lines))
> +            sys.stdout.write(curses.tparm(ed))
> +        main.footer_present = False
> +
> +    class InteractConsoleLogFilter(logging.Filter):
> +        def filter(self, record):
> +            if record.levelno == format.NOTE and (record.msg.startswith("Running") or record.msg.startswith("package ")):
> +                return False
> +            clearFooter()
> +            return True
> +
> +    if interactive:
> +        console.addFilter(InteractConsoleLogFilter())
> +
>       while True:
>           try:
> +            updateFooter()
>               event = eventHandler.waitEvent(0.25)
>               if event is None:
>                   if shutdown>  1:
> @@ -126,12 +194,6 @@ def main(server, eventHandler):
>               if isinstance(event, bb.runqueue.runQueueExitWait):
>                   if not shutdown:
>                       shutdown = 1
> -            if shutdown and helper.needUpdate:
> -                activetasks, failedtasks = helper.getTasks()
> -                if activetasks:
> -                    print("Waiting for %s active tasks to finish:" % len(activetasks))
> -                    for tasknum, task in enumerate(activetasks):
> -                        print("%s: %s (pid %s)" % (tasknum, activetasks[task]["title"], task))
>
>               if isinstance(event, logging.LogRecord):
>                   if event.levelno>= format.ERROR:
> @@ -151,6 +213,7 @@ def main(server, eventHandler):
>                   return_value = 1
>                   logfile = event.logfile
>                   if logfile and os.path.exists(logfile):
> +                    clearFooter()
>                       print("ERROR: Logfile of failure stored in: %s" % logfile)
>                       if includelogs and not event.errprinted:
>                           print("Log data follows:")
> @@ -281,10 +344,12 @@ def main(server, eventHandler):
>               logger.error("Unknown event: %s", event)
>
>           except EnvironmentError as ioerror:
> +            clearFooter()
>               # ignore interrupted io
>               if ioerror.args[0] == 4:
>                   pass
>           except KeyboardInterrupt:
> +            clearFooter()
>               if shutdown == 1:
>                   print("\nSecond Keyboard Interrupt, stopping...\n")
>                   server.runCommand(["stateStop"])
> @@ -315,4 +380,6 @@ def main(server, eventHandler):
>           if return_value == 0:
>               return_value = 1
>
> +    if stdinbackup:
> +        termios.tcsetattr(fd, termios.TCSADRAIN, stdinbackup)
>       return return_value
> diff --git a/bitbake/lib/bb/ui/uihelper.py b/bitbake/lib/bb/ui/uihelper.py
> index c96f381..2c78695 100644
> --- a/bitbake/lib/bb/ui/uihelper.py
> +++ b/bitbake/lib/bb/ui/uihelper.py
> @@ -23,6 +23,8 @@ class BBUIHelper:
>       def __init__(self):
>           self.needUpdate = False
>           self.running_tasks = {}
> +        # Running PIDs preserves the order tasks were executed in
> +        self.running_pids = []
>           self.failed_tasks = []
>           self.tasknumber_current = 0
>           self.tasknumber_total = 0
> @@ -30,16 +32,20 @@ class BBUIHelper:
>       def eventHandler(self, event):
>           if isinstance(event, bb.build.TaskStarted):
>               self.running_tasks[event.pid] = { 'title' : "%s %s" % (event._package, event._task) }
> +            self.running_pids.append(event.pid)
>               self.needUpdate = True
>           if isinstance(event, bb.build.TaskSucceeded):
>               del self.running_tasks[event.pid]
> +            self.running_pids.remove(event.pid)
>               self.needUpdate = True
>           if isinstance(event, bb.build.TaskFailedSilent):
>               del self.running_tasks[event.pid]
> +            self.running_pids.remove(event.pid)
>               # Don't add to the failed tasks list since this is e.g. a setscene task failure
>               self.needUpdate = True
>           if isinstance(event, bb.build.TaskFailed):
>               del self.running_tasks[event.pid]
> +            self.running_pids.remove(event.pid)
>               self.failed_tasks.append( { 'title' : "%s %s" % (event._package, event._task)})
>               self.needUpdate = True
>           if isinstance(event, bb.runqueue.runQueueTaskStarted):
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

I like the look of this Richard, will make me look at bit less like an 
insane nodding dog!

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



