Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE86F36C47
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:44:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14873.1776671094031345486
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cSm/87tq;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4D5921A331C;
	Mon, 20 Apr 2026 07:44:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 244E55FFA5;
	Mon, 20 Apr 2026 07:44:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD41A10460B74;
	Mon, 20 Apr 2026 09:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776671091; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U933O/m8Rckt5G7NPiUN5j5uaIjj2torke8FsBxrIVE=;
	b=cSm/87tqYfyN665XQwJVgiBAbSk8k/HUpDOiKqKHR6LivMjFJcDwEAGI8QVNt9efGxueSk
	/6ucFh6IKhAmqsqG0t+ROwo5sN+M5IRYgUdWhfUypzGhUB4eUhNm9HALGXzUXtTGGKHNNF
	exn2zp2Uq/oxA0k3tq3rrwSu/Akg3ZUGXUVeEnmIphuy0IXUTD/Avb6c1LawJzrV0bXo6b
	5KY5otd70Uxc3ofBgxcj+0lbhlZLjWElYzz5Ap5iEOma26Y00gc820uqVjBp/wCyY/zXjT
	GqcyD6P0iFrMM8fRstC6ZY3oSaXb5+ZydX1Js9QWW+AjKk1eG3B0YxkQidbX5A==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 20 Apr 2026 09:44:37 +0200
Subject: [PATCH 06/10] oe/spdx30_tasks: Remove unused local variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spdx3-improvements-v1-6-27e0d5edcdbe@bootlin.com>
References: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
In-Reply-To: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
 ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235547

The deploy_dir_spdx variable is assigned from "DEPLOY_DIR_SPDX", but
never used, so remove it. Same for pkgdest and for pkg_arch variables.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/lib/oe/spdx30_tasks.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 819f6a34b9c2..a071d85e10ea 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -605,7 +605,6 @@ def get_is_native(d):
 
 def create_recipe_spdx(d):
     deploydir = Path(d.getVar("SPDXRECIPEDEPLOY"))
-    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     pn = d.getVar("PN")
 
     license_data = oe.spdx_common.load_spdx_license_data(d)
@@ -816,10 +815,8 @@ def create_spdx(d):
 
     pn = d.getVar("PN")
     deploydir = Path(d.getVar("SPDXDEPLOY"))
-    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_workdir = Path(d.getVar("SPDXWORK"))
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
-    pkg_arch = d.getVar("SSTATE_PKGARCH")
     is_native = get_is_native(d)
 
     recipe, recipe_objset = load_recipe_spdx(d)
@@ -1122,7 +1119,6 @@ def create_spdx(d):
 
 
 def create_package_spdx(d):
-    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     deploydir = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
 
     direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
@@ -1143,7 +1139,6 @@ def create_package_spdx(d):
         d, "%s-package-common" % d.getVar("PN")
     )
 
-    pkgdest = Path(d.getVar("PKGDEST"))
     for package in d.getVar("PACKAGES").split():
         localdata = bb.data.createCopy(d)
         pkg_name = d.getVar("PKG:%s" % package) or package
@@ -1341,7 +1336,6 @@ def collect_build_package_inputs(d, objset, build, packages, files_by_hash=None)
 
 
 def create_rootfs_spdx(d):
-    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     deploydir = Path(d.getVar("SPDXROOTFSDEPLOY"))
     root_packages_file = Path(d.getVar("SPDX_ROOTFS_PACKAGES"))
     image_basename = d.getVar("IMAGE_BASENAME")

-- 
2.53.0


