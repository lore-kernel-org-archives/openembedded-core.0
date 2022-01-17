Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3099BC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 02:11:02 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.6040.1642385441199973001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 18:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=HRO41iyS;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642385443; x=1673921443;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=atQ72PLvD3/bne7DN2Gzw+WUBsH7fXY1axl5Z4TkTKY=;
  b=HRO41iyS0LNV0xDXgLyCUi1cBRCxNlxmTFAOJp0Oss34tejQD/pFBVWx
   L/PjlmlVcwYxYzYs4465rMNQD58RjwnhInEiVhLsSuOHCqGgrp9bAHC2e
   0WKEY27tM1V1IAdtbIJlHOXa+MAwazRmnt28YX7WH5zzJM40nWRgQIvqO
   E6DAX+YZxnv98Q8UGso1oX7BzhEVLrx5CTVNnsdRW7hWeLREJL3eEziSD
   QxJvXAZaZxnYqdJBBRWL+TWnqnVpBD1vpAh+rXypjPDPvcDRax6Ewj2Ov
   /hSEsF3NBYLJ1WZstZfHjKQxSifLr2SmM3bYT4M1jheQ/dMr1f3zWepvy
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="242094205"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="242094205"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="492220693"
Received: from khershix-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.230.190])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:42 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 04/12] xserver-xorg: whitelist two CVEs
Date: Mon, 17 Jan 2022 10:10:24 +0800
Message-Id: 
 <cd14ceef48aff3186abd0c32165827f99be26622.1642385249.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642385249.git.anuj.mittal@intel.com>
References: <cover.1642385249.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 02:11:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160623

From: Ross Burton <ross@burtonini.com>

CVE-2011-4613 is specific to Debian/Ubuntu.

CVE-2020-25697 is a non-trivial attack that may not actually be feasible
considering the default behaviour for clients is to exit if the
connection is lost.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit afa2e6c31a79f75ff4113d53f618bbb349cd6c17)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 85d0788eaf..8864564b3e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -20,6 +20,14 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.xz"
 UPSTREAM_CHECK_REGEX = "xorg-server-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
 
 CVE_PRODUCT = "xorg-server x_server"
+# This is specific to Debian's xserver-wrapper.c
+CVE_CHECK_WHITELIST += "CVE-2011-4613"
+# As per upstream, exploiting this flaw is non-trivial and it requires exact
+# timing on the behalf of the attacker. Many graphical applications exit if their
+# connection to the X server is lost, so a typical desktop session is either
+# impossible or difficult to exploit. There is currently no upstream patch
+# available for this flaw.
+CVE_CHECK_WHITELIST += "CVE-2020-25697"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-- 
2.34.1


