Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0ATZ-0004D3-Qc
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 12:35:13 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 12:26:42 +0100
Message-Id: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [RFC][PATCH 0/5] drop dependency on GNOME if x11 is disabled
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
X-List-Received-Date: Wed, 22 Feb 2012 11:35:14 -0000

I'd like to stop various GNOME packages from being built in a
distro which doesn't use x11. For me, this fixes many unwanted
dependencies, e.g. librsvg -> gconf -> polkit -> systemd -> udev-systemd
on a system with an old kernel (2.6.18), which cannot use a recent
udev. Of course, it saves some build time, too.

I guess, additional PR bumps for all users of gconf, gnomebase and
gtk-icon-cache bbclasses are required in order to pick up this change,
right? Does someone already have a script to automatically generate
a list of affected recipes? Is the PR bump required, considering that
this change mainly reduces build-time dependencies? It also disables
some preinst and postrm hooks, but they don't really hurt on existing
images. I suppose there aren't many images using GNOME packages
without x11. Any opinions?

Is it OK to use the 'x11' flag for this purpose? Is anybody using
GNOME with a different backend? Would it be better to introduce
a 'gnome' (and 'gconf'?) distro feature flag?

Regards,
Andreas

Andreas Oberritter (5):
  libsoup-2.4: don't depend on libgnome-keyring unless x11 is defined
  libproxy: don't depend on gconf unless x11 is defined
  gconf.bbclass: don't add dependencies or hooks unless x11 is defined
  gtk-icon-cache.bbclass: don't add dependencies or hooks unless x11 is
    defined
  gnomebase.bbclass: skip packages inheriting gnomebase unless x11 is
    defined

 meta/classes/gconf.bbclass                         |    5 ++++-
 meta/classes/gnomebase.bbclass                     |    7 ++++++-
 meta/classes/gtk-icon-cache.bbclass                |    5 ++++-
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    4 ++--
 meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb |    4 ++--
 5 files changed, 18 insertions(+), 7 deletions(-)

-- 
1.7.5.4



