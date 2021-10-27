Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D771C4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.9299.1635325675675491668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cVrOLahO;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 131-20020a1c0489000000b0032cca9883b5so4318356wme.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OQezZIkEaMjQNPYqq0a12H/6OOJXGJVQ3FdAa0gqUj0=;
        b=cVrOLahOlQxAdfYUNdV1Fa/dKgotQnJKTMMOOIEA2NdOP+K2tj6ebvd7FfoCjP8+aY
         0sKZ9AM1Vc+5/FlcAlO1XKjTgVRP24Q7ryTBwml9Y4CC9IJW7NqmXJW8X4IlZ+zE/uAy
         xs5fYKONm0LlJ+d5Xh7HWpbrI+9kIRF/6c3Wox6PfIY21DcrUG1+exqWrmyMMLPWWJvb
         Oe9WEQpWziFgwN7H66xfdXTgbT8ut/8nnED5L91y9YOS1rgo1AtoF6f/MFOdwlYlSoTp
         ukszks6LcW3tIxeMhV2uEBUN4SZtjj+SuJdW3HoxbrH8FbdDTtFvykqVdZucKdjq+5UM
         KbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OQezZIkEaMjQNPYqq0a12H/6OOJXGJVQ3FdAa0gqUj0=;
        b=dlSQiQbLWR4K8HQ4w5NB8IgUuqpLP0b6/2s0wADqOH/jHsUQox9wW6yVAYqi6WI90C
         hxj7/tY8OVzp06Le5y+Ozv2El4HtTBh84TQd2Cu/b/0FWhLWOxdWsoWA5rbF/h4/fJcK
         wPl61NZspFVKYaHA6GU0pMBeFvdU1PPEw62kZwRo5z6B5XVQXizIvmyQ7GYn9u5rxiwX
         39rwZHpdpOwJ6zhcotEnYtaVrX4kxZvd2o++GQ2GxxZ3BC1nTgfx8WmmWobZbG9Y0z03
         Eik2yLZYtMC4/ONhniQCdLIKQ7lEIDsKSMo8n5kRNFCdUPJ7pcH2ImRTRAi2aT6t4S8I
         batg==
X-Gm-Message-State: AOAM533Cevn7Yjh/u3tIoVj2jy1Nn7s15hztTd0UYsS81/PLaLgl7hCj
	dr3faQ/8Gt6ukWZbXGEzbyR1FU3urSk=
X-Google-Smtp-Source: 
 ABdhPJzA0+zIurlJ7R0XJqBMr4U5G6Ih/uGUVIdUAxT3DVXXM78SoKWi3s907d4IACWiF7KahBHkhw==
X-Received: by 2002:a1c:19c5:: with SMTP id 188mr4498105wmz.145.1635325674252;
        Wed, 27 Oct 2021 02:07:54 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/30] gptfdisk: address ncurses 6.3 compatibility
Date: Wed, 27 Oct 2021 11:07:30 +0200
Message-Id: <20211027090736.2546759-24-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157500

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...gptcurses-correct-ncurses-6.3-errors.patch | 99 +++++++++++++++++++
 meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correct-ncurses-6.3-errors.patch

