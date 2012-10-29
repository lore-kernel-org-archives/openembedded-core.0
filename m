Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TSumJ-00071r-BT
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 20:13:39 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q9TJ00Yi026526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 29 Oct 2012 20:00:01 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TSuZ6-00033w-Hc; Mon, 29 Oct 2012 20:00:00 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1351523465-26489-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1351527102.2828.19.camel@ted>
	<lyvcdtgsa6.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1351531332.2828.26.camel@ted>
	<lyr4ohgnw0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1351534747.2828.34.camel@ted>
Date: Mon, 29 Oct 2012 20:00:00 +0100
In-Reply-To: <1351534747.2828.34.camel@ted> (Richard Purdie's message of "Mon, 
	29 Oct 2012 18:19:07 +0000")
Message-ID: <lymwz5gl3j.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Mon, 29 Oct 2012 19:13:39 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> >> But the real bug is the time mismatch in the autobuilders, isn't it?
>> >> And this can/should be solved by synchronizing time by ntp on them
>> >> instead of applying dirty hacks like resetting file dates.
>> ...
>> > Worse, when this does happen the failures are extremely unpredictable
>> > and hard to debug. It causes things to repeatedly recompile for example,
>> > even during do_install.
> ...
> Set the date stamp of some headers in the target sysroot of some key
> system components (say glib) to a date about a day in the future,

Are there really packages which create files dated in the future?
Perhaps a sanity check should be written which rejects files which are
newer than their containing directory and/or the time-of-day?


> then clean and rebuild some software that uses glib.

How will 'tar -m' fix this?  It makes things just worse because the
files generated with -m are always newer than without -m (in practice,
time offset between hosts served by ntp is far below 100ms. which is
enough for the build stages doing the sstage file extraction).




Enrico


