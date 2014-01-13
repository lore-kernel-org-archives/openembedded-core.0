Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 790226E374
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 15:37:02 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id x55so4339678wes.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 07:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YE0ynjrwe1CbIYOLge1ILllTdG0YDQKfNNkMzvoZxOI=;
	b=VkXak1T8E1E00VM6f8QM3VA1XfpTpc/JAGOKngx/tBV3huQc7bkx7Avb7dzZvuDJXu
	BDdB5mjUdP+2OyKDhBfvqGAm9h/jhJbAYqW6yF0VzF3z4X6fRDGCCEqq2yYZZ3NcaP61
	1SWl84PY1XlRivxaXiU6EM7fHxMXbeEZUxyThYkByMAF5B5pMMpHYxcaJq1uTEaw2jPn
	8BFvNiqjzdgEnSwQkXlL+LG9s/WdlW0JgcYCYsSd8e4Cb1cdecqNvUerImJXWytRzV2t
	MDoQWSqNzD40AjivQTBReVG1GDW2YexOffKFxGLm+2+XU+wNXYHKBod5+SJmF6Cz/tWq
	DqFw==
X-Gm-Message-State: ALoCoQmW/Sw62jQVEn4oQBkmrHBF5U6L9HcFvHukrk2teTKNuXb64+5Ran0YZIO9z3UbIbyR8T8h
X-Received: by 10.180.21.244 with SMTP id y20mr16059886wie.37.1389627422889;
	Mon, 13 Jan 2014 07:37:02 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id j3sm18405905wiy.3.2014.01.13.07.37.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Jan 2014 07:37:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2014 15:36:53 +0000
Message-Id: <1389627413-7106-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389627413-7106-1-git-send-email-ross.burton@intel.com>
References: <1389627413-7106-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V2 5/5] packagegroup-core-tools-testapps: add Piglit
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
X-List-Received-Date: Mon, 13 Jan 2014 15:37:02 -0000

Respect the OpenGL distro feature and if it's enabled, pull in piglit and
mesa-tools.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../packagegroups/packagegroup-core-tools-testapps.bb           |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 1861ebe..4b8f99b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -24,10 +24,14 @@ KEXECTOOLS_powerpc ?= ""
 KEXECTOOLS_e5500-64b ?= ""
 KEXECTOOLS_aarch64 ?= ""
 
+GLTOOLS = "\
+    mesa-demos \
+    piglit \
+    "
+
 X11TOOLS = "\
     fstests \
     owl-video \
-    mesa-demos \
     x11perf \
     xrestop \
     xwininfo \
@@ -48,4 +52,5 @@ RDEPENDS_${PN} = "\
     ltp \
     connman-client \
     ${@base_contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', "${GLTOOLS}", "", d)} \
     "
-- 
1.7.10.4


