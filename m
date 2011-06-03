Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QSNdj-00014b-Kb
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 08:13:47 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2011 23:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,313,1304319600"; d="scan'208";a="11256744"
Received: from unknown (HELO [10.255.13.71]) ([10.255.13.71])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jun 2011 23:10:26 -0700
Message-ID: <4DE87AD1.1050004@linux.intel.com>
Date: Thu, 02 Jun 2011 23:10:25 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4DE56B0D.4020209@intel.com>
In-Reply-To: <4DE56B0D.4020209@intel.com>
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
X-List-Received-Date: Fri, 03 Jun 2011 06:13:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/31/2011 03:26 PM, Scott Garman wrote:
> Hey folks,
> 
> I'd like to collect some feedback on error messages while building that 
> you find confusing/annoying/unhelpful. I'm going to be working on trying 
> to improve the situation and would like to hear from you about what 
> could be more helpful.
> 
> I'm starting to track some of these situations with the following bugs:
> 
> http://bugzilla.pokylinux.org/show_bug.cgi?id=542
> 
> http://bugzilla.pokylinux.org/show_bug.cgi?id=1127
> 
> http://bugzilla.pokylinux.org/show_bug.cgi?id=1128
> 
> I can't promise to fix everything you come up with, but I'd like to try 
> to make a dent in some of these issues and improve the usability of our 
> build system.
> 
> Thanks,
> 
> Scott
> 

These are maybe a bit off topic, but I'll leave it to you to decide if
they meet the criteria for this effort.

o bb.debug messages are not logged anywhere nor do they appear on the
  console with -DDD during recipe parsing (while bb.note messages do
  make it to the console).

o I'm seeing duplicate messages lately - no examples handy, I'll post
  or open a bug next time.

o The bash logging facility (logging.bbclass) is still a second class
  citizen and probably needs a bitbake server hook so bbnote, bbplain,
  bbdebug, etc. can call into bitbake proper and use the python
  equivalents and therefor also make it to the proper destination
 (console or log).

o It's been mentioned, but I'd like to second that most of the time,
  getting a traceback is really not very helpful. Chris Larson mentioned
  moving the exception handling higher up the stack - I think that
  makes a lot of sense. I'd also suggest not printing a traceback unless
  running with at least -D. A catchall try block that only
  does:

  print "Unhandled exception:", e

  under normal conditions and prints a trace with -D enabled would clean
  things up a lot I think.

o In general I find the default UI to be exceedingly noisy. It feels
  very much like what I would write for something I was actively
  developing - ie, something I expect to break a lot! I don't think
  that's the sort of impression we want users to have while building a
  release (for example).

  I'd prefer if what we currently get today was the output of -D. The
  current output could instead be something a lot more in the vein of
  what we see with recipe parsing. Perhaps one line per
  BB_NUMBER_TREADS (N), maybe something like:

  Task 2300/4600 [####################                    ]
    0: linux-yocto: do_compile
    1: matchbox: do_fetch
    ...
    N: dbus: do_configure

  It would of course update the current lines and not scroll. Most of
  the time, this would be plenty information. Upon failure we stop
  updating the "UI" and print something like:

  ERROR: An unhandled exception occured while processing
         linux-yocto: do_fetch

         Exception: No such file or directory.

         Run with -D for a more detailed error report or consult the
         appropriate log file:

         $(pwd)/tmp/work/$machine/linux-yocto-$HASH-$HASH \
         /temp/log.do_fetch.$PID

  Or something along those lines.

Thanks for collecting these Scott, great idea!

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


