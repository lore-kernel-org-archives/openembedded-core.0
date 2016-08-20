Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3D0731BD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 15:03:08 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id cf3so5042109pad.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TfOeB7965jSu8YhO7pJEIel48cJD8qDJ2MXCmMNc1fo=;
	b=nMQPrNcBJ24x4HW+dqbxTLHmioAiJ1s0G/0DSiiP6isuHkDlGXvUSsSONeEI/ERcpZ
	u2SXm2TJfz3imIezKJawNLVFx63CR5+CFQmJ8Uq3K8+tsZz4TmADYU4Wv7ISf5FbsmWL
	GZaZ/b1+c9MrWXjAWnnVv0CG4DbU46ussWDnEL7hlNETsQeKbhAjkhP1PzAxQMEowSFN
	htplJ3XNQiro0m1s2g7J4HPjzwk+b2kPLjB3gszZDNeT44Z/Lr0n8b/Whgtgbb1QUP5U
	B9totU8LahoibNIIXdQNBHiTpvwdl+bFxty3ajzYmmgpbn7ch9sAMwG6WpglmPKqPyp+
	BefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TfOeB7965jSu8YhO7pJEIel48cJD8qDJ2MXCmMNc1fo=;
	b=Cj8LNgBeeoxjgc4ObknJjFFJ1qiyx1QqEnOux8zf42LdCsOZ2VAzo5Hhu/3JZF7Gqi
	cVG2VHK0kA9WHSGTzIJzixijnyCt7Enq7GUmdgVtvtqIkORYmVcVFsdBWdiAGXE6Nu0U
	bZi3YJdZtUhuwrsqEPovLBgp3/RHDMkhWEwR40776c/ThqGhza4J80q+jVsKBj5SNeXH
	QuAjmO4kXHNmz3PVEIXXR5IiiJsADBNZbvzQJ3LPqh37zgR5cPCnXxkS8vNMrXnsu4VE
	7n1I0t8y+Xebx1ZqDPeYu701fbLnNpCBPkC5Wb40nvekgrns9U5dD8cEwOgcM+l6lFt6
	Hzng==
X-Gm-Message-State: AEkoouthtnvf66TgNC0kJcaofrKjTpLOWhUifBfTPoTUBPDJdPErzbikJEQrRPGaUQFMHw==
X-Received: by 10.66.78.35 with SMTP id y3mr24476781paw.40.1471705389009;
	Sat, 20 Aug 2016 08:03:09 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	n80sm14754199pfi.19.2016.08.20.08.03.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Aug 2016 08:03:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Aug 2016 08:02:59 -0700
Message-Id: <20160820150300.15345-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] xserver-xf86-config: pre-load int10 and exa modules
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
X-List-Received-Date: Sat, 20 Aug 2016 15:03:10 -0000

musl doesn't like lazy loading that xorg uses, therefore
load the needed modules explicitly

[YOCTO #10169]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-xserver/xserver-xf86-config/10-preload-modules.conf           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
index 7ceb6fd..132459c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
@@ -3,7 +3,8 @@ Section "Module"
     Load "fb"
     Load "shadow"
     Load "shadowfb"
+    Load "int10"
     Load "vbe"
     Load "vgahw"
+    Load "exa"
 EndSection
-
-- 
2.9.3


