Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QSQ2H-0003HO-Ti for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 10:47:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p538C3qH002538
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jun 2011 09:12:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02262-05 for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2011 09:11:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p538BvDD002532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jun 2011 09:11:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE87AD1.1050004@linux.intel.com>
References: <4DE56B0D.4020209@intel.com>  <4DE87AD1.1050004@linux.intel.com>
Date: Fri, 03 Jun 2011 09:11:36 +0100
Message-ID: <1307088696.27470.617.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Tell me your build error message annoyances!
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
X-List-Received-Date: Fri, 03 Jun 2011 08:47:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 23:10 -0700, Darren Hart wrote:
> These are maybe a bit off topic, but I'll leave it to you to decide if
> they meet the criteria for this effort.
> 
> o bb.debug messages are not logged anywhere nor do they appear on the
>   console with -DDD during recipe parsing (while bb.note messages do
>   make it to the console).

This isn't a priority for Scott's work at this point IMO.

> o I'm seeing duplicate messages lately - no examples handy, I'll post
>   or open a bug next time.

This is a genuine bug that seems to have crept in recently which need to
fix, not sure its Scott who needs to do it though.

> o The bash logging facility (logging.bbclass) is still a second class
>   citizen and probably needs a bitbake server hook so bbnote, bbplain,
>   bbdebug, etc. can call into bitbake proper and use the python
>   equivalents and therefor also make it to the proper destination
>  (console or log).

This also isn't a priority for Scott's work at this point IMO.

> o It's been mentioned, but I'd like to second that most of the time,
>   getting a traceback is really not very helpful. Chris Larson mentioned
>   moving the exception handling higher up the stack - I think that
>   makes a lot of sense. I'd also suggest not printing a traceback unless
>   running with at least -D. A catchall try block that only
>   does:
> 
>   print "Unhandled exception:", e
> 
>   under normal conditions and prints a trace with -D enabled would clean
>   things up a lot I think.

I'm going to disagree here a little here. If something unexpected
happens we always need the traceback so the pastebin'd error message
means something to the developers. Currently it shows up even when the
failure is a known error case and a message has been printed to the user
and this is a bug though.

If we get exception handling right I think we solve this problem too.

> o In general I find the default UI to be exceedingly noisy. It feels
>   very much like what I would write for something I was actively
>   developing - ie, something I expect to break a lot! I don't think
>   that's the sort of impression we want users to have while building a
>   release (for example).
> 
>   I'd prefer if what we currently get today was the output of -D. The
>   current output could instead be something a lot more in the vein of
>   what we see with recipe parsing. Perhaps one line per
>   BB_NUMBER_TREADS (N), maybe something like:
> 
>   Task 2300/4600 [####################                    ]
>     0: linux-yocto: do_compile
>     1: matchbox: do_fetch
>     ...
>     N: dbus: do_configure
> 
>   It would of course update the current lines and not scroll. Most of
>   the time, this would be plenty information.

You're describing the code in the ncurses UI. It is there and you can
run it but its unfinished :(.

>  Upon failure we stop
>   updating the "UI" and print something like:
> 
>   ERROR: An unhandled exception occured while processing
>          linux-yocto: do_fetch
> 
>          Exception: No such file or directory.
> 
>          Run with -D for a more detailed error report or consult the
>          appropriate log file:
> 
>          $(pwd)/tmp/work/$machine/linux-yocto-$HASH-$HASH \
>          /temp/log.do_fetch.$PID
> 
>   Or something along those lines.

You should never be asked to rerun something, it should know when to
print the right information.

Cheers,

Richard



