Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id A371C7382F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 22:46:16 +0000 (UTC)
Received: by wgin8 with SMTP id n8so10029561wgi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 15:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=U3fpbLmE9V3rGeZZV4ifhylrIgXhf2NONCcw3oApxys=;
	b=rsSw4xSAoAlxPViwV8A7iCU5WAmPz54Si98YdKbvxYizOVT4esTKC3hTJ7W5GNwlyC
	Yci21K3cOJPHbIsa5qJanYFg/ibBkb/JRyyQm02XE6yaMpBmS1yhehk1HlWqHQdB2ANO
	ZOBAbmHD+8q8wGzVIfUnv2oKynnTB8uPkcSDUuNqWX0K9PEgX0GnCSpX1EdPbAlOZOTV
	c/HywGjAbUU+O4e3uxhmBco8ICJQUU8On6/L0R6Fc8aezj4xR8DkoHaLdFPhmpY4C0A3
	s0+y5aGkiwhTUPK8uHdz/QbqPScdDSk1QLiwMfipMq4aRkPXwGV3O1uPZrGyvrR2AtwN
	ruQA==
X-Received: by 10.180.106.70 with SMTP id gs6mr3120155wib.36.1430261177525;
	Tue, 28 Apr 2015 15:46:17 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id g14sm8898215wjs.47.2015.04.28.15.46.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Apr 2015 15:46:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Apr 2015 00:46:18 +0200
Message-Id: <1430261178-3911-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH] e2fsprogs: install populate-extfs.sh
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
X-List-Received-Date: Tue, 28 Apr 2015 22:46:18 -0000

* install populate-extfs.sh from contrib, be aware that in order
  to use it you need to set DEBUGFS shell variable, otherwise it will
  try to use debugfs from relative path which is almost always
  incorrect:
    CONTRIB_DIR=$(dirname $(readlink -f $0))
    DEBUGFS="$CONTRIB_DIR/../debugfs/debugfs"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index 67a5ea7..be1db9e 100644
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
2.3.5


