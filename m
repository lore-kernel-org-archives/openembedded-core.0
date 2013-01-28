Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Tzrjj-00049j-6n
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 17:39:12 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r0SGNPxd028266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Jan 2013 17:23:26 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TzrUi-0000ps-FG; Mon, 28 Jan 2013 17:23:40 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <fdad95c5f7fc287a6b173d5c30447ab05fab0778.1359049755.git.ross.burton@intel.com>
	<1359385200.7131.11.camel@phil-desktop.brightsign>
	<ly1ud5l3cg.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1440434.Jn4S7oh0Xd@helios>
Date: Mon, 28 Jan 2013 17:23:40 +0100
In-Reply-To: <1440434.Jn4S7oh0Xd@helios> (Paul Eggleton's message of "Mon, 28
	Jan 2013 15:58:04 +0000")
Message-ID: <lywquxjmyb.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.82
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base: make feature backfilling happen earlier
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
X-List-Received-Date: Mon, 28 Jan 2013 16:39:12 -0000
Content-Type: text/plain

Paul Eggleton <paul.eggleton@linux.intel.com> writes:

>> 1. set some defaults on distribution base ...
>> 2. allow to override these defaults on a per-project base
>> ...
>> afaik, DISTRO_FEATURES_BACKFILL + _CONSIDERED exist to allow the first
>> two point without an '-=' operator which lacks in bitbake.
>
> No they don't. They exist to allow adding new features that should be enabled 
> for all existing distro configs without each of those having to be changed, and 
> provide a means for distros to opt out of that enabling if they wish.

How is this different from my requirements?  Ok; atm,
DISTRO_FEATURES_BACKFILL is pretty useless because it contains only
'pulseaudio' which is probably unwanted on >90% of all embedded devices
and it is impossible to extend DISTRO_FEATURES_BACKFILL.

But this variable exists to allow removal of features which are enabled
by default.


>> Of course, I could reinvent the wheel and write my own _CONSIDERED
>> mechanism.  But until now (resp. without the '=' => '?=' change), it
>> worked fine with DISTRO_FEATURES_BACKFILL.
> ...
> It's still not clear to me why you could not just set DISTRO_FEATURES
> directly. If you have values you're likely to want to remove, you can
> put them in separate variables that you can clear out later.

It is very difficultly to do within distro.conf. E.g. having

| DISTRO_FEATURES = "${@subtract_set('DISTRO_FEATURES', 'UNWANTED_FEATURES')}'

will probably result into some error regarding recursive expansion.

Using ':=' will not work here because required operations are not
available yet.


At the end it will reinvent the DISTRO_FEATURES_BACKFILL_CONSIDERED
wheel by moving it into my-distro.bbclass.



Enrico


