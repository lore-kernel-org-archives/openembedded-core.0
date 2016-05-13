Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id A3F81731C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:57:01 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id qe5so11710999igc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 09:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8QHJBWQSqKZd+WIouJnw7eWbX8+MRR+7+U42blQDEZQ=;
	b=GI733huB6Ez47Zz0TYViZq21CMxLDJPOTQ5RHsqxnxKvDU542cRX2wkiICPehRjmxi
	sIdNr2ztz0IY5pO/UR0bA1LKazO8hj0JkpB/HfCJttCLNPr7dXQFg7zJYtkygHzMU5BF
	fZOwiUE4TQ0VwsLmeP6zpv3jeeSS5HNzd+fCEvm8cNdraXKoxipjq3sRYXTyT2lGrX30
	P4f9f3WCBu2X9AG2TJgnD/JesOiIW7Y3BEYSCTso5D4T/RnvHjvtNZHiCs4kSZIlrk4q
	/PeG5ccWqFo6rMYfKb5JnekMEt8u3K3Mtm8j6ApWcmatt2/jTFcP7pfMy7GWm5VZgrsI
	0UxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8QHJBWQSqKZd+WIouJnw7eWbX8+MRR+7+U42blQDEZQ=;
	b=f0ojzZI7UaNWvJYjfKVcphg3D6a8gb8odzFSrxF0s27IrYPjs9hGlo33TgYyHNLH+I
	CCNzJJbsdtc7KZdPOUBnn3zADYwm3Y0A33cnCax00hzhXYGYRJZ8K4h/85TTmwBzHjBR
	r/9/pKulD/PtpXlsWiB2icfKFfIQzkXrysxMq0T6ah63m+q7DtAAW9NCoYUQiGBnQDrx
	0UdlVBSIXDmUrhTi+d+gcY3A1oDZrjBSDQJVEPhMZ1I8r9JGD3Df2fR6YPhEom/6nL5X
	UoWY50luG6feQf3Xm6jXCSppPTeoYZh0D+2NZ1ewfqXeJ7EogeJFKel4Zj6vIuEryC8S
	S4Xg==
X-Gm-Message-State: AOPr4FXj7yIrr12Vi4deeVqkJrIOdQ82DG4eGsOLOYi+xZx4/Bnj187v6EEUDPiyIeMQAYsw
X-Received: by 10.50.88.36 with SMTP id bd4mr1425425igb.23.1463158621914;
	Fri, 13 May 2016 09:57:01 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8DAE6.dip0.t-ipconnect.de.
	[93.232.218.230]) by smtp.gmail.com with ESMTPSA id
	gn3sm1227509igb.16.2016.05.13.09.57.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 09:57:01 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 18:56:56 +0200
Message-Id: <0cb46598518d5ec4e8a0d0277a4cd6fe82be21d1.1463158480.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463158480.git.patrick.ohly@intel.com>
References: <cover.1463158480.git.patrick.ohly@intel.com>
Subject: [PATCH 1/2] combo-layer: fix default "update" mode
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
X-List-Received-Date: Fri, 13 May 2016 16:57:03 -0000

When the "history" option is not set in the combo-layer.conf, the
intended default was to use the traditional method. Passing "True" as
default when querying the config was unintentional.

Also remove some left-over debugging code.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 92525ca..a0a737d 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -641,8 +641,7 @@ def action_update(conf, args):
         history = None
         for name in repos:
             repo = conf.repos[name]
-            repo_history = repo.get('history', True)
-            logger.error('%s: %s' % (name, repo_history))
+            repo_history = repo.get('history', False)
             if history is None:
                 history = repo_history
             elif history != repo_history:
-- 
2.1.4


