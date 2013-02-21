Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U8a4f-0004VE-R9
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 18:36:57 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1LHKUHb005806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 21 Feb 2013 18:20:31 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U8Zos-00020W-C3; Thu, 21 Feb 2013 18:20:30 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYo_FLTkZ_OiFf6Tt_oYO6NoUAUB74s__2UcKv7ccdxaA@mail.gmail.com>
Date: Thu, 21 Feb 2013 18:20:30 +0100
In-Reply-To: <CAJTo0LYo_FLTkZ_OiFf6Tt_oYO6NoUAUB74s__2UcKv7ccdxaA@mail.gmail.com>
	(Ross Burton's message of "Thu, 21 Feb 2013 15:35:30 +0000")
Message-ID: <lyk3q1oa75.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.83
X-Spam-Score: -5.7
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: "Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
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
X-List-Received-Date: Thu, 21 Feb 2013 17:36:57 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> "With recent systemd packaging change, the rescue image size grow up
> from 5.9 MiB to 27 MiB because systemd dependencies are hardcoded in
> mandatory packages."
>
> This certainly can happen.  core-image-minimal-initramfs went from 19M
> up to 35M if you turn on systemd with the (unmerged) busybox enabling
> turned on.  Investigating this shows that the cause was busybox
> recommending busybox-syslog which depends on systemd, which isn't
> useful in the initramfs.  My branch adds busybox-syslog to
> BAD_RECOMMENDS and it's back down to 19M.  

I want busybox-syslogd in the rescue image. And an ntp + dhcp client
and http server.  Next might be tools from util-linux which depends on
systemd too.


> When people are building images with and without systemd, how are the
> non-systemd images booting?

Custom /init which executes busybox's /sbin/init finally.


> If sysvinit, what's the rationale for this?

It allows modularization (starting new services without editing /init)
with zero costs (busybox-init is already there).  I need full control
over things like attaching/detecting ubi volumes or sd cards and I feel
much better, when every line of relevant code was written by me ;)


> Will you consider switching to systemd for everything if the disk
> increase was only a new MB, on the grounds of consistent booting
> behaviour?

Definitively not.  There is far too much logic in usual systemd/udev
systems (e.g. accessing block devices and other hardware during udev
scanning) which contradicts with purposes of a rescue system.


> One massive problem with making init system an image time choice with
> packages is what happens when you have a feed with both pn-sysv and
> pn-systemd packages in.

I wrote some ideas here[1]. It starts with moving init script subpackages
into separate 'all-<initsys>' feeds till implementing the BAD_RECOMMENDS
mechanism in the depsolvers.

For me, it would be also okay, when runtime package management gets ignored
at all (rescue system are initramfs images without pkg management) and
making the initmgr in DISTRO_FEATURES selecting the default RRECOMMENDS.
The actual BAD_RECOMMENDATIONS mechanism works perfect in this case; adding
interesting -sysv subpackages manually when creating the rescue image would
be ok for me.


> The alternative is that if sysvinit and systemd are enabled we can't
> do any real systemd enabling.

Why not?  The functions in libsystemd are robust enough so that daemons
are still working in non-systemd systems.



Enrico

Footnotes: 
[1]  http://lists.linuxtogo.org/pipermail/openembedded-core/2013-February/035998.html



