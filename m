Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1UXxWA-0003me-DM
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 19:42:07 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r42HO4Dr014205
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 2 May 2013 19:24:06 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1UXxEi-000602-F3; Thu, 02 May 2013 19:24:04 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Burton\, Ross" <ross.burton@intel.com>
References: <CAJTo0LZdtT=qg2k3eBJ_DQHQzMvqS0vwFSmkgCxxG7KOiPWfzQ@mail.gmail.com>
Date: Thu, 02 May 2013 19:24:04 +0200
In-Reply-To: <CAJTo0LZdtT=qg2k3eBJ_DQHQzMvqS0vwFSmkgCxxG7KOiPWfzQ@mail.gmail.com>
	(Ross Burton's message of "Thu, 2 May 2013 17:10:15 +0100")
Message-ID: <lyy5bxl2h7.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.79
X-Spam-Score: -6.6
X-Spam-Level: ------
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: libexecdir and multilib
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
X-List-Received-Date: Thu, 02 May 2013 17:42:13 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

> rpm allows "executables" (but not libraries) to conflict and will
> prefer the 64-bit version,

Sure? At least rpm-4 (Fedora, RHEL) does not allow files to conflict.
Fedora solves the multilib problem by splitting the distribution into
main packages (unilib only; contain binaries and data) and libraries
(multilib).  The distribution assemble tool ("mash") copies e.g. i386
-lib and -devel packages both in i386 and x86_64 repositories.

libexecdir files in Fedora should be part of unilib (main architecture)
packages only.


> libexecdir = ${exec_prefix}/libexec"
> ===
>
> Conflicting binaries with multilib, would likely need improvements in
> the opkg bbclass.  Consistent name so cross-architecture file paths
> are consistent, although the binary architecture isn't.

How is ${bindir} multilib packaging solved in OE?  Can this mechanism
applied to ${exec_prefix}/libexec too?


> What's clear from the research I've done is that there isn't a clear
> answer - upstreams have different expectations of how libexecdir/bindir
> are used, and different distributions do different things to solve the
> multilib problems - even when the distribution maintainers are also
> upstream developers.  Some examples:
>
> dbus has a helper dbus-daemon-launch-helper, which is installed into
> libexecdir.  Fedora moves it into $libdir, where as Debian moves this
> same binary to /usr/lib/dbus-1 avoiding the $arch... Some disagreement
> there apparently.

Yes; Fedora introduced this in 2007[1] without telling the rationale in
the commit :( afais, this is not give problems because path is read from
<serviceconfig> tag in /etc/dbus-1/system.conf and program is probably
called only from dbus library itself.


> My personal opinion at this point in time is that we should change
> libexecdir to be $libdir.

atm, multilib is a theoretical issue for me only and I do not have a
strong bias for ${libdir} vs. ${exec_prefix}/lib.

Nevertheless, when we change libexecdir to match ${libdir} in one
architecture, we will see packaging regressions.  To fix/detect them,
we will have to:

1. remove ${libexecdir}/* wildcards from FILES lists (permanent change)

2. do world builds with "strange", temporary libexecdir
   (e.g. /usr/lib/strange-libexec) and look for unpackaged files.



Enrico

Footnotes: 
[1]  http://pkgs.fedoraproject.org/cgit/dbus.git/commit/?id=73fe28f678b4a1f015bffbec0fa50b3690dd39a4


