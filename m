Return-Path: <prvs=548e81f19=Martin.Hundeboll@prevas.dk>
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id 14F7D78757
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 09:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=1151; q=dns/txt;
	s=ironport2; t=1516183111; x=1547719111;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=VLTcNMlVjUq5TJCYtXs3i+TsxQkqaQqPJDwoNcXX3zg=;
	b=LldsojCEjvVbGInZvC/MxcNpzVw6uWtqsuzPlqsbxQTnch2G/esbIVMo
	k4UyEt/Rrg2358FA+AMvgDARLqbSojC5O9VYM1kQWbczrFqqb27+wMH0C
	BbiJcGAvNkOlaBroQHkCQAp3gJhJl9NdxDQed/8egmVX4CPzXWaHB5lQj g=;
X-IronPort-AV: E=Sophos;i="5.46,372,1511823600"; 
   d="scan'208";a="2924828"
Received: from vmprevas4.prevas.se (HELO smtp.prevas.se) ([172.16.8.104])
	by ironport2.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jan 2018 10:58:29 +0100
Received: from mnhu.aaad.autarch.net (172.16.8.31) by smtp.prevas.se
	(172.16.8.104) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 17 Jan 2018 10:58:28 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 10:58:20 +0100
Message-ID: <20180117095820.14658-1-mnhu@prevas.dk>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
X-Originating-IP: [172.16.8.31]
Subject: [PATCH] glib-2.0: fix EXTRA_OECONF append for PTEST
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
X-List-Received-Date: Wed, 17 Jan 2018 09:58:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The order of '_append' and '_<override>' matters: '_append' must be
before overrides to have any effect.

Fix this in glib-2.0, so that EXTRA_OECONF is appended instead of
overwritten.

Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 354d95cfe3..af65d80d76 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -49,7 +49,7 @@ EXTRA_OECONF = "${PRINTF} ${CORECONF}"
 EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux"
 
 # Tell configure that we'll have dbus-daemon on the target for the tests
-EXTRA_OECONF_class-target_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' ac_cv_prog_DBUS_DAEMON=dbus-daemon', '', d)}"
+EXTRA_OECONF_append_class-target = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' ac_cv_prog_DBUS_DAEMON=dbus-daemon', '', d)}"
 
 do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
-- 
2.15.1


