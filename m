Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger@moiji-mobile.com>) id 1U7SsX-0003df-NV
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 16:44:03 +0100
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id D4CC82543431;
	Mon, 18 Feb 2013 15:43:48 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.80)
	(envelope-from <holger@moiji-mobile.com>)
	id 1U7Scv-0005Da-4P; Mon, 18 Feb 2013 16:27:33 +0100
Date: Mon, 18 Feb 2013 16:27:33 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130218152733.GD12835@xiaoyu.lan>
References: <20130218102402.GA15710@xiaoyu.lan>
	<CAJTo0LbOcDd5N6Be=sYrEEJdPoPtX5Cw+tnze=0DAhjp53M7hg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbOcDd5N6Be=sYrEEJdPoPtX5Cw+tnze=0DAhjp53M7hg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Holger Hans Peter Freyther <holger@moiji-mobile.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: State of systemd from an integrator point of view
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
X-List-Received-Date: Mon, 18 Feb 2013 15:44:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 18, 2013 at 01:10:27PM +0000, Burton, Ross wrote:

> The INITMAN variable is injected into DISTRO_FEATURES, so I do find
> the more idiomatic base_contains more readable:
> 
> ${@base_contains("DISTRO_FEATURES", "systemd", "", "watchdog", d)}

thanks. I will update my BSP.

> 
> systemd could RPROVIDE="watchdog" but as the means to configure it are
> different that might not be ideal, and if you ever switched entirely
> to systemd with these conditionals it's obvious where your redundant
> dependencies are.
> 
> Personally, I'd stick with conditional dependencies.

true, the watchdog package can potentially do a lot more as well. I also
have one watchdog related issue in my kernel/systemd. The TI Davinci wdt
doesn't allow to set the interval via IOCTL.


> Oh, interesting.  Without any thinking I can't think of reasons why
> that would fail.    Filed #3900.

I will try to find some time toward the end to re-produce and provide
feedback. I think it is a genuine bug in systemd. I am going to update
the ticket then.


> Agreed, although it would be good if the journal could be tuned.  IMHO
> it's technically great, just young.

journald is doing a 'lot' of work for each syslog message. E.g. if one
takes a look at journald-server.c:dispatch_message_real. I don't know how
the messages are flowing but from what I see the only way it could be
made usable is:

a.) API changes to there helpers to avoid dynamic allocations in many
of the cases. E.g. re-use one dynamically allocated string.

   r = get_process_cmdline(ucred->pid, 0, false, &t);
   if (r >= 0) {
        cmdline = strappend("_CMDLINE=", t);
        free(t);

                        if (cmdline)
        IOVEC_SET_STRING(iovec[n++], cmdline);
   }

in here there are at least:
   1.) a malloc for /proc/%lu/cmdline
   2.) a malloc for the FILE* pointer by glibc
   (3.) a mmap for ANOM memory in the fgets callby glibc)
     this example uses fgetc so it might not apply
   3.) re-allocs for every character read from the file
   4.) the strappend does another allocation and memcpy.


b.) Reducing the work by having the systemd send all this info with
each message (probably it doesn't work because of the interface that
is attempted to be used between systemd and the 'syslog'?

c.) Disabling/caching most of this information. E.g. the audit handling
should probably be behind a #ifdef if AUDIT is disabled. I will probably
experiment with putting a #ifdef to most of the additional information
it wants to query.

Upstream will probably end up doing nothing about it.

regards

holger


