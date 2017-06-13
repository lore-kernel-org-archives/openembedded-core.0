Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA54782EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 16:44:55 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id 77so4240389wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 09:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=gGehZeOhlaH6RTo3roSv/gaXp9EHJ13+9mXYwjkhPAI=;
	b=kji4G/z3cr6rlV3Gt8J+TZYv57apW36Dl0h8pXxvpcZsP+7LZwIli+kI4Ht2AQhNPX
	WKzyHz7JgEFfq0bvOw8k9xwQyDzoW/LvkHoPLUcd+mpi0qzLrFoAtrunoBiwRcnPDMp+
	RE8gczlCqYB3zxZUOLkKZ6rTFUM+e9CjX2Lon2cGudgyqu7U2mQOtvXFKP2+vIFjmwaJ
	VTBgIjIfKqpXD4OhT1EADoLc3QvEcLGe+ZQ7JwqYB0ewZz4QZckWPH/w6xEydVBbUnlD
	wHp8k56dsCNtclCVhXebEr//uSj1R/dsNgCKUkf7KwmnZuUM7uwiJ935k+c8cJGWXPdP
	YOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gGehZeOhlaH6RTo3roSv/gaXp9EHJ13+9mXYwjkhPAI=;
	b=OjoDIapjmtoCGzqe81L1QqNJtU+dxSC/KzvVsBzjS2DL4qz/LLs0js19tkQUtMSVhu
	juJQlVGLGeMfotwrRY4T8uohKcHXe5Qf1f82ZrUNMFGTwJak+KhUS+z43BlYcXZNgRKQ
	ES3IdyFEneGmtQL+7tLl4crh5zPQnHNJC7LdCgG4Xz4nAcbu7ABfxcBjiwVUNmS2Yp/a
	uwBMLN5CqggI5jK3dbHmaJwMl48K869seMZoAfMpMGMLM+CN34ggb5nEFrSw7vsJW1/x
	oe8dxg0rMZZVz5EMLXS5vqr4Yjb5Ge7NAekPkSdQ4WrSQdiUlsfsZCtV92I76nYVxNwo
	KK3A==
X-Gm-Message-State: AKS2vOwwvDNAvBlEyzidGmsR+f3C05ZA/FeYJ7K1WHeB1T9cif40o+AQ
	G4MLpkGYqFdsrLscIdU=
X-Received: by 10.28.93.79 with SMTP id r76mr11996612wmb.64.1497372296267;
	Tue, 13 Jun 2017 09:44:56 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r142sm3962867wmg.24.2017.06.13.09.44.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Jun 2017 09:44:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 17:44:54 +0100
Message-Id: <1497372294-21326-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] externalsrc: verify that EXTERNALSRC/EXTERNALSRC_BUILD are absolute paths
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
X-List-Received-Date: Tue, 13 Jun 2017 16:44:56 -0000

If these are set to URLs then the errors produced are not helpful.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/externalsrc.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index d64af6a..529be49 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -29,6 +29,12 @@ EXTERNALSRC_SYMLINKS ?= "oe-workdir:${WORKDIR} oe-logs:${T}"
 
 python () {
     externalsrc = d.getVar('EXTERNALSRC')
+    externalsrcbuild = d.getVar('EXTERNALSRC_BUILD')
+
+    if externalsrc and not externalsrc.startswith("/"):
+        bb.error("EXTERNALSRC must be an absolute path")
+    if externalsrcbuild and not externalsrcbuild.startswith("/"):
+        bb.error("EXTERNALSRC_BUILD must be an absolute path")
 
     # If this is the base recipe and EXTERNALSRC is set for it or any of its
     # derivatives, then enable BB_DONT_CACHE to force the recipe to always be
@@ -48,7 +54,6 @@ python () {
 
     if externalsrc:
         d.setVar('S', externalsrc)
-        externalsrcbuild = d.getVar('EXTERNALSRC_BUILD')
         if externalsrcbuild:
             d.setVar('B', externalsrcbuild)
         else:
-- 
2.8.1


