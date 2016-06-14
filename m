Return-Path: <armccurdy@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0B6E0601A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 22:51:13 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id h190so1041803ith.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 15:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kFBCgAs/qhalK9gQbcnf+mERvfUhAfPkjnYc4ajWLJk=;
	b=h7tzAYQBqY4hZ5ulNRaVEgsC0FihdKf0QNAk9XtUAwKnLiUoX8rQTOWADQFpkH3B3B
	CJ2yzX5R/+r1Tev0dw29bwXZiXqXCB9PBgVSVjvVHKGo71JetNqc9qY8tqdw3jchcNPv
	ELMS+FYOVpkARwTp4gHUMdG7C5v0LR8bviRhcSghe3h6OYc5PM3ca9KhQTSAuEpCzfln
	OG/V3X6Qv/fhcIR+/iGZHGGrxXmiqSfc5c0D4re+YEKtAHOaNnmK4WRz9fWy/o+o/KOd
	8R/Z3Aq9zgLAv0TWXhf9SmrvyX4m/gRQS17IjKejJHgKNAmoKxw5U+mFp6tHOItnQ1TV
	l0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kFBCgAs/qhalK9gQbcnf+mERvfUhAfPkjnYc4ajWLJk=;
	b=IgQguStYhuTZaZ/tocr6EspYo1YA45SOIOHcL2v6sfdPNRE6a3ssLIw2KsS4fDpsEb
	k6jnO1CIkf6I0oKBwRd+ukfbf5eRs+ksAfXWNo32CalkdCOtVmrZr7F5Pv1CPuE5QsDr
	jtSke/8q/tZzaTEK1bCbtQ/QAg+d+sWvUchuq8Z1eUbjof8B+Mwdb2biQUN9pT/R+EuA
	1PfKYz3GoYzkLmOqI8DN8Wabhyq6eEyJcOdnD4Hoc04H3I3tB5OPVK3nQdPeHX0IDOu+
	GnBOADtv5ijLxxXQnxneuHyMXAodsu6jNu0LtOAM0xNY00CFY9Bd681kMkTWr3emPKYg
	4m9g==
X-Gm-Message-State: ALyK8tLBNP3XhNbV0PLh0yzWq93U9U/L56MlBypRSRA1j9oIeHLp5unkC3tMAda7tsSgjw==
X-Received: by 10.36.19.16 with SMTP id 16mr31535916itz.76.1465944673889;
	Tue, 14 Jun 2016 15:51:13 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	g73sm15686991iog.6.2016.06.14.15.51.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jun 2016 15:51:12 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 15:51:06 -0700
Message-Id: <1465944666-27538-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] directfb: fix client->gfx_state initialisation
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
X-List-Received-Date: Tue, 14 Jun 2016 22:51:14 -0000

Shortly before the DirectFB 1.7.7 release, an optimisation was added
to CoreGraphicsStateClient_Init() to avoid creating an extended
Graphics State object if it will not later be required:

  4d422fb Client: Create extended Graphics State object when needed for later usage

Unfortunately the client->gfx_state variable used to track the
extended Graphics State object is not initialised, which can lead to
crashes etc due to creation of the Graphics State object erroneously
being skipped.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/directfb/directfb.inc        |  1 +
 .../fix-client-gfx_state-initialisation.patch      | 38 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-graphics/directfb/directfb/fix-client-gfx_state-initialisation.patch

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index f6b7cbe..527062a 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -19,6 +19,7 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/DirectFB-${PV}.tar.g
            file://compar_fn_t.patch \
            file://union-sigval.patch \
            file://use-PTHREAD_MUTEX_RECURSIVE.patch \
+           file://fix-client-gfx_state-initialisation.patch \
           "
 
 S = "${WORKDIR}/DirectFB-${PV}"
diff --git a/meta/recipes-graphics/directfb/directfb/fix-client-gfx_state-initialisation.patch b/meta/recipes-graphics/directfb/directfb/fix-client-gfx_state-initialisation.patch
new file mode 100644
index 0000000..57a9b0d
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb/fix-client-gfx_state-initialisation.patch
@@ -0,0 +1,38 @@
+From 8e53c0b9cedb62b82e2b7680d793d433b647ae20 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Mon, 13 Jun 2016 13:32:44 -0700
+Subject: [PATCH] fix client->gfx_state initialisation
+
+Shortly before the DirectFB 1.7.7 release, an optimisation was added
+to CoreGraphicsStateClient_Init() to avoid creating an extended
+Graphics State object if it will not later be required:
+
+  4d422fb Client: Create extended Graphics State object when needed for later usage
+
+Unfortunately the client->gfx_state variable used to track the
+extended Graphics State object is not initialised, which can lead to
+crashes etc due to creation of the Graphics State object erroneously
+being skipped.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ src/core/CoreGraphicsStateClient.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/core/CoreGraphicsStateClient.cpp b/src/core/CoreGraphicsStateClient.cpp
+index 5d46f0e..5007755 100644
+--- a/src/core/CoreGraphicsStateClient.cpp
++++ b/src/core/CoreGraphicsStateClient.cpp
+@@ -364,6 +364,7 @@ CoreGraphicsStateClient_Init( CoreGraphicsStateClient *client,
+      client->renderer  = NULL;
+      client->requestor = NULL;
+      client->throttle  = NULL;
++     client->gfx_state = NULL;
+ 
+      if (dfb_config->task_manager) {
+           if (dfb_config->call_nodirect) {
+-- 
+1.9.1
+
-- 
1.9.1


