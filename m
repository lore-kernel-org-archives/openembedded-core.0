Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TSwyZ-0000sb-JA for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 22:34:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TLKqeo007910;
	Mon, 29 Oct 2012 21:20:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06614-09; Mon, 29 Oct 2012 21:20:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TLKinK007904
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 29 Oct 2012 21:20:46 GMT
Message-ID: <1351545644.2828.41.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 29 Oct 2012 21:20:44 +0000
In-Reply-To: <lymwz5gl3j.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1351523465-26489-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1351527102.2828.19.camel@ted>
	<lyvcdtgsa6.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1351531332.2828.26.camel@ted>
	<lyr4ohgnw0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1351534747.2828.34.camel@ted>
	<lymwz5gl3j.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Mon, 29 Oct 2012 21:34:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-29 at 20:00 +0100, Enrico Scholz wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> 
> >> >> But the real bug is the time mismatch in the autobuilders, isn't it?
> >> >> And this can/should be solved by synchronizing time by ntp on them
> >> >> instead of applying dirty hacks like resetting file dates.
> >> ...
> >> > Worse, when this does happen the failures are extremely unpredictable
> >> > and hard to debug. It causes things to repeatedly recompile for example,
> >> > even during do_install.
> > ...
> > Set the date stamp of some headers in the target sysroot of some key
> > system components (say glib) to a date about a day in the future,
> 
> Are there really packages which create files dated in the future?
> Perhaps a sanity check should be written which rejects files which are
> newer than their containing directory and/or the time-of-day?
>
> > then clean and rebuild some software that uses glib.
> 
> How will 'tar -m' fix this?  It makes things just worse because the
> files generated with -m are always newer than without -m (in practice,
> time offset between hosts served by ntp is far below 100ms. which is
> enough for the build stages doing the sstage file extraction).

Imagine system A generates the sysroot headers with a time ahead of
system B. These are packaged up into an sstate tarball. System B which
has a clock at some time behind system A then downloads and uses them so
the sysroot headers become some time in the future. You then see the
problem I described previously.

tar -m fixes this by timestamping things at the time of extraction,
thereby removing any issue of the timestamps being in the future. Yes,
we could add a step which iterated over the extracted files and checked
to see if any were in the future and if so, change their timestamps but
it seems a bit overkill when the option to tar resolves all the
problems.

The alternative is to mandate *every* system that builds are run on use
ntp and add checks to sanity.bbclass to this effect since someone might
try using a sstate feed with a bad clock. This would cause no end of
problems, not least with corporate filewalls and hurt usability of the
project so we took the other option which fixes things in a way this
should become a non-issue.

Cheers,

Richard




