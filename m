Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6C1C54E69
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:21 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.14871.1709739735633302296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Smt1mi8x;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56682b85220so11153527a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739734; x=1710344534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSf9wS1p9mewbCviPcCPaDnYcYoT/ORojY4mRNyr/pM=;
        b=Smt1mi8x379wY5+cwDTuid9M33HcyKQlKo8/Zx/m5uUQngt2+3iMZO4LNDD1qiuZYK
         niY36zZQ0xctSB65wGLwhqwCA5Jaey1tjbwPDnMgIJYLg7OHLvHHEcqXTpu06VDF1WOI
         aaMoKr1H1cd/4x3xh16flv47ivgTro8g4sgnMgpMmVvHiA06f1AqPy7NKRGuQSoTOyds
         ilg0dpm3EsKUUFaiK9n41hk2S5lDXBauFvUKay4veAV2OZuskr9X6B3jfBeXknLPtOwF
         /5/Dm74FndojmmyFgl7htnu9o7tDNpO0VL54fzsEasQwiSDHznnyZPrupl4H6ziV5UDb
         3+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739734; x=1710344534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSf9wS1p9mewbCviPcCPaDnYcYoT/ORojY4mRNyr/pM=;
        b=NIioDmT8KhiYwWlgBJ8BI70J0hEgAB9Uu6mNXyC9lhZe5kk5LUIaWfk+0Fhx5TjMN6
         OvaO7Rcv1WwVaZjUXkeO2k94pE23203EbBYrGl/jZdsV+QzL2lVAlClnhogYEjD+ceY4
         0H2/maEYzQpPNvUI/LOyhf5INOQ2TayYWqX3BPSUkPccYc7ER4v132NJEjr9Mvf4QpTH
         soYKv5j3riw6nNRU7A1yRQEBw8ixWpwIKTzz36FTS9g2/EWjQhPsUdDI0Do048Fke0hB
         nGIug3maPFPFk4X5BPLcw1znaaJiAOQy1QW50ci2mtQN/pCIVZg1cDWLiWteOtbzv2aL
         lLxA==
X-Gm-Message-State: AOJu0Yyh2OSbzAWFo4IAnX72Hv/WUybIUo3b2hAp34ATeIQpnviNKi6Y
	J++9Z3vuBkt7ulXVtw+WQd7KjQqNE/QYjkFaN5z4dI+dJaaTzfEw0fzuqyoP
X-Google-Smtp-Source: AGHT+IEh6amn5kUo3BW7WW67nNCnfToiMf1Ts24ykbNaV2OVK4N/zp01q4sy8XAm0YBoKj+wWhIS0Q==
X-Received: by 2002:a17:906:2516:b0:a3e:39f7:52b4 with SMTP id i22-20020a170906251600b00a3e39f752b4mr11135193ejb.49.1709739734000;
        Wed, 06 Mar 2024 07:42:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/47] man-pages: upgrade 6.05.01 -> 6.06
Date: Wed,  6 Mar 2024 16:41:29 +0100
Message-Id: <20240306154151.3741709-25-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196708

License-Update: formatting, file names, http -> https, additional license snippets (which are all BSD-type).
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-man.ml-do-not-use-dev-stdin.patch    | 33 +++++++++++++++++++
 ...man-pages_6.05.01.bb => man-pages_6.06.bb} | 15 ++++++---
 2 files changed, 43 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/man-pages/man-pages/0001-man.ml-do-not-use-dev-stdin.patch
 rename meta/recipes-extended/man-pages/{man-pages_6.05.01.bb => man-pages_6.06.bb} (64%)

