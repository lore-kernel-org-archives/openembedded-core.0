Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2BA60767
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 15:24:22 +0000 (UTC)
Received: by wmww144 with SMTP id w144so29352870wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 07:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0bOzAfB47giTb3h2LyBGjYeIQuTqMmb5wARMr42pE3I=;
	b=SGBPjTq4RQUcRFuOVyqI4fuNQ4iqmuaLh6E41eI0FMtYrczlL6Y5xXxW3EDJhriE+M
	u+ISsNxA/97l/JOzFlc1pa9xeCr9sTZUENRXZxKZzq523mYbvIGt9gL39lpqC5jy+/B5
	b/N9+m7R9fPhCCUYihPYrWJ3Fb9xpphxEeI6rH9NaasOONymvnWqtF8kc+U+nFUrgfHV
	CHvIVv0XOZzSh7ve593MfkfiCsvSIkXqklRb4CcmuEr2cG01bOL6ZZJQmCfOSOt4ndqe
	6d7+MP8X7+I7hCQqUDDhtTjrl5o0bPE6gAgOgwS605WOSJemw0+Gu39wt3eDn7ZBk5iD
	LBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0bOzAfB47giTb3h2LyBGjYeIQuTqMmb5wARMr42pE3I=;
	b=DNlKVkNmXLDMgV0i0wg/yE/0s1Kr23QXnoVpOmRKGzSrw+GWUIWSSfOtNTNMF3pyn/
	hHv941thsrODhGCakYhy9wQ/ZcYiStm1VpTOhWkyC/V0IoD3TGJS+jCuwi2eomLcdPt8
	qG6kE2DHHWPclvF6uKWnL01Ia3bjoCTmzM81DGguYes8kLfFT+LVupbEQN/KKDgvRPen
	wwFeQ6QMGgXEs7MlyxGZb/b8yhrWOkO3CY3k0Nn+RZRDuprCMDLUZyNkn1WkfKmPQ5SG
	gpoEJLmesL66KOLT3b6oXdjIP97FtlybG7onFY6hocXD0wasvWNuOrqNqom+HALpKM45
	XJmA==
X-Gm-Message-State: ALoCoQm3QaAMohIyCGEvAvymMPxkDRP58wzbTzi/KiM0Y6Bpg669X4+/z27qB09iCNeVT2MWUaHvqtoKMzWiKmDKjGxw6hCy/g==
X-Received: by 10.28.126.215 with SMTP id z206mr43110760wmc.71.1449761062864; 
	Thu, 10 Dec 2015 07:24:22 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	yr7sm12901867wjc.9.2015.12.10.07.24.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Dec 2015 07:24:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 15:24:20 +0000
Message-Id: <1449761060-21041-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] cooker: use in instead of count
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
X-List-Received-Date: Thu, 10 Dec 2015 15:24:24 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 bitbake/lib/bb/cooker.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
index 4df8881..d39c64b 100644
--- a/bitbake/lib/bb/cooker.py
+++ b/bitbake/lib/bb/cooker.py
@@ -1072,7 +1072,7 @@ class BBCooker:
 
         for pfn in self.recipecache.pkg_fn:
             inherits = self.recipecache.inherits.get(pfn, None)
-            if inherits and inherits.count(klass) > 0:
+            if inherits and klass in inherits:
                 pkg_list.append(self.recipecache.pkg_fn[pfn])
 
         return pkg_list
-- 
2.1.4


