Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8506260125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 22:00:04 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v11so425126wru.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 15:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LI6jMR1KoDD/I1HAvzZ9jfx2aOfGIch5wBmsdUOd7Hk=;
	b=NEG2XMomaQX1MZVuP6rcV8hrVWGI/VuNhsmwxgZ5IdVJUWxgK2XKnXxc034ynHGG/j
	8wd0cZaRpBJzX0+UPFP5KnqVlSaI95ViXPJTYMKU8g70B90f4MMV7njjlpmcJKx0iYy/
	inxwYekP+/qzestTYL6tJvNQroyVutWpcGdB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LI6jMR1KoDD/I1HAvzZ9jfx2aOfGIch5wBmsdUOd7Hk=;
	b=T6BSPeNQ0FTysFx+ArbK5B/J2rKNaef6JemZjbkv+r4jrrBl6WlpuDObba9fqQ7sJH
	/BVxNHuYySFfzK/vvZeiszQ9p7NuV27FtrzyELc7mwP+E1QyKMeEvreljQFPkzdSIuvC
	jSeVoGRt497/4F1emKysUNVMH7A4kpsNNRlzqpUoDjiRX5WNojgIJOG2mxUdFzVp/Ff4
	vJksXhUxIYKqKdmcUedl8+tQAa5ZR3cT/qEv22ZW7sbK+ylZkBpX/ggWAJ8ArptlCSEg
	EdsH22dKqHqFx3IF4IIWg8zpDjjjyycaS8g8ugl5SnWLbPN056TmAW9BearnWJgFuexa
	SEWg==
X-Gm-Message-State: APjAAAVxgDIBzXrPYVwSoWX/sbOjQ67FBiUgN3R+NUPJTvTVeO0VJ0js
	qc3D7gyBtjE4oXCO+Er9PdgtQMkfzVQ=
X-Google-Smtp-Source: APXvYqyptlOwp7OF5cOv5G8/kOqRCX/u38jtotED3rwe1wYLOCpLyk8TduEa25aW9MPfIQTN5FIbOg==
X-Received: by 2002:a5d:4945:: with SMTP id r5mr22282406wrs.328.1557871204848; 
	Tue, 14 May 2019 15:00:04 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k17sm75048wrm.73.2019.05.14.15.00.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 15:00:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 23:00:03 +0100
Message-Id: <20190514220003.25148-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] glib-2.0: fix last failing ptest
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
X-List-Received-Date: Tue, 14 May 2019 22:00:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

Upstream glib don't really actually test the test suite with modern glibc and
all the locales present so we're finding a number of bugs.  Backport another fix
from upstream to fix the test data with modern glibc.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../glib-2.0/glib-2.0/fix-nl-abaltmon.patch   | 44 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/fix-nl-abaltmon.patch b/meta/recipes-core/glib-2.0/glib-2.0/fix-nl-abaltmon.patch
index 5c1488bc41d..c36a397fefc 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/fix-nl-abaltmon.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/fix-nl-abaltmon.patch
@@ -1,4 +1,6 @@
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/merge_requests/828]
+Fix the last few remaining bugs in glib's date/locale code.
+
+Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 From 93d8482384ebc5c7d1f3d92b0190db0371269663 Mon Sep 17 00:00:00 2001
@@ -60,3 +62,43 @@ index c5d2ce5f8..08fa40ac5 100644
  
 -- 
 2.18.1
+
+From 35c28be32762d5af6b93cb6a3420c5977f7bf599 Mon Sep 17 00:00:00 2001
+From: Rafal Luzynski <digitalfreak@lingonborough.com>
+Date: Mon, 13 May 2019 23:11:28 +0200
+Subject: [PATCH] tests: Update month name check for Greek locale
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Update the abbreviated month name in the test to match the actual
+translation. Otherwise the test fails with false positive.
+
+Vocabulary:
+
+July (nominative)  - Greek: Ιούλιος (abbreviated: Ιούλ)
+Of July (genitive) - Greek: Ιουλίου (abbreviated: Ιουλ)
+
+This is similar to commit 4d215e006ee69bd7a993bf853722993433adbf9a
+and commit 7fe793e125c316ac34edd8158df5a132cb044bc1.
+
+Closes #1776
+---
+ glib/tests/date.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/glib/tests/date.c b/glib/tests/date.c
+index 8eb28712b..ff13ad101 100644
+--- a/glib/tests/date.c
++++ b/glib/tests/date.c
+@@ -388,7 +388,7 @@ test_month_names (void)
+       TEST_DATE ( 1,  4, 2018,   "%OB %Y",       "Απρίλιος 2018");
+       TEST_DATE ( 1,  5, 2018,   "%OB %Y",          "Μάιος 2018");
+       TEST_DATE ( 1,  6, 2018,   "%OB %Y",        "Ιούνιος 2018");
+-      TEST_DATE (16,  7, 2018, "%e %b %Y",        "16 Ιούλ 2018");
++      TEST_DATE (16,  7, 2018, "%e %b %Y",        "16 Ιουλ 2018");
+       TEST_DATE ( 1,  8, 2018,   "%Ob %Y",            "Αύγ 2018");
+     }
+   else
+-- 
+2.18.1
-- 
2.20.1


