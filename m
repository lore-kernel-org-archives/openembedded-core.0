Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 435576E26B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 17:26:08 +0000 (UTC)
Received: by iofh134 with SMTP id h134so69378150iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 10:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EkrxHNkYRSeALoyPjxwicxWprRpycTnib4R4k/W6KIY=;
	b=lb1rvj/yWdxlMOqjt8Lp3fKyNnrxSpUPwWIFmpmMsheulLryEHI+fXZh5/D4khiFhm
	X51IBuEjjfkgBREk+Eo57+6LWyLMqlUjwVGE/GOgmsvrUKqecbTtaXmm06c/gjWmgEeh
	0wVoYnx6+tJ8BYaXYKe30955jfFadc33g41ORAQZGwrscw3tL9CemywQfG0ceRGDmsKD
	kNb2FhIYIEzuLO7vwCNqa7mQ+oWIB8rXKLhwSWKF2Ku/FPNmYwlLdVU83sN5MR60sAMW
	fpNytYiorgUnz+1C/MHqqAEHxKyIVosm3s63pnkKg1Gm7gMthUpuFF6ZUXWNbfxMdq2Z
	fXaA==
X-Received: by 10.107.162.205 with SMTP id l196mr62753028ioe.3.1441905968315; 
	Thu, 10 Sep 2015 10:26:08 -0700 (PDT)
Received: from localhost.localdomain (mail.novatech-llc.com. [64.126.95.172])
	by smtp.gmail.com with ESMTPSA id
	68sm4959573ioz.5.2015.09.10.10.26.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Sep 2015 10:26:07 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 12:25:29 -0500
Message-Id: <1441905929-27469-1-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
Subject: [PATCH] wic: fix path parsing, use last occurrence
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
X-List-Received-Date: Thu, 10 Sep 2015 17:26:11 -0000

If the path contains 'scripts' more than once the first occurrence will be
incorrectly used. Use rfind instead of find to find the last occurrence.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 scripts/lib/wic/plugin.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index ccfdfcb..151ff31 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -42,7 +42,7 @@ class PluginMgr(object):
 
     def __init__(self):
         wic_path = os.path.dirname(__file__)
-        eos = wic_path.find('scripts') + len('scripts')
+        eos = wic_path.rfind('scripts') + len('scripts')
         scripts_path = wic_path[:eos]
         self.scripts_path = scripts_path
         self.plugin_dir = scripts_path + PLUGIN_DIR
-- 
2.4.5


