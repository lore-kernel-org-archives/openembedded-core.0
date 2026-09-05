Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB25C79F8B
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 18:43:38 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.678.1788633813084059966
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 11:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kyuAdxFF;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d58efc7356so26125595ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 11:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788633812; x=1789238612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tRchRA5hUCsuaXO97G+s91MbNT5b5lMbC6RTLftdIOE=;
        b=kyuAdxFFNQDa2tdRtYBhwxzZSwBGrOj25qzob7D9PZ642tOCIZXtH5NmUTOJdsTlEy
         86V0jY0bFZCDin8PLFKHC1Ot6JvhOohJ7jg6QQ5Z21Q7HfTGua/e/92uWACGQQVNMIkA
         1cpHnUZwvIAV74PEHpd/Mf+QuXZ8PeO3tKGFcO7F5IfBYFrW1emy/r5Xoh8iia32pkMg
         pCUjk6fQa4o2myJDfN7BkCZ2ID6zM49eydarLC3JKZC2DrIOc/cFfWjztzwFb+mBOFI3
         KQPGrV+1qoSGh7LWCxx5BpVMX6yTrACPBRg0xgZTKirqhRKi8EZcrn/4S+EzvLTD+vEg
         cYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788633812; x=1789238612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tRchRA5hUCsuaXO97G+s91MbNT5b5lMbC6RTLftdIOE=;
        b=mTKJm6dygXfdlPK73h9JJDzPFbaWVwcJ/DhqIP6w5EPTBpVTIF4yp2wiu0EoID+cCF
         ORhhkaRzUgYlduruttF3vgu6HD8qZPutxQVE5wm7UuqTq1AFrXFeHszIZTcHb08HyaTU
         pYR+4860e6+IkaVz6OG3cthtk+fkmaYKJN4mlmTpgxr5+hFeOh+ejxDwakfkUMizo8nR
         bPo/TLqmC03S/uTxcWqwxS+XfPGlJVy+sf0Po7lfV05drkDKo/IAIryFiNkaBvnglMw/
         HhnTo4NGh6uHEB6/HWG9/+w9KC9d3RsC3IfDQW73UBQ0dKg1vmOQaGfpbsiACADYD6E8
         4RyA==
X-Gm-Message-State: AFuF++m4Ugtw4eO30HvUMXIjh3LVzFigYeL9qyorzyR23ljKSFBehHZg
	kA0XFDiNHVktKzn6WAwe1KURFWTXNYK+yCRFfE0FUIbsK38+3Itsq/Lv9oCbhg==
X-Gm-Gg: AYBFou2LX1ANfK4oUTLYHhvOzr8s1y4V4H3lWk5Vz/tYrljUjyLS4LUbsqQAib/s0Z/
	EgqPMovq0wk2khSM52KeF8j4lyQpxKBzFxYhmXwmCzAHB2heCrke1Eyimf2WsSbKB22dqI91N+R
	Fi/+sg9JzHfGPgXUeNCo/u9GbUHUuwHPYB4uydeLC3Ll0C6Qn9J4nS8WscT8FoqED3PY85qZzoq
	swa+daMWZ501TvzLadau4pa3iTmR+d++WEstfWYf24ibxJlxytRp5gvKzYARA1keGxkw4nCpdJo
	CgIPGBt0EB2WTMsihC9tFrAtG7mM8nbLgAOckBGRIcMZhmHN0Y1Tu0EPIHhn5YNKpo5rSu6bffz
	YhmR8jFjR0F9zk/lQlSvEGnnTa/BPu9nYQKoWAwGeJ62nYmoqJoyjdcgG982Zb7XNRvVnmGye6T
	V1KOEikraI3ZscX7gD2BD8jf93SfHSwTOgW2CjIUdDnWiUY1f1PsbfNOBYlaoQMlQcU84rrlzIC
	M520H+tUctqshApJ9jRaoznh62XX9UJknFrwOUG6trz/DMtW0u16Kmu2tE9UhkLzO0V5gPxyBey
	a81J30tcjiSI0ODWiFJefGBgQXqxAlriq3rO8fQHZ6bH6tIY0mOsB20aKLNhNv0r7d6XHOylEk5
	KBIN2TxUWjWaDd/at04ob102CnfvxqYSHvKNPp1TLkQYBCLc4/kQJf4d5
X-Received: by 2002:a17:90b:224c:b0:398:9bd5:490f with SMTP id 98e67ed59e1d1-39b2624cf31mr18802904a91.22.1788633812226;
        Sat, 05 Sep 2026 11:43:32 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm13410256eec.11.2026.09.05.11.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 11:43:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] python3-typing-extensions: Fix build with flit-core 4
Date: Sat,  5 Sep 2026 11:43:28 -0700
Message-ID: <20260905184328.3263998-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 18:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245150

Fixes
 ERROR Unmet dependencies
|       flit_core<4,>=3.11
|               wanted: <4,>=3.11
|               found: 4.0.2

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...4d71b18eee56c53dde6a609dea188bb26a96.patch | 21 +++++++++++++++++++
 .../python3-typing-extensions_4.16.0.bb       |  2 ++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-typing-extensions/996d4d71b18eee56c53dde6a609dea188bb26a96.patch

diff --git a/meta/recipes-devtools/python/python3-typing-extensions/996d4d71b18eee56c53dde6a609dea188bb26a96.patch b/meta/recipes-devtools/python/python3-typing-extensions/996d4d71b18eee56c53dde6a609dea188bb26a96.patch
new file mode 100644
index 0000000000..226c65c13c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-typing-extensions/996d4d71b18eee56c53dde6a609dea188bb26a96.patch
@@ -0,0 +1,21 @@
+From 996d4d71b18eee56c53dde6a609dea188bb26a96 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
+Date: Mon, 24 Aug 2026 18:40:42 +0200
+Subject: [PATCH] Allow building this package with flit-core 4 (#787)
+
+Upstream-Status: Backport [https://github.com/python/typing_extensions/pull/787]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,6 +1,6 @@
+ # Build system requirements.
+ [build-system]
+-requires = ["flit_core >=3.11,<4"]
++requires = ["flit_core >=3.11,<5"]
+ build-backend = "flit_core.buildapi"
+
+ # Project metadata
diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
index cede81e128..484f0164bc 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
@@ -15,6 +15,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
+SRC_URI += "file://996d4d71b18eee56c53dde6a609dea188bb26a96.patch"
+
 SRC_URI[sha256sum] = "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
 
 inherit pypi python_flit_core

