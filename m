Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U7O24-0003ON-CC
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 11:33:34 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1IAH13W020659
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 18 Feb 2013 11:17:03 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U7NmP-0007tn-Jm; Mon, 18 Feb 2013 11:17:01 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<CAP9ODKq_XBobE5vCOCCSgusT9RQyY3VSbUZmR9yAcQ4eFkKLBg@mail.gmail.com>
	<1361019187.31795.49.camel@ted> <20130217231955.GF3300@jama>
Date: Mon, 18 Feb 2013 11:17:01 +0100
In-Reply-To: <20130217231955.GF3300@jama> (Martin Jansa's message of "Mon, 18
	Feb 2013 00:20:52 +0100")
Message-ID: <lyd2vydizm.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Cc: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Mon, 18 Feb 2013 10:33:35 -0000
Content-Type: text/plain

Martin Jansa <martin.jansa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
writes:

>> On the specifics of the do_install_append, you've seen my comments
>> about how we're not learning from past mistakes with the way the
>> do_install in the class was written. I note Phil also agreed with
>> them, both of us remembering some of the horrors we've dealt with in
>> the past (and binconfig.bbclass is still around, sadly).
>
> But it doesn't need to be as dangerous as binconfig.bbclass, because
> we already list .service or .socket files in SYSTEMD_SERVICE so we can
> improve that "find" call

Why is 'find' required at all?  afaik, only files from $SRC_URI are
affected.  So we can

1. create an (overridable) SYSTEMD_EXTRA_SERVICES variable

2. fill this variable in systemd.bbclass with .service, .target, .socket
   + .mount files from $SRC_URI

3. modify systemd's do_install so that files above are copied after
   doing some some sanity checks (e.g. checks that no previous version
   from 'make install' exists or that it are really systemd files).


Enrico


