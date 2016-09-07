Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id CBDC5776F4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 09:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id C1A9A1EEA614;
	Wed,  7 Sep 2016 11:08:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id c7KO-dBMRkaI; Wed,  7 Sep 2016 11:08:57 +0200 (CEST)
Received: from pcrosen.daviel.openwide.fr (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPA id A809C1EECBA6;
	Wed,  7 Sep 2016 11:08:56 +0200 (CEST)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 11:08:41 +0200
Message-Id: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH v2 0/8] Fix BUILD_* family of variables
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
X-List-Received-Date: Wed, 07 Sep 2016 09:09:01 -0000
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
V2
* rewording in some commits messages
* no need for a patch to KConfig, use OE_RUNMAKE_FLAGS instead
* change all patch titles to use : in the short commit message
* rpm : manually remove files instead of calling make distclean
* libpcre : explicitely set CCLD_FOR_BUILD in the recipe since it's the only
  recipe using it.
* glibc patch has been submited upstream

It would be interesting to modify yocto's builders to use the BUILD_*
variable in order to have some early warning wrt gcc polution in recipes, but
seeing the various recipes I had to patch, I would expect such a change to
trigger a high number of build failures.

Jérémy Rosen (8):
  cross: export CC family from BUILD_* for cross compilers
  linux-yocto: allow overriding compiler name in KConfig
  linux-libc-headers: allow overriding compiler name in KConfig
  busybox: allow overriding compiler name in KConfig
  sanity: fix hardcoded references to gcc
  glibc: remove hard-coded reference to gcc -E
  rpm: manually cleanup sysck
  libpcre: explicitely specify CCLD_FOR_BUILD for this recipe

 meta/classes/cross.bbclass                                                        | 12 ++++++++++++
 meta/classes/kernel.bbclass                                                       |  1 +
 meta/classes/sanity.bbclass                                                       | 14 +++++++-------
 meta/recipes-core/busybox/busybox.inc                                             |  2 +-
 meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch | 39 +++++++++++++++++++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb                                             |  3 ++-
 meta/recipes-devtools/rpm/rpm_5.4.16.bb                                           |  2 +-
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc                     |  2 ++
 meta/recipes-support/libpcre/libpcre_8.39.bb                                      |  2 ++
 9 files changed, 67 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch

-- 
git-series 0.8.9

