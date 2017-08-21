Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id CE15F78340
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 11:43:43 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id p8so14561713wrf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 04:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=msGmC6+GTcXCqGsKfsz7J9or+kpSQol12CV7+wE8+EM=;
	b=mTXORxIcipNlvSD9fauOziuVheV+vzEcZom97RMRrCc5f7J7JM7qZuGaDsRyWIL7V4
	iQZTKU1KlivzRIBAg5kC4L9DOlfLOklhB6UC3kh5LvP2O0usQFphyVyGveyIRpZASpLQ
	rHiuuHc07QmGgO+qhNPixnCQNPU3K78fjPsInr3KsWge1laMSBD1Bthx31Tf8JCYB2LZ
	MWfHFNgItTFEX0RmyFun5xgd9+7dIZ6eJDPQaUl70JYhdtxG77kPUA8vnykba0X5hKuM
	dcTEoz8WTPk1yDc0vgILYGLQsO5b2hUzc+j+cJsJLknygpO/tAJrXLvpAsz0Z965WD1M
	Ob2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=msGmC6+GTcXCqGsKfsz7J9or+kpSQol12CV7+wE8+EM=;
	b=irjKogz2aL8+kx1JKVjKqdNkOON9u4O67Qz7wXm+ec1ONFGNdUMRwmMbF18QxkXBxA
	CxFfUGFTBYymSC0AK/o+BONml84K9LZc0dD0t5+wQ08nDIvfZQGpu2BQUbQtwgcFP2Ta
	LHzf7+YUkSHVHL17o6OcgezLLGjByKKRcVe76ekcJKSo7ERRKZMpkC4mcQMWQpmtQGv9
	rDiuoKZvGjks2PuBOEJeMevop0Ncx4T585xF/OTxlOMaYImYKh+HaDAe91WS/dEnJv4T
	n+1xs1r3Pci9PFQ5Y5VOK4kWsXe/r9FWa0xjUAplq5/GYplrcsBvDr4jEJsKsVlf+Hg9
	OjuA==
X-Gm-Message-State: AHYfb5iRU7KWFHCQmtqGEAxM9EtZrVFoZ0Smeo5BkxXyaj8qcq8WYCRN
	UsE/TGo6nOB70T62
X-Received: by 10.80.162.39 with SMTP id 36mr11611789edl.58.1503315824614;
	Mon, 21 Aug 2017 04:43:44 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.88]) by smtp.gmail.com with ESMTPSA id
	j22sm1911376eda.91.2017.08.21.04.43.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Aug 2017 04:43:43 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 13:43:34 +0200
Message-Id: <1503315814-27663-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] base.bbclass: trim duplicated whitespaces from BUILDCFG_VARS
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
X-List-Received-Date: Mon, 21 Aug 2017 11:43:44 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

To give a example:
Before the change, in our build console, TUNE_FEATURES looks like:
...
TUNE_FEATURES     = "arm armv7a vfp  neon        cortexa8"
...

After the change:
...
TUNE_FEATURES     = "arm armv7a vfp neon cortexa8"
...

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8c86977..07734ac 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -206,7 +206,7 @@ def buildcfg_vars(d):
     for var in statusvars:
         value = d.getVar(var)
         if value is not None:
-            yield '%-17s = "%s"' % (var, value)
+            yield '%-17s = "%s"' % (var, " ".join(value.split()))
 
 def buildcfg_neededvars(d):
     needed_vars = oe.data.typed_value("BUILDCFG_NEEDEDVARS", d)
-- 
2.7.4


