Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U8Tjz-0006rk-29
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 11:51:04 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1LAYj1l013772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 21 Feb 2013 11:34:46 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U8TUC-0004iw-Ro; Thu, 21 Feb 2013 11:34:44 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Burton\, Ross" <ross.burton@intel.com>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<CAP9ODKq_XBobE5vCOCCSgusT9RQyY3VSbUZmR9yAcQ4eFkKLBg@mail.gmail.com>
	<1361019187.31795.49.camel@ted> <20130217231955.GF3300@jama>
	<lyd2vydizm.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LbAmTuj0dZKq7=wX5uqF9OV7dW7FXd4d2incdKSshXEmQ@mail.gmail.com>
Date: Thu, 21 Feb 2013 11:34:44 +0100
In-Reply-To: <CAJTo0LbAmTuj0dZKq7=wX5uqF9OV7dW7FXd4d2incdKSshXEmQ@mail.gmail.com>
	(Ross Burton's message of "Wed, 20 Feb 2013 19:58:28 +0000")
Message-ID: <lybobe0xbv.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Thu, 21 Feb 2013 10:51:07 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

>>> But it doesn't need to be as dangerous as binconfig.bbclass, because
>>> we already list .service or .socket files in SYSTEMD_SERVICE so we
>>> can improve that "find" call
>>
>> Why is 'find' required at all?  afaik, only files from $SRC_URI are
>> affected.  So we can
>>
>> 1. create an (overridable) SYSTEMD_EXTRA_SERVICES variable
>>
>> 2. fill this variable in systemd.bbclass with .service, .target, .socket
>>    + .mount files from $SRC_URI
>>
>> 3. modify systemd's do_install so that files above are copied after
>>    doing some some sanity checks (e.g. checks that no previous version
>>    from 'make install' exists or that it are really systemd files).
>
> As I've said before you'll need to be pre-processing these files
> anyway,

oh... this means khem's "meta-systemd: Append ${PN} to SYSTEMD_SERVICE"
patch series is incomplete and all the do_install_append() need to get
yet more complicated....

It is really time, to move the additional-service-file installation back
into the class.


> so either the class gets *even more* logic or you just deal with it.
> Over time more and more upstreams will get systemd support so we'll
> be carrying overcomplicated logic for no reason.  We're really just
> talking about one conditional and a sed call here.

By applying some general rules (e.g. using autoconf like '@bindir@'
templates), this can/should be done by the class and not in every
recipe.



Enrico


