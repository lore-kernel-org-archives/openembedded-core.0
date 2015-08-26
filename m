Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id AE461734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 04:42:03 +0000 (UTC)
Received: by wijn1 with SMTP id n1so11558969wij.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 21:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AlItKdFuxhuLmWVxNLtD+ooK86XMr4mh8di6+uZDANA=;
	b=eJKhgK5+OLo924J+LprxhnCuP4dDYaN4zB1pwt9HkTCe3n4olMZw8eXDMkTX3XaI52
	1KBzLZ0UCJyseap2DVt8lvcvM9TY0r0Tl9dI2p8VALoiT6NZjabPTErHz/MswFaxe+WK
	11bqhHZfzmYrVk06Vb6TYv3sh+MRc1poD/p9buikSVaMSPOsdagtxTDvnAib4Rye0zqB
	YzPqhDX0SYAzSIRVQ+EU1OOTzIPtVPJPrvazMwvmpqkiAY8vOXxHvypv2SifRXpwFPzt
	Cb9sUUcL3S1iDcHNjd8mKRu73tz2AeAJRQAHPpuVQqX18yfpr2FbdnlfCiYh2YdjjVTH
	CPgw==
X-Received: by 10.194.122.200 with SMTP id lu8mr53293112wjb.83.1440564123266; 
	Tue, 25 Aug 2015 21:42:03 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	cd16sm5586204wib.19.2015.08.25.21.42.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Aug 2015 21:42:02 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 21:41:52 -0700
Message-Id: <1440564112-28879-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1440563739-28496-1-git-send-email-kergoth@gmail.com>
References: <1440563739-28496-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv3] sanity.bbclass: remove abspath warning for SSTATE_MIRRORS
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
X-List-Received-Date: Wed, 26 Aug 2015 04:42:07 -0000

From: Christopher Larson <chris_larson@mentor.com>

The sstate URI is relative to begin with, so it's completely valid to want to
alter it in a way that keeps it relative using a mirror, and I have real world
cases where this is causing issues. Remove the warning.

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


