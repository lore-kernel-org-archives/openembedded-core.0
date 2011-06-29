Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qbz1u-000828-TI
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 19:58:27 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Wed, 29 Jun 2011
	19:54:41 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jun 2011 19:54:38 +0200
Message-ID: <cover.1309370038.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [RFC v3 PATCH 0/9] Linux 3.0 build support
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
X-List-Received-Date: Wed, 29 Jun 2011 17:58:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


v3: - task-base.bb: fix a problem that *pcmia26 couldn't be found.

v2: Probably some more patches could be squashed together. There might also
    be more places that should be addressed in these patches.

    - Whitespace fixes
    - Updated module-init-tools to 3.16. I'm not applying the ignore*.patch
    (it didn't apply).
    - Do not provide virtual/*/depmod-2.6; just provide virtual/*/depmod.
    - Do only install as depmod.
    - Rearrange the order of some patches.
    - Added patches to clean up (partly) task-base, distro_tracking_fields.

    A few of the patches might be ready to pull, but the majority will need
    to be revised.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
This work is unfinished and incomplete...
It is published in its current form both to get feedback, but also to aid
anyone else who is working on 3.0-support. If some of the patches are found=
 to
be OK, it's fine to cherrypick them.

The kernel-related classes has been modified to build a 3.0 kernel. The
patches has been simplified by removing support for the 2.4-series. (The
latter was suggested in an older mail thread:
http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg026=
82.html
).

The patches has been tested on linux-yocto_2.6.37 and a hacked version usin=
g
the linux-yocto-dev repository (using a 3.0-rcX). The latest versions has o=
nly
been built for qemuarm, prior iterations has also been built for qemux86.

Finally, no work has been done on the libc-linux-headers classes and recipe=
s.

/Anders

Please review the following changes for suitability for inclusion. If you h=
ave
any objections or suggestions for improvement, please respond to the patche=
s. If
you agree with the changes, please provide your Acked-by.

The following changes since commit ff014d9634638457622f6019b163e75bafcefada=
:

  task-base: add 3G into DISTRO_FEATURE (2011-06-29 14:46:46 +0100)

are available in the git repository at:
  git://github.com/darander/oe-core kernel-3.0
  https://github.com/darander/oe-core/tree/kernel-3.0

Anders Darander (9):
  Remove support for building 2.4 kernels
  image=C2=A1kernel.bblass: do not use depmod-2.6
  modules-init-tools(-cross): update to 3.16
  module-init-tools-cross: do not install depmod as depmod-2.6
  kernel.bblass: remove get_kernelmajorversion
  modutils-initscripts: move recipe prior to modutils removal
  modutils: remove modutils
  task-base: remove modutils reference.
  distro_tracking_fields: remove modutils.

 meta/classes/image.bbclass                         |    2 +-
 meta/classes/kernel.bbclass                        |   22 ++----
 meta/classes/linux-kernel-base.bbclass             |    8 --
 meta/classes/module-base.bbclass                   |    2 +-
 .../conf/distro/include/distro_tracking_fields.inc |    8 +--
 meta/recipes-core/tasks/task-base.bb               |   24 +----
 .../{modutils =3D> module-init-tools}/files/PD.patch |    0
 .../files/modutils.sh                              |    0
 .../module-init-tools-cross_3.12.bb                |   12 ---
 .../module-init-tools-cross_3.16.bb                |    8 ++
 .../module-init-tools/module-init-tools.inc        |    1 -
 ...nit-tools_3.12.bb =3D> module-init-tools_3.16.bb} |    6 +-
 .../modutils-initscripts.bb                        |    0
 meta/recipes-kernel/modutils/files/armeb.patch     |   16 ----
 meta/recipes-kernel/modutils/files/configure.patch |   34 -------
 meta/recipes-kernel/modutils/files/gcc4.patch      |   93 ----------------=
----
 meta/recipes-kernel/modutils/files/lex.l.diff      |   35 --------
 .../modutils/files/modutils-notest.patch           |   16 ----
 .../modutils/files/program_prefix.patch            |   71 ---------------
 .../recipes-kernel/modutils/modutils-collateral.bb |   21 -----
 .../modutils/modutils-cross/module.h.diff          |   35 --------
 .../modutils/modutils-cross_2.4.27.bb              |   20 ----
 meta/recipes-kernel/modutils/modutils_2.4.27.bb    |   93 ----------------=
----
 23 files changed, 24 insertions(+), 503 deletions(-)
 rename meta/recipes-kernel/{modutils =3D> module-init-tools}/files/PD.patc=
h (100%)
 rename meta/recipes-kernel/{modutils =3D> module-init-tools}/files/modutil=
s.sh (100%)
 delete mode 100644 meta/recipes-kernel/module-init-tools/module-init-tools=
-cross_3.12.bb
 create mode 100644 meta/recipes-kernel/module-init-tools/module-init-tools=
-cross_3.16.bb
 rename meta/recipes-kernel/module-init-tools/{module-init-tools_3.12.bb =
=3D> module-init-tools_3.16.bb} (87%)
 rename meta/recipes-kernel/{modutils =3D> module-init-tools}/modutils-init=
scripts.bb (100%)
 delete mode 100644 meta/recipes-kernel/modutils/files/armeb.patch
 delete mode 100644 meta/recipes-kernel/modutils/files/configure.patch
 delete mode 100644 meta/recipes-kernel/modutils/files/gcc4.patch
 delete mode 100644 meta/recipes-kernel/modutils/files/lex.l.diff
 delete mode 100644 meta/recipes-kernel/modutils/files/modules
 delete mode 100644 meta/recipes-kernel/modutils/files/modules.conf
 delete mode 100644 meta/recipes-kernel/modutils/files/modutils-notest.patc=
h
 delete mode 100644 meta/recipes-kernel/modutils/files/program_prefix.patch
 delete mode 100644 meta/recipes-kernel/modutils/modutils-collateral.bb
 delete mode 100644 meta/recipes-kernel/modutils/modutils-cross/module.h.di=
ff
 delete mode 100644 meta/recipes-kernel/modutils/modutils-cross_2.4.27.bb
 delete mode 100644 meta/recipes-kernel/modutils/modutils_2.4.27.bb

--=20
1.7.4.1



