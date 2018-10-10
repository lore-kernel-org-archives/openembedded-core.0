Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8FD7477A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 15:45:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9AFi3IH031365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Oct 2018 08:44:33 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 10 Oct 2018 08:43:52 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Oct 2018 23:02:58 +0800
Message-ID: <cover.1539182705.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V2 0/3] Fix multilib install file conflict of gobject-introspection
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
X-List-Received-Date: Wed, 10 Oct 2018 15:45:19 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

1 test steps
Set config in local.conf:

MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

IMAGE_INSTALL_append = " packagegroup-core-buildessential ldd gobject-introspection lib32-gobject-introspection gobject-introspection-dev lib32-gobject-introspection-dev"

2 bitbake core-image-sato

3 runqemu qemux86-64

4 runtime test:
Prepare a simple c file:
// test.h
int test_foo();

// test.c
#include <stdio.h>

int test_foo()
{
printf("hello world.\n");

return 0;
}

4.1 verify /usr/lib64/gir-1.0 is searched
# mv /usr/lib64/gir-1.0/ /tmp
# g-ir-scanner --no-libtool --namespace=Test --nsversion=0 --library=test --output Test-0.gir --include=GObject-2.0 test.c test.h
Couldn't find include 'GObject-2.0.gir' (search path: '['gir-1.0', '/usr/share/gir-1.0', '/usr/lib64/gir-1.0', '/usr/share/gir-1.0', '/usr/share/gir-1.0']')

4.2 verify g-ir-scanner and g-ir-compiler work
# gcc -fPIC -shared test.c -o libtest.so
# g-ir-scanner --no-libtool --namespace=Test --nsversion=0 --library=test --output Test-0.gir --include=GObject-2.0 test.c test.h
# g-ir-compiler Test-0.gir -o Test-0.typelib


The following changes since commit 4806d533044011811e78ac41c6aeee3de4224a1e:

  bitbake: main: Fix environment handling for UI module imports (2018-10-10 12:47:48 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/gir-ml
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/gir-ml

Kai Kang (3):
  gobject-introspection: add required python modules to rdepends
  gobject-introspection: fix multilib install file conflicts
  vala: update vapigen-wrapper

 meta/recipes-devtools/vala/vala.inc           |  7 +-
 ...nfigure.ac-make-GIR_DIR-configurable.patch | 68 +++++++++++++++++
 ...02-g-ir-tools-respect-gir_dir_prefix.patch | 76 +++++++++++++++++++
 .../gobject-introspection_1.58.0.bb           | 13 +++-
 4 files changed, 160 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-g-ir-tools-respect-gir_dir_prefix.patch

--
2.18.0


