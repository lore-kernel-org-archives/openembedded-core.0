Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U9wTz-0006mU-Au
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 12:44:42 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1PBS9vm032209
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 25 Feb 2013 12:28:10 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U9wE5-0000aM-23; Mon, 25 Feb 2013 12:28:09 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYo_FLTkZ_OiFf6Tt_oYO6NoUAUB74s__2UcKv7ccdxaA@mail.gmail.com>
	<E79C80CE9122499B9C7D2D855CDF6319@intel.com>
Date: Mon, 25 Feb 2013 12:28:09 +0100
In-Reply-To: <E79C80CE9122499B9C7D2D855CDF6319@intel.com> (Ross Burton's
	message of "Sun, 24 Feb 2013 10:37:26 +0000")
Message-ID: <lymwus3a5y.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.72
X-Spam-Score: -5.7
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
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
X-List-Received-Date: Mon, 25 Feb 2013 11:44:44 -0000
Content-Type: text/plain

Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> the source, so enabling systemd may well lead to libsystemd-* libraries
> sneaking into your rescue image.

for socket activation and sd_notify(), only libsystemd-daemon is required
which is

-rwxr-xr-x    1 root     root         11644 Feb 25 09:27 /lib/libsystemd-daemon.so.0.0.7

~ # ldd /lib/libsystemd-daemon.so.0.*
        libdl.so.2 => /lib/libdl.so.2 (0x441e0000)
        librt.so.1 => /lib/librt.so.1 (0x441c8000)
        libc.so.6 => /lib/libc.so.6 (0x44040000)
        /lib/ld-linux.so.3 (0x44010000)
        libpthread.so.0 => /lib/libpthread.so.0 (0x441a0000)

~ # ldd -u -r /lib/libsystemd-daemon.so.0.*
Unused direct dependencies:
        /lib/libdl.so.2


Ok, it needs more space than nothing and small things like this can sum
up easily.  But it is still a significant difference between having
libsystemd-daemon in the image or the whole systemd.


> The systemd libraries will have to be reviewed to verify that installing
> one of them doesn't pull in systemd itself.

afair, libsystemd-daemon was designed to be as light weighted as possible
and will never depend on the rest of systemd.



Enrico


