Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA61731DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 13:56:36 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r126so26631347wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 05:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RbNj/CK00NGavngyn7HfFrvruWMPQ5a5qTRoDnA8bvY=;
	b=irTY6fnd2iI1sBsMyC8WZf9mnGKmeNZieTFA5TpxHGtDG8OQJeP/NET/QgKmB6JH54
	oimGXV6xVJrrHsjm0rbFksnpwFvRIex8ABC+gmXGBon+mzLnum/5ktq2XCW2sL/+X/JJ
	T8sCd3nK5By4dp2afPkf44iVY33P3dL3dYyzlc7lpc+mzovomwRu3Gz9QIG7kF0QjY05
	S7tc2NwFsdzzJH+eXhqCuqC3Auvkr+pDjwWvBaSLk4uGclJxHK/5R9odWS9VmSH+yR4R
	ec4lMd6IipdR2XVrAwrMViJ5UQUH2XacdrMbt5o1qgldGd7scqO8oLs4/RY39yTvulvh
	cWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RbNj/CK00NGavngyn7HfFrvruWMPQ5a5qTRoDnA8bvY=;
	b=X27rEvAt0uq+VIlR243ro/Oxh7n5CiBr645VRztzf5USGZnd+pE6kIQYw0ciaPnvMn
	CUix5bwldBn4f1t9cvNa3jbBKtZ8XU2pzUf2WV4uHvSXy4pAE+N955KICb3KgsyS6KIY
	FYqdTCcM4tGsOqvFATVffs209C34FZgmK9qFauOIjQNbQbirUXiLpSdBw4z8k2+LzhmF
	DMW7p6iV2VsilKGPSEGiYe85GVdrbli4K8PhDDlgewM7JtkcBphynQJdUbvgfLbgrrl8
	FjhgrVl/6RHaWLQkqWEEklpJcA5+3xOnbyMMGSiyzeKPCi4rfn37vYe29XH8xqvFt6zp
	RN4A==
X-Gm-Message-State: AIkVDXKBdg7SNVMRYImVoStbi9cczW3Yp051790t1xA1aI4FyfEJh+oWP5Gf3dhKJWOH6Q==
X-Received: by 10.28.129.5 with SMTP id c5mr12983612wmd.23.1485179795812;
	Mon, 23 Jan 2017 05:56:35 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	a35sm14912467wra.21.2017.01.23.05.56.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 05:56:35 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 14:55:40 +0100
Message-Id: <20170123135540.3632-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] useradd-staticids: Fix groupadd
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
X-List-Received-Date: Mon, 23 Jan 2017 13:56:37 -0000

When a group name is duplicated between USERADD_PARAM and
GROUPADD_PARAM, this class tries to add it twice which results in
failure of the groupadd command.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/classes/useradd-staticids.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index f7f6057ac3..a309b8873d 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -165,7 +165,9 @@ def update_useradd_static_config(d):
                 if newgroup and is_pkg:
                     groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg)
                     if groupadd:
-                        d.setVar("GROUPADD_PARAM_%s" % pkg, "%s; %s" % (groupadd, newgroup))
+                        # Only add the group if not already specified
+                        if not uaargs.groupname in groupadd:
+                            d.setVar("GROUPADD_PARAM_%s" % pkg, "%s; %s" % (groupadd, newgroup))
                     else:
                         d.setVar("GROUPADD_PARAM_%s" % pkg, newgroup)
 
-- 
2.11.0


