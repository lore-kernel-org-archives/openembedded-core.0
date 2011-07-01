Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QcXrI-0005fI-T4
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 09:09:49 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Fri, 1 Jul 2011
	09:06:04 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jul 2011 09:05:59 +0200
Message-ID: <cover.1309503939.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v4 0/8] Linux 3.0 build support
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
X-List-Received-Date: Fri, 01 Jul 2011 07:09:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


v4: Removed the RFC in patch subject.
    - Merge the patches 2 and 4 from v3.=20
    - Bump PR in patch 2.
    - Delete the ignore*.patch from module-init-tools. In v2, the=20
      patch was just disabled.

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

The following changes since commit 40ecaf6a59ba61e72d29d7e677197ef37c998408=
:

  uclibc: Add default uClibc.machine files (2011-07-01 00:40:10 +0100)

are available in the git repository at:
  git://github.com/darander/oe-core kernel-3.0
  https://github.com/darander/oe-core/tree/kernel-3.0

Anders Darander (8):
  Remove support for building 2.4 kernels
  image=C2=A1kernel.bblass module-init-tools: do not use depmod-2.6
  modules-init-tools(-cross): update to 3.16
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
 .../files/ignore_arch_directory.patch              |   30 ------
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
 24 files changed, 24 insertions(+), 533 deletions(-)
 rename meta/recipes-kernel/{modutils =3D> module-init-tools}/files/PD.patc=
h (100%)
 delete mode 100644 meta/recipes-kernel/module-init-tools/files/ignore_arch=
_directory.patch
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



