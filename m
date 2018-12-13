Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id A831A71BEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:12 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id z23so1680314plo.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=r+RdyOBEz2btP4r7PXrtoDSbGnIho/OQXBmAflSLHsk=;
	b=BvjBkoDbbXS3bWyDceST4oYAY58LCykNb61mQtCOwWchMOWWwlgt9AIk6kiHkCk8JS
	XGLOWhO5B5qAQCU+VRnN6fuMIxH+iWFhe4qR0OzUUtxeRNVkfNSEEdPuusJOY4WHk/Op
	SEA+HkmdSDS8mSm4aS2n6rLW5Aj+ZzDVHO9rmOgoRDdCO75AOiiymJATIKAOSXbSjEPe
	10EEhLFGOwFceJqHiU5gTcdEfyBnFYnyy7VqDq3ekbngA+LtXTsPEGbMfRCtXhqVEHut
	SIdFlb/GoZhX0XiUU5X6zFqyRSxPxyVGWypdEFKtrB77e7DnVDU4SN+zPeCBV3IKTcIt
	tHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=r+RdyOBEz2btP4r7PXrtoDSbGnIho/OQXBmAflSLHsk=;
	b=A/5ml3PQSGPybsUV5a97TPFynOQTIYVRy95x4lA34rCykIt/YUeVCTsDtd+0BNzW/D
	l0vlj1sODoUyzaRhWEL1hXTIJIu1FuUO0ig/EsgfiyCi1LMS39YchiFne+M1Y0zHckaP
	xouhDwgxutTphjfue4tZsF6aWSTNm6gvwvJ/KI3jxA35i1lh16T22bQIt7FI+DNME24P
	kfsJVvXmoJoSPmRuGvXaQWAwMkBlq2jExt3zFkJlLP11v0rWWNKmZkjvLl8h5WvqrFg/
	+weERyzaJkFUb+gjOjofSjuE54J6ytHsozRxmTEK9fhtNNaZ5eFNrhsgDRqtI/LAncyi
	GhHA==
X-Gm-Message-State: AA+aEWZLZxmT9NuOfYCdni+ikM0F5+J/1XsNV52HZSwEqyNYr94m76oJ
	CU8/zFyaVU6Zvi/yNHO9YeNdwsu5
X-Google-Smtp-Source: AFSGD/X5WM4O49mao6Xa6fpKB7VruBWRRuyTyDd3Rewa4lkU3Fjh2++ici1zeZFfqWuqnu4Ljkflfg==
X-Received: by 2002:a17:902:7d82:: with SMTP id
	a2mr427276plm.163.1544737153841; 
	Thu, 13 Dec 2018 13:39:13 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:19 -0800
Message-Id: <2af12843cb5efb6e2b04ac4c1661328db457e7ec.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 11/45] oeqa/utils/commands: Avoid log message duplication
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:13 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Each time a runqemu() fails, the log handler would be left behind meaning
messages from any subsequent run would be duplicated (or worse/more).

This ensures we remove the handler regardless and means we no longer
have the duplication.

(From OE-Core rev: 532984708436bdfa3a8cac2c684a425eb249bad0)

(From OE-Core rev: 600e71ede1977c45fed1958dd5356911e4fcf272)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 933af92..da70529 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -342,11 +342,11 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None,
         yield qemu
 
     finally:
+        targetlogger.removeHandler(handler)
         try:
             qemu.stop()
         except:
             pass
-    targetlogger.removeHandler(handler)
 
 def updateEnv(env_file):
     """
-- 
2.7.4


