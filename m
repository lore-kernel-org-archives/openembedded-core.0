Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFABEDE9AD
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 11:25:57 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.9526.1694690750270503179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 04:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dkKYobY7;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-530199bca8eso921260a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 04:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694690748; x=1695295548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11k/uoqSGgfJOCKbeCRlo1ZDT3y98PYsK7szmHCaPak=;
        b=dkKYobY7fhDaXFT7zh3UKIKuT/zTnGZovRxRHjrzwkGKacCZmIcGRvJiPVSOlEugPQ
         Saeewc9xXpAw0oWmNeLgKMgRTOr520IWkErMkesqms2X3K0xAQGXKlKgPyUrf5xsj+xI
         thmBSwUgH2JytUuEjdp+EHrGnSOEzRh5q7jq/YynwYsl68Wqn4cK/x/tfge2/P7MEUc7
         2sWPQ1L7maublFqmeU4XPnSjv6PtEEy2mccsqBvPHS/yjgL5s2PJxDZ85LBWaEeAA3b2
         y4A+xHFtH4XxolEdJnTE6OOuc70DCTYZHD/oEO8Bxx4HWfE+pr5GrL6slLhA5uU9lq67
         OE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694690748; x=1695295548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11k/uoqSGgfJOCKbeCRlo1ZDT3y98PYsK7szmHCaPak=;
        b=NH6omsTW9nOLxlxo8KzbeB9ffihAVzYAEAYMYtkb7YIr5fFP+q8+IOD5/DISyBfC7k
         b53DHd8Fzzqfce44KHqn7c19JLsW54/JPokjovCcX+TawUJdgYcHeAHG2iM4FyycUHND
         WSILaFxPwbdVIwutSvpGgUvC7WCeZzeMn6BxNV9071U12J0xCJzIfuG9ypKGoxKyd9pJ
         miO6wdT+e33TeVwhJD0SH2XODL03ruoGNJIb1S2vYpzS1RK34xlV2HCxsqGrZN8aHEs9
         jn0kYOjMlQnKiTqL9jjFXvIuH9mMO2xOfEBOtSLkEuT3z+dPfAgCUEjuVlty5H4hI8mK
         U9xw==
X-Gm-Message-State: AOJu0YzNs6HcNkNttcP6dNZd8GPVgVoBmvEol3koRb+SkZxISW6BMzYA
	fIuFZIR+aWIGiNKoiA30V4X1BCFGDE0=
X-Google-Smtp-Source: AGHT+IHLoAJ6pftTiKa3hkT+zo8JywicgXpthwDS+RpBiNod42B3O5VmeYT3ZL7oCNYtNLGFuLrshg==
X-Received: by 2002:a17:906:cc4b:b0:9a9:e858:e731 with SMTP id mm11-20020a170906cc4b00b009a9e858e731mr2068082ejb.24.1694690748576;
        Thu, 14 Sep 2023 04:25:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o23-20020a170906861700b00992d70f8078sm873832ejx.106.2023.09.14.04.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 04:25:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] scripts/oe-setup-builddir: add support for configuration descriptions
Date: Thu, 14 Sep 2023 13:25:40 +0200
Message-Id: <20230914112540.2214062-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230914112540.2214062-1-alex@linutronix.de>
References: <20230914112540.2214062-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 11:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187635

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


