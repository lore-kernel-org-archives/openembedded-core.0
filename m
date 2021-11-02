Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB372C43217
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:47:23 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.515.1635871643329618021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218509751"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="218509751"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:43 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575202"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:42 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 15/24] go.bbclass: Allow adding parameters to go
 ldflags
Date: Wed,  3 Nov 2021 00:44:03 +0800
Message-Id: 
 <4c0c5edbb561f2bd21bba979ed7553fb3b717116.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:47:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157802

From: Ahmed Hossam <Ahmed.Hossam@opensynergy.com>

Currently, there is no clean way to pass extra parameters to the go tool link,
which is passed by the go build ldflags flag, the append needs to happen inside
the quotes of the ldflags parameter

See [YOCTO #14554].

Add a variable to allow adding extra parameters to -ldflags in the GO_LDFLAGS
variable, one of the main usecases is setting the application version.

For example, adding to the recipe something like
GO_EXTRA_LDFLAGS="-X main.Version=v1.0.0"
or
GO_EXTRA_LDFLAGS="-X main.Version=${PV}"

Signed-off-by: Ahmed Hossam <Ahmed.Hossam@opensynergy.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit eaa7a61dab9a1d7bb039f16abdd9aacb44faa595)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/go.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 0dd0c5f1d2..aa54b4a08c 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -41,7 +41,8 @@ GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS
 GO_LINKMODE ?= ""
 GO_LINKMODE:class-nativesdk = "--linkmode=external"
 GO_LINKMODE:class-native = "--linkmode=external"
-GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS}'"'
+GO_EXTRA_LDFLAGS ?= ""
+GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
 export GOPATH_OMIT_IN_ACTIONID ?= "1"
 export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
-- 
2.31.1


