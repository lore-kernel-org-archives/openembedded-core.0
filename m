Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 49E2A738AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 07:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 093F71EE07F6;
	Tue, 23 Aug 2016 09:25:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id vycd0Fnm2g9w; Tue, 23 Aug 2016 09:25:38 +0200 (CEST)
Received: from pcrosen.daviel.openwide.fr (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPA id BB58C1EE04C7;
	Tue, 23 Aug 2016 09:25:38 +0200 (CEST)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 09:25:21 +0200
Message-Id: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 0/8] Fix BUILD_* family of variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Aug 2016 07:25:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The BUILD_* family of variables allow the user to specify the name of the host
compiler to use at build time. This feature is particularly important for long
term maintainance. Future versions of gcc might not be compatible with old
yocto distributions and we can't assume that "gcc" is the correct name for the
compiler.

This problem is already an issue with Jethro which can't be compiled on a
machine wher gcc-6 is the default compiler. pkgconfig-native will refuse to
compile because it uses -Werror and gcc-6 has new warnings compared to gcc-5

This patch serie fixes multiple hard-coded references to gcc in various recipes
and build infrastructure

This patch was tested by building core-image-minimal for qemu-x86_64 with a
directory with the following content added to the PATH

 g++ -> /bin/false
 gcc -> /bin/false
 myg++ -> /usr/bin/g++
 mygcc -> /usr/bin/gcc

And the following variables added to local.conf

export BUILD_CC = "mygcc"
export BUILD_CXX = "myg++"
export BUILD_CPP = "mygcc -E"
export BUILD_CCLD = "mygcc"

---

All the patches haven't been pushed upstream yet, but I would be interested on
feedback on the actual work.

It would also be interesting to modify yocto's builders to use the BUILD_*
variable in order to have some early warning wrt gcc polution in recipes, but
seeing the various recipes I had to patch, I would expect such a change to
trigger a high number of build failures.

Jérémy Rosen (8):
  [autotools] export CCLD_FOR_BUILD
  [cross] export CC family from BUILD_* for cross compilers
  [rpm] force a configure before make distclean
  [linux-yocto] allow overriding compiler name in KConfig
  [linux-libc-headers] allow overriding compiler name in KConfig
  [busybox] allow overriding compiler name in KConfig
  [sanity] fix hardcoded references to gcc
  [glibc] remove hard-coded reference to gcc -E

 meta/classes/autotools.bbclass                                                                                            |  2 ++
 meta/classes/cross.bbclass                                                                                                | 12 ++++++++++++
 meta/classes/sanity.bbclass                                                                                               | 14 +++++++-------
 meta/recipes-core/busybox/busybox.inc                                                                                     |  5 +++++
 meta/recipes-core/busybox/busybox/0001-Allow-overriding-of-host-compiler-names.patch                                      | 27 +++++++++++++++++++++++++++
 meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch                                         | 23 +++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb                                                                                     |  6 ++----
 meta/recipes-devtools/rpm/rpm_5.4.16.bb                                                                                   |  2 +-
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc                                                             |  7 ++++++-
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-Allow-overriding-host-compiler-name-from-environment.patch | 32 ++++++++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc                                                                                 |  4 ++++
 meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch                     | 32 ++++++++++++++++++++++++++++++++
 12 files changed, 153 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-Allow-overriding-of-host-compiler-names.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-Allow-overriding-host-compiler-name-from-environment.patch
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch

-- 
git-series 0.8.9

