Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SK8FC-00021i-G7
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 15:14:54 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 15:05:18 +0200
Message-Id: <1334667923-13908-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/5] Misc resent patches for master or master-next
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
X-List-Received-Date: Tue, 17 Apr 2012 13:14:54 -0000

I'm resending patches that either haven't received any comments
so far (2 through 5) or where I don't know how to continue (1).

Some comments on the patches:
1) [fix] module.bbclass behaves differently than kernel.bbclass. My intention
   is to make them behave the same way. My first try was to copy pkg-
   postinst from kernel.bbclass to module.bbclass, but this was rejected
   by Koen, because it would leak build paths into the package. Richard
   suggested that calling depmod wasn't needed at all, because it was
   already called by pkg-postinst of kernel-image. So far I haven't had
   any problems with this patch.
   The main motivation to modify pkg-postinst was to improve the duration
   of the first boot, because module.bbclass forced pkg-postinst to get
   executed on first boot.
2) [fix] I wrote a local recipe, that fetched a tarball from a debian mirror.
   snapshot.debian.net didn't contain it, so it returned a html page
   instead of a 404.
3) [fix] Using PKGSUFFIX was suggested by Richard, in order to get rid of
   a preferred-provider warning.
4) [cleanup] Only removes unused files from wpa-supplicant just to get a better
   overview of the recipe.
5) [cleanup] Moves wpa_passphrase to bindir, which seems to be a more adequate
   location and which is the location used by Debian and Ubuntu.

I see that master-next hasn't received any updates since April 2nd.
Are patches that were submitted after that date going to get reviewed
after the release or should they get resubmitted after the release?

Andreas Oberritter (5):
  {kernel,module}.bbclass: don't run depmod for module packages during
    do_rootfs
  mirrors: remove snapshot.debian.net
  python: use PKGSUFFIX for libpython2
  wpa-supplicant: remove unused files
  wpa-supplicant: move wpa_passphrase to bindir

 meta/classes/kernel.bbclass                        |    4 +-
 meta/classes/mirrors.bbclass                       |    1 -
 meta/classes/module.bbclass                        |    7 +-
 .../wpa-supplicant-0.7.3/defaults-sane             |    8 -
 .../wpa-supplicant/wpa-supplicant-0.7.3/defconfig  |  157 ----------------
 .../wpa-supplicant/wpa-supplicant-0.7.3/init.sh    |   50 -----
 .../wpa_supplicant-0.5.7-always-scan.patch         |   14 --
 ...a_supplicant-fix-deprecated-dbus-function.patch |  189 --------------------
 .../wpa_supplicant_default.conf                    |   13 --
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    8 +-
 .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    7 +-
 12 files changed, 14 insertions(+), 446 deletions(-)
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defaults-sane
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/init.sh
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-0.5.7-always-scan.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-fix-deprecated-dbus-function.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant_default.conf

-- 
1.7.5.4



