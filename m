Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 00FE877054
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 15:00:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id D88383C886A8
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Sep 2015 15:59:46 +0100
Message-Id: <4d350d8597736f4f954b6865937b0fe740ff78b0.1441374016.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441374016.git.joshua.lock@collabora.co.uk>
References: <cover.1441374016.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1441374016.git.joshua.lock@collabora.co.uk>
References: <cover.1441374016.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v2 9/9] procps: fix for base_sbindir == sbindir
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

An rmdir call in do_install_append was trying to remove the
sbindir, however in a system with a merged usr this directory
is not empty and therefore failing to rm it causes an ERROR.

Instead check that sbindir != base_sbindir before trying to
remove the directory.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-extended/procps/procps_3.3.10.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/procps/procps_3.3.10.bb b/meta/recipes-extended/procps/procps_3.3.10.bb
index 65d64ec..dcfaba7 100644
--- a/meta/recipes-extended/procps/procps_3.3.10.bb
+++ b/meta/recipes-extended/procps/procps_3.3.10.bb
@@ -31,8 +31,9 @@ do_install_append () {
 	[ "${bindir}" != "${base_bindir}" ] && for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i; done
 	install -d ${D}${base_sbindir}
 	[ "${sbindir}" != "${base_sbindir}" ] && for i in ${base_sbindir_progs}; do mv ${D}${sbindir}/$i ${D}${base_sbindir}/$i; done
-        # Remove now empty dir
-	rmdir ${D}/${sbindir}
+        if [ "${base_sbindir}" != "${sbindir}" ]; then
+                rmdir ${D}${sbindir}
+        fi
 
         install -d ${D}${sysconfdir}
         install -m 0644 ${WORKDIR}/sysctl.conf ${D}${sysconfdir}/sysctl.conf
-- 
2.1.4


