Received: from mail-ie0-f169.google.com ([209.85.223.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TvZt5-00056Z-9j
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 21:47:16 +0100
Received: by mail-ie0-f169.google.com with SMTP id c14so3448523ieb.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 12:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=iz5kgyGHiB4tK+UpHTi658FxKshtVkVq5o43+YqwJto=;
	b=oDWojpueaz6t5fGnO8lb5FRxriNszzNx5ekGBFlwRt1QA4CJfv48QRzjM2jPBXvmA5
	um9MO2b6LINik++TeHHIK91T4I6JAjVXnwV93k/2NEWi9zV0A+dSFlxX3I631IV7UC65
	8/cljvR/rndwjRpevFW1QPNIPRBU1/dqhcX+xkzkh78fkgDJFOH4aANiCPMUB54zBMEy
	8M0/UU80Xw+5EjopppmQv5DYh/5n+gfEWTk7/hEFqK+EE+MLQxKRUw7qxU/JGLKyOdCH
	HQ2hPKqEvemYRnPjdl3v2Rz8E5yi9UqoUYL4r2s5HjVeB1NiBsxu0iFR5NaXNRCFZWmJ
	bGcg==
X-Received: by 10.50.222.226 with SMTP id qp2mr1791343igc.103.1358368304746;
	Wed, 16 Jan 2013 12:31:44 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id x7sm5635144igk.8.2013.01.16.12.31.41
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 12:31:43 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 13:31:36 -0700
Message-Id: <1358368296-24597-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.0.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] ptest.bbclass: don't add to PACKAGES if disabled
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
X-List-Received-Date: Wed, 16 Jan 2013 20:47:20 -0000

From: Christopher Larson <chris_larson@mentor.com>

Without this, we have excessive dependencies leaking into the build. In
particular, glib-2.0 was sucking in python modules even if ptest wasn't in
DISTRO_FEATURES.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/ptest.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 8bde489..361de78 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -14,7 +14,7 @@ PTEST_ENABLED = "${@base_contains("DISTRO_FEATURES", "ptest", "1", "0", d)}"
 RDEPENDS_${PN}-ptest_virtclass-native = ""
 RDEPENDS_${PN}-ptest_virtclass-nativesdk = ""
 
-PACKAGES += "${PN}-ptest"
+PACKAGES += "${@base_contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
 
 FILES_${PN}-dbg += "${PTEST_PATH}/*/.debug \
                     ${PTEST_PATH}/*/*/.debug \
-- 
1.8.0.3



