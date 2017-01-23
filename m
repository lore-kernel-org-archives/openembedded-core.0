Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3E21A731DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:00:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r126so26651970wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 06:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tN+q0YxKQ3TC6U0tTOJe2cRo6wjhCDhOmfdgvad3xRA=;
	b=Cb6256Z3gD3zJYjiJ12zZ6FOnPKocimNxLR1BoZYjsVv0PNrGFkuzknk8dL+8Lzwzr
	cUbG5qKpgYYFUhIIICEVjKz2/iEOsiYBjWvHqwVlHmeXqWt33FZBB6Xj8F/cQf0+UisR
	QXrtx5my/FAyGcrSxTLIF2tez7qPANezLYm+sn/pL8tAG5NxViiPgsuruFFXwjqwofgo
	bpafzXmUYgp4wUOhRvW8L6zWQYQRhe1aiYsEX5jT1IhRKnO1OQx6vuvV1L3/aQlIErzv
	w5LOrPJ6SzsN5sAEuf7RcC/vf9+DNTO11oVK1NLcHgY0+g9PnjP9/5K0+hcaU8ZLwbf0
	Jpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tN+q0YxKQ3TC6U0tTOJe2cRo6wjhCDhOmfdgvad3xRA=;
	b=G71Shfk8AxlffGYrRlbpBNVt758u4v5egc+NE9grmlMJn+kiZM4JHDjZXriX5x+9tl
	ZUOihs+33YfeyqHaD8S7cZutgeX9wdJyk9y1EJbKEKh2rp5nP8y+1inKgDg75MsCMN4Q
	D0eN3iSPInNa1U3OgU7jEOiNW2IQTCv8KzaPSLYLHRIfL+h6v3BS+6ubmKMF6z6KKuKw
	pM0j6WlFdQyA1Yshei7fg/6JuyZbhVK4O6oKk6UEfvC9n3vrFr3xSWQGU0fGHDl4ysnE
	j1HoIxL2wUXz9UY3MD/+43FccVzdRZE6aakpSDtOCBd4Rc31iLgxV0pXdSMiq4DO3Irn
	zuIw==
X-Gm-Message-State: AIkVDXLIO8gITdn0AYT9RJ/PfLhVN3sSJgXIkfM5DuoDlmw1wTFxLTxILQMBWpjli2GtEw==
X-Received: by 10.28.126.12 with SMTP id z12mr15546283wmc.84.1485180005322;
	Mon, 23 Jan 2017 06:00:05 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	186sm21178735wmw.24.2017.01.23.06.00.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 06:00:04 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 14:59:16 +0100
Message-Id: <20170123135916.4618-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Mon, 23 Jan 2017 14:00:07 -0000

Symlinking the openssl configuration file at install time results in
errors when overriding it using an external package which also provides
openssl-conf. This should be done as a postinstall task for such
packages.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 5cca019e1d..696b564cdd 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -201,7 +201,6 @@ do_install () {
 	   ${D}${sysconfdir}/ssl/
 	ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl/certs
 	ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl/private
-	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl/openssl.cnf
 }
 
 do_install_ptest () {
@@ -245,4 +244,16 @@ do_install_append_class-native() {
 	    OPENSSL_ENGINES=${libdir}/ssl/engines
 }
 
+pkg_postinst_openssl-conf () {
+#!/bin/sh
+if [ -e $D${libdir}/ssl/openssl.cnf ]; then
+	rm -f $D${libdir}/ssl/openssl.cnf
+fi
+
+# If openssl-conf is installed before openssl, we must ensure that the symlink
+# destination exists
+mkdir -p $D${libdir}/ssl/
+ln -s ${sysconfdir}/ssl/openssl.cnf $D${libdir}/ssl/openssl.cnf
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


