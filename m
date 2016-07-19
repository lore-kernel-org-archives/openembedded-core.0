Return-Path: <matt@madison.systems>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7259D6080F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 12:19:14 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id x72so6937189pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 05:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=zjwXVHI06k6mF30CDp21mqqZrfCvetjvNIDW0Jsa2dI=;
	b=bijC6Shk6kWsHrDKR3sR/40WWul+ZbgWozCL6/Ugg2FfvMcSZG+UydaLvTjklutnmT
	YvwShUxxFeQKuE9KoeBceLsm+nIhzfJwT14DfpFCRk8e8wZLAjbr7IczbN3pwbwuYRAf
	UCWE/5ln1La50xdA3NIhHZSnPRO38BiqePByjDZCJC9+sP/3FA5Gi6EXEjtHtbk+Im9t
	IX0nZd5O2+Dl34EtcWcudnzYqb+rjTE7lqgVczaJk7748hf7HZLcgomX41fj9fmqzB0+
	jxPugIMO276NvX1qt753aPTrIbrSA59WfHQVfbLCX+4u0k23YA6VifPhuSd9N5tFRC+7
	ur2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zjwXVHI06k6mF30CDp21mqqZrfCvetjvNIDW0Jsa2dI=;
	b=bcU4BkcdPygavcNyoFEXwl0uTfcNLLSQoFLObD8vkNnEyMBwY0qnYhkW5yKqAs8HPv
	2R/NzEXuz8DPU7Bp7Ml8ne3Z1ZT6vKG7rIDAxJX7INYYY6AOp+XP0vUeXoDcsZthewQM
	yqPKbXPfQU8z3vhATSHVWPdo1LO/Jun4XM0db/55igDBZT16HZDc98T+Xh0PN5/PkqRC
	YTjHo7euJsbcPaeD8OtcqgqtOdohtPkEiZLQbQp9FJorBx4KtsCFEWPCs4GVjojRl6tt
	LtkevpY07g4BoNe+I45WnlG+/rtTijX0qYv8S0VdNCb/+1UVpAIZqCQ5WESOOo24g+2q
	/Cjg==
X-Gm-Message-State: ALyK8tLMY6WPH7TSOszmCCL1Os4Dwz54bf19u6MQJ+AEmj7Ifl5wBWNNZDb4SQdw3Zj/Tg==
X-Received: by 10.98.43.68 with SMTP id r65mr54660189pfr.148.1468930754478;
	Tue, 19 Jul 2016 05:19:14 -0700 (PDT)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93])
	by smtp.gmail.com with ESMTPSA id z1sm4538087pab.19.2016.07.19.05.19.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jul 2016 05:19:13 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2016 05:18:47 -0700
Message-Id: <1468930727-2937-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] package_deb.bbclass: fix Python 3 error
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
X-List-Received-Date: Tue, 19 Jul 2016 12:19:17 -0000

Don't modify an OrderedDict while walking its keys.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/package_deb.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 8f9b09a..945df0e 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -232,7 +232,7 @@ python do_package_deb () {
 
         rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS", True) or "")
         debian_cmp_remap(rdepends)
-        for dep in rdepends.keys():
+        for dep in [k for k in rdepends.keys()]:
                 if dep == pkg:
                         del rdepends[dep]
                         continue
@@ -240,7 +240,7 @@ python do_package_deb () {
                         del rdepends[dep]
         rrecommends = bb.utils.explode_dep_versions2(localdata.getVar("RRECOMMENDS", True) or "")
         debian_cmp_remap(rrecommends)
-        for dep in rrecommends.keys():
+        for dep in [k for k in rrecommends.keys()]:
                 if '*' in dep:
                         del rrecommends[dep]
         rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS", True) or "")
-- 
2.7.4


