Return-Path: <lkml@jv-coder.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42ACCC433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 09:27:15 +0000 (UTC)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 by mx.groups.io with SMTP id smtpd.web09.4662.1653470833785585160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 02:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@jv-coder.de
 header.s=dkim header.b=Rx6rTY/l;
 spf=pass (domain: jv-coder.de, ip: 5.9.79.73, mailfrom: lkml@jv-coder.de)
Received: from ubuntu.localdomain (unknown [37.24.96.116])
	by mail.jv-coder.de (Postfix) with ESMTPSA id 6BF889F943;
	Wed, 25 May 2022 09:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
	t=1653470829; bh=swO3BdPqDANAkI5mtYl1CmeRS+U7epchNE6Prda+T3o=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Rx6rTY/liJ6Ws0oEm0x3F6MwNZJzKrkZDwqp3gSBrQWMaZzdwQI5fl8rBoomp/LCq
	 CNmLAWLjxRZ9UclcoPM/prsvqDc0AJBaAuaK+ZU5AQAkSY8EAhDLjNDX/Bz9tU6aqT
	 QqVe6OiZN8SZjB2YQzZl1n7nitYP+tt+lLyyBFWQ=
From: Joerg Vehlow <lkml@jv-coder.de>
To: openembedded-core@lists.openembedded.org
Cc: Joerg Vehlow <joerg.vehlow@aox.de>
Subject: [PATCH] libseccomp: Add missing files for ptests
Date: Wed, 25 May 2022 11:26:59 +0200
Message-Id: <20220525092659.771559-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 09:27:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166108

From: Joerg Vehlow <joerg.vehlow@aox.de>

pfc files are used e.g. in 38-basic-pfc_coverage.sh
valgrind_test.supp is required, when valgrind is installed, otherwise
all valgrind tests fail

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
---
 meta/recipes-support/libseccomp/libseccomp_2.5.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb b/meta/r=
ecipes-support/libseccomp/libseccomp_2.5.4.bb
index c76f3c3573..731d9ae08d 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
@@ -37,6 +37,10 @@ do_install_ptest() {
     for file in $(find tests/*.tests -type f); do
         install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
     done
+        for file in $(find tests/*.pfc -type f); do
+        install -m 644 ${S}/${file} ${D}/${PTEST_PATH}/tests
+    done
+    install -m 644 ${S}/tests/valgrind_test.supp ${D}/${PTEST_PATH}/test=
s
     for file in $(find tools/* -executable -type f); do
         install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
     done
--=20
2.25.1


