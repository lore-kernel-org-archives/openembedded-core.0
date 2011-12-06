Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RY1av-0002Ha-L5
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 21:26:29 +0100
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 28057A672B;
	Tue,  6 Dec 2011 21:19:39 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 21:19:30 +0100
Message-Id: <1323202770-19265-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [PATCH] rootfs_ipk: implement FEED_DEPLOYDIR_BASE_URI support
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
X-List-Received-Date: Tue, 06 Dec 2011 20:26:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

this feature was present in OE-classic, is documented in OE-core
but its implementation is actually missing.
The present implementation is directly copied from OE-classic
and tested on an arm926 machine.

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta/classes/rootfs_ipk.bbclass |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bb=
class
index b4b95c5..ec01951 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -205,7 +205,18 @@ ipk_insert_feed_uris () {
=20
 		# insert new feed-sources
 		echo "src/gz $feed_name $feed_uri" >> ${IPKGCONF_TARGET}
-        done
+	done
+
+	# Allow to use package deploy directory contents as quick devel-testing
+	# feed. This creates individual feed configs for each arch subdir of th=
ose
+	# specified as compatible for the current machine.
+	# NOTE: Development-helper feature, NOT a full-fledged feed.
+	if [ -n "${FEED_DEPLOYDIR_BASE_URI}" ]; then
+		for arch in ${PACKAGE_ARCHS}
+		do
+			echo "src/gz local-$arch ${FEED_DEPLOYDIR_BASE_URI}/$arch" >> ${IMAGE=
_ROOTFS}/etc/opkg/local-$arch-feed.conf
+	    done
+	fi
 }
=20
 python () {
--=20
1.7.6.4



