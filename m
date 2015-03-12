Return-Path: <net147@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 334F37395A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 09:21:02 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so18677614pdb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 02:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JWvcZ2LN3n4czezP3EhcD9/A5e7WOAPrfFMq4dPNLBk=;
	b=rvWn6lHv1mSR3ZEYdztCjjc/3ZiyhKcB9MB45nsMUcRWk4c865x8/c+ml+I84rhX54
	Ps/+3qRidwpMPD9mGayfnQcERDvLzEY39dO/wjLTek9mgshPtPlr1oYR8HS/gypk1E4V
	pQBkUvY/H+N982gBZU6w29MJ8Kh3OwjLVseINq7t0MuV09OsP/gdLsysJOVRBuaOr8al
	cpeVrfLjcIz39jmg3dSNSKAXZzjJXTihsJYP3s5hG1i4AOq+4MraRJAf43w4Ey28W6dz
	1zeRb4Q8z3zA5b/pWmsLEJJt5wOJDxBgIwZ+fpLVsNR4eL0EgqZBOAkMyZ6HozoLXCz0
	5OXA==
X-Received: by 10.70.128.49 with SMTP id nl17mr87701547pdb.67.1426152064299;
	Thu, 12 Mar 2015 02:21:04 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id c9sm9997412pdo.13.2015.03.12.02.21.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Mar 2015 02:21:03 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2015 20:20:47 +1100
Message-Id: <1426152047-20625-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [daisy][PATCH v2] systemd: fix /var/log/journal ownership
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
X-List-Received-Date: Thu, 12 Mar 2015 09:21:03 -0000

The ownership needs to be explicitly set otherwise it inherits the user
and group id of the build user.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd_211.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_211.bb b/meta/recipes-core/systemd/systemd_211.bb
index 567c323..98c4aca 100644
--- a/meta/recipes-core/systemd/systemd_211.bb
+++ b/meta/recipes-core/systemd/systemd_211.bb
@@ -124,6 +124,8 @@ do_install() {
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
 	fi
 
+	chown root:systemd-journal ${D}/${localstatedir}/log/journal
+
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
 }
-- 
2.3.1


