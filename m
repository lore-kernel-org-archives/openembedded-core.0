Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1TikgO-0008Uh-Gf
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 12:41:00 +0100
Received: by mail-we0-f175.google.com with SMTP id z53so226112wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 03:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=id0HdhMR5fIo5UHSEosj80g5QTKL/L/AkZ2cCrdd9w0=;
	b=U2oLvwj61kwmLlVdKpiuQ/SGZCfecN6LdBZqdpmo3L2NirZzEmoI+zk9qu15cGTDZv
	0U6ExfvfYrqx62E3+RLsNxbNIskJ1M2/vgKfOjO4pPgXiGH4Bm7at9rNY/oYu05M8n73
	Y/PgKcviBogD+5inFkyh9sMFeyvN9h5zDb3rB6gnmjSnDqbHOOxJ+so0dKIzyRyGosqq
	MgoBd2SVPwKvxK2mT3CVX7C4YeiLwYBIYmdakjYg9oa7t4kygX7vCZtkMvhGWvrpBsKZ
	7uEH78e2naqwjDo+wK28dsR+7EwWxcU6i/Mekz+6hxhBcjTJirz/ba0T3durIKwO9GUk
	PNzA==
Received: by 10.194.71.140 with SMTP id v12mr1284522wju.36.1355311587362;
	Wed, 12 Dec 2012 03:26:27 -0800 (PST)
Received: from fahad-u1204.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPS id w5sm2773399wif.11.2012.12.12.03.26.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 03:26:26 -0800 (PST)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 16:26:11 +0500
Message-Id: <1355311572-10461-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>,
	Fahad Usman <fahad_usman@mentor.com>
Subject: [PATCH 1/2] perf: pass CFLAGS and LDFLAGS
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
X-List-Received-Date: Wed, 12 Dec 2012 11:41:00 -0000

Signed-off-by: Christopher Larson <chris_larson@mentor.com>

the patch was imported from meta-mentor layer on yoctoproject git server
http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor as of commit id
9d698004137c1a888d40d6a4808d94afa22387e7

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index 4e6d03d..8d1b232 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -9,7 +9,7 @@ as well."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-PR = "r6"
+PR = "r8"
 
 require perf.inc
 
@@ -67,6 +67,14 @@ EXTRA_OEMAKE = \
 		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
 		'
 
+# We already pass the correct arguments to our compiler for the CFLAGS (if we
+# don't override it, it'll add -m32/-m64 itself). For LDFLAGS, it was failing
+# to find bfd symbols.
+EXTRA_OEMAKE += "\
+	'CFLAGS=${CFLAGS}' \
+	'LDFLAGS=${LDFLAGS} -lpthread -lrt -lelf -lm -lbfd' \
+"
+
 do_compile() {
 	oe_runmake all
 }
-- 
1.7.9.5



