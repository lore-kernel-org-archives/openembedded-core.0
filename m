Return-Path: <freesilicon@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC626AC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 16:44:04 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id qs7so38579348wjc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 08:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=K3+CqbFijZ/Z817Hh6gDR2YlOd4n8LtzWjTTj7yH820=;
	b=grCTxUgBMWCRNG0WTS5cwRIh7r40E+cerGpO3IY86sXtTLXqavMcsNHxQz+MbYRimY
	E/ETUtWfxuFWNKbjYratjJk+7AbKCKe7vYfImA1Cc4xFzSFZZpQRvTe0ddt2HhGXUdKd
	2YowtKcsV4J5232dU440ombZcyS1qUfcrGrrfj1amTMrBqCFxUJoawHy7K2LEuulbtnz
	QVGLh7dMme4uIdtYi2T/GSvRvlqIbohqGJtqBfRF8iDk7PdqIfw5TimAZIbJ1r7NXyKE
	Wv+7dCkPEfo9Sce/dpD4LoNWG2pFr5C+YgZ1SogUoNlE3onmhO3A1M+s2SjuZagLgTiG
	l7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K3+CqbFijZ/Z817Hh6gDR2YlOd4n8LtzWjTTj7yH820=;
	b=dK0RvfZIJ0REyOHZFPGZX3alkB9xmGQ/sDx2YEvQ44JKztGMt8VYKg+DnpdZs7xa1W
	odV4eegI3sPg1nClPUJtTjGtJC8Rb+AivWD7DSU2yyrLuzNXrzagkKdPjgNYkEydfqFg
	tWXXeYnHAeMQAXXJhjNb4b/Dk0nS+IjszsnMy6TxIo0zHOb7xnz6GsjEjnYIqF52LT3F
	VtCIJea+UPNiMHGPjpeREeGguGAYFoXQymPLWIjl7Yl0T8HLoQgWJZC/60MZGk6i4OX3
	q8U+S86/e2TV1r2FD9+59vr7hXJzb3F7VNCk2IkRR9X+Up8lLer0hsZrT4qbTiwx3zNm
	BSbQ==
X-Gm-Message-State: AIkVDXI25J7O7pk8V9NHhGNyWUZEtG+iJlaHEJeyb3q3n1VMjY0wOxwu7Rls3/61PG1nwg==
X-Received: by 10.194.80.42 with SMTP id o10mr69336276wjx.65.1483548244635;
	Wed, 04 Jan 2017 08:44:04 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	197sm95765908wmy.16.2017.01.04.08.44.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Jan 2017 08:44:04 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 17:43:02 +0100
Message-Id: <20170104164302.11293-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] nss: Fix postinstall script
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
X-List-Received-Date: Wed, 04 Jan 2017 16:44:06 -0000

When installing NSS on a read-only rootfs, the current postinstall
scriptlet exits after having run the signing part. This causes an error
when appending the task because the rest of the script is simply ignored
and therefore never run.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/recipes-support/nss/nss_3.27.1.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/nss/nss_3.27.1.bb b/meta/recipes-support/nss/nss_3.27.1.bb
index 091793899f..a69672b3d8 100644
--- a/meta/recipes-support/nss/nss_3.27.1.bb
+++ b/meta/recipes-support/nss/nss_3.27.1.bb
@@ -208,18 +208,18 @@ do_install_append_class-target() {
 
 pkg_postinst_${PN} () {
     if [ -n "$D" ]; then
-        for I in $D/${libdir}/lib*.chk; do
+        for I in $D${libdir}/lib*.chk; do
             DN=`dirname $I`
             BN=`basename $I .chk`
             FN=$DN/$BN.so
             shlibsign -i $FN
-	    if [ $? -ne 0 ]; then
-	       exit 1
-	    fi
+            if [ $? -ne 0 ]; then
+                exit 1
+            fi
         done
-        exit 0
+    else
+        signlibs.sh
     fi
-    signlibs.sh
 }
 
 PACKAGES =+ "${PN}-smime"
-- 
2.11.0


