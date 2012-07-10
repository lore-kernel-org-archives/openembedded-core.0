Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Soc5M-0004gb-BF
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 17:10:44 +0200
Received: by qabg1 with SMTP id g1so2527330qab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 07:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=zLmDjJDAyDQp7KHHiu4V/Vz0uOV6S4Zu5CVnMDdX7/U=;
	b=fboySzkFwYXHM4JNRPqZbOIkBVCihvq7BnAg1lQa92sYcOqmBaSh1UZQeO2Hfx6MWs
	87MeCQDARfD4eyp1mfpBng0TGqOVU8mDng7Se483bXkJb5Cdt+6eD2imAWKkJFtc8bdo
	O++nAUCSZVJUnYAT8gmfBen4jPjV48CIKzX/FTGxrUV+TP4y+1bUsaLSmrzwaZUtgXPh
	efZTjgjMSREZ+ab8E0BEroTgf/oMxp29krwMeSSNc1eIjxnun5T2S97sKgVZF2t9vaii
	PNFKdrqH3xri+RER2137PxXUfek0VsDJucf8oM8EY2bqCqkKFdaD7enZv4Sj5BCHWO64
	TQQA==
Received: by 10.224.190.136 with SMTP id di8mr19762536qab.88.1341932373090;
	Tue, 10 Jul 2012 07:59:33 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id n2sm65763443qap.10.2012.07.10.07.59.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jul 2012 07:59:32 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 17:59:18 +0300
Message-Id: <9403579097d0430a5ce2cd3bb23925fe25917a0b.1341932186.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1341932186.git.andrei@gherzan.ro>
References: <cover.1341932186.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkjydx/1P6GUYJNT1y5HqgyyydtS5joUnbrPr5AVTCRMVVr9J1IY0nxvU0Bv3vXsntbwNsl
Subject: [PATCH 1/5] utils.py: Modify and rename distro_features_backfill python function
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2012 15:10:44 -0000

This function was written to be used with DISTRO_FEATURES. This behavior
is usefull with MACHINE_FEATURES as well.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/lib/oe/utils.py |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 8912dac..5a19a76 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -89,15 +89,18 @@ def inherits(d, *classes):
     """Return True if the metadata inherits any of the specified classes"""
     return any(bb.data.inherits_class(cls, d) for cls in classes)
 
-def distro_features_backfill(d):
+def features_backfill(var,d):
+    # This construct allows the addition of new features to variable specified
+    # as var
+    # Example for var = "DISTRO_FEATURES"
     # This construct allows the addition of new features to DISTRO_FEATURES
     # that if not present would disable existing functionality, without
     # disturbing distributions that have already set DISTRO_FEATURES.
     # Distributions wanting to elide a value in DISTRO_FEATURES_BACKFILL should
     # add the feature to DISTRO_FEATURES_BACKFILL_CONSIDERED
 
-    backfill = (d.getVar("DISTRO_FEATURES_BACKFILL", True) or "").split()
-    considered = (d.getVar("DISTRO_FEATURES_BACKFILL_CONSIDERED", True) or "").split()
+    backfill = (d.getVar(var+"_BACKFILL", True) or "").split()
+    considered = (d.getVar(var+"_BACKFILL_CONSIDERED", True) or "").split()
 
     addfeatures = []
     for feature in backfill:
-- 
1.7.9.5



