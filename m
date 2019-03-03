Return-Path: <matt@madison.systems>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5B87C697
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 13:32:08 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p19so1228064plo.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 05:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YVUUxgLdxTfXRI5UemQpYmMOch/fPeOGvnzpBk7ZQ9w=;
	b=GcJP539/n4dhjW0NxSpSQ6ZodDUJ4BGwRtFghvl7kgNrVBV5iL40eoC2Wj20LhGD49
	FeaeDeGT9zC+RENNm9CQS2FxXvPk3U6NA988Bc/hYE28WJ7IGmy68REC6+IHPCV4GyGD
	brVATekOlP1LEfsH694/ltIR5vrSLnjr3yEboEtxf/GWM/ySV2aE0tjToLFLXDEUr5Of
	C2DMo+OGFwcMjYExT0Ar/fOatmh/VmECIezUteCm/mftvLUBibmGCcvxsbUfJHbEXwI4
	EXHsAkYlf5/ok/WQ0kapc3S3HJv6AXw1u2H8LOw6/qzzKndfsdc1MKea9mWzgrlOY7TT
	IvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YVUUxgLdxTfXRI5UemQpYmMOch/fPeOGvnzpBk7ZQ9w=;
	b=b4XTAqRr6fbaY2yTqhqPSgIb7OmVa5bcbG8hjlbKg4FBJ2n/NzblIrfLUDzDa43irZ
	Th8FVVMIS+DakVdHtAeYOwyW5LFhRBLABmyAun0SzHGhq3u788Dhs1e80T8Xy6PpiZxj
	iow2S9p5Lcrey9Af11Gg1NvPnBUqqottl5zxGVkYoABysGj1JRAF0l4jzvij5qR3yWrk
	3YKGk0vHQBB8K0t1s2Ey3nbhj0aXeLzZEivFkj8VUsPhSSr08dgtNuVw4VFB8qxcdAeA
	WL8KJ9dSsVzFX8oPJk0/Po3kbV6eaoQzk11a6TMcf+dYOWFcROq9yzYxYFEQef3W/BOa
	/KAw==
X-Gm-Message-State: APjAAAVU7tnDTaeUUC8HxyPdBqG2bH3mhu8NVqabnAhVEZ4+0XK+W7wV
	KKXwHMtPl2iD69slK/oS2iUGl16+M3k=
X-Google-Smtp-Source: APXvYqwZX6ltkX9NR6LJ0bA+7l1ItsDyqu8EahhgvAwrxOSwnJLsgfYqCMHZnFa9NXw8UZ1IULi7VQ==
X-Received: by 2002:a17:902:323:: with SMTP id
	32mr15393310pld.310.1551619928761; 
	Sun, 03 Mar 2019 05:32:08 -0800 (PST)
Received: from legion.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	v12sm4742199pfn.25.2019.03.03.05.32.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 05:32:07 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Mar 2019 05:31:42 -0800
Message-Id: <20190303133142.11792-1-matt@madison.systems>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] uboot-extlinux-config.bbclass: add missing variable dependencies
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
X-List-Received-Date: Sun, 03 Mar 2019 13:32:08 -0000
Content-Transfer-Encoding: 8bit

do_create_extlinux_config performs its own override processing
for several variables, so we have to explicitly add the label-
suffixed variable names to its vardeps to make sure that changes
get detected.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/uboot-extlinux-config.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
index c65c421b60..b5b1a81dfc 100644
--- a/meta/classes/uboot-extlinux-config.bbclass
+++ b/meta/classes/uboot-extlinux-config.bbclass
@@ -148,5 +148,7 @@ python do_create_extlinux_config() {
     except OSError:
         bb.fatal('Unable to open %s' % (cfile))
 }
+UBOOT_EXTLINUX_VARS = "CONSOLE MENU_DESCRIPTION ROOT KERNEL_IMAGE FDTDIR FDT KERNEL_ARGS INITRD"
+do_create_extlinux_config[vardeps] += "${@' '.join(['UBOOT_EXTLINUX_%s_%s' % (v, l) for v in d.getVar('UBOOT_EXTLINUX_VARS').split() for l in d.getVar('UBOOT_EXTLINUX_LABELS').split()])}"
 
 addtask create_extlinux_config before do_install do_deploy after do_compile
-- 
2.19.1


