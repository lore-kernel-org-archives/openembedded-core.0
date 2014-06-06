Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7996FC92
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 16:57:21 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id u57so3134061wes.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jun 2014 09:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=X/nIht/rKYLr+S8tOu8y91W8A53zcZe/lxn2MX5QwlU=;
	b=LbQlAUlXdT2JJamyP6c/AKs7QRbYjml5gP9bUjRLPEOQaImeodMR02jVm9eqgEhrvh
	8rFt8QMRTvRHhfiQd3IuM033eHl8gIDMJZ4koRhOnBsE+IM75t4vvPdN7YvhTIBe0JWR
	7hTgSsLetWnemcZB6tpqgT1QZOZz466F9oI6ZV7ML82aJ7eoRcDeSn24gKS8pWVAk+RN
	5AFhGP2BwtCY94WldvSKiKjnRcY3w3fnXEbJ+XrYwXZhOITTrB+H42sMvI8vgPEu3lso
	kJrBShfFeGfqKkhe0vBuQPivhHRook5ZWLg0HSJY/AQP/+3PXbs4aPa4LkDlER8D+Eec
	NOVA==
X-Received: by 10.14.183.196 with SMTP id q44mr455309eem.83.1402073842334;
	Fri, 06 Jun 2014 09:57:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m44sm23979464eep.6.2014.06.06.09.57.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jun 2014 09:57:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jun 2014 18:57:34 +0200
Message-Id: <1402073854-10723-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH] update-rc.d: Allow to use different initscripts provider
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
X-List-Received-Date: Fri, 06 Jun 2014 16:57:23 -0000

* until now all recipes were respecting VIRTUAL-RUNTIME_initscripts
  variable but commit bba835fed88c3bd5bb5bd58962034aef57c408d8
  hardcoded "initscripts" runtime dependency

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/update-rc.d.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index ca9486b..19b081d 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -1,7 +1,8 @@
 UPDATERCPN ?= "${PN}"
 
 DEPENDS_append = " update-rc.d-native"
-DEPENDS_append_class-target = " initscripts"
+VIRTUAL-RUNTIME_initscripts ?= "initscripts"
+DEPENDS_append_class-target = " ${VIRTUAL-RUNTIME_initscripts}"
 UPDATERCD = "update-rc.d"
 UPDATERCD_class-cross = ""
 UPDATERCD_class-native = ""
-- 
2.0.0


