Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TStpy-0005iQ-05
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 19:13:22 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q9THxhFi013261
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 29 Oct 2012 18:59:44 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TStcl-0000Uh-BE; Mon, 29 Oct 2012 18:59:43 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1351523465-26489-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1351527102.2828.19.camel@ted>
	<lyvcdtgsa6.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1351531332.2828.26.camel@ted>
Date: Mon, 29 Oct 2012 18:59:43 +0100
In-Reply-To: <1351531332.2828.26.camel@ted> (Richard Purdie's message of "Mon, 
	29 Oct 2012 17:22:12 +0000")
Message-ID: <lyr4ohgnw0.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.84
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
X-List-Received-Date: Mon, 29 Oct 2012 18:13:22 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> > where the option was added deliberately to deal with time mismatch
>> > between autobuilders which was causing real world bugs.
>> 
>> But the real bug is the time mismatch in the autobuilders, isn't it?
>> And this can/should be solved by synchronizing time by ntp on them
>> instead of applying dirty hacks like resetting file dates.
>
> I have asked that ntp be installed/fixed on the autobuilders to sort the
> problem out but it seems that even with ntp running, mismatches can
> happen (e.g. misconfigured timezones).

Really? The only timezone related problems might arise when a package
makes 'touch -d <date>' during build.  But I can not remember that I
have ever seen such a package and this problem should be easy to
localize.

Else, timezone configuration is completely uninteresting for comparing
timestamps or for setting time from ntp.


> Worse, when this does happen the failures are extremely unpredictable
> and hard to debug. It causes things to repeatedly recompile for example,
> even during do_install.

How comes do_install() into the game?  'populate-lic' are the only
sstate files created before do_install() and I can not imagine how they
affect the other build phases; do_compile() results are not sstated
(and with the 'tar -m' thing, timestamps get havoc completely causing
unpredictable rebuilds).

When do_install() is executed, all the following sstate files
(populate_sysroot, package) are invalidated and must be recreated.  So
your problem with do_install() sounds more like an incomplete/racy
cleanup of old files.



Enrico


