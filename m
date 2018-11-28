Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1804F6C567
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 16:23:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j10so26922089wru.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 08:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=XKc8e3Jot7MCBlKFduzW5uqkYjfwqcylfug1ng3OI2s=;
	b=HBtQ8nqO4dXbjjio+ieK9KbY+VffRdX/ReIQAOlXLbqk7m/m/l74538LZYasoBGBcQ
	6nAKAqd7CihjUgYoRoqTmVB/hK9v5yDZ8kVI4WZoH8tl5lWgJ9Ro8AY16shQGlFV8m0q
	ctrkoHOojXLiO48bdHjlm93hUWkAfr+uIFVRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XKc8e3Jot7MCBlKFduzW5uqkYjfwqcylfug1ng3OI2s=;
	b=m08/E+PX1mJUZdM9iq64HVBxkd6Y6+O9lgu90b1vB+b5p4t8jnTdz8gJ57tA+k+eg9
	hL8I+VBEOvu+sTKDsV0qtATxdTu96EniFPOHHkSkVkBdefWCOG+zGLAVBbAzuu90KyNU
	dEEmA7IVlI+TGc1Fk/XceicHzUIccl33jSMWRiWyoMcZN8Qt6o8HQCQmuT3LvlahLDc/
	7pt8v/7B8A7rSiSG1I+nejG7Aa+URoFBYCOryjiKXqQmnd5YJ+zBETHY4lwYeL3XB8QY
	agR2KyWuUtfw5VDEAafiGGFFSj+7+gfpcgE+nyrmjLZD7EegJiRcSVojC+oZIa+Q793n
	o+MA==
X-Gm-Message-State: AA+aEWbNzHwNsZbScR2iXn4feotwyb2QQkUFZiXOy5L7VG3YLNShiws3
	Fj2hBLusdRuL+6/AzBlVb4jxuZ83pAg=
X-Google-Smtp-Source: AFSGD/WB11QeMwxFelutfTuhQWVqenpTzOivIRvD+o6M2xDPrd4PKyeHMo6tIJ9LLszbMwO5rmi71A==
X-Received: by 2002:adf:9dd2:: with SMTP id q18mr31914679wre.12.1543422229185; 
	Wed, 28 Nov 2018 08:23:49 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l3sm10033017wru.36.2018.11.28.08.23.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 08:23:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 16:23:44 +0000
Message-Id: <20181128162347.16512-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/4] oeqa/utils/qemurunner: Fix python ResourceWarning for unclosed file
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
X-List-Received-Date: Wed, 28 Nov 2018 16:23:49 -0000

Fixes:

Stderr:
/media/build1/poky/meta/lib/oeqa/utils/qemurunner.py:381: ResourceWarning: unclosed file <_io.BufferedWriter name=16>
  self.runqemu = None

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index f9430340925..241d1eced88 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -378,6 +378,8 @@ class QemuRunner:
             if self.runqemu.poll() is None:
                 self.logger.debug("Sending SIGKILL to runqemu")
                 os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
+            self.runqemu.stdin.close()
+            self.runqemu.stdout.close()
             self.runqemu = None
         if hasattr(self, 'server_socket') and self.server_socket:
             self.server_socket.close()
-- 
2.17.1


