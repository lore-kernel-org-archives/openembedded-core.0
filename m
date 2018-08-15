Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 41FDA7918E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 11:59:13 +0000 (UTC)
Received: from xps.local (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 5D2AE1C14CF;
	Wed, 15 Aug 2018 13:59:13 +0200 (CEST)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 13:59:07 +0200
Message-Id: <20180815115907.14045-1-martin@geanix.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH] openssh: fix wrong volatile dir for sshd host keys on read-only rootfs
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
X-List-Received-Date: Wed, 15 Aug 2018 11:59:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the read-only-rootfs image feature is enabled, and openssh is
installed into an image, the ssh daemon is reconfigured to use
/var/run/ssh when generating host keys.

Fix up the creation of the volatile dir to actually match what sshd is
configured to.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd b/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
index a0d2af3c65..fcbc5ae9d5 100644
--- a/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
+++ b/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
@@ -1,2 +1,2 @@
-d root root 0755 /var/run/sshd none
+d root root 0755 /var/run/ssh none
 f root root 0644 /var/log/lastlog none
-- 
2.18.0


