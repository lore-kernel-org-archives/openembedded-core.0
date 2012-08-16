Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T28kM-00058C-T4
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 00:40:58 +0200
Received: by wibhm2 with SMTP id hm2so940503wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 15:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=w7gktX14iFdaTGWiHCZOsyLfLlApcQYl1gzrIhqU3Bw=;
	b=Wzy29AwVtOPQ3rum8GBZunIXU0FCOw7h6jiM5vNhVb0tMI6wAvldDCKgw4cv8N386R
	fe01SfHZ9RmSFrkrLpsXP4SwkF2Js+JorpMoGaScdI/j7bMHipHE0GzESliSY9hdSI11
	VO1tcHhYr0ueDlKOnaMKUUT8xLOQl1TaPOCDp0PdtcESZEip+jCByUDmLmEmMxK/eeCK
	CpE7omqrW361giAeOgOlFmOwiFyoQmdxtKm4Dn3aDeFIFJ/EqnXrdcPjijbGULW8hiAz
	kijz4Rg/ryYbIqVYn0FoKgpTlSwumfqHVMA6WPhz5i5f66WSEcx6lAM5+iif+xY5WFCZ
	7URg==
Received: by 10.216.139.95 with SMTP id b73mr1258292wej.191.1345156141193;
	Thu, 16 Aug 2012 15:29:01 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id cu1sm6321240wib.6.2012.08.16.15.28.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 15:29:00 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 01:28:47 +0300
Message-Id: <754a26c722091d5922d1ef095def13f1cf57f27f.1345155936.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345155936.git.andrei@gherzan.ro>
References: <cover.1345155936.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQllRVqdJQVr6OGFetXlaLodHh4um/XOYgFQCKyAT0LdOALjHqKneGlO73T+U/psnYzuXzkT
Subject: [V2 PATCH 1/6] utils.py: Modify and rename distro_features_backfill python function
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
X-List-Received-Date: Thu, 16 Aug 2012 22:40:58 -0000

This function was written to be used with DISTRO_FEATURES. This behavior
is usefull with MACHINE_FEATURES as well.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/lib/oe/utils.py |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index e14743f..8d3efe4 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -87,15 +87,18 @@ def inherits(d, *classes):
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



