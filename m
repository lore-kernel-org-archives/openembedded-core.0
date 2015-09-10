Return-Path: <george.mccollister@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id BDB6C6E26B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 17:31:01 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so25733812igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 10:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WsNOxUyMAOA/xl/s748hJcZQbnh5QKZtYgwMijd2I+E=;
	b=JO16u5LSBDFi57GP9nUFRZTDbHbHdyRdlMaOcDRseXNsWu1h5eChZwWlka8B4sMPb5
	7E5Xz0oJyFEGWP+5u7h4zh6RqCavAO3tOKAR0i+EztFrcrOMBoeyYTSdQz/2zGLWEg3E
	fc9qzitzc80STaxV7skX52iQ01wo23oPeetHCelQ1yAlFfLwzbfq0T3N0QpgCpEvuWeI
	ZzFKH1yOyyTH9mms+Ny36vBaK+S//ofaLljVnCwnhbCcY3NjQJUK79A0sHF8usbbgAZt
	3EtmC6TtrZOLcqQnmGe9BiHwGJfn/6YtTWMUYb21eaLx2bhtvynp8ye5HysgwtZM+HJz
	YVcg==
X-Received: by 10.50.3.66 with SMTP id a2mr8609542iga.92.1441906262300;
	Thu, 10 Sep 2015 10:31:02 -0700 (PDT)
Received: from localhost.localdomain (mail.novatech-llc.com. [64.126.95.172])
	by smtp.gmail.com with ESMTPSA id
	20sm7509797ioj.25.2015.09.10.10.31.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Sep 2015 10:31:01 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 12:30:52 -0500
Message-Id: <1441906252-28516-1-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
Subject: [PATCH][fido] wic: fix path parsing, use last occurrence
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
X-List-Received-Date: Thu, 10 Sep 2015 17:31:04 -0000

If the path contains 'scripts' more than once the first occurrence will be
incorrectly used. Use rfind instead of find to find the last occurrence.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 scripts/lib/wic/plugin.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 41a8017..3acd5b4 100644
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


