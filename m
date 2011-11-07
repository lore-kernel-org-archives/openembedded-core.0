Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RNWa5-0004XU-TZ
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 22:18:14 +0100
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 5E620A636A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2011 22:11:58 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 22:11:54 +0100
Message-Id: <1320700315-11952-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <4EB8225D.6000804@intel.com>
References: <4EB8225D.6000804@intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] useradd.bbclass: handle nativesdk case
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
X-List-Received-Date: Mon, 07 Nov 2011 21:18:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

* without this patch, building dbus-nativesdk leads to a missing
dependency on 'base-passwd-nativesdk'
This was added by commit 46e6c3fa8034b12d178d605f3f5d7efe69671a13
* this patch handle the nativesdk case in the class useradd
* close bug 1702 http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1702

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta/classes/useradd.bbclass |   18 +++++++++++++++---
 1 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index fb70b3e..b935d01 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -3,9 +3,16 @@ USERADDPN ?=3D "${PN}"
 # base-passwd-cross provides the default passwd and group files in the
 # target sysroot, and shadow -native and -sysroot provide the utilities
 # and support files needed to add and modify user and group accounts
-DEPENDS_append =3D " base-passwd shadow-native shadow-sysroot"
 RDEPENDS_${USERADDPN}_append =3D " base-passwd shadow"
=20
+def useradd_dep_append(d):
+	deps =3D ' '
+	if not bb.data.inherits_class('nativesdk', d):
+		deps =3D ' shadow-native shadow-sysroot base-passwd'
+	return deps
+
+DEPENDS_append =3D "${@useradd_dep_append(d)}"
+
 # This preinstall function will be run in two contexts: once for the
 # native sysroot (as invoked by the useradd_sysroot() wrapper), and
 # also as the preinst script in the target package.
@@ -96,8 +103,13 @@ useradd_sysroot_sstate () {
 	fi
 }
=20
-do_install[prefuncs] +=3D "useradd_sysroot"
-SSTATEPOSTINSTFUNCS +=3D "useradd_sysroot_sstate"
+python () {
+	if not bb.data.inherits_class('nativesdk', d):
+		funcs =3D bb.data.getVarFlag('do_install', 'prefuncs', d) or ""
+		funcs +=3D 'useradd_sysroot'
+		bb.data.setVarFlag('do_install', 'prefuncs', funcs, d)
+		d.setVar('SSTATEPOSTINSTFUNCS', (bb.data.getVar('SSTATEPOSTINSTFUNCS',=
 d, True) or "").join("useradd_sysroot_sstate"))
+}
=20
 # Recipe parse-time sanity checks
 def update_useradd_after_parse(d):
--=20
1.7.6.4



