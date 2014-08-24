Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 04CFF70F3B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 16:22:40 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so12066431wgh.26
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 09:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lPTouhLnEbLfz02lyTxSI71LhUuhcLdVy9qpZl3qSeQ=;
	b=F3qW0XFc2FpfCUk5bNxwwyV27a8tX9KozUxU0c8g4Ix6dwUtH0bRYCG9tkDc16Faxl
	FecDhGDyO3qBYljxF8B8fWA1Zth8TvMS9dX3AWphCv15jI0DHN1+NtmvCviiU1GgmQkp
	tNlYYQDY7aZzazCW+j0JoMwcSRzWHFaNrVeIYqYPqUW2zwH13GllvMA9cuLr+IGktpuw
	3ny/Wqx97MZrV5yUbBZ41mk14YtvCI+hAsXvtm3i1j6hxuK+hpzjRxA1HwmngeeMCa6N
	JNIa0e08hFANC+i24eRYgDEsmKPMnxtdCrAA5WaiCuEmKqL0KnG+yEBwa+/jVja2Uzg2
	/DdQ==
X-Received: by 10.180.188.205 with SMTP id gc13mr10037268wic.66.1408897361922; 
	Sun, 24 Aug 2014 09:22:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lq15sm21956137wic.1.2014.08.24.09.22.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Aug 2014 09:22:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Aug 2014 18:22:46 +0200
Message-Id: <1408897366-8784-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] buildhistory: Restore parsing time optimalization
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
X-List-Received-Date: Sun, 24 Aug 2014 16:22:46 -0000

* it was added in:
  http://git.openembedded.org/openembedded-core/commit/meta/classes/buildhistory.bbclass?id=540a2a30be21c3eca4323efbe91e7dcfc31a4c97
* then accidentally removed in:
  http://git.openembedded.org/openembedded-core/commit/meta/classes/buildhistory.bbclass?id=6db6c74f2876df7a183990426bb4262972966441

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/buildhistory.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 479e460..e8cdee5 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -499,6 +499,8 @@ POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_list_installed_sdk_host ;
 SDK_POSTPROCESS_COMMAND += "buildhistory_get_sdkinfo ; "
 
 def buildhistory_get_build_id(d):
+    if d.getVar('BB_WORKERCONTEXT', True) != '1':
+        return ""
     localdata = bb.data.createCopy(d)
     bb.data.update_data(localdata)
     statuslines = []
-- 
2.0.4


