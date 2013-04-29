Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1UWrlh-0002HT-MO
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 19:22:11 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r3TH3h4M006243
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2013 19:03:44 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1UWrUN-0005D7-7C
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 19:03:43 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1367249183-2579-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<CAJTo0Laf-d0hz5kkRZZAr7W4yGs+aYaTu51XU2k2q-s0p57q5A@mail.gmail.com>
	<lyip35jpw8.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYGf=QtQ_dEbaUiFWOGjpAjfNXqCPY_XYrt+G-rUhcsOg@mail.gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 29 Apr 2013 19:03:43 +0200
In-Reply-To: <CAJTo0LYGf=QtQ_dEbaUiFWOGjpAjfNXqCPY_XYrt+G-rUhcsOg@mail.gmail.com>
	(Ross Burton's message of "Mon, 29 Apr 2013 17:20:46 +0100")
Message-ID: <lyehdtjmkw.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.82
X-Spam-Score: -6.5
X-Spam-Level: ------
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: [PATCH 1/7] bitbake.conf: fix definition of ${libexecdir}
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
X-List-Received-Date: Mon, 29 Apr 2013 17:22:30 -0000
X-List-Received-Date: Mon, 29 Apr 2013 17:22:30 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

>> Things *are* expected to move around.  E.g. /usr/lib/openssh/sftp-server
>> becomes /usr/lib/sftp-server now.
>
> Right, so don't use Debian as a rationale for this approach.

Debian defines libexecdir to be /usr/lib (+multiarch).  It might set
sometimes per-package '--libexecdir=${libexecdir}/<package>' configure
options, but libexecdir is always /usr/lib there.


> $ ls /usr/lib/openssh/
> sftp-server  ssh-keysign  ssh-pkcs11-helper
>
> For reference, on Fedora this binary is /usr/libexec/openssh/sftp-server,
> with the split between dropping binaries directly into /usr/libexec or
> using a subdirectory apparently arbitrary.

Placing openssh helpers in own subdirectory can make sense when
there are alternative implementations.  Nevertheless, programs
expect ${libexecdir}/sftp-server there.

Every recipe using libexecdir must be investigated whether it is placing
only private files into it (--> candidate for ${pkglibexecdir}), or
whether files are part of its public api (--> must be directly below
${libexecdir}).


> Every package that I looked at on Debian is using
> /usr/lib/[packagenameish]/[binary].  /usr/lib/upower/upowerd.
> /usr/lib/telepathy/telepathy-gabble.  I say packagenameish as it's
> often changed to be a more general name - i.e. all of the Telepathy
> backends use /usr/lib/telepathy.
>
> There are no *executables*, only libraries, in /usr/lib on Debian or

I do not have Debian for reference; but Ubuntu-12.04 (only a minimal,
GUI-less installation) has

/usr/lib/command-not-found
/usr/lib/pt_chown

and

/usr/lib/sftp-server -> openssh/sftp-server



> Fedora.

Fedora has /usr/libexec with lot of executables directly below it.


> I'm really not liking dropping the executables into a directory that
> on non-multilib is the same as libdir.

When we want to follow FHS strictly, nothing prevents us from placing
files into /usr/lib.

  /usr/lib includes object files, libraries, and internal binaries
  that are not intended to be executed directly by users or shell
  scripts.

  Applications may use a single subdirectory under /usr/lib. If an
  application uses a subdirectory, all architecture-dependent data
  exclusively used by the application must be placed within that
  subdirectory.


When we really do not want executables under ${libdir}, we can set

  libexecdir = ${prefix}/lib/libexec

(which might be a good setting for world-builds to detect some kind of
libexecdir related problems).


> If we want to be like the half of the world that does the same as
> Fedora then we can revert back to /usr/libexec.  Or we can be like
> the half of the world that does the same as Debian and use something
> similar to ${prefix}/lib/$(DEB_SOURCE_PACKAGE) (as used in CDBS and
> Debhelper):

Debian does *not* include the package name since mid 2011

        http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=541458


Enrico


