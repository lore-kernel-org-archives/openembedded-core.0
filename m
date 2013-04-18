Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1USmWT-0007WF-BP
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 12:57:02 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r3IAdOAk009859
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 18 Apr 2013 12:39:25 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1USmFQ-0006l0-8a; Thu, 18 Apr 2013 12:39:24 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1366211991.25282.34.camel@ted>
	<ly38uoywcw.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1366280909.10502.54.camel@ted>
Date: Thu, 18 Apr 2013 12:39:24 +0200
In-Reply-To: <1366280909.10502.54.camel@ted> (Richard Purdie's message of
	"Thu, 18 Apr 2013 11:28:29 +0100")
Message-ID: <lywqs0xgv7.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
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
X-List-Received-Date: Thu, 18 Apr 2013 10:57:03 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> > Currently, you can set VIRTUAL-RUNTIME_init_manager to an init
>> > system that isn't in DISTRO_FEATURES. This leads to head scratching
>> > over unbootable images.
>> 
>> Because this sanity check is placed into an anonymous function, this
>> change affects also images which do not not include packagegroup-core*
>> in their images and are not using VIRTUAL-RUNTIME_init_manager at all.
>
> Affects in that it runs the anonymous python fragment but does nothing?

no; the 'parsing recipes' phase throws an exceptions

| ERROR: Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (sysvinit) matches the entries enabled in DISTRO_FEATURES##                                                               | ETA:  00:00:14
| ERROR: Unable to parse /srv/oe/dev/org.openembedded.core/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb: Exited with "1"
| ERROR: Command execution failed: Exited with 1


Of course, I can BBMASK out these packagegroup-core recipes or simply
define VIRTUAL-RUNTIME_init_manager.


> Other proposals for solutions are welcome. I thought it better to
> catch a common user misconfiguration than generate broken images
> silently though.

You can put this check into e.g. do_configure[prefuncs].



Enrico


