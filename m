Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id F304677056
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 14:58:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 0F55C3C8869A
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 15:58:23 +0100
Message-Id: <82a9dc6d0c430ec44a9a7cf4e2499bdd5bffeb1f.1441291646.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441291646.git.joshua.lock@collabora.co.uk>
References: <cover.1441291646.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1441291646.git.joshua.lock@collabora.co.uk>
References: <cover.1441291646.git.joshua.lock@collabora.co.uk>
Subject: [PATCH 8/9] nfs-utils: don't force use of /sbin as sbindir
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
X-List-Received-Date: Thu, 03 Sep 2015 14:58:51 -0000

In a system with a merged /usr /sbin isn't packaged.

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


