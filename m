Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1USoAr-0001GB-2o
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 14:42:50 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r3ICPAri009924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 18 Apr 2013 14:25:11 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1USntl-0000VV-Ms; Thu, 18 Apr 2013 14:25:10 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1366211991.25282.34.camel@ted>
	<ly38uoywcw.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1366280909.10502.54.camel@ted>
	<lywqs0xgv7.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1366287118.10502.58.camel@ted>
Date: Thu, 18 Apr 2013 14:25:09 +0200
In-Reply-To: <1366287118.10502.58.camel@ted> (Richard Purdie's message of
	"Thu, 18 Apr 2013 13:11:58 +0100")
Message-ID: <lysj2oxbyy.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.83
X-Spam-Score: -5.1
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup: Add init-manager sanity check
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
X-List-Received-Date: Thu, 18 Apr 2013 12:42:51 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> no; the 'parsing recipes' phase throws an exceptions
>> 
>> | ERROR: Please ensure that your setting of
>> | VIRTUAL-RUNTIME_init_manager (sysvinit) matches the entries
>> | enabled in DISTRO_FEATURES## | ETA: 00:00:14
>> | ERROR: Unable to parse
>> | /srv/oe/dev/org.openembedded.core/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb:
>> | Exited with "1"
>> | ERROR: Command execution failed: Exited with 1
>> 
>> 
>> Of course, I can BBMASK out these packagegroup-core recipes or simply
>> define VIRTUAL-RUNTIME_init_manager.
>
> Hmm, I understand now.
>
> The way I see this is that the system can't know if anything in your
> environment is going to use packagegroup-* or not.

Exactly; at this stage, the system does not known whether
VIRTUAL-RUNTIME_init_manager will ever be used and should not check it
there hence.


> Given that, I do think this is a valid warning

It's not a warning, but an error stopping the build


>> > Other proposals for solutions are welcome. I thought it better to
>> > catch a common user misconfiguration than generate broken images
>> > silently though.
>> 
>> You can put this check into e.g. do_configure[prefuncs].
>
> So it errors at build time some time later? Where we can is it not
> better to inform the user of configuration issues earlier?

The differrence is that the anonymous python function fails regardless
whether VIRTUAL-RUNTIME_init_manager is used or not (and can not cause
problems hence).

The check in do_configure() will fail only, when it is really used.

I know that the check in the anonymous python function is executed very
early while the do_configure() check might trigger hours later.  I do
not know whether such early warnings are really important; perhaps my
initial

| DEPENDS += "${@some_check(d)}"

suggestion could be enhanced so that some_check() throws an exception
and puts a note like the actual one.


Enrico


