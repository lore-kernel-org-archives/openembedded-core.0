Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2E04A783BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 18:28:13 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u83so36255506wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 10:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=udXyKFVVyczvInicKb2OPS+ob48bKWmJhW7INkDhEfA=;
	b=rWlc/Ab02plE9+Ym9b4OS5/YR2nfkBXKJearvukJ2lBBMHYjpzUU9G0g2lcQ/U2QWr
	JkPW8FISJRVRxoyggTshsNzxIkVQodG3g8lsPsuEpD7X0Wwl9w0Co5lWOD0R338Rib8X
	n5zVLrE0ST8K3EQlyL7T5LDOGsxACNbiu/7ilY1O6gDnttNaPmSw6tygonZaxlvat2yz
	P9wyC7gNPK2juQxpozwdhrdZLFwKYkaDmPC5qmBTWtYvc/6K9lQwwGVi3uF+Pg2Y5yAP
	4+DPsmil1QEtKy7nH3XPHM6yOCBrOVFcTVrcETA7wcun+M2HJe28o6l14NgBNhWhjmBf
	hK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=udXyKFVVyczvInicKb2OPS+ob48bKWmJhW7INkDhEfA=;
	b=MMYSjP7KXwhBtSrA+H8gBbslc1VhU3VAyW+EhbP4r6kS5h6vh5JIEbVr/LpNC97ZBS
	lzUZCORwLXvIibE9boUahC5H7N0o2lVkOM63PuHzrq7Z0aajgrFX8VWUY78JX4DzkKem
	5UYqZkLtWZHtguRZP8HDWafTDkXx6kPHUtntQ1Q9BQhwTT9cJpFn75k6rQCWHSb3z1xf
	TBhapyIxxTf0+t0p8CWP1M7iWdzL97ngSBV9d9whFej6jXyQNGBOw/uxWu4UgFVP9d2D
	kfQZdvb7VKb4QW2dg8ZGObDGWrf7kWxOv4b8W/rpYLu3xNo8SIioZa0alz0UTpTZvfC2
	OIvQ==
X-Gm-Message-State: AJaThX5TbqGjfe6I4/MYIpV3domIc1rpS3PvvFc035DdwWxCliOOMvi9
	a5SBNMUeoW1axn7mUf+qnT3B9mnq
X-Google-Smtp-Source: AGs4zMZTO11OZKHkdGv0yUL+mTEdr0+dOQMFwLiXOUsS5Nq1Ja8W3pKylijiNs7cIgBj/a8OQZxVwQ==
X-Received: by 10.28.193.139 with SMTP id r133mr19067471wmf.39.1511807294734; 
	Mon, 27 Nov 2017 10:28:14 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b66sm2525664wmh.32.2017.11.27.10.28.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Nov 2017 10:28:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 18:28:11 +0000
Message-Id: <20171127182811.22760-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] package_manager: force dnf to refresh the cache
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
X-List-Received-Date: Mon, 27 Nov 2017 18:28:14 -0000

DNF has a time-based cache policy (and a great sense of humour) so it's possible
that 'dnf makecache' won't actually refresh any caches.  Force the cache updates
by passing --refresh.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 6cbb61fd849..ef69b18b642 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -692,7 +692,7 @@ class RpmPM(PackageManager):
         return packages
 
     def update(self):
-        self._invoke_dnf(["makecache"])
+        self._invoke_dnf(["makecache", "--refresh"])
 
     def _invoke_dnf(self, dnf_args, fatal = True, print_output = True ):
         os.environ['RPM_ETCCONFIGDIR'] = self.target_rootfs
-- 
2.11.0


