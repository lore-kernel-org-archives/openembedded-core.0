Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TzpPt-0000y7-52
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 15:10:42 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r0SDsoiM009763
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Jan 2013 14:54:51 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TzpAv-0000bd-Oe; Mon, 28 Jan 2013 14:55:05 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <fdad95c5f7fc287a6b173d5c30447ab05fab0778.1359049755.git.ross.burton@intel.com>
	<6d174abd95de70a59f54ca28c965ca72933a3ce7.1359049755.git.ross.burton@intel.com>
	<ly1ud9cf34.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1359377661.22371.54.camel@ted>
Date: Mon, 28 Jan 2013 14:55:05 +0100
In-Reply-To: <1359377661.22371.54.camel@ted> (Richard Purdie's message of
	"Mon, 28 Jan 2013 12:54:21 +0000")
Message-ID: <lypq0pl8ee.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.84
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 28 Jan 2013 14:10:45 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> > Backfilling DISTRO_FEATURES and MACHINE_FEATURES with _append statements
>> > happens too late to use those variables with conditional inherits, like
>> > this:
>> 
>> This causes regressions for setups where DISTRO_FEATURES_BACKFILL uses
>> the override mechanism. E.g. I have
>> 
>> | DISTRO_FEATURES_BACKFILL_mydist = "ld-is-gold ${${PROJECT_FEATURES}"
>> | DISTRO_FEATURES_INITMAN_mydist = "systemd"
>> 
>> Before this commit, DISTRO_FEATURES contained 'ld-is-gold' and the
>> project features.  Now, project features + ld-is-gold vanished and
>> pulseaudio is in again.
>
> I don't think its possible to make everything work :(
>
> The question is therefore how do we want to proceed? I'll take further
> proposed patches but I don't know what the best thing to do here is...

I made my setup (--> overriding DISTRO_FEATURES_BACKFILL by distro
configuration) working again by assigning it weakly in bitbake.conf:

-DISTRO_FEATURES_BACKFILL = "pulseaudio ${DISTRO_FEATURES_INITMAN}"
+DISTRO_FEATURES_BACKFILL ?= "pulseaudio ${DISTRO_FEATURES_INITMAN}"

ditto for MACHINE_FEATURES_BACKFILL.



Enrico


