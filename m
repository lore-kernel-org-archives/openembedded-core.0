Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 176E9753C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 22:39:23 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id d8-v6so7936948wro.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 15:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=I1NBgaCePJ186PBInsyOQVlZsQmnrAJSjDS3xWudYE0=;
	b=hopaoNHy8TPMVuaaaHs6SfGlpfvlzNznvFtiVuzR6KiF16XJ6fmK8EtlI/e/jrVIAz
	0HYoO4s44LGd+tOl6xpR+aVvxCtd2HUIORnGA3n6j2babhrPQ3UUFxyPObeLzsIoX2cR
	Pz26qFqoJ+AAE4uGPnl0sxPvNKSfbzi2XlpGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I1NBgaCePJ186PBInsyOQVlZsQmnrAJSjDS3xWudYE0=;
	b=W/FYCoiGy3+ui4BkMrDwyHL4KXDXiwcW/HGw2uXIZZqpu5rtMjszsu5H6Kz/DruqJi
	OCLrIy/ReQ8qVhEVcTXOUerDEfuUUgMZWpX1Gu/ccP7/YVfDQTWWZ/C6ahBR5Tgms1/W
	aLTsMRVRAI8/uf2c32cr36dCO9gF6lqxPc5+ZO07QJv//N3MIiK6yW/rg+j2+k0ySo94
	c/rbg+MVeYjKqpY6sHp06iSLxZy98T6zHSbx8MEUQy8HwbsncVBdt8rSxpopzWseJrg9
	DQJcpeAtg4aVL85vugVua4WZCPm7PPz7SwUn18PhmWnyBnEz2el31rdTIQBQVhxdyKbz
	Gejg==
X-Gm-Message-State: APt69E2/NFxE0Tg1/YZ9PqxOPb12xWlPiWmW5/X73KAyipAMd451KPs6
	8URBlqRYeo3Qr0WnGsI87o46OHoBVRE=
X-Google-Smtp-Source: ADUXVKKhp9tOoEdVPdMT3DhUVAhA9eGaXPe/6O+W9wcfD18TglBQa+hDAFp7z09kEuzgbVukRlOwOA==
X-Received: by 2002:adf:a801:: with SMTP id
	l1-v6mr3467113wrc.201.1528324764523; 
	Wed, 06 Jun 2018 15:39:24 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	90-v6sm51890165wrl.79.2018.06.06.15.39.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 15:39:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 23:39:22 +0100
Message-Id: <20180606223922.10747-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] rpm: Fix patch to ensure variables aren't used uninitialised
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
X-List-Received-Date: Wed, 06 Jun 2018 22:39:24 -0000

Recent patches were applied which removed a function which set the xx
variable. This means xx can be uninitalised and prerm functions can fail.

This adjusts the patch to ensure the xx value isn't used in such a way.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...the-PATH-environment-variable-before-ru.patch | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
index a38675f89c9..bf24d43eb9a 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
@@ -6,6 +6,9 @@ Subject: [PATCH 1/2] Do not reset the PATH environment variable before running
 
 We add lots of native stuff into it and scriptlets rely on that.
 
+Also need to remove the xx test later in the function since the
+value could now be used un-initialised.
+
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
@@ -25,6 +28,13 @@ index 92f949fa2..7c1aa75a8 100644
  	free(ipath);
      }
  
--- 
-2.11.0
-
+@@ -206,9 +206,7 @@ static void doScriptExec(ARGV_const_t ar
+ 	/* XXX Don't mtrace into children. */
+ 	unsetenv("MALLOC_CHECK_");
+ 
+-	if (xx == 0) {
+ 	    xx = execv(argv[0], argv);
+-	}
+     }
+     _exit(127); /* exit 127 for compatibility with bash(1) */
+ }
-- 
2.17.1


