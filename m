Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72B2C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 07:32:45 +0000 (UTC)
Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.web10.7552.1715844758175707766
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 00:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=nVxn68AF;
 spf=pass (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=859c909c3=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1715844759; x=1747380759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gBUD9CI0o/u1ZKqP/CI5s153luTTY4Ay1ibJjcO2KnI=;
  b=nVxn68AFnNZmhvUCIUhsrLeRhdGss7vTVX2mFL6TNiRfYRz2vee0hOHS
   +rH7/+p8383q0kCyB4KLqipI/SjSn6FAoHyDLICmMHYMa9IBOgDq0mkCR
   7/GSDLyqMtiyxTw3goZGeGkzOTteK/znB4tK1Dd8AXIQyT1yDuh22TXUb
   Y=;
X-CSE-ConnectionGUID: RLorJRt9SqmNCs6ZanQjDg==
X-CSE-MsgGUID: j1dnpZDIRHq+XyZtgX1cOQ==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 16 May 2024 09:32:37 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw4.muc with ESMTP/TLS;
 16 May 2024 09:26:29 +0200
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb6.muc with ESMTP/TLS; 16 May 2024 09:26:29 +0200
Received: from localhost.localdomain (10.30.85.215) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Thu, 16 May 2024 09:26:29 +0200
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH 1/3] ipk: Fix clean up of extracted IPK payload
Date: Thu, 16 May 2024 09:24:37 +0200
Message-ID: <20240516072439.2998567-2-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516072439.2998567-1-philip.lorenz@bmw.de>
References: <20240516072439.2998567-1-philip.lorenz@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12F.europe.bmw.corp (2a03:1e80:a15:58f::1:2b0) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 07:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199442

It turns out that the IPK payload tarball was actually cleaned up in the
concrete package manager implementation (most likely because at some
point Debian and IPK packages used different compression algorithms).

Globbing removes this ambiguity so move the removal of the payload into
the common extract method.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/lib/oe/package_manager/ipk/__init__.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 0f0038d00d9..47e72cc7a65 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -159,6 +159,7 @@ class OpkgDpkgPM(PackageManager):
         bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
         bb.utils.remove(os.path.join(tmp_dir, "debian-binary"))
         bb.utils.remove(os.path.join(tmp_dir, "control.tar.gz"))
+        bb.utils.remove(os.path.join(tmp_dir, data_tar))
         os.chdir(current_dir)
 
         return tmp_dir
@@ -511,7 +512,4 @@ class OpkgPM(OpkgDpkgPM):
             bb.fatal("Unable to get information for package '%s' while "
                      "trying to extract the package."  % pkg)
 
-        tmp_dir = super(OpkgPM, self).extract(pkg, pkg_info)
-        bb.utils.remove(os.path.join(tmp_dir, "data.tar.zst"))
-
-        return tmp_dir
+        return super(OpkgPM, self).extract(pkg, pkg_info)
-- 
2.44.0


