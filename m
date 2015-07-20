Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 21D8775979
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 22:15:13 +0000 (UTC)
Received: by padck2 with SMTP id ck2so107161317pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 15:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lwLrFGRzYmU/Ulfqpu1JDqd/gPYqn6LIK8tl4sgvni0=;
	b=id2OwkqqL6351Wc5504WKrp2N88vU0FhgjWZVlME68WSdsx0BdhESQrRUvY4rPL+y8
	VjiK+z+3c7N56sskDd5RysyvvpPGSU0eRMo41LvQifaGT5BlUdYYCxqjBI7gR4cksRd1
	g5jOIA28Y3cATt2o5PNzIZOWCdhXAMDyp8ajF22kw7mzZ7aNkwAI4vQOYbEtmUEFL7Pc
	U8lpwQuin8XajuQITKvSx43cckR+xaJFx4EtpN2f7OxvP/nGHaJdAopDVU0gK0AuyLp8
	E3esh7zgao71iBUoIA/NacLoASgsvL+lKJANA6Aa7oOdadsWHSO76yDT5ed56M49ckl7
	ROsg==
X-Received: by 10.70.49.43 with SMTP id r11mr63694138pdn.91.1437430514028;
	Mon, 20 Jul 2015 15:15:14 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	f1sm23612727pdp.39.2015.07.20.15.15.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jul 2015 15:15:12 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jul 2015 15:15:51 -0700
Message-Id: <c5e5bbd5f85ed4ae437815656889d328da25e75b.1437430369.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1437430369.git.chris_larson@mentor.com>
References: <cover.1437430369.git.chris_larson@mentor.com>
Subject: [PATCHv2 1/6] recipetool: catch BBHandledException from parsing
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
X-List-Received-Date: Mon, 20 Jul 2015 22:15:14 -0000

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


