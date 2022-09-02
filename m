Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0A4C6FA82
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 12:02:19 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.5628.1662120132398135681
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 05:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RxIgujDk;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id az27so2026851wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 05:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ARLZQwuGgxReMTfjrl6z/EvkXbehnHTewUtCDRuAA9w=;
        b=RxIgujDkbLIB3MlmzvdyjQMsISQiI2ntbyZBWI5oKRrE2mGK7OtPCf9YPV+mAcxJuG
         /kkpuTnHly6hBYRLyRz8JDos5d5fYNVCJF0tA7EMDdbwDhemUbXBrreFD3XdL4K7dLqS
         GTiuk95XDzqt/LcPsxb8vdecedIw24PlR1OpHUkXbFLK7gtxUFOQDFL5nujLT/pmLYtO
         6peMAKVprfNKvynfUHIx2yRhsUVqVJ8yyt4zSckgNhYu+tSWdgqqzAexqEmZiCb1pW1z
         PMJgG100ozfkDlUWTGBLApcjSKXC1xCzywEIwv0eWMlA+HhkYoIJK8STkxwmWtdrqk3P
         lBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ARLZQwuGgxReMTfjrl6z/EvkXbehnHTewUtCDRuAA9w=;
        b=fM93BCbbVN5GDZaOqFnabaOmWZ5QG0s4an22QOpAbBXFlj9FrUQVO1wRLt8yjn2iRm
         p/pfEEIcZzZa5tS/AysuSyEZquvBqlk0OIlrfXB5dUHTwoTW6IXKQ23QwruK6FkXTbUd
         n5RCAWjJs2SFZTWRaOZq3FhEZYMqOAoCAYScYM6Kkb6LgLHcXa5zbwXmi9FdPN94pRrG
         WlkB5fUgyvhMQ/bIO1IGKKVfANNgyvQOBuJb1fLmJR5LiSyjOImok1O6Sd4SRn3pe9Iu
         TC7LVj1rIbk0JNUWBdySHQKDbweE4n+q0cVef8Nox8miT1JiEPNLh8GpCRLo2jimcxdf
         Gw6Q==
X-Gm-Message-State: ACgBeo0xF//Qz5WGd9JQwAM+K0BqOIhdE1/ESFSLFkLmy7HV3YKWt7jb
	DiiTDm7DvWB5fT+HQVDpsaTqKZmFr2I=
X-Google-Smtp-Source: 
 AA6agR6wNBsJXlHgfYujWvSYH6Sj8xCZnRj6UUKvsIRbxQbNmDuU0cwMpVzxGOgRRlsL4hFSDNMx4g==
X-Received: by 2002:adf:d0cb:0:b0:226:e96c:47a2 with SMTP id
 z11-20020adfd0cb000000b00226e96c47a2mr8334828wrh.252.1662120130518;
        Fri, 02 Sep 2022 05:02:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c198c00b003a2e92edeccsm8802489wmq.46.2022.09.02.05.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 05:02:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] scripts/oe-setup-builddir: make environment variable the
 highest priority source for TEMPLATECONF
Date: Fri,  2 Sep 2022 14:02:01 +0200
Message-Id: <20220902120202.487119-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 12:02:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170244

This sets the following order:

1. TEMPLATECONF set in the unix environment (for example as a
prefix to '. oe-init-build-env').

2. If empty then $BUILDDIR/conf/templateconf.cfg

3. If absent then $OEROOT/.templateconf (oe-init-build-env sets OEROOT
to where it is, which is poky or oe-core).

I believe this is more logical and consistent with common practice;
it also avoids situations where the user is stuck with cryptic
errors because templateconf.cfg contains something invalid and
that something cannot be overridden from command line.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-builddir | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 32bc6580eb..8e95f0d94e 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -38,7 +38,7 @@ chmod -st "$BUILDDIR/conf" 2>/dev/null || echo "WARNING: unable to chmod $BUILDD
 
 cd "$BUILDDIR"
 
-if [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
+if [ -f "$BUILDDIR/conf/templateconf.cfg" -a -z "$TEMPLATECONF" ]; then
     TEMPLATECONF=$(cat "$BUILDDIR/conf/templateconf.cfg")
     # The following two are no longer valid; unsetting them will automatically get them replaced
     # with correct ones.
-- 
2.30.2