diff --git a/meta/recipes-extended/man-pages/man-pages/0001-man.ml-do-not-use-dev-stdin.patch b/meta/recipes-extended/man-pages/man-pages/0001-man.ml-do-not-use-dev-stdin.patch
new file mode 100644
index 00000000000..ec2d0600c7e
--- /dev/null
+++ b/meta/recipes-extended/man-pages/man-pages/0001-man.ml-do-not-use-dev-stdin.patch
@@ -0,0 +1,33 @@
+From f16cd8c4986b7f250e8465dfbe4bda8d366e05dd Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 4 Mar 2024 14:35:16 +0100
+Subject: [PATCH] man.ml: do not use /dev/stdin
+
+This was introduced in https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?id=30c38a8bf8ae8f4a6e71d3b8ac4abf0a40778f1e
+(presumably to build a 'sed | install' pipeline instead of previous 'install; sed' sequence),
+but it doesn't work under pseudo where /dev/stdin is absent.
+
+Upstream-Status: Inappropriate [yocto specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ share/mk/install/man.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/share/mk/install/man.mk b/share/mk/install/man.mk
+index b9865b9..06880f0 100644
+--- a/share/mk/install/man.mk
++++ b/share/mk/install/man.mk
+@@ -60,10 +60,10 @@ $(foreach s, $(MANSECTIONS),                                                  \
+ 
+ $(_manpages):
+ 	$(info INSTALL	$@)
+-	<$< \
+-	$(SED) $(foreach s, $(MANSECTIONS), \
++	$(INSTALL_DATA) -T $< $@
++	$(SED) -i $(foreach s, $(MANSECTIONS), \
+ 		-e '/^\.so /s, man$(s)/\(.*\)\.$(s)$$, $(notdir $(man$(s)dir))/\1$(man$(s)ext)$(Z),') \
+-	| $(INSTALL_DATA) -T /dev/stdin $@
++	$@
+ ifeq ($(LINK_PAGES),symlink)
+ 	if $(GREP) '^\.so ' <$@ >/dev/null; then \
+ 		$(GREP) '^\.so ' <$@ \
diff --git a/meta/recipes-extended/man-pages/man-pages_6.05.01.bb b/meta/recipes-extended/man-pages/man-pages_6.06.bb
similarity index 64%
rename from meta/recipes-extended/man-pages/man-pages_6.05.01.bb
rename to meta/recipes-extended/man-pages/man-pages_6.06.bb
index f0eb1a6132d..fa2e6b266e3 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.05.01.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.06.bb
@@ -4,19 +4,24 @@ SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
 
-LIC_FILES_CHKSUM = "file://README;md5=cbd51cd3dd298230df8ddd4637e65c37 \
-                    file://LICENSES/BSD-2-Clause.txt;md5=d0f280d1058e77e66264a9b9e10e6c89 \
-                    file://LICENSES/BSD-3-Clause.txt;md5=71f739ef75581cae312e8c711bcdab16 \
+LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
+                    file://LICENSES/BSD-2-Clause.txt;md5=9e16594a228301089d759b4f178db91f \
+                    file://LICENSES/BSD-3-Clause.txt;md5=407426fcc1a243b7b2eff6e35c56aca9 \
                     file://LICENSES/BSD-4-Clause-UC.txt;md5=1da3cf8ad50cd8d5d1de3cfc53196d01 \
                     file://LICENSES/GPL-1.0-or-later.txt;md5=e5b7c80002ef72ab868b43ce47b65125 \
                     file://LICENSES/GPL-2.0-only.txt;md5=3d26203303a722dedc6bf909d95ba815 \
                     file://LICENSES/GPL-2.0-or-later.txt;md5=3d26203303a722dedc6bf909d95ba815 \
+                    file://LICENSES/Linux-man-pages-1-para.txt;md5=97ab07585ce6700273bc66461bf46bf2 \
+                    file://LICENSES/Linux-man-pages-copyleft-2-para.txt;md5=1cafc230857da5e43f3d509c425d3c64 \
                     file://LICENSES/Linux-man-pages-copyleft.txt;md5=173b960c686ff2d26f043ddaeb63f6ce \
+                    file://LICENSES/Linux-man-pages-copyleft-var.txt;md5=d33708712c5918521f47f23b0c4e0d20 \
                     file://LICENSES/MIT.txt;md5=7dda4e90ded66ab88b86f76169f28663 \
                     "
-SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
+           file://0001-man.ml-do-not-use-dev-stdin.patch \
+           "
 
-SRC_URI[sha256sum] = "b2dd44ca0342b50923291f06bdba38c42438e10c04843ce1f731cf3f50631e0a"
+SRC_URI[sha256sum] = "006906e7be81a71c2d347809597bcb91485fa7fa488acdaa79e681ddfa894568"
 
 inherit manpages
 
-- 
2.39.2


