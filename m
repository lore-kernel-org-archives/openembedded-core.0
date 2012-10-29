Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TSxIN-000178-SZ
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 22:54:55 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q9TLfGsi013024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 29 Oct 2012 22:41:17 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TSx5A-0004HS-76; Mon, 29 Oct 2012 22:41:16 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1351523465-26489-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1351527102.2828.19.camel@ted>
	<lyvcdtgsa6.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1351531332.2828.26.camel@ted>
	<lyr4ohgnw0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1351534747.2828.34.camel@ted>
	<lymwz5gl3j.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1351545644.2828.41.camel@ted>
Date: Mon, 29 Oct 2012 22:41:16 +0100
In-Reply-To: <1351545644.2828.41.camel@ted> (Richard Purdie's message of "Mon, 
	29 Oct 2012 21:20:44 +0000")
Message-ID: <lybofl0xdv.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.8
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
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
X-List-Received-Date: Mon, 29 Oct 2012 21:54:56 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> >> >> But the real bug is the time mismatch in the autobuilders, isn't it?
>> >> >> And this can/should be solved by synchronizing time by ntp on them
>> >> >> instead of applying dirty hacks like resetting file dates.
> ...
> Imagine system A generates the sysroot headers with a time ahead of
> system B. These are packaged up into an sstate tarball. System B which
> has a clock at some time behind system A then downloads and uses them
> so the sysroot headers become some time in the future.

This can not happen when both machines are synchronizing their time with
ntp.  Drift to stratum-1 machine is usually <1ms in local networks and
<50ms for remote ones (--> see 'ntpq' -> pe output).

Nothing, which can cause the problem described by you.


> The alternative is to mandate *every* system that builds are run on
> use ntp

Yes; a common timesource is mandatory for so nearly every distributed
system.  Even windoze enables (s)ntp clients by default (although its
daily synchronization is just a bad joke) and I remember Fedora/Ubuntu
enabling it by default too.


> and add checks to sanity.bbclass to this effect since someone might
> try using a sstate feed with a bad clock. This would cause no end of
> problems, not least with corporate filewalls

Every non-trivial network has local ntp servers which are used by clients
there.


> and hurt usability of the project

How common is the distributed autobuilder setup?  How many of these
installations do not use ntp?



Enrico


