Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4F89270A0E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 16:15:46 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id et14so11329718pad.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OCfC+EIWe7I8XxQYnIrwNVnZUSG2PFRhB3KFlq+vVyM=;
	b=VqDQCFoQEPuLk3C7hOarXTN+cWnqoSgzc5LyTL8t7yzBxoa2QDTyuOVXG5znea3gNh
	CnBPjcid6nGP8Emr+8k6XhfVl0muJaJgaUNhEZZF0TrXoWh5+oodTk29BFDj/OhY/0u4
	/aKz09I8JF9TFBkrRvRTaFlGbSRhWae93xhVGKu7/OkLSdkeljcGVDRufzuZTSz39liL
	t0dY63XUR//YSTyCJpn/Geq8C3LTC+cNjMEXTj+vWUUoxR2yNLP9v0y1A5y8vvFwxT6q
	ipXMm3gpd3S5KHeS+R4sKUreN8xmTaPgw3IcLEuoUyuh/2nrSOIt0+bM96KcbHGD87Lr
	AuPQ==
X-Received: by 10.68.247.72 with SMTP id yc8mr10007594pbc.114.1407773747671;
	Mon, 11 Aug 2014 09:15:47 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	kl7sm18165617pdb.13.2014.08.11.09.15.45 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Aug 2014 09:15:46 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 09:15:37 -0700
Message-Id: <1407773737-16725-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1407773737-16725-1-git-send-email-kergoth@gmail.com>
References: <1407773737-16725-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] oe.package_manager: fix use of PACKAGE_EXCLUDE for dpkg
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
X-List-Received-Date: Mon, 11 Aug 2014 16:15:47 -0000

From: Christopher Larson <chris_larson@mentor.com>

It was iterating over the variable character-by-character rather than
word-by-word.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index a0984c4..8be3d41 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1666,7 +1666,7 @@ class DpkgPM(PackageManager):
                 priority += 5
 
             pkg_exclude = self.d.getVar('PACKAGE_EXCLUDE', True) or ""
-            for pkg in pkg_exclude:
+            for pkg in pkg_exclude.split():
                 prefs_file.write(
                     "Package: %s\n"
                     "Pin: release *\n"
-- 
1.8.3.4


