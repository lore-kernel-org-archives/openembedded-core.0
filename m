Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SEo8v-0002If-CT
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 22:46:25 +0200
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 51EA4A622E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Apr 2012 22:37:15 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Apr 2012 22:37:10 +0200
Message-Id: <1333399030-28619-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1333399030-28619-1-git-send-email-eric@eukrea.com>
References: <1333399030-28619-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] copyleft_compliance: also print the reason for including a package
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
X-List-Received-Date: Mon, 02 Apr 2012 20:46:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta/classes/copyleft_compliance.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copy=
left_compliance.bbclass
index 4082e7e..3ca7337 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -47,14 +47,14 @@ def copyleft_should_include(d):
     exclude =3D oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
=20
     try:
-        is_included, excluded =3D oe.license.is_included(d.getVar('LICEN=
SE', True), include, exclude)
+        is_included, reason =3D oe.license.is_included(d.getVar('LICENSE=
', True), include, exclude)
     except oe.license.LicenseError as exc:
         bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
     else:
         if is_included:
-            return True, None
+            return True, 'recipe has included licenses: %s' % ', '.join(=
reason)
         else:
-            return False, 'recipe has excluded licenses: %s' % ', '.join=
(excluded)
+            return False, 'recipe has excluded licenses: %s' % ', '.join=
(reason)
=20
 python do_prepare_copyleft_sources () {
     """Populate a tree of the recipe sources and emit patch series files=
"""
@@ -67,7 +67,7 @@ python do_prepare_copyleft_sources () {
         bb.debug(1, 'copyleft: %s is excluded: %s' % (p, reason))
         return
     else:
-        bb.debug(1, 'copyleft: %s is included' % p)
+        bb.debug(1, 'copyleft: %s is included: %s' % (p, reason))
=20
     sources_dir =3D d.getVar('COPYLEFT_SOURCES_DIR', True)
     src_uri =3D d.getVar('SRC_URI', True).split()
--=20
1.7.7.6



