Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id DB7CA76B69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:18:56 +0000 (UTC)
Received: by pabzx8 with SMTP id zx8so15916173pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=JIWIina0woRQ9CCRuKOnvqelj5WK75Y7OHB2tY4bqVY=;
	b=uPNUc7trTkyfIYkUQx6f3JS1ka9qRcrDJR2y9CLrvvBNy3SSL7Hzkz3tbWn8TnNqOg
	+5Fi3PJ4vWaUsUBO1Dt7F52tBkHh1cVwxBByP/69+dx/r+nE3dwVvw+mavBta/ER+QAM
	gF0Z2bf/msfeW48QpQIYGCmcx/kLCnqUz6QkwVIPUzd9cmirA9gBxBwFmWY48cTrTk3B
	wWo4sOyAEC6n0ibBbhoKz9L4ppnPGF42O5fTPhTClBVaIP5hR8B2/oh3xJJQ+5TL7HSS
	Mg8pc5By1sTq+mdqFMZu46U9EQ/8zGJWuOG+cZb+N+AMvmhLMqPYZ+Sqja6y/kGnd0bv
	TP9A==
X-Received: by 10.66.141.11 with SMTP id rk11mr5235750pab.143.1440454737419;
	Mon, 24 Aug 2015 15:18:57 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	mc1sm18565465pdb.14.2015.08.24.15.18.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:18:56 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:18:37 -0700
Message-Id: <8fe38d7e8626e6ecb7074b02210d8a19f54936c4.1440454289.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <88f419e3f0f9c1a3fa5619641be68b9832de9196.1440454289.git.chris_larson@mentor.com>
References: <88f419e3f0f9c1a3fa5619641be68b9832de9196.1440454289.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440454289.git.chris_larson@mentor.com>
References: <cover.1440454289.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 5/7] bitbake.conf: unexport SHELL
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
X-List-Received-Date: Mon, 24 Aug 2015 22:18:56 -0000

From: Christopher Larson <chris_larson@mentor.com>

The user's shell shouldn't be allowed to affect the build (and it can break
the flock command and possibly more, if the user's shell isn't POSIX
compliant).

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/bitbake.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1407c5f..4250ca5 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -780,6 +780,11 @@ TARGET_ARCH[unexport] = "1"
 # (breaks sysvinit at least)
 DISTRO[unexport] = "1"
 
+# Make sure SHELL isn't exported
+# (can break any number of things if the user's shell isn't POSIX-compliant,
+# including the flock command). The user's shell shouldn't affect our builds.
+SHELL[unexport] = "1"
+
 # Used by canadian-cross to handle string conversions on TARGET_ARCH where needed
 TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
 
-- 
2.2.1


