Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10368C43219
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.324.1636573191354886075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZbsGNShA;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id i5so5942379wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RketXntlqgf6uozjq8A60/lnqYd2PWhTXti3RksE4ug=;
        b=ZbsGNShA0MwKZHAogD4d32qMfNzYcufSAmvOfeBHy5F/S3Y0ue8TJnWXBbcwQJtWx6
         Jfou6kv9kdTySVPlTWYhFlka+vv2cEZrd+BFFJ6CcDP4b4P03SiSe83k0DjP8UiROFs4
         HhDt/NJSntNZN5R9ATZcHwk5WDpzlYXVjCW9SwnKGfJZj5/I48PjXpDFs+i+GYXyxtgj
         NTIGUVzCxO0dqkwgWmO8klwOrwrXP8FIeC7MntPqWmG9q6hptTwIlQs1uTAuCkxgSPMp
         3Fvh9l4h21mlbFmeRjAmKVw/Z+mQRv8vr5+ij8XTTqmPgQs4tQCdumQBKGZygcw5O6yh
         OqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RketXntlqgf6uozjq8A60/lnqYd2PWhTXti3RksE4ug=;
        b=xTAGxrBYXazKoXtIjJaNW0OTGlXVxtzj6k75jpMd1I9YJ+Ne5I9/3/NmR2ul5MRwG4
         PSOvu9saI7K4nZHOhc1CobPlslgvLi0mui62V3abFLsZMFWBYxvj8EHEGVE2F8Xn4sj+
         gfLx1VNurDaJoLfM+vOvCNPcxfhMX6XvkwljyRbHx4IycmfGbVL05JOoeqOSvLa/hxgu
         Sp8fi4VfgWCFboUB+yqjo2qYaEyQmpo5aOGKtGgYjcBcIG3mPFqT61TSCD6TJTSeNLAb
         /kSjoS274Ae7sawm/h+OM/lQ4msC+IWcmlP2N5RuPk7t8Pp4KpEKJDusP9PYqvOwie55
         Ib5g==
X-Gm-Message-State: AOAM530ici5R2nVCkPhNqis68rE2CWH+r7siwILVKo7EA5IrYx0iNRSK
	vggVoaBS+IFMOf+z9heGLjlw86VnrXc=
X-Google-Smtp-Source: 
 ABdhPJyLXrByLt3pPn60uTIUCcRfZcQJ/gT+QitBTKMWqbAHsfp4uBtoA560YLAFi4lcpZv5Wx6gNw==
X-Received: by 2002:a5d:522e:: with SMTP id i14mr1875978wra.43.1636573189974;
        Wed, 10 Nov 2021 11:39:49 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/24] python3-packaging: upgrade 21.0 -> 21.2
Date: Wed, 10 Nov 2021 20:39:25 +0100
Message-Id: <20211110193937.2606747-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158096

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...dbf19e2b76ab025efc11208bd50e09e8223e.patch | 37 +++++++++++++++++++
 ...ging_21.0.bb => python3-packaging_21.2.bb} |  4 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-packaging/8cb9dbf19e2b76ab025efc11208bd50e09e8223e.patch
 rename meta/recipes-devtools/python/{python3-packaging_21.0.bb => python3-packaging_21.2.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-packaging/8cb9dbf19e2b76ab025efc11208bd50e09e8223e.patch b/meta/recipes-devtools/python/python3-packaging/8cb9dbf19e2b76ab025efc11208bd50e09e8223e.patch
new file mode 100644
index 0000000000..42b1dc133f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-packaging/8cb9dbf19e2b76ab025efc11208bd50e09e8223e.patch
@@ -0,0 +1,37 @@
+From 8cb9dbf19e2b76ab025efc11208bd50e09e8223e Mon Sep 17 00:00:00 2001
+From: Moyiz <8603313+moyiz@users.noreply.github.com>
+Date: Tue, 2 Nov 2021 21:42:53 +0200
+Subject: [PATCH] Revert pyparsing constraint (#482)
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ setup.py                   | 2 +-
+ tests/test_requirements.py | 4 +++-
+ 4 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index c6a1caec..419aa284 100644
+--- a/setup.py
++++ b/setup.py
+@@ -48,7 +48,7 @@
+     author=about["__author__"],
+     author_email=about["__email__"],
+     python_requires=">=3.6",
+-    install_requires=["pyparsing>=2.0.2,<3"],  # Needed to avoid issue #91
++    install_requires=["pyparsing>=2.0.2"],  # Needed to avoid issue #91
+     classifiers=[
+         "Development Status :: 5 - Production/Stable",
+         "Intended Audience :: Developers",
+diff --git a/tests/test_requirements.py b/tests/test_requirements.py
+index 8cc45687..f2c209c4 100644
+--- a/tests/test_requirements.py
++++ b/tests/test_requirements.py
+@@ -192,4 +192,6 @@ def test_sys_platform_linux_in(self):
+     def test_parseexception_error_msg(self):
+         with pytest.raises(InvalidRequirement) as e:
+             Requirement("toto 42")
+-        assert "Expected stringEnd" in str(e.value)
++        assert "Expected stringEnd" in str(e.value) or (
++            "Expected string_end" in str(e.value)  # pyparsing>=3.0.0
++        )
diff --git a/meta/recipes-devtools/python/python3-packaging_21.0.bb b/meta/recipes-devtools/python/python3-packaging_21.2.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-packaging_21.0.bb
rename to meta/recipes-devtools/python/python3-packaging_21.2.bb
index f20f8886a4..5e9541082f 100644
--- a/meta/recipes-devtools/python/python3-packaging_21.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_21.2.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "7dc96269f53a4ccec5c0670940a4281106dd0bb343f47b7471f779df49c2fbe7"
+SRC_URI[sha256sum] = "096d689d78ca690e4cd8a89568ba06d07ca097e3306a4381635073ca91479966"
+
+SRC_URI += "file://8cb9dbf19e2b76ab025efc11208bd50e09e8223e.patch"
 
 inherit pypi setuptools3
 
-- 
2.20.1


