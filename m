Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 25E2D6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 16:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8UGhbig021808; Fri, 30 Sep 2016 17:43:38 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Joo_lCLfT11O; Fri, 30 Sep 2016 17:43:38 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8UGhYJT021790
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 30 Sep 2016 17:43:35 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1bq0uM-0007Cm-Ea; Fri, 30 Sep 2016 17:43:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 17:43:24 +0100
Message-Id: <1475253808-27642-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475253808-27642-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1475253808-27642-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/7] multilib.conf: Ensure sstate checksums don't change when using this include
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
X-List-Received-Date: Fri, 30 Sep 2016 16:43:39 -0000

When enabling multilib.conf, the world was rebuilding due to changes in the
pkg-config search path. This doesn't matter so exclude it from the checksums.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/multilib.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 50303fb..1403a03 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -24,4 +24,5 @@ OPKG_ARGS_append = " --force-maintainer --force-overwrite"
 # inside the multilib sysroot.  Fix this by explicitly adding the MACHINE's
 # architecture-independent pkgconfig location to PKG_CONFIG_PATH.
 PKG_CONFIG_PATH .= ":${STAGING_DIR}/${MACHINE}${datadir}/pkgconfig"
-PKG_CONFIG_PATH[vardepsexclude] = "MACHINE"
+PKG_CONFIG_PATH[vardepsexclude] = "MACHINE datadir STAGING_DIR"
+PKG_CONFIG_PATH[vardepvalueexclude] = ":${STAGING_DIR}/${MACHINE}${datadir}/pkgconfig"
-- 
2.7.4


