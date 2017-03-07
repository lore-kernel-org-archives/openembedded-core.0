Return-Path: <jobol@nonadev.net>
Received: from edna.lautre.net (edna.lautre.net [80.67.160.88])
	by mail.openembedded.org (Postfix) with ESMTP id 264236FFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 12:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by edna.lautre.net (Postfix) with ESMTP id 8DE5D115CD5;
	Tue,  7 Mar 2017 13:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1488891180;
	bh=X+WynQE+IjFkVzBM6+h5411slCpkqnp7aZ1lBbEbEK0=;
	h=From:To:Cc:Subject:Date;
	b=edeyDo3//5/Qfw5W3hPmhmHVJbO9R3sRiTJyG0iWh0wuVw7AY7OGoQYmWaBjDH8Ld
	YIGUtHdAGKwhMrh+y8QxF1JqFeYL3GlNQNxWEh8KIgyRyf0TmJAYFWKqaU1lfJP3wP
	dYtXAoVPe8coW5CPbUEWKKK7Zkyy/0inim8H/T7s=
X-Virus-Scanned: Debian amavisd-new at edna.lautre.net
X-Spam-Flag: NO
X-Spam-Score: -3
X-Spam-Level: 
X-Spam-Status: No, score=-3 tagged_above=-10 required=5.31
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1] autolearn=ham autolearn_force=no
Received: from edna.lautre.net ([127.0.0.1])
	by localhost (edna.admin.lautre.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Z2DahqDwvZvA; Tue,  7 Mar 2017 13:52:56 +0100 (CET)
Received: from d-jobol.iot.bzh (por56-1-78-229-206-229.fbx.proxad.net
	[78.229.206.229])
	by edna.lautre.net (Postfix) with ESMTPA id 8799D115CD0;
	Tue,  7 Mar 2017 13:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1488891173;
	bh=X+WynQE+IjFkVzBM6+h5411slCpkqnp7aZ1lBbEbEK0=;
	h=From:To:Cc:Subject:Date;
	b=085V2kj1yUGoS5+QXZgfLWTSgw8YkyOPElubO00HG/uB4fglRz2naueXe+PNLJBEp
	qLjvUdx7tEmtGMggfZsJFUfx/BMeq2g3tk9m1+XqpwhFUlGZFsYj7BzolcTdF6IqTi
	OLQKJKobhT/m40k3nBWwb/CXgCRrp4TyxW4krSNM=
From: jobol@nonadev.net
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Mar 2017 13:52:42 +0100
Message-Id: <20170307125242.15333-1-jobol@nonadev.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Jos=C3=A9=20Bollo?= <jose.bollo@iot.bzh>
Subject: [PATCH] shadow: use config 'attr' if distro has 'xattr'
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
X-List-Received-Date: Tue, 07 Mar 2017 12:53:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: José Bollo <jose.bollo@iot.bzh>

When DISTRO_FEATURES has 'xattr' the shadow package
now automatically activates its config 'attr'.
The current implmentation is a copy of what is
made currently for libcap.

Change-Id: Ie2a8469bc18b8ca7a067caf83413a28f8bcfbc84
Signed-off-by: José Bollo <jose.bollo@iot.bzh>
---
 meta/recipes-extended/shadow/shadow.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 99ffac3..e59ff64 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -74,7 +74,8 @@ PAM_PLUGINS = "libpam-runtime \
                pam-plugin-shells \
                pam-plugin-rootok"
 
-PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,${PAM_PLUGINS}"
-- 
2.9.3


