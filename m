Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu6z-0005YU-Sv
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:37:53 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=nZi2PnloJCVB32+siu4wrvO9t9fRzkS21SQGThdJNxg=;
	b=qXQn4uHQuTAKGf7kqC8c0pAc5zYrBkl3ZQt3jwVZOzA7kkB71QyxqQ4yKwyO1egKrt
	sM031LiY1kNVjoa1JRujw4nnOrm7IkI3OAHZK3IvXt0G7KN/aAqWNnFzUPIbsEFfl1Bi
	8XV4IfPFF1EMY9EWhxY76WoyXU8Ljctiv6oRw=
Received: by 10.205.127.66 with SMTP id gz2mr1214717bkc.124.1321029098222;
	Fri, 11 Nov 2011 08:31:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x14sm11726999bkf.10.2011.11.11.08.31.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:31:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:54 +0100
Message-Id: <014f5fe4b85f6ac2bca3e35b6b649b3746af21da.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 18/22] time: use u-a for time, conflicts with busybox
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
X-List-Received-Date: Fri, 11 Nov 2011 16:42:03 -0000

* it was reported here:
  http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/009409.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/time/time.inc    |   10 ++++++++++
 meta/recipes-extended/time/time_1.7.bb |    2 ++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/time/time.inc b/meta/recipes-extended/time/time.inc
index 2d9dab8..401288b 100644
--- a/meta/recipes-extended/time/time.inc
+++ b/meta/recipes-extended/time/time.inc
@@ -6,3 +6,13 @@ SECTION = "utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
+inherit update-alternatives
+
+do_install_append () {
+        mv ${D}${bindir}/time ${D}${bindir}/time.${PN}
+}
+
+ALTERNATIVE_NAME = "time"
+ALTERNATIVE_LINK = "${bindir}/time"
+ALTERNATIVE_PATH = "${bindir}/time.${PN}"
+ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/time/time_1.7.bb b/meta/recipes-extended/time/time_1.7.bb
index 35afb1e..c38608f 100644
--- a/meta/recipes-extended/time/time_1.7.bb
+++ b/meta/recipes-extended/time/time_1.7.bb
@@ -1,5 +1,7 @@
 require time.inc
 
+PR = "r1"
+
 SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
 	   file://debian.patch"
 
-- 
1.7.8.rc1



