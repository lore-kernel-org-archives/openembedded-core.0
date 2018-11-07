Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 0943C71A88
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 08:00:14 +0000 (UTC)
Received: from zen.localdomain (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id B88A01C155B;
	Wed,  7 Nov 2018 09:00:15 +0100 (CET)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed,  7 Nov 2018 09:00:11 +0100
Message-Id: <20181107080011.1434-1-martin@geanix.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] shadow: improve reproducibility by hard-coding shell path
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
X-List-Received-Date: Wed, 07 Nov 2018 08:00:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The shadow configure script tries really hard to detect the running
shell to make sure it doesn't do unsupported calls.

On my system the shell is detected as /bin/sh, while a build in an
ubuntu docker it resolves to /bin/bash. And since the shell path is
baked into the target binaries through config.h, the build becomes
inreproducible.

Fix reproducibility by hard-coding the shell to be /bin/bash

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---

I wasn't whether to use /bin/bash or /bin/sh; comments are welcome...

 meta/recipes-extended/shadow/shadow.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 0fa80a282a..8eacca6809 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -45,6 +45,8 @@ PAM_SRC_URI = "file://pam.d/chfn \
 
 inherit autotools gettext
 
+export CONFIG_SHELL="/bin/bash"
+
 EXTRA_OECONF += "--without-audit \
                  --without-libcrack \
                  --without-selinux \
-- 
2.19.1


