Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D698E937FB
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 18:53:18 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.255173.1776019990953608980
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 11:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=M5KiaGjH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202604121853083f35f887f900020702-w87cld@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202604121853083f35f887f900020702
        for <openembedded-core@lists.openembedded.org>;
        Sun, 12 Apr 2026 20:53:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=h1NfB164xMfpOor97hJ9V6qxk0CAHp2lgKwKZ1bldVQ=;
 b=M5KiaGjHLQlAhY+LqEgVhhuaOMSdi3vw1M30sxkkZvAj/BSAWSF3BIQYiF6UYf6XBLczut
 wrURvKVjrt7+O+wDNZp+yVDxoq7tnBd4OlMOVhzq8fNNVyi+IxtciG0aMS6lHZBJZo9NzxsF
 z++cHuXZQR5NUf6hJWqyfDV6TPcCBIZ+QczW/opS5htrDG0PfhXcHKk1YbgPX4c3lqUixuGk
 Wrr9OJR8YjasAjdVJ5BXn/iow0UZXSzkVvXmY9bJ2MLwHaz1s1vTSmckesOTyg41FjS31Ck3
 p96lTlNMPDDTltOhVTtK8TGMcTvJAzfDRURAOEMT1ZoJ0uAfmuzIes1A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/2] xwayland: set status for CVE-2024-21886
Date: Sun, 12 Apr 2026 20:52:01 +0200
Message-ID: <20260412185201.2556780-2-peter.marko@siemens.com>
In-Reply-To: <20260412185201.2556780-1-peter.marko@siemens.com>
References: <20260412185201.2556780-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 18:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235073

From: Peter Marko <peter.marko@siemens.com>

Reference [1]:
Introduced in: xorg-server-1.13.0 (2012)
Fixed in: xorg-server-21.1.11 and xwayland-23.2.4

Note that the status should be "fixed-version", however that does not
seem to work correctly with the new sbom-cve-check.

[1] https://lists.x.org/archives/xorg/2024-January/061525.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/xwayland/xwayland_24.1.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
index df1bb7e31b..6c10eddb8e 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "f297af27a84508db9b80d1cbbcc69c3801da38eb64c72f3b5b50f58245
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
+CVE_STATUS[CVE-2024-21886] = "version-not-in-range: fixed since xwayland-23.2.4"
+
 inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 

