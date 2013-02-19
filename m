Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1U7nIJ-0000Kc-Gw
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 14:31:40 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 19 Feb 2013 14:14:17 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id DA4AE291D4F;
	Tue, 19 Feb 2013 14:14:17 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2013 14:14:00 +0100
Message-ID: <1361279644-17675-5-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1361279644-17675-1-git-send-email-bjst@enea.com>
References: <1361279644-17675-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: "Rick.Yang" <rick.yang@enea.com>
Subject: [PATCH 4/8] acl: Add ptest
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
X-List-Received-Date: Tue, 19 Feb 2013 13:31:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: "Rick.Yang" <rick.yang@enea.com>


Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/recipes-support/attr/acl_2.2.51.bb            |   21 ++++++++++++++++
 .../attr/files/add-runtest-target.patch            |   26 ++++++++++++++++=
++++
 meta/recipes-support/attr/files/run-ptest          |    8 ++++++
 3 files changed, 55 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/attr/files/add-runtest-target.patc=
h
 create mode 100644 meta/recipes-support/attr/files/run-ptest

diff --git a/meta/recipes-support/attr/acl_2.2.51.bb b/meta/recipes-support=
/attr/acl_2.2.51.bb
index 1c40b00..92d67e0 100644
--- a/meta/recipes-support/attr/acl_2.2.51.bb
+++ b/meta/recipes-support/attr/acl_2.2.51.bb
@@ -4,3 +4,24 @@ PR =3D "r3"
=20
 SRC_URI[md5sum] =3D "3fc0ce99dc5253bdcce4c9cd437bc267"
 SRC_URI[sha256sum] =3D "06854521cf5d396801af7e54b9636680edf8064355e51c0765=
7ec7442a185225"
+
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
+
+SRC_URI +=3D "file://add-runtest-target.patch \
+	    file://run-ptest \
+	   "
+
+inherit ptest
+
+RDEPENDS_${PN}-ptest +=3D "perl \
+                         perl-module-filehandle \
+                         perl-module-getopt-std \
+                         perl-module-posix"
+
+do_install_append() {
+    if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ] ; then
+        sed -i -e 's/include $(TOPDIR)\/include\/builddefs//g' ${B}/test/M=
akefile
+        ptest_do_install
+        cp -r ${B}/test/ ${D}${PTEST_PATH}/
+    fi
+}
diff --git a/meta/recipes-support/attr/files/add-runtest-target.patch b/met=
a/recipes-support/attr/files/add-runtest-target.patch
new file mode 100644
index 0000000..25fdaca
--- /dev/null
+++ b/meta/recipes-support/attr/files/add-runtest-target.patch
@@ -0,0 +1,26 @@
+From 149c3a4f0ba84b4ff94a52029dc89b887dcb6b8c Mon Sep 17 00:00:00 2001
+From: "Rick.Yang" <rick.yang@enea.com>
+Date: Mon, 17 Dec 2012 07:27:39 +0100
+Subject: [PATCH] Add runtest target for ptest.
+
+Signed-off-by: Rick.Yang <rick.yang@enea.com>
+Upstream-status: Pending
+
+---
+ test/Makefile |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/test/Makefile b/test/Makefile
+index d2baac8..5f52e10 100644
+--- a/test/Makefile
++++ b/test/Makefile
+@@ -47,4 +47,5 @@ $(ROOT):
+ .PHONY: $(TESTS) $(NFS) $(ROOT)
+ .NOTPARALLEL:
+=20
+-
++runtest-TESTS:
++	perl run $(TESTS)
+--=20
+1.7.5.4
+
diff --git a/meta/recipes-support/attr/files/run-ptest b/meta/recipes-suppo=
rt/attr/files/run-ptest
new file mode 100644
index 0000000..c431f04
--- /dev/null
+++ b/meta/recipes-support/attr/files/run-ptest
@@ -0,0 +1,8 @@
+#!/bin/sh
+#
+#This script is used to run acl test suites
+
+cd ./test/
+
+make -k runtest-TESTS | sed '/commands/d' | sed '/ok\| passed/ s/^/PASS: /=
g' | sed '/error\|fail\|failed[^0]\|ERROR\|FAIL/ s/^/FAIL: /g' | sed 's/UPA=
TH=3D\".*\"/UPATH=3DUTF8-String/g'
+
--=20
1.7.5.4



