Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Ssb0p-0001L3-VC
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 16:50:32 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q6LEd6E2026658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2012 16:39:07 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1Ssapl-0001KN-Bx
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 16:39:05 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <lyk3xy7mlu.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20120720104117.GE3534@jama.jama.net> <1342782398.21788.7.camel@ted>
	<ly629i7inz.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Sat, 21 Jul 2012 16:39:05 +0200
In-Reply-To: <ly629i7inz.fsf@ensc-virt.intern.sigma-chemnitz.de> (Enrico
	Scholz's message of "Fri, 20 Jul 2012 13:53:36 +0200")
Message-ID: <lyipdhp4ae.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -5.2
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: Broken parallel build of gcc*
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Jul 2012 14:50:32 -0000
Content-Type: text/plain

Enrico Scholz
<enrico.scholz-wttK6gPy29v+Hn7q9Vec/7NAH6kLmebB@public.gmane.org>
writes:

>> Encrico: Which DISTRO are you using and do you use rm_work*.bbclass?
>
> yes; rm_old_work seems to cause the problem. 

The signature stuff was one problem; there is another, more trivial (but
probably more difficult) one:

Adding a task like

| addtask do_rm_old_work before do_unpack

causes stampfile dependencies for the shared gcc like

gcc.do_unpack ->  gcc-initial.do_rm_old_work
gcc.do_unpack ->  gcc-intermediate.do_rm_old_work

E.g. the earlier 'do_rm_old_work' stamps are recipe dependent but the
later 'do_unpack' are shared between recipes. Bitbake reexecutes do_unpack
when the corresponding do_rm_old_work is newer which is causing the seen
errors.

For now, I will declare the task as 'before do_compile'.


Enrico


