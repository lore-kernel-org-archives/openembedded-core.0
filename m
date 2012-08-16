Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T27s8-0003YL-Bl
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 23:44:56 +0200
Received: by wgbdr1 with SMTP id dr1so2503809wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 14:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=w7gktX14iFdaTGWiHCZOsyLfLlApcQYl1gzrIhqU3Bw=;
	b=Xjt2fW4ZaBcADoJX2pGahXO6KbSaxvohy1xwnd9sBYGeMCcNbduPQjcYNYGekQfeP/
	UVzsAvtEoSSUFCJ8LdkGyZce+EKCVLNsmcFqcKUNqSpLKbteosc8zUIEVtKDuljUGoGb
	+7mgp22ThkNBAXAWeEhB8Fzf9kL4b4dLfhHQE81kph7kRzAcvUy1vrBcFlFL2+ps4tQq
	C9qh0EwhvEXgCBLmVW0KXOhyRi0ydX0eWoCnopqpvUKiLDo34ljOSEscH4UiQJ1K5GIe
	oSE5g/s7Kl1m19eociXHMNrQh13yyhWrR6UfPYacB4e706xWSYNeXdq0eGYPXGfD7jbk
	gRTA==
Received: by 10.216.198.145 with SMTP id v17mr1425915wen.1.1345152778566;
	Thu, 16 Aug 2012 14:32:58 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id bc2sm8949894wib.0.2012.08.16.14.32.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 14:32:57 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 00:32:44 +0300
Message-Id: <754a26c722091d5922d1ef095def13f1cf57f27f.1345152235.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345152235.git.andrei@gherzan.ro>
References: <cover.1345152235.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkvgJ3vskzBF+3mnyIOaMx1KG1yxQcbMKVpPx3XaAjkkTrhfjVewl8+52pCIfcSe/HIbQ/k
Subject: [PATCH 1/7] utils.py: Modify and rename distro_features_backfill python function
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
X-List-Received-Date: Thu, 16 Aug 2012 21:44:56 -0000

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



