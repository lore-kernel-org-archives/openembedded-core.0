Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1C378734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 04:32:52 +0000 (UTC)
Received: by pacgr6 with SMTP id gr6so13663926pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 21:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=T/vIhyAx8yWvV/SJSUi69oTLWsKx50hRNocPOdKIGYE=;
	b=f0g3ufeZ5GcvK12wz5Ehk5ltHlVSfG6izmhlmWRTDktk3w3ArDRsow8pUsQ55hQbW6
	A/l3OsF2G9MMRKWfEXB2atpKmBQNUt53x3wTN4T4WUlDpXM/Ro9/PocuyPPsL0CKpQhw
	OcK95BUQQYG5q5/1eXIdTfsxakhxfxyfyTlgAFYQ5LBxSYeh3K3ge0Cf8/kIULGRf9OG
	DxTSqC0ku+kC/YvcRLrLlIPyy+PfCT6jvNFJ3eZIkbRYGGTCyDKa8/LYy/pSOMW7gXFL
	iJJjZhqniUZos6s2DifI59zafNTwjjjKGLSZVWvxX224gCc4kompgKXxMNfyMVG2WW3F
	rdtw==
X-Received: by 10.68.166.97 with SMTP id zf1mr64463706pbb.72.1440563572665;
	Tue, 25 Aug 2015 21:32:52 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id j5sm22950503pdi.7.2015.08.25.21.32.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Aug 2015 21:32:51 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 21:32:41 -0700
Message-Id: <1440563561-28084-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] sanity.bbclass: remove forced abspath for SSTATE_MIRRORS
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
X-List-Received-Date: Wed, 26 Aug 2015 04:32:56 -0000

From: Christopher Larson <chris_larson@mentor.com>

The sstate URI is relative to begin with, so it's completely valid to want to
alter it in a way that keeps it relative using a mirror, and I have real world
cases where this is causing issues. Remove the check which errors out on
relative file:// paths.

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


