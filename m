Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD0D76BDE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:19:00 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so2988218pad.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=U9dx/3MbWRuWWpErhQqiAYPCaD9WyZcqIvWT591W8uo=;
	b=s/bULrAoq8OZC/WhkWAeU0r5GUQGOmrbnJTeZeJt4K7i4YhK0KOc0auDh1OKR08nL0
	LOjYyKvyU4pHUh07xsj1O/onOCnHvB6B3qNSDNZN5zP1vEYadGnA4EZdE07Q9DvxKVw7
	60Mg+y5rOgmGAeea0vx0pxCGievqZ+76t/3NJ9J28NDhaKVx5gt0DScT2T2k4EYyls/v
	p5L9vOU26uHJCb0m6sRf0BvPX01Ab73trFt44+m7wjcN2atPasTelTGkM9IVEVrDzX6J
	NDFrWKkx82CxMXucmi7KHPZj9dg2zNnBu1vju30Ynsh6h1LCkP/9uVwBEXnkBDrmZEUx
	iasg==
X-Received: by 10.66.102.71 with SMTP id fm7mr49289892pab.5.1440454741291;
	Mon, 24 Aug 2015 15:19:01 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	mc1sm18565465pdb.14.2015.08.24.15.18.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:19:00 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:18:38 -0700
Message-Id: <b901c63c2bad573a33437792ab6c312924470eed.1440454289.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <88f419e3f0f9c1a3fa5619641be68b9832de9196.1440454289.git.chris_larson@mentor.com>
References: <88f419e3f0f9c1a3fa5619641be68b9832de9196.1440454289.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440454289.git.chris_larson@mentor.com>
References: <cover.1440454289.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 6/7] bitbake.conf: set USE_NLS based on DISTRO_FEATURES
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
X-List-Received-Date: Mon, 24 Aug 2015 22:19:01 -0000

From: Christopher Larson <chris_larson@mentor.com>

If our libc doesn't support locales, we don't need gettext nls bits enabled.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4250ca5..0ef185d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -114,7 +114,7 @@ TUNE_ASARGS ??= ""
 TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
 LIBCEXTENSION ??= ""
 ABIEXTENSION ??= ""
-USE_NLS ??= "yes"
+USE_NLS ??= "${@bb.utils.contains('DISTRO_FEATURES', 'libc-locale-code', 'yes', 'no', d)}"
 SDKUSE_NLS ??= "yes"
 
 TARGET_ARCH = "${TUNE_ARCH}"
-- 
2.2.1


