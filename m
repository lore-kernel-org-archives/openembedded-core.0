Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id A58316AC6B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 23:33:39 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 10so959058ykt.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 16:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=BC0TwhA5wI7tu94nF2Z2aV8xh8nfXwqVkZKKblwc7/E=;
	b=YQdCAhQqA4A5NzePiUgCzwe/4gKTAju/k4uKrxWe04D18TNdZzfnvbPWqVh4dsR7Vs
	MbyYKR6RABZsdz2T8wpEWdhdOUvmB0F2iGz2hpMtzcPLbLe9kBBkXjrGYMgbKe6sUwUn
	hV0qgT9GUOPjHHwNS/KcNvvGjSTozp56hdbYPwPVEan2FqXWz3sa0UWm0wv46tbmEg3t
	bBJe5E/RRxaJTVHiJPY79gQdZcHImBrfrhtfFomYZwJzY0PzKdUnxyTWJpyXSntxU/kO
	E2xbDQqGOrtzAhLaJV7mGSMcJFw1rMOAAdVA3s/drZ1l/w5uE2b6AVqfs0eAf4y5cvs+
	ptiA==
X-Received: by 10.236.53.69 with SMTP id f45mr8985465yhc.53.1409268820413;
	Thu, 28 Aug 2014 16:33:40 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id a63sm2423053yhd.53.2014.08.28.16.33.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 16:33:39 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Aug 2014 20:33:19 -0300
Message-Id: <1409268800-17566-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] libpam: Fix runtime providers
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
X-List-Received-Date: Thu, 28 Aug 2014 23:33:40 -0000

The runtime providers were commented out. Removing the comment brings
up a issue with the native renaming which has been workarounded
disabling the runtime recommendation. This is indeed a workaround so a
FIXME comment has been added to remind about it in case we someday
move to native prefix.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index d7033d0..f08b4af 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -81,7 +81,10 @@ RDEPENDS_${PN}-xtests = "${PN}-${libpam_suffix} \
     pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} \
     pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} \
     coreutils bash"
-#RRECOMMENDS_${PN} = "${PN}-runtime-${libpam_suffix}"
+
+# FIXME: Native suffix breaks here, disable it for now
+RRECOMMENDS_${PN} = "${PN}-runtime-${libpam_suffix}"
+RRECOMMENDS_${PN}_class-native = ""
 
 python populate_packages_prepend () {
     def pam_plugin_append_file(pn, dir, file):
-- 
1.7.10.4


