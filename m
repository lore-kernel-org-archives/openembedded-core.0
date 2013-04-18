Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1USmDB-0005gj-GO
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 12:37:06 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r3IAJSWv004364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 18 Apr 2013 12:19:29 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1USlw7-0004m9-Tf; Thu, 18 Apr 2013 12:19:27 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1366211991.25282.34.camel@ted>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 18 Apr 2013 12:19:27 +0200
In-Reply-To: <1366211991.25282.34.camel@ted> (Richard Purdie's message of
	"Wed, 17 Apr 2013 16:19:51 +0100")
Message-ID: <ly38uoywcw.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.0
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Richard Purdie
	<richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
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
X-List-Received-Date: Thu, 18 Apr 2013 10:37:21 -0000
X-List-Received-Date: Thu, 18 Apr 2013 10:37:21 -0000
Content-Type: text/plain

Richard Purdie
<richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
writes:

> Currently, you can set VIRTUAL-RUNTIME_init_manager to an init system
> that isn't in DISTRO_FEATURES. This leads to head scratching over
> unbootable images.

Because this sanity check is placed into an anonymous function, this
change affects also images which do not not include packagegroup-core*
in their images and are not using VIRTUAL-RUNTIME_init_manager at all.

It would be probably better to execute this check only, when the package
gets built.  Or add

DEPENDS += "${@some_check(d)}"

where some_check(d) evaluates to 'broken-virtual-runtime' or so when bad
configuration has been detected and empty else.



Enrico


