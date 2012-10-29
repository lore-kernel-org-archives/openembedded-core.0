Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TSu8o-00063C-3n for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 19:32:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TIJFJQ006735;
	Mon, 29 Oct 2012 18:19:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06614-01; Mon, 29 Oct 2012 18:19:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TIJ6nU006729
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 29 Oct 2012 18:19:07 GMT
Message-ID: <1351534747.2828.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 29 Oct 2012 18:19:07 +0000
In-Reply-To: <lyr4ohgnw0.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1351523465-26489-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1351527102.2828.19.camel@ted>
	<lyvcdtgsa6.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1351531332.2828.26.camel@ted>
	<lyr4ohgnw0.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate.bbclass: preserve time when unstaging files
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
X-List-Received-Date: Mon, 29 Oct 2012 18:32:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-29 at 18:59 +0100, Enrico Scholz wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> 
> >> > where the option was added deliberately to deal with time mismatch
> >> > between autobuilders which was causing real world bugs.
> >> 
> >> But the real bug is the time mismatch in the autobuilders, isn't it?
> >> And this can/should be solved by synchronizing time by ntp on them
> >> instead of applying dirty hacks like resetting file dates.
> >
> > I have asked that ntp be installed/fixed on the autobuilders to sort the
> > problem out but it seems that even with ntp running, mismatches can
> > happen (e.g. misconfigured timezones).
> 
> Really? The only timezone related problems might arise when a package
> makes 'touch -d <date>' during build.  But I can not remember that I
> have ever seen such a package and this problem should be easy to
> localize.
> 
> Else, timezone configuration is completely uninteresting for comparing
> timestamps or for setting time from ntp.
>
> > Worse, when this does happen the failures are extremely unpredictable
> > and hard to debug. It causes things to repeatedly recompile for example,
> > even during do_install.
> 
> How comes do_install() into the game?  'populate-lic' are the only
> sstate files created before do_install() and I can not imagine how they
> affect the other build phases; do_compile() results are not sstated
> (and with the 'tar -m' thing, timestamps get havoc completely causing
> unpredictable rebuilds).
> 
> When do_install() is executed, all the following sstate files
> (populate_sysroot, package) are invalidated and must be recreated.  So
> your problem with do_install() sounds more like an incomplete/racy
> cleanup of old files.

Set the date stamp of some headers in the target sysroot of some key
system components (say glib) to a date about a day in the future, then
clean and rebuild some software that uses glib.

You will find that every time the recipe runs make, *everything* will
recompile. This will happen during do_install as well as do_compile and
if you recipe calls make for any other reason, it will recompile again.

Normally the builds actually tolerate this quite well, until you get
something like qt4 where the do_install environment isn't setup to
support compiling and then things explode in interesting ways.

Cheers,

Richard




