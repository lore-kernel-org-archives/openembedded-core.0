Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD1465C9D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 15:18:10 +0000 (UTC)
Received: by pdcu2 with SMTP id u2so27868405pdc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=V/HzJ8lITxdI246+WoOvDjE0ZdAH2ylGEZlJofU5yAc=;
	b=plEmyKGGs+uhpy62o6gQS39sKDUQs9/v4DSvPRfzrr2Dh5OlofP4UdwDvt4C/E6LU8
	L5KB5ZG2fp9olshcbHwBH61i/7IhiJPnFMEr0ypQ89vrBaFo0VtfpWrJ4YJZyP1pK4aW
	XE8oD1xZnJQAuDcDd9AWH1+UqZMX4XDi1u+1oR6ACqPeehDrOY6WjWw/iQMH9DWhS0xA
	e4k1z6th3u/Xi0vcru/8qDKwYA9mHkKJwSoIi7RUfM9PL8F8d3gH//om3hjSyyJWLeVv
	qlRbFzSpoSr5ZSk84PPjKkXVZtn72lcenk4MccetENlF5QSIV6WgxX2Lh+ND/gsUEwiU
	Dstw==
X-Received: by 10.68.69.42 with SMTP id b10mr56771602pbu.38.1435763889724;
	Wed, 01 Jul 2015 08:18:09 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	fs16sm2644704pdb.12.2015.07.01.08.18.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 08:18:08 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 08:18:21 -0700
Message-Id: <1435763901-24229-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [PATCH] multilib_global: expand multilib pref values properly
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
X-List-Received-Date: Wed, 01 Jul 2015 15:18:12 -0000

This ensures that in cases where the preference value changes when the
multilib override is applied, we correctly expand it in that context.

For example, for `PREFERRED_PROVIDER_${TARGET_PREFIX}gcc
= "gcc-external-cross-${TARGET_ARCH}"`, when it sets the prefixed version of
this, we want TARGET_ARCH expanded with the multilib applied, otherwise the
arch suffix will be incorrect for that context.

We ran into this trying to use preferences in meta-sourcery along with
multilibs. We worked around it there via PNBLACKLIST, but this fix should
still go into the core.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/multilib_global.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 67bd70d..ed34404 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -84,7 +84,7 @@ def preferred_ml_updates(d):
             # implement alternative multilib name
             newname = localdata.expand("PREFERRED_PROVIDER_" + virt + p + "-" + pkg)
             if not d.getVar(newname, False):
-                d.setVar(newname, newval)
+                d.setVar(newname, localdata.expand(newval))
         # Avoid future variable key expansion
         provexp = d.expand(prov)
         if prov != provexp and d.getVar(prov, False):
-- 
2.2.1


