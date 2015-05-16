Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6A765C9C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 May 2015 04:58:51 +0000 (UTC)
Received: by wgkx2 with SMTP id x2so14154122wgk.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 21:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4UEgH1a397DWe2DQgUqBAe+UUkqVK95yVHYOT1WkNcs=;
	b=zhL1bu4SWFvuo1JFrE9/C4560n8aA8UlKyn+koGgqx1WppySIFy7/HwCzZsvIYPMUP
	grarTVxaf8Irjdhkfnoh8XaoI+tB7z0fWt6aPs3wxiEk5bTW1rtcJep1VDnEBQUg8t5u
	Eiv5SiSDscsyLjoKOHgznEJejP7BELo8UBrtLdCqefrxGJdRtxT3jdE0D+i1opp6PmRu
	HVmOcf4f+dXSnMWJJKLNPBRTbyKeWFsw3Uel+L21Kgbl+ZUymLREhD/u3yxFMhZAzPjV
	pE7VzUYa83tzQli3IbBKqDWkTBu11fbX/YFI9dYC8xWFQ+k8ONedElthJ+IQlBr4dBu9
	uXsA==
X-Received: by 10.180.85.161 with SMTP id i1mr3221553wiz.45.1431752332402;
	Fri, 15 May 2015 21:58:52 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id v3sm1170474wix.8.2015.05.15.21.58.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 May 2015 21:58:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 May 2015 06:59:15 +0200
Message-Id: <1431752355-17659-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.0
Subject: [dizzy][PATCH] e2fsprogs: install populate-extfs.sh
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
X-List-Received-Date: Sat, 16 May 2015 04:58:52 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* install populate-extfs.sh from contrib, be aware that in order
  to use it you need to set DEBUGFS shell variable, otherwise it will
  try to use debugfs from relative path which is almost always
  incorrect:
    CONTRIB_DIR=$(dirname $(readlink -f $0))
    DEBUGFS="$CONTRIB_DIR/../debugfs/debugfs"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index 70ccdfd..95c612c 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -54,6 +54,8 @@ do_install () {
 	oe_multilib_header ext2fs/ext2_types.h
 	install -d ${D}${base_bindir}
 	mv ${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs
+
+	install -v -m 755 ${S}/contrib/populate-extfs.sh ${D}${base_sbindir}/
 }
 
 do_install_append_class-target() {
-- 
2.4.0


