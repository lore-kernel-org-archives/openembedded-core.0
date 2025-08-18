Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890A1CA0ED1
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 18:11:45 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.571.1755540697178991447
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 11:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=YSzYorpb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202508181811353af829ac4431cecb66-mj9z7g@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202508181811353af829ac4431cecb66
        for <openembedded-core@lists.openembedded.org>;
        Mon, 18 Aug 2025 20:11:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+VPwCCRmAdtLnc5+n5qNsVLU4bDQ73GEy75KamXEBf4=;
 b=YSzYorpbHLGd37l/Ru9aTv9pcvKQOXDXSDCbaupmHmpFB5nRwekpmgfG/qHukoNQd857hA
 Q1IJOtjZq7DpwlVDs/LkHmeHvWb24g2o2Vdclzm0WGsMqLktP4ef0CGzEzksYAkQcFAUUQwS
 qqx39TwH3b3C+KgHMcb3mcbS95IG4fYnzuZTp6cDN9rZNeOP6EI8Rp4YX8bYJafX/HBOnNrx
 ARypbEBBrdsPNOArmkbmgBoG8s7E0TXGtugWOktQQwMrzVbe+9yZqbXE8IPybPb6/ZgM8G1+
 mGn/7cOBdWleKqXq+sSvc6IF+0jNCWur0esxmIVsWQFp/OrU889NAXzg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] glib-2.0: ignore CVE-2025-4056
Date: Mon, 18 Aug 2025 20:10:48 +0200
Message-Id: <20250818181048.1685946-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 18:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222046

From: Peter Marko <peter.marko@siemens.com>

NVD report [1] says:
A flaw was found in GLib. A denial of service on **Windows platforms**
may occur if an application attempts to spawn a program using long
command lines.

The fix [3] (linked from [2]) also changes only files
glib/gspawn-win32-helper.c
glib/gspawn-win32.c

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-4056
[2] https://gitlab.gnome.org/GNOME/glib/-/issues/3668
[3] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4570

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index e1a3b57270..53e0543045 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -66,3 +66,5 @@ def find_meson_cross_files(d):
 python () {
     find_meson_cross_files(d)
 }
+
+CVE_STATUS[CVE-2025-4056] = "not-applicable-platform: Issue only applies on Windows"

