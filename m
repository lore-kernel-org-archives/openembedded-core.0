Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8762DC83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 10:07:26 +0000 (UTC)
Received: from esa5.hc324-48.eu.iphmx.com (esa5.hc324-48.eu.iphmx.com [207.54.71.60])
 by mx.groups.io with SMTP id smtpd.web10.77810.1753697238020690729
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 03:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=GFPbica6;
 spf=pass (domain: bmw.de, ip: 207.54.71.60, mailfrom: prvs=2978930ce=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1753697239; x=1785233239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uJdH52lttGnDWD1Au/5GFaoFDUxI6mV6dZsYeEFtWuw=;
  b=GFPbica64H0mo1poXsGAdKTs6+zKzXnGWkO4Oq3Kr0o1o9WevUzMOopz
   64V1eKJkQ46tW1FN0a6Inh8/HcstGxJ7xoUdG/lV+i6yQr6ylkWp+C5WD
   TdIgrhfaWWoA3x9IPOYozEYtKwrw+v+X2IuF+SxGfJF33NIedKdisrx8l
   U=;
X-CSE-ConnectionGUID: p+Fg/nFQRUekYoc1Z5+YWg==
X-CSE-MsgGUID: V2PICnMjS+ahst5rTK6NuQ==
Received: from 160.46.252.38.spf.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa5.hc324-48.eu.iphmx.com with ESMTP/TLS; 28 Jul 2025 12:07:15 +0200
Received: from unknown (HELO esabb5.muc) ([10.31.187.136]) by esagw2.muc with
 ESMTP/TLS; 28 Jul 2025 12:07:15 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb5.muc with ESMTP/TLS; 28 Jul 2025 12:07:15 +0200
Received: from marvin-ws (10.30.85.214) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Mon, 28 Jul 2025 12:07:15 +0200
X-CSE-ConnectionGUID: jia+/5ouRXubAH8cykFIiQ==
X-CSE-MsgGUID: Py9J66j3QOybuFgMhctZeg==
X-CSE-ConnectionGUID: EYPucLiQSNCF6dICC9yv4A==
X-CSE-MsgGUID: +A6Wtir3TLiQdJMm9ecv5Q==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH 4/4] license_image: Make use of exit_if_errors consistent
Date: Mon, 28 Jul 2025 11:59:32 +0200
Message-ID: <20250728095936.1495441-5-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728095936.1495441-1-philip.lorenz@bmw.de>
References: <20250728095936.1495441-1-philip.lorenz@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12F.europe.bmw.corp (2a03:1e80:a15:58f::1:2b0) To
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 10:07:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220998

`exit_if_errors` is typically called at the end of the outermost call
site (e.g. the task or hook calling a function which raises QA issues).
Adapt license_image accordingly.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/classes-recipe/license_image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index d2c5ab902ce..0d8cd7ab911 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -51,6 +51,8 @@ python license_create_manifest() {
     rootfs_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY'),
                         d.getVar('SSTATE_PKGARCH'), d.getVar('IMAGE_NAME'), 'license.manifest')
     write_license_files(d, rootfs_license_manifest, pkg_dic, rootfs=True)
+
+    oe.qa.exit_if_errors(d)
 }
 
 def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
@@ -116,7 +118,6 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                                        "The license listed %s was not in the "\
                                        "licenses collected for recipe %s"
                                        % (lic, pkg_dic[pkg]["PN"]), d)
-    oe.qa.exit_if_errors(d)
 
     # Two options here:
     # - Just copy the manifest