diff --git a/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correct-ncurses-6.3-errors.patch b/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correct-ncurses-6.3-errors.patch
new file mode 100644
index 0000000000..9d0443e524
--- /dev/null
+++ b/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correct-ncurses-6.3-errors.patch
@@ -0,0 +1,99 @@
+From e301f7dd650c9e56f954a7c49661d938079e1a9b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 25 Oct 2021 17:27:51 +0200
+Subject: [PATCH] gptcurses: correct ncurses 6.3 errors
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ gptcurses.cc | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/gptcurses.cc b/gptcurses.cc
+index d0de024..70be999 100644
+--- a/gptcurses.cc
++++ b/gptcurses.cc
+@@ -235,22 +235,22 @@ Space* GPTDataCurses::ShowSpace(int spaceNum, int lineNum) {
+       ClearLine(lineNum);
+       if (space->partNum == -1) { // space is empty
+          move(lineNum, 12);
+-         printw(BytesToIeee((space->lastLBA - space->firstLBA + 1), blockSize).c_str());
++         printw("%s",BytesToIeee((space->lastLBA - space->firstLBA + 1), blockSize).c_str());
+          move(lineNum, 24);
+-         printw("free space");
++         printw("%s","free space");
+       } else { // space holds a partition
+          move(lineNum, 3);
+          printw("%d", space->partNum + 1);
+          move(lineNum, 12);
+-         printw(BytesToIeee((space->lastLBA - space->firstLBA + 1), blockSize).c_str());
++         printw("%s",BytesToIeee((space->lastLBA - space->firstLBA + 1), blockSize).c_str());
+          move(lineNum, 24);
+-         printw(space->origPart->GetTypeName().c_str());
++         printw("%s",space->origPart->GetTypeName().c_str());
+          move(lineNum, 50);
+          #ifdef USE_UTF16
+          space->origPart->GetDescription().extract(0, 39, temp, 39);
+-         printw(temp);
++         printw("%s",temp);
+          #else
+-         printw(space->origPart->GetDescription().c_str());
++         printw("%s",space->origPart->GetDescription().c_str());
+          #endif
+       } // if/else
+    } // if
+@@ -267,10 +267,10 @@ int GPTDataCurses::DisplayParts(int selected) {
+ 
+    move(lineNum++, 0);
+    theLine = "Part. #     Size        Partition Type            Partition Name";
+-   printw(theLine.c_str());
++   printw("%s",theLine.c_str());
+    move(lineNum++, 0);
+    theLine = "----------------------------------------------------------------";
+-   printw(theLine.c_str());
++   printw("%s",theLine.c_str());
+    numToShow = LINES - RESERVED_TOP - RESERVED_BOTTOM;
+    pageNum = selected / numToShow;
+    for (i = pageNum * numToShow; i <= (pageNum + 1) * numToShow - 1; i++) {
+@@ -284,7 +284,7 @@ int GPTDataCurses::DisplayParts(int selected) {
+             } else {
+                currentSpace = ShowSpace(i, lineNum);
+                move(lineNum++, 0);
+-               printw(">");
++               printw("%s",">");
+             }
+             DisplayOptions(i);
+             retval = selected;
+@@ -632,7 +632,7 @@ void GPTDataCurses::DisplayOptions(char selectedKey) {
+          } // if/else
+       } // for
+       move(LINES - 1, (COLS - optionDesc.length()) / 2);
+-      printw(optionDesc.c_str());
++      printw("%s",optionDesc.c_str());
+       currentKey = selectedKey;
+    } // if
+ } // GPTDataCurses::DisplayOptions()
+@@ -744,11 +744,11 @@ void GPTDataCurses::DrawMenu(void) {
+ 
+    clear();
+    move(0, (COLS - title.length()) / 2);
+-   printw(title.c_str());
++   printw("%s",title.c_str());
+    move(2, (COLS - drive.length()) / 2);
+-   printw(drive.c_str());
++   printw("%s",drive.c_str());
+    move(3, (COLS - size.str().length()) / 2);
+-   printw(size.str().c_str());
++   printw("%s",size.str().c_str());
+    DisplayParts(currentSpaceNum);
+ } // DrawMenu
+ 
+@@ -798,7 +798,7 @@ void PromptToContinue(void) {
+ void Report(string theText) {
+    clear();
+    move(0, 0);
+-   printw(theText.c_str());
++   printw("%s", theText.c_str());
+    move(LINES - 2, (COLS - 29) / 2);
+    printw("Press any key to continue....");
+    cbreak();
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb
index 16fe540968..c5a153ab0c 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb
@@ -9,6 +9,7 @@ DEPENDS = "util-linux"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-gptcurses-correctly-include-curses.h.patch \
+           file://0001-gptcurses-correct-ncurses-6.3-errors.patch \
            "
 SRC_URI[sha256sum] = "95d19856f004dabc4b8c342b2612e8d0a9eebdd52004297188369f152e9dc6df"
 
-- 
2.20.1


