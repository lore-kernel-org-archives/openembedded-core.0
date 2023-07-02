Return-Path: <sveyret@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEF3EB64D9
	for <webhook@archiver.kernel.org>; Sun,  2 Jul 2023 12:21:35 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.4489.1688300486988610032
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 05:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DzRztwk9;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: sveyret@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-313f0ca48c7so1125509f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 05:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688300485; x=1690892485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bnb2MlnA4DTgh9ehNRj5vohp1B0mDBQ7y3pzfFBSAyo=;
        b=DzRztwk9VWvXIr6Yb0xe0pkcxBQCDKzFRDKN/dik6aR36fHfjFZYQDDo+vGfzAR6id
         Y3/psUlEdzl1bw5V3OtpAOT7Y7oWsvhLO0/MPNW6jtr7dFTjshZM/i2W7cGWbVcnHNPU
         ph+ATwPLBnnXvXejH27VIHKfvNPfnXaXEAKjAiEzpFanRUF4Xzr2daVZQQJBp143FTBz
         ZgoC42Whk0BFwCaWqucoTRnr2UukbdBwMR7i5nXB0B02olKBvNqg++R53qaxKRtWBkbR
         A8mSWtvdK1y8JXlMV/GadGK+heWXNt4GQ+3DonTwY5obAa2734/4XSpajEDaiQVwyYGp
         +l2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688300485; x=1690892485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bnb2MlnA4DTgh9ehNRj5vohp1B0mDBQ7y3pzfFBSAyo=;
        b=VwMfABYkP+RFIKZ/1TLoCPFrwKAIIznxR4L01UnDP7ubWqxf5OjIlEjZTqRqTXwvqL
         8JF3sUZAo+FOkDTIVVs8ubF14KGFFvrby+YVwvqCddIxfQh7wg6Csv77OlXBuafyDWkI
         S1q2U8E82shg2RPQaX1pETWtUR1Bn66VzNvfebpo9Qt8ojiLY7cv/yroYEBTGroO5ZY2
         CsNRJWFNwouuEHXpWUFVG2Sykf8Bifu1am803bSg1IdivOKT7qP2sfJ4Io/pqQXMwYP9
         WwiFbf/NbNbCkI6w3F7gh3iz960nPow9XA6scSQFqYHTBok4KqBR0SdDmXDARz9hY+Mt
         7rLQ==
X-Gm-Message-State: ABy/qLYnKP/ysV2974XjFlBMnk4zczLUDpkRG1oD86PkVtnjtXr9GheD
	/UpqEWZkTYTarW6ww0fEEB8TNZHhC5SCJQ==
X-Google-Smtp-Source: APBJJlEZkpHbLeqhu7rBtyQI4uZ2SQwxtH5vqrdrzw6W5isxDnVa0yfeF4QlGC/yTOXakRN3eoT4BA==
X-Received: by 2002:adf:f84f:0:b0:314:a77:b6c0 with SMTP id d15-20020adff84f000000b003140a77b6c0mr7164326wrq.1.1688300485039;
        Sun, 02 Jul 2023 05:21:25 -0700 (PDT)
Received: from buffy.int.neptura.org ([2a01:e0a:3ed:3de1:ef11:32d0:af22:f04f])
        by smtp.googlemail.com with ESMTPSA id b9-20020a5d40c9000000b0031417fd473csm8561956wrq.78.2023.07.02.05.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 05:21:24 -0700 (PDT)
From: =?UTF-8?q?St=C3=A9phane=20Veyret?= <sveyret@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?St=C3=A9phane=20Veyret?= <stephane@neptura.org>,
	=?UTF-8?q?St=C3=A9phane=20Veyret?= <sveyret@gmail.com>
Subject: [PATCH] scripts/oe-setup-builddir: copy conf-notes.txt to build dir
Date: Sun,  2 Jul 2023 14:21:21 +0200
Message-Id: <20230702122121.14917-1-sveyret@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 12:21:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183778

From: Stéphane Veyret <stephane@neptura.org>

Since commit 569d4cd325, if one is using a custom template directory
containing a conf-notes.txt, this file is only displayed when creating
a new environment. When entering an already existing environment, only
the default poky conf-notes.txt is displayed.

This patch copies the conf-notes.txt to display to the build directory,
so that the good file is shown, even when templateconf.cfg is not used.

Signed-off-by: Stéphane Veyret <sveyret@gmail.com>
---
 scripts/oe-setup-builddir | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 89ae30f609..678aeac4be 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -98,9 +98,17 @@ EOM
     SHOWYPDOC=yes
 fi
 
+if [ -z "$OECORENOTESCONF" ]; then
+    OECORENOTESCONF="$OEROOT/meta/conf/templates/default/conf-notes.txt"
+fi
+if [ ! -r "$BUILDDIR/conf/conf-notes.txt" ]; then
+    [ ! -r "$OECORENOTESCONF" ] || cp "$OECORENOTESCONF" "$BUILDDIR/conf/conf-notes.txt"
+fi
+
 # Prevent disturbing a new GIT clone in same console
 unset OECORELOCALCONF
 unset OECORELAYERCONF
+unset OECORENOTESCONF
 
 # Ending the first-time run message. Show the YP Documentation banner.
 if [ -n "$SHOWYPDOC" ]; then
@@ -116,11 +124,7 @@ EOM
 #    unset SHOWYPDOC
 fi
 
-if [ -z "$OECORENOTESCONF" ]; then
-    OECORENOTESCONF="$OEROOT/meta/conf/templates/default/conf-notes.txt"
-fi
-[ ! -r "$OECORENOTESCONF" ] || cat "$OECORENOTESCONF"
-unset OECORENOTESCONF
+[ ! -r "$BUILDDIR/conf/conf-notes.txt" ] || cat "$BUILDDIR/conf/conf-notes.txt"
 
 if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
     echo "$ORG_TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"
-- 
2.39.3


