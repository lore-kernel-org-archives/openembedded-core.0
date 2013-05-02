Received: from mail-ve0-f173.google.com ([209.85.128.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UXwMv-0004pd-PJ
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 18:28:30 +0200
Received: by mail-ve0-f173.google.com with SMTP id ox1so668648veb.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 09:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:from:date:message-id:subject:to:cc
	:content-type:x-gm-message-state;
	bh=iJ13yRGhTesgdE/bA2ej6T0anFWBgSARcNWaDEDlxFI=;
	b=Loyd80b63/jn9crTVQMM0hTmLTcAGe5uxXLY3ESxBLeJfFwmJHp300iTEPla+9hcs/
	GFB7Xr9HjRFTfpqIP1HoIY1fSu79O0d1h5Ff+x3uEB2d6Wx4p66ZSz/AL7jBUjTzWrXR
	tKfvR/7HEmivbwhCMCVaqmg5jtJlOejrhJNB0+6sXu5c4xV5pUG1vjRjRRbavPDshRkv
	FovqkpFe5TXYKlnT6XwWiF+7UNDqdudYgvB/pR1kU48u/yGXy6gOUArQnzTx68nzO4li
	qaR7Glly5w3/7aiW+EvFECktjnkOyujDnJyQeXYGRzGJvrTMDzGPqqrDc6jq72IPflYx
	7j9A==
X-Received: by 10.220.67.67 with SMTP id q3mr2385637vci.38.1367511035714; Thu,
	02 May 2013 09:10:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Thu, 2 May 2013 09:10:15 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 May 2013 17:10:15 +0100
Message-ID: <CAJTo0LZdtT=qg2k3eBJ_DQHQzMvqS0vwFSmkgCxxG7KOiPWfzQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkRd1qwHEPtCTri1dWFmpX5VgPETBVOBtSYDmUOyCOmVgcaELiE5Q4TusXHJGf2XECGLY6o
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: libexecdir and multilib
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
X-List-Received-Date: Thu, 02 May 2013 16:28:30 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

There were several issues being discussed here under the topic of
libexecdir, some simple and some less so.  I'll ramble for a bit to
try and get a proper conclusion debated.

The situation where you have a 32-bit dropbear but a 64-bit openssh is
rather pathological and I'd like to know if this was a real-world
problem and the rationale behind it, or whether it was an example of a
hypothetical issue.  Note that the example of Debian using "/usr/lib"
as libexecdir is true only in the case where ML isn't being used, then
libexecdir is $prefix/lib/$arch, which will have the same hypothetical
problem.  Debian's SSH works because dropboard and openssh aren't
multilib-enabled - if you look at e.g. libgstreamer in Debian you'll
see the libexecdir there is arch-qualified.

Looking at the latest FHS drafts and the revised automake
documentation, I agree that our default --libexecdir shouldn't contain
${BPN}.  There may be packages that drop unrealistic numbers of
binaries into libexecdir and for those we can join most other
distributions and change libexecdir on a per-package basis.  However
the exact choice of libexecdir depends on what ML behaviour we expect
and have from the package managers, which predictably isn't uniform.

If it wasn't for multilib, this wouldn't be a issue - we could just
change the libexecdir definition to whatever we wanted.  However,
multilib does exist and causes all sorts of annoyances, mainly around
conflicting binaries.  As far as I'm aware rpm and opkg have different
behaviour when binaries conflict in packages: rpm allows "executables"
(but not libraries) to conflict and will prefer the 64-bit version,
whereas opkg allows files in $bindir (etc) to conflict.  So, rpm can
handle an arbitrary libexecdir but opkg can't at present.

So there are three options that I can see:

libexecdir = "$libdir"
===

No conflicting binaries in libexecdir when multilib is used, so
companion binaries used by libraries don't get used by different
architectures.  Other packages accessing the libexecdir could have
different architecture, but this is likely a rare situation.

libexecdir = "${exec_prefix}/lib"
===

Conflicting binaries with multilib, would likely need improvements in
the opkg bbclass.  Consistent name so cross-architecture file paths
are consistent, although the binary architecture isn't.  There is the
possibility of a /usr/lib solely containing libexecdir binaries if the
ML configuration means that the libdirs used are lib32 and lib64,
which would look odd.

libexecdir = ${exec_prefix}/libexec"
===

Conflicting binaries with multilib, would likely need improvements in
the opkg bbclass.  Consistent name so cross-architecture file paths
are consistent, although the binary architecture isn't.

What's clear from the research I've done is that there isn't a clear
answer - upstreams have different expectations of how
libexecdir/bindir are used, and different distributions do different
things to solve the multilib problems - even when the distribution
maintainers are also upstream developers.  Some examples:

dbus has a helper dbus-daemon-launch-helper, which is installed into
libexecdir.  Fedora moves it into $libdir, where as Debian moves this
same binary to /usr/lib/dbus-1 avoiding the $arch... Some disagreement
there apparently.

gdk-pixbuf has a tool to introspect/register the installed loader
modules.  As this loads the libraries, it needs to match the
architecture of the libgdk-pixbuf being used.  Upstream has this tool
installing to $bindir yet multilib distributions can't have this tool
being replaced with different architectures, so Fedora adds a
word-size suffix to the binary, and Debian moves it to their
libexecdir (which in ML-compatible packages in $libdir/$arch), and
both adapt their postinst scripts to match.

Both of these examples are in mainstream packages where the package
maintainers in the distro are also upstream developers, and yet these
kludges exist (note that our gdk-pixbuf is currently broken in this
respect).

My personal opinion at this point in time is that we should change
libexecdir to be $libdir.  My rationale for this is these internal
binaries then "stick" with their architecture, and that the number of
binaries that need to be invoked and match their library's
architecture is likely higher than the number of cross-package and
cross-architecture hard-coded execution paths (such as 32-bit dropbear
running 64-bit openssh helpers).

Hopefully nobody got too bored reading this, any comments?

Ross


