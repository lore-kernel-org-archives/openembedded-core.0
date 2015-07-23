Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id DF20576239
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 19:57:17 +0000 (UTC)
Received: by pacan13 with SMTP id an13so1291474pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 12:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lwLrFGRzYmU/Ulfqpu1JDqd/gPYqn6LIK8tl4sgvni0=;
	b=VEYvPORj/EZ5NG9offJGUUUE0zvKKvFopU9DQOx5JiDm4zuODepd4v++FJqzLoRODn
	ZbM+L2nUJxFYYg7hqiBrKim4av8eRwmXDwuz6/E/ih7j60vXYxzPMrQ2fA+iMpptnz/9
	7iFC2KNQoBt+w/H0hjs5f1yxyAqgwsTnhGiCdpb155NtBWgeQNQ0dWmaCoINd59YK+m1
	gogPKetThcONToudVgE9uTXLvykENI/ShpLV2yDUe1I0BBOmAcxmrzLgGZ0qXnhEJVvF
	N/AquQ5qGwX64dsRpkqHikmhsoxXph0ryBVz3IuegvY2gkq/V3AA7FnbQTd9lasumTuC
	91sA==
X-Received: by 10.66.142.73 with SMTP id ru9mr22129976pab.78.1437681437472;
	Thu, 23 Jul 2015 12:57:17 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id j9sm5019734pdl.65.2015.07.23.12.57.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 12:57:16 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 12:58:06 -0700
Message-Id: <38fd16a3ab690b57f0b920bb961881ccdef04fb2.1437663603.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1437663603.git.chris_larson@mentor.com>
References: <cover.1437663603.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCHv3 1/7] recipetool: catch BBHandledException from parsing
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
X-List-Received-Date: Thu, 23 Jul 2015 19:57:20 -0000

This ensures that we don't see a traceback on parsing failures.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/recipetool | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/recipetool b/scripts/recipetool
index c68bef4..3063cf7 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -82,9 +82,11 @@ def main():
 
     scriptutils.logger_setup_color(logger, args.color)
 
-    tinfoil_init(getattr(args, 'parserecipes', False))
-
-    ret = args.func(args)
+    try:
+        tinfoil_init(getattr(args, 'parserecipes', False))
+        ret = args.func(args)
+    except bb.BBHandledException:
+        ret = 1
 
     return ret
 
-- 
2.2.1


