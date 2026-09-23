Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F11C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 20:52:17 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5352.1790196731682478453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 13:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Fkvk9vnz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20260923205208124c331ab70002074f-nio3og@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260923205208124c331ab70002074f
        for <openembedded-core@lists.openembedded.org>;
        Wed, 23 Sep 2026 22:52:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=yrfg8SbLK7EWxrlXFt6kKTji/te3eJO3MNJc0Fahxfk=;
 b=Fkvk9vnz5gwUtAaKbha0kBs1ucXB/dG5eqhvUjcu7PKsd7FiTSOiTgpNZxQo+ACUrZiUEh
 LgC6S3WhxZXfe14QHSyR/krjcZiDW2+2I/UJS6bTffcjV8D7UljOKOZ0cjkaDVe4HYY/hrDL
 C/4ER4xRHxKqI8Ih3tHQ47MkLPxUICq/4nLcEzuZp6Ei7n7E2XZEA1Zqq+rg0cc+ZQMKFNA3
 XHZiFQx1NQLQwoCIVJJ5ZucTUBYFFFj1xBHt8CzWjH8mvcpo+g65U02kwiNIdyCiVjEIgM6E
 7HHq0qS+EGAYTj5cNj/MmNZ5QXShHQB9UxYcPtduJWDn6fBzqIxe87Dg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 1/3] kernel.bbclass: make the -src package installable on purpose
Date: Wed, 23 Sep 2026 22:51:53 +0200
Message-ID: <20260923205206.1102615-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260923205206.1102615-1-adrian.freihofer@siemens.com>
References: <20260923205206.1102615-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 20:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246554

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The kernel-source-with-debug-src debug-with-srcpkg split style stashes the
kernel's source under the -src package, but that package was never added
to PACKAGES. It therefore does not exist as an ordinary, installable
package: the only way it ever ends up on an image is through the package
complementary mechanism, which is not suitable for the kernel. Not even
kernel-dbg, which the complementary mechanism is meant for, can be pulled
in that way for the kernel, since IMAGE_INSTALL_COMPLEMENTARY on
*-dbg matches against PN, and the kernel recipe's packages are named after
KERNEL_PACKAGE_NAME rather than PN.

The result was that -src got installed on debug images most likely by
accident, as a side effect of the complementary glob, rather than because
anyone asked for it.

Add -src to PACKAGES when PACKAGE_DEBUG_SPLIT_STYLE is
"debug-with-srcpkg", so it becomes a regular package that can be
requested through IMAGE_INSTALL or RDEPENDS like any other.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 0a6d754108..3c887a5cc5 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -678,7 +678,8 @@ EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs d
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
-PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg"
+PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg \
+    ${@d.getVar('PN') + '-src' if d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-with-srcpkg' else ''}"
 FILES:${PN} = ""
 FILES:${KERNEL_PACKAGE_NAME}-base = "${KERNEL_MODULE_INSTALL_PREFIX}/modules.order ${KERNEL_MODULE_INSTALL_PREFIX}/modules.builtin ${KERNEL_MODULE_INSTALL_PREFIX}/modules.builtin.modinfo"
 FILES:${KERNEL_PACKAGE_NAME}-image = ""
-- 
2.55.0


