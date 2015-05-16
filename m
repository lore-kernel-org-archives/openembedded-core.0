Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id BC5CC65C9C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 May 2015 04:58:19 +0000 (UTC)
Received: by wicnf17 with SMTP id nf17so12633296wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 21:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7X5Z/fL4WNjbccxaJB1u/Zjl1LhfW38+GxE8PO0BmVM=;
	b=b6iiqF29/lMNMdqdaWu8SAFrCCtTytNXH5uNg1cnecyawUS6Z3xvfBy/XDO3LkzAwH
	ZseiCcdJHdeVvAvXYfKMOALHfPrK32+d2em+3z3mrG9GUZ1ceOVyQUxbwJbyHSMM9djx
	gRQPFH5Mwd15fA9v18c2lcgDFkHJG5S1CiYAcOwWk/s4RV7GA3J0TsW6vwESx0fpRm3i
	QMDklITBnuY4sA8znaUMH+lHjrKp8WhKeUJddV1k+bEoh/Hc2G8havY4dmfJnWpZal5u
	pmzXfdI4YbRnBvubF4v8HkiWiPSo/Xhh0oDEBpvwAtTKXjLgohp/hp8MUjXZiTADr46q
	gnUw==
X-Received: by 10.180.7.133 with SMTP id j5mr3268331wia.84.1431752300943;
	Fri, 15 May 2015 21:58:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id v20sm5549163wjr.49.2015.05.15.21.58.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 May 2015 21:58:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 May 2015 06:58:43 +0200
Message-Id: <1431752323-17235-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.0
Subject: [fido][PATCH] e2fsprogs: install populate-extfs.sh
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
X-List-Received-Date: Sat, 16 May 2015 04:58:22 -0000

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
index 66065bc..abc959f 100644
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


