Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RNhLi-0008L6-Mc
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 09:48:07 +0100
Received: from e6520eb.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 68FD64B02AE;
	Tue,  8 Nov 2011 09:41:50 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 09:41:47 +0100
Message-Id: <1320741708-15019-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <4EB86E07.5020907@intel.com>
References: <4EB86E07.5020907@intel.com>
MIME-Version: 1.0
Cc: Scott Garman <scott.a.garman@intel.com>
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
X-List-Received-Date: Tue, 08 Nov 2011 08:48:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

* without this patch, building dbus-nativesdk leads to a missing
dependency on 'base-passwd-nativesdk'
This was added by commit 46e6c3fa8034b12d178d605f3f5d7efe69671a13
* this patch handle the nativesdk case in the class useradd
* close bug 1702 http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1702
* v2 from Scott Garman with Richard Purdie's tricks

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/classes/useradd.bbclass |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 0f9b84c..6c933e1 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -3,7 +3,9 @@ USERADDPN ?=3D "${PN}"
 # base-passwd-cross provides the default passwd and group files in the
 # target sysroot, and shadow -native and -sysroot provide the utilities
 # and support files needed to add and modify user and group accounts
-DEPENDS_append =3D " base-passwd shadow-native shadow-sysroot"
+DEPENDS_append =3D "${USERADDDEPENDS}"
+USERADDDEPENDS =3D " base-passwd shadow-native shadow-sysroot"
+USERADDDEPENDS_virtclass-nativesdk =3D ""
=20
 # This preinstall function will be run in two contexts: once for the
 # native sysroot (as invoked by the useradd_sysroot() wrapper), and
@@ -95,8 +97,9 @@ useradd_sysroot_sstate () {
 	fi
 }
=20
-do_install[prefuncs] +=3D "useradd_sysroot"
-SSTATEPOSTINSTFUNCS +=3D "useradd_sysroot_sstate"
+do_install[prefuncs] +=3D "${SYSROOTFUNC}"
+SYSROOTFUNC =3D "useradd_sysroot"
+SYSROOTFUNC_virtclass-nativesdk =3D ""
=20
 # Recipe parse-time sanity checks
 def update_useradd_after_parse(d):
--=20
1.7.6.4



