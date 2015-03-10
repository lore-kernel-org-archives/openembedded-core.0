Return-Path: <net147@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 63D7D739B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 03:26:05 +0000 (UTC)
Received: by pdbfp1 with SMTP id fp1so62549540pdb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 20:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9nM4H+9hmdBq/WtwSw6flkAl8Luy5kd7LX0Ov0PCSqI=;
	b=C7TXcbpj+QzRyAOamN4mMSHvozjfUU69oVmDIIPydwH70VDKmBIJumbCFqSnClJYba
	oR6uLBjNlwzAfbTliPmc0Nu2EmSodZ75wG4araYc8qVC/xHz/kqBG8vLvnmLq6KxeCNb
	ooRmuQ4omzx1BiA/WSmR/3saXW3FTIZSQGZJBJyI+6tVbLU3tthn0VACsGRX+q0QkS2D
	6E5/4v6v91vaNC2m/EmtqC+caOM3cDAuibiJyfFlWAxh0z7PvdeadyafWTNI+W0c98M5
	hwhrLKNH8m6KID64DAECii5jNW9rQHs6ZEPGhJsltcn558vqppa270YMY6z+F7RItWf/
	3RQg==
X-Received: by 10.70.64.228 with SMTP id r4mr60215040pds.15.1425957966746;
	Mon, 09 Mar 2015 20:26:06 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id t5sm6155132pde.51.2015.03.09.20.26.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Mar 2015 20:26:06 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 14:25:30 +1100
Message-Id: <1425957930-8061-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH] systemd: fix /var/log/journal ownership
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
X-List-Received-Date: Tue, 10 Mar 2015 03:26:07 -0000

The ownership needs to be explicitly set otherwise it inherits the user
and group id of the build user.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd_219.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 24486f1..6a4f4e8 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -147,6 +147,8 @@ do_install() {
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
 	fi
 
+	chown root:root ${D}/${localstatedir}/log/journal
+
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
 
-- 
2.3.1


