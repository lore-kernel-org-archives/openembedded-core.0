Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E18C83F17
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 15:43:33 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.507.1693410212755741395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 08:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ije1nSF5;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2bd0a5a5abbso56731711fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 08:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693410211; x=1694015011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11k/uoqSGgfJOCKbeCRlo1ZDT3y98PYsK7szmHCaPak=;
        b=Ije1nSF5kiP47RvKOEuH23JIY1e2c7xbNplyLObWck9qaC8V5AzCg1R4eWSWFQ7OgB
         l/iVPazDk2VOKfJzcKghDV31w6e/+truOsTumrOrZdI3wttC+0S5ANjP7ePWQI1ilkeD
         fpP1NV/wtadNUCDW4yNaVnrCoLK5qDzlAzNTcocGrDoGtqOoqRQ6gM00UM6ALmhusdS7
         iADKIjzn8s82cOm6qgwMey8EgHnizzYQAZQYJESymRcsZwVa9eUVKmCa+Gh9+Cq7Q2h2
         41jQhtSOxrt+vPccqhy9INRcZcaw+IsujbcP5TXFPSOCHXtGjWSutYGRVp5E+3y9IKbi
         MWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693410211; x=1694015011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11k/uoqSGgfJOCKbeCRlo1ZDT3y98PYsK7szmHCaPak=;
        b=KDHYeV63Ydxhw6PIE6GJbf0Wf8CDPae3hUnBcYHCrLiiJD08HFKUUVof4E++vUp5fj
         AQbtfkNgyBjgdyv+f7JzApHOQGlDZ77SrzSNLukwFGFAXFuY7JNUbhyxCE6ijYERC8eo
         yxL3g5KnKsDp5GDEns6kXIM7NaJYlW8D47MIwKBvHlsc7QCdr1ga96JbrI5/8H6l7MCN
         r9bDkM+PJriNND+Fc495tfKE0aj2poKj2wMW42dFB8ONPoYaOLVoggKeZHGUMBSVVgIL
         Ufm24JPLc7Dh4seXJsDA2oZD66VeHWfPY6LNmLPZ2+53n+YMh64azN1cW+w+zg4ZZ0Jl
         kEkg==
X-Gm-Message-State: AOJu0Yx9sP7spjPR6BCG1RqSufFtJc+KzI4ub3sXYFgxzJx3bdW9Ki/s
	hS8o+ereCCOkOX7Q16V38gKPGVI+Emg=
X-Google-Smtp-Source: AGHT+IHdRjjmbTCQZeeD9IJ+wEq64RIvC/5pMWAmNrSpo6tICNzObnnYCzWzVW9e22kCZtBp4v7iMw==
X-Received: by 2002:a2e:8084:0:b0:2b6:a804:4cc with SMTP id i4-20020a2e8084000000b002b6a80404ccmr2062454ljg.53.1693410210692;
        Wed, 30 Aug 2023 08:43:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jj26-20020a170907985a00b00988e953a586sm7336559ejc.61.2023.08.30.08.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 08:43:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] scripts/oe-setup-builddir: add support for configuration descriptions
Date: Wed, 30 Aug 2023 17:43:14 +0200
Message-Id: <20230830154314.661141-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230830154314.661141-1-alex@linutronix.de>
References: <20230830154314.661141-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 15:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186897

They are handled exactly same as conf-notes.txt.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-builddir | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 678aeac4be5..1b5dc55743e 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -57,6 +57,7 @@ if [ -n "$TEMPLATECONF" ]; then
     fi
     OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
     OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
+    OECOREDESCRCONF="$TEMPLATECONF/conf-description.txt"
     OECORENOTESCONF="$TEMPLATECONF/conf-notes.txt"
 fi
 
@@ -98,6 +99,13 @@ EOM
     SHOWYPDOC=yes
 fi
 
+if [ -z "$OECOREDESCRCONF" ]; then
+    OECOREDESCRCONF="$OEROOT/meta/conf/templates/default/conf-description.txt"
+fi
+if [ ! -r "$BUILDDIR/conf/conf-description.txt" ]; then
+    [ ! -r "$OECOREDESCRCONF" ] || cp "$OECOREDESCRCONF" "$BUILDDIR/conf/conf-description.txt"
+fi
+
 if [ -z "$OECORENOTESCONF" ]; then
     OECORENOTESCONF="$OEROOT/meta/conf/templates/default/conf-notes.txt"
 fi
@@ -108,6 +116,7 @@ fi
 # Prevent disturbing a new GIT clone in same console
 unset OECORELOCALCONF
 unset OECORELAYERCONF
+unset OECOREDESCRCONF
 unset OECORENOTESCONF
 
 # Ending the first-time run message. Show the YP Documentation banner.
@@ -124,6 +133,7 @@ EOM
 #    unset SHOWYPDOC
 fi
 
+[ ! -r "$BUILDDIR/conf/conf-description.txt" ] || cat "$BUILDDIR/conf/conf-description.txt"
 [ ! -r "$BUILDDIR/conf/conf-notes.txt" ] || cat "$BUILDDIR/conf/conf-notes.txt"
 
 if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
-- 
2.30.2


