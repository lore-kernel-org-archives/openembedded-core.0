Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id D31D5611C2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 18:31:47 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id w9so3477905iob.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 10:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gyXuGVF01DK+7rHpJbZDjcENBWD5gVKt7FaO4JPW1oU=;
	b=ksOQitRlsGxk/e4TNToR4AxFRDmnB8ZszwodR5feoQyymuDrI02XjrMhk6qJcH3U5y
	ii5M9lXP3RBaZBDmG7NiR/YiJMdDnqHCevMh+0XH02gaHV4B1QruxQBfFyKfduyGC01w
	E+46qJYem3hPnR4tBPFbTuLOGFYznTZvJTmom3NJxUEPeP88YCGwcC22HSUH4omBb/Mz
	x0NhC5ZyTU/ys7/fa8OEjtrU3OgZa5dEho1ppjwDl2mzxQqsPsZ2jU59U2sa4D9nI2m4
	I6apTlj5IkCP6QMhK2+UL4J4JeurMuyoYB9+OEuFAUtC2uEdR0l80BK3k7hX+q0QB/sZ
	Iepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gyXuGVF01DK+7rHpJbZDjcENBWD5gVKt7FaO4JPW1oU=;
	b=N4niI8O1fQlIvz2J95YVOinS+zaaJBJYs3PUEaaW6B0UDvur6C/ommazJxowA4wRPk
	ScqyqTlscMgyqb44yQqh/ht/EcoL6u6ijYpw3fkt+MWq3JaWscelGo1HDzYo0FYUGPYE
	jWfFC/XpFvQAL98O5ouVGUNMcAn7ALALgxf07nsUyeLo9YA6jAEO0nZF2fkOoj/U3I7Y
	BJHf9iVQm4OwPaBQPR1jHDEfYLkGUMVp+4lg9cSyAVbGnyWVE0k8rCueStPmJ4bnBwmk
	sHxy0t/xezGu71vcg2t/yEJEC0sjQKFQg+Kxw2xusOvEBZowyU4vrqg9MWSg2c0GO/Ub
	ILJw==
X-Gm-Message-State: ANhLgQ0RE6qNXvSZeMZCpU99+DY6/dhgHrOPoGqoWvCFhmh+AHj6ty/M
	OWLaycCRnveTeU4rrUDHiF9Ij4tHCX8=
X-Google-Smtp-Source: ADFU+vvqr3/lYqTsEvLcyu8lmV7JunEnlVHvTFklG4fP3rEQLfMQM5MD+QuXEUfbdFe/VrZWS1t5GA==
X-Received: by 2002:a5e:9b01:: with SMTP id j1mr3123139iok.27.1583346708301;
	Wed, 04 Mar 2020 10:31:48 -0800 (PST)
Received: from OLA-8C37N23.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	e13sm6759451iol.16.2020.03.04.10.31.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 10:31:47 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2020 12:31:39 -0600
Message-Id: <20200304183139.1512-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] classes/kernel.bbclass: Fix parsing errors
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
X-List-Received-Date: Wed, 04 Mar 2020 18:31:48 -0000

legitimize_package_name wants the actual value of KERNEL_REVISION, so
use d.getVar() to fetch it as is done elsewhere in the file. Failing to
do so can result it weird errors at parsing time.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 15219c596f..0eadd3efb8 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -570,9 +570,9 @@ RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
 # Allow machines to override this dependency if kernel image files are
 # not wanted in images as standard
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image"
-PKG_${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
+PKG_${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-image += "${@oe.utils.conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
-PKG_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name('${KERNEL_VERSION}')}"
+PKG_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
 RPROVIDES_${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION}"
 ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
 ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base = "1"
-- 
2.17.1


