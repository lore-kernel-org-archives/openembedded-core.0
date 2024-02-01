Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DF4C47DDF
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 09:15:20 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.11588.1706778911383978280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 01:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BOAM+vME;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33ae3cc8a6aso457462f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 01:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706778910; x=1707383710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V92hsViiZH+mhpdSgOwEM8I0a4OlUuBhTGBOd1IYVP8=;
        b=BOAM+vMEo+UlHn3FMt3vVJt3/Jd/f/siPsOkYVeOuP2mQ+o5CHaK5rQ83euV5+L1Up
         gUDKEvYFwmFG2vvf7WMIFxRxxsqfakviPFJs5S80EioFfQ7+2DwxiC8v3T5bUu7A8tE4
         EwlhQTzaT0BMGMjHDD7Z5UTYeqV5lbtr4b/TJuqWvCgK1eW1rx/25xFRC4LQhxRxfWG8
         CggZpI/wRfOyqFZHtiSSndXlEPFpB0fGTpIqdW/MwuXo4WT5c9J8Japbv7lm2/uQxKSe
         /k4OSPIEln9ZpTJ+xcyxGWpgmWmF+sILPYCsxeGTFhO3bIhnX00NligGnlgEpn7/becd
         xn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706778910; x=1707383710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V92hsViiZH+mhpdSgOwEM8I0a4OlUuBhTGBOd1IYVP8=;
        b=Pz04xB38G9IKDNozHFnRr38diGX/zVxoWoXW+HjEmizDBY15kBKDLhCWLKArAlAy/I
         IBgpb6XgswwiypZ0zRIHNZ2U3hdPcIA96N40Q59Bc6zoN+dOST9M1F+bJphqNn7F7bss
         c67XuK2aI8vAuvpJhqNK8MjHMjDIRTiiGTRQiX5bl2VE/laYoUjQNmIgKuqqQXnqstDE
         ftCrMxFv3tbMIBcJvm+2mrAhNFjh+UPEZvaMEu9g2nvfcfYPij9xqlZCXlyRP5dSOpFf
         PKxYjnucQFMTmUI8h4w8kyekKmnjmnO6lG9SuvnSN4gdZv/Mvp5tZFvVE/aIMprHSwH8
         qsZQ==
X-Gm-Message-State: AOJu0YyPvjrprgXOBs+yDlcE5mSNNTnp4Ohj4PczKERKNwpQv03U7mXy
	68PjhXHKCr3sX8TtLIf3SypOJqUVDAfhnKrTKhni6bJFz1hp/a/j+ym/egfp
X-Google-Smtp-Source: AGHT+IHiJ1uJRDJGqSphVVa/W4XQvlOrrtfnmA2hHmZzPgUnx9JVNeywjHFR1okviMQS1BSqZ0cpWw==
X-Received: by 2002:adf:e542:0:b0:337:c5f2:e843 with SMTP id z2-20020adfe542000000b00337c5f2e843mr1122265wrm.57.1706778909803;
        Thu, 01 Feb 2024 01:15:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d59a3000000b0033b18e6d81fsm382143wrr.114.2024.02.01.01.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 01:15:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 2/2] classes/package_rpm: streamline the logic in one of the condition blocks
Date: Thu,  1 Feb 2024 10:15:04 +0100
Message-Id: <20240201091504.1944076-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240201091504.1944076-1-alex@linutronix.de>
References: <20240201091504.1944076-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 09:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194581

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 45ac138084b..3743be8c821 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -243,13 +243,11 @@ python write_specfile () {
                     p = path + '/' + dir
                     # All packages own the directories their files are in...
                     target.append(get_attr(dir) + '%dir "' + escape_chars(p) + '"')
-            else:
+            elif path:
                 # packages own only empty directories or explict directory.
                 # This will prevent the overlapping of security permission.
                 attr = get_attr(path)
-                if path and not files and not dirs:
-                    target.append(attr + '%dir "' + escape_chars(path) + '"')
-                elif path and path in dirfiles:
+                if (not files and not dirs) or path in dirfiles:
                     target.append(attr + '%dir "' + escape_chars(path) + '"')
 
             for file in files:
-- 
2.39.2


