Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 577406AD79
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 07:46:09 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Mon, 24 Jun 2013 09:46:05 +0200
Received: by sestofb10.enea.se (Postfix, from userid 2671)	id 94850289755;
	Mon, 24 Jun 2013 09:46:05 +0200 (CEST)
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2013 09:45:52 +0200
Message-ID: <1372059952-11074-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371716874-42538-1-git-send-email-sona.sarmadi@enea.com>
References: <1371716874-42538-1-git-send-email-sona.sarmadi@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH v2] bash ptest: Sed away the Makefile dependency to remove error messages.
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
X-List-Received-Date: Mon, 24 Jun 2013 07:46:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Bj=C3=B6rn Stenberg <bjst@enea.com>

The bash Makefile defines a dependency on itself and tries to run configure=
,=20
causing error messages when running ptest on target:

make: *** No rule to make target `configure.in', needed by `configure'.
make: *** No rule to make target `aclocal.m4', needed by `configure'.
make: *** No rule to make target `config.h.in', needed by `configure'.
make: *** No rule to make target `Makefile.in', needed by `Makefile'.
make: Failed to remake makefile `Makefile'.

This patch edits out this dependency in the Makefile installed for ptest,=20
to get rid of these messages.

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-extended/bash/bash-4.2/run-ptest |    2 +-
 meta/recipes-extended/bash/bash.inc           |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash-4.2/run-ptest b/meta/recipes-e=
xtended/bash/bash-4.2/run-ptest
index 66f1eee..8dd3b99 100644
--- a/meta/recipes-extended/bash/bash-4.2/run-ptest
+++ b/meta/recipes-extended/bash/bash-4.2/run-ptest
@@ -1,2 +1,2 @@
 #!/bin/sh
-echo Makefile: | make -f Makefile -f - -k THIS_SH=3D/bin/bash BUILD_DIR=3D=
. runtest
+make -k THIS_SH=3D/bin/bash BUILD_DIR=3D. runtest
diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/ba=
sh/bash.inc
index c619f82..2f4519c 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -40,6 +40,7 @@ do_install_append () {
 do_install_ptest () {
 	make INSTALL_TEST_DIR=3D${D}${PTEST_PATH}/tests install-test
 	cp ${B}/Makefile ${D}${PTEST_PATH}
+        sed -i 's/^Makefile/_Makefile/' ${D}${PTEST_PATH}/Makefile
 }
=20
 pkg_postinst_${PN} () {
--=20
1.7.10.4


