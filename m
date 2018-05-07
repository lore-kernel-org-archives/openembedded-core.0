Return-Path: <allenwild93@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id E6EFA74C00
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 00:34:01 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id f3-v6so1000966ybg.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 May 2018 17:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TpiwbAMEqHn/VVT086emC+vls6RI5r61IwFyAwamwsI=;
	b=HfdPa+14QcJMPj6KGNgakRwD/G88yBl9bpgU1YYsvUl/2c3ZPGB8poYk6xi+I8tXvt
	auC6PuAJcrPDAMiBHHmWGpNefI5EDZ8whs2aFFr0GHtuf9sK5IRXuNlNrxqa1KdNffVX
	11V/XXeQI894AgUHhvAF8NinY6Q+xJvyfqR6HezLIi8txw2JZYEb1Ipe2i3nB2EPy8c4
	iKVN08F9zFOs5KnbXZbW9IeLil6bQt30kCdlmDI+zijlqIFvz9b+0sDkKJYX9L/6CQtM
	8F8wz3Ewof+2sGxRrRkHOHBLmj920bczclRV+UPEKTBe+tbQf9MgopYJ5pCAe3Y+xVyc
	+1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TpiwbAMEqHn/VVT086emC+vls6RI5r61IwFyAwamwsI=;
	b=gqKx2KMjQMfObzHIRF1unIYUwyBcbEkv6Sbn+xzK3LAn5vx00PjddJe5x+v+UNw0Hd
	wJIkQVHz/CwOCFNmgN5eNlwVDBCk3t9iLyhWTJ8q9k6piK2ZZ0e8cDAhYBKVLAbNCOIv
	+E+sq6pHGlo43kbgFgCwKmlDA4+NFb78PtQw0kIiZX0sPooY4hl+xLYA2qhKuwlj6BiT
	cYP2NKe98pDhlfaxdwehLQw1o8l9i41t1sJXL0cJdod+Mmyqk5QCoTeJzxIBWypZHPa+
	9216dK+sPli8RdltMMZhFmgFUNGe9vjTJSBBOULZ+qfQR3riJY9Vb1YWooOF/ePES4WG
	AI3A==
X-Gm-Message-State: ALQs6tBpnxrg4LC36BWvtH7BC24ACW5kLtTiNNfztgO6xMo5w29EWt8+
	vynUAu0C5ALkFsnQO87ALqjcUQ==
X-Google-Smtp-Source: AB8JxZo2RcvHXsOtu2pM4YnNDwoFg9mLYCdOwmLHfX6FJgeiDuYuG6XQTXc4yRuT6fppZpj3C0vt8g==
X-Received: by 2002:a25:45:: with SMTP id 66-v6mr5844012yba.434.1525653242499; 
	Sun, 06 May 2018 17:34:02 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:3d10:2828::ed54])
	by smtp.gmail.com with ESMTPSA id
	p5-v6sm9269052ywm.44.2018.05.06.17.34.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 May 2018 17:34:01 -0700 (PDT)
From: Allen Wild <allenwild93@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 May 2018 20:33:49 -0400
Message-Id: <20180507003349.2749-1-allenwild93@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] kernel: fix the modules tarball when using usrmerge
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
X-List-Received-Date: Mon, 07 May 2018 00:34:02 -0000

kernel_do_deploy only uses /lib when creating the modules tarball,
creating an empty archive if usrmerge is in distro features because the
modules are in /usr/lib.

Create the modules tarball from ${D}${root_prefix}/lib instead of
${D}/lib so that it's not empty when usrmerge is enabled.

Signed-off-by: Allen Wild <allenwild93@gmail.com>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 78d6c30b07..bbb5dbb1b2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -677,8 +677,8 @@ kernel_do_deploy() {
 		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} $deployDir/${base_name}.bin
 	done
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		mkdir -p ${D}/lib
-		tar -cvzf $deployDir/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
+		mkdir -p ${D}${root_prefix}/lib
+		tar -cvzf $deployDir/${MODULE_TARBALL_BASE_NAME} -C ${D}${root_prefix} lib
 		ln -sf ${MODULE_TARBALL_BASE_NAME} $deployDir/${MODULE_TARBALL_SYMLINK_NAME}
 	fi
 
-- 
2.17.0


