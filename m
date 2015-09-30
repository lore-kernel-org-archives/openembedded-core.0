Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 05BB3762A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDitIg006646 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:44:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id p3hL11l6WYx3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:44:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDihdL006624
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:44:54 +0100
Message-ID: <1443620683.5162.79.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 14:44:43 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] multilib.conf: Ensure MACHINE doesn't change target sigs
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
X-List-Received-Date: Wed, 30 Sep 2015 13:44:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Sysroot paths (which happen to contain MACHINE) should not cause the signatures
to change every time MACHINE changes so exclude this from them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index f867c8d..50303fb 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -24,3 +24,4 @@ OPKG_ARGS_append = " --force-maintainer --force-overwrite"
 # inside the multilib sysroot.  Fix this by explicitly adding the MACHINE's
 # architecture-independent pkgconfig location to PKG_CONFIG_PATH.
 PKG_CONFIG_PATH .= ":${STAGING_DIR}/${MACHINE}${datadir}/pkgconfig"
+PKG_CONFIG_PATH[vardepsexclude] = "MACHINE"



