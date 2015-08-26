Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 45BD0734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 04:35:49 +0000 (UTC)
Received: by qgeb6 with SMTP id b6so119757535qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 21:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C7RdjAwLBRsviD1e/tq/sx4gkyKudD242NC9BvncJ3o=;
	b=SdSQwSk4CvevW7XOMBhvedE1tZFeJ87HzNJ0gmO9w3GwGCXRtVrOTWiG0hOcmtxBh5
	1g4xqJToNH18PjDsg4U5RoGaV5mxF8SPFSOdBrWCekBkLC2W21mwNd7LX2G3HQi1zpyh
	IziV3zep0qDCD/ww6basQegszY+tvG7IcFH+7clRyB9exBJda52OYVPQPsBIRqdvxYUm
	E8JPYIoLSX1ZsP2T3y3pfTT+oDmoqN1qtsVdompVTTZPPp4wzRJ7rzbVH5v1N+JKIRq9
	XNm1088KeyP1oI2r5ygEj/TJMel2XQsgajMXvb35aImnXs1MKsKA3JINGFlu1nWcO7Va
	kqXw==
X-Received: by 10.140.239.15 with SMTP id k15mr78598435qhc.4.1440563749966;
	Tue, 25 Aug 2015 21:35:49 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	b47sm15516759qge.44.2015.08.25.21.35.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Aug 2015 21:35:48 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 21:35:39 -0700
Message-Id: <1440563739-28496-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1440563561-28084-1-git-send-email-kergoth@gmail.com>
References: <1440563561-28084-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2] sanity.bbclass: remove forced abspath for SSTATE_MIRRORS
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
X-List-Received-Date: Wed, 26 Aug 2015 04:35:52 -0000

From: Christopher Larson <chris_larson@mentor.com>

The sstate URI is relative to begin with, so it's completely valid to want to
alter it in a way that keeps it relative using a mirror, and I have real world
cases where this is causing issues. Remove the check which warns on relative
file:// paths.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/sanity.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index ef90fc8..c142274 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -818,8 +818,6 @@ def check_sanity_everybuild(status, d):
                 continue
 
             if mirror.startswith('file://'):
-                if not mirror.startswith('file:///'):
-                    bb.warn('Invalid file url in %s: %s, must be absolute path (file:///)' % (mirror_var, mirror_entry))
                 import urlparse
                 check_symlink(urlparse.urlparse(mirror).path, d)
                 # SSTATE_MIRROR ends with a /PATH string
-- 
2.2.1


