Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SDEVr-0007wO-GU
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 14:31:35 +0200
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 008284B015A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 14:22:30 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2012 14:22:29 +0200
Message-Id: <1333023749-31830-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [PATCH] license.bbclass: remove existing license.manifest before appending new data
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
X-List-Received-Date: Thu, 29 Mar 2012 12:31:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

without this fix, we append license each time we build again the same ima=
ge,
ending with a large not up to date file.

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta/classes/license.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 394a6d4..c85233c 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -79,6 +79,10 @@ license_create_manifest() {
 	# Get list of installed packages
 	list_installed_packages | grep -v "locale" |sort > ${LICENSE_DIRECTORY}=
/${IMAGE_NAME}/package.manifest
 	INSTALLED_PKGS=3D`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manife=
st`
+	# remove existing license.manifest file
+	if [ -f ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest ]; then
+		rm ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+	fi
 	# list of installed packages is broken for deb
 	for pkg in ${INSTALLED_PKGS}; do
 		# not the best way to do this but licenses are not arch dependant iirc
--=20
1.7.7.6



