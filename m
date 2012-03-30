Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SDfec-0008OM-7s
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 19:30:26 +0200
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 3C2F54B01B6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 19:21:19 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 19:21:18 +0200
Message-Id: <1333128078-31642-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [PATCH] license.py: fix behaviour of copyleft_compliance
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
X-List-Received-Date: Fri, 30 Mar 2012 17:30:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

actually if a package has a license in its LICENSE variable
which is not in the whitelist nor in the blacklist and even
if an other license in this variable is in the whitelist,
the package gets excluded and is not taken in account in the
copyleft_compliance.
This patch solves this by excluding a recipe if the LICENSE
variable includes a pattern from the blacklist and doesn't
include a variable from the whitelist.

Example in busybox which has LICENSE=3D"GPLv2 & BSD-4-Clause",
with the actual behaviour (where he blacklist contains only
CLOSED Proprietary) we get :
DEBUG: copyleft: busybox-1.19.4 is excluded: recipe has excluded licenses=
: BSD-4-Clause
which is not sane because busybox is covered by a copyleft license
which is GPLv2 and should match the default whitelist which is
GPL* LGPL*.

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta/lib/oe/license.py |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 5914506..c19911e 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -86,8 +86,10 @@ def is_included(licensestr, whitelist=3DNone, blacklis=
t=3DNone):
     """
=20
     def include_license(license):
-        return (any(fnmatch(license, pattern) for pattern in whitelist) =
and not
-                any(fnmatch(license, pattern) for pattern in blacklist))
+        return any(fnmatch(license, pattern) for pattern in whitelist)
+
+    def exclude_license(license):
+        return any(fnmatch(license, pattern) for pattern in blacklist)
=20
     def choose_licenses(alpha, beta):
         """Select the option in an OR which is the 'best' (has the most
@@ -106,8 +108,9 @@ def is_included(licensestr, whitelist=3DNone, blackli=
st=3DNone):
         blacklist =3D []
=20
     licenses =3D flattened_licenses(licensestr, choose_licenses)
-    excluded =3D filter(lambda lic: not include_license(lic), licenses)
-    if excluded:
+    excluded =3D filter(lambda lic: exclude_license(lic), licenses)
+    included =3D filter(lambda lic: include_license(lic), licenses)
+    if excluded and not included:
         return False, excluded
     else:
         return True, None
--=20
1.7.7.6



