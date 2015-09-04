Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 0179A77055
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 15:00:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id BF5633C886A7
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Sep 2015 15:59:45 +0100
Message-Id: <4b76806483932ff80de47a76970d28c28be0c5e3.1441374016.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441374016.git.joshua.lock@collabora.co.uk>
References: <cover.1441374016.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1441374016.git.joshua.lock@collabora.co.uk>
References: <cover.1441374016.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v2 8/9] nfs-utils: don't force use of /sbin as sbindir
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
X-List-Received-Date: Fri, 04 Sep 2015 15:00:09 -0000

The Makefile for mount and osd_login utilities forces
/sbin as asbindir, however on a merged /usr system this directory
might not exist. Instead sed in the system sbindir.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
index 6da8509..42101de 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
@@ -90,6 +90,14 @@ RDEPENDS_${PN}-stats = "python"
 
 FILES_${PN} += "${systemd_unitdir}"
 
+do_configure_prepend() {
+        sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
+            ${S}/utils/mount/Makefile.am
+
+        sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
+            ${S}/utils/osd_login/Makefile.am
+}
+
 # Make clean needed because the package comes with
 # precompiled 64-bit objects that break the build
 do_compile_prepend() {
-- 
2.1.4


