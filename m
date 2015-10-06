Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2301476AE2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 03:19:59 +0000 (UTC)
Received: by iofh134 with SMTP id h134so208357328iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Oct 2015 20:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5vlLtWHFPYZkNDfCFvOx2c2U/QKOX7RGq1rZcIL+db8=;
	b=N+YIUed0ZgLoknyzUceQ8Alk2HDOHqYS3QCnFv57FZF8+kiOvrlh1tNwY4tz8tdOG1
	if3GWvQ8KaauJ5dLoJ4rP6I2J5dvOYfX5b/QtoMKzKFYuRKxx6WfwmouALRo59UhySu4
	zYkISjcWIaA+nbIX9QrhZbuolk/JichNC7dhQ5fZ3owsm9pwyq1ndRJVw6CCzXyitDss
	R0U6tVgQhBxIobw9eK7Z774KAj9PJ+A9pg9q5Ns+zL493TRbu433g/qDfb8EXgl4osgK
	W9m2K97nXB+AQeta8PYcNSnfonex0aGsJQ8TYAsaeF5u5maWwhEFfVZgYQuEHnhq4dl2
	ncDw==
X-Received: by 10.107.134.24 with SMTP id i24mr32195927iod.162.1444101599996; 
	Mon, 05 Oct 2015 20:19:59 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id bc4sm6094425igb.2.2015.10.05.20.19.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Oct 2015 20:19:59 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Oct 2015 20:19:28 -0700
Message-Id: <1444101568-16639-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
References: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 7/7] busybox.inc: remove MAKEFLAGS over-ride from EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 06 Oct 2015 03:20:00 -0000

Busybox Kbuild likes to control its own MAKEFLAGS (it adds -rR,
etc), so avoid over-riding MAKEFLAGS via EXTRA_OEMAKE.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index b380860..878e2bb 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -18,6 +18,10 @@ BUSYBOX_SPLIT_SUID ?= "1"
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
+# Busybox Kbuild likes to control its own MAKEFLAGS (it adds -rR,
+# etc), so avoid over-riding MAKEFLAGS via EXTRA_OEMAKE.
+EXTRA_OEMAKE = "-e"
+
 EXTRA_OEMAKE += "'CC=${CC}' 'LD=${CCLD}'"
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
 
-- 
1.9.1


