Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4898AC4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 13:47:39 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.6648.1707745653767357223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 05:47:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MzYeE3hN;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: mail2szahir@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso2228612a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 05:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707745653; x=1708350453; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RbpbHb+FrDaqJhosnc+MUQ9LYgSj+oXB7EeDp7T+cQ=;
        b=MzYeE3hNORcot4lDZWg8lxvp1kE8w89x7RFBIe5LW0ToVGl26WLE9QpfTRI1NdZyYN
         lpzBI//uyQaR52tuS/W7bhLWiI5sND5PT0RhVEpK+EG5v4DzTAI9hXUfgTJF2LSU5z3a
         xr1HAZCqPJqWqeHlka3192FXB+AD4lmoI19mju5Y2bUmC8QOVcA6KPuGxxBVBzCBYtOj
         YX1Wa/vmKLDBooomTbPc14HyDMfxIWgU8JNkCZLPSVjxohP+XS8qkaA0eDJ/5+Max4m9
         QRdV37HSnHpskjIcA8tN4iq/ppYob94/3b+nz5QnO9dVnsZQw6rorkZNBSxz5uuLbpLs
         GEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707745653; x=1708350453;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RbpbHb+FrDaqJhosnc+MUQ9LYgSj+oXB7EeDp7T+cQ=;
        b=a1GlqWFinMKDla44BnEgoqhZmLjhaHDU0Qkf6F3FgdEgIHQ9ZEz1OpZIBv5ZIq3aN5
         uknzAcgdkOR+fDX1I+qhuOQ96TeqNdz8NJYL0b4a8ujqhBgXf4tlLtv5XH77DpPo43BR
         FQYUjsHWzGsyB4NEm5PZuhdszXlCahbt73VZdVEypYPonb7QCLcXnyNuhokQ7rpWZPzn
         WCr/iu1scIT51ynkvrf7aGiSaciDJ7nv0Ba3npQOACBapxNT9o7bx8KxZcT7XMIabYfG
         /0Lh59I1hcpHIFXNgkF3J9955nm3S1wv03XalwG/MtLzg3KqzPPveTDFFGtjzy7L5oXJ
         4Mpw==
X-Gm-Message-State: AOJu0Yx1fJkuxb9KTx0rbL7adSbrUDzR8Mecscob6ji+de53GEtdC+P7
	yKGPrneD10rrFa3CJsO/oq34GZVDrxlzIr28sm/mahO0IiSlMkzPqsF8hsQZ
X-Google-Smtp-Source: AGHT+IFum5vUYlS3x+Lza70oNr6wtQGMZ/Q36CJv7VlkLmo5p6TRoHEZcYbPyQCPHo4trW57MKRixA==
X-Received: by 2002:a17:90b:4f84:b0:297:b67:e5a8 with SMTP id qe4-20020a17090b4f8400b002970b67e5a8mr3354418pjb.40.1707745652811;
        Mon, 12 Feb 2024 05:47:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOAIVY1iuwGDxLFGa65lwMDP9cSblLYj1JdmaUTvjjRtATOCgOYxL/VPPGKMrcPkC8u50E8mUpENlL7Oun6Hk4ZTHci4k=
Received: from localhost.localdomain ([2405:201:e02e:c09b:b92a:92ea:d205:2f9c])
        by smtp.gmail.com with ESMTPSA id sl15-20020a17090b2e0f00b0029732fc0154sm536511pjb.3.2024.02.12.05.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:47:32 -0800 (PST)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	mail2szahir@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][master][PATCH] alsa-lib: Enabling ptest for alsa-lib component
Date: Mon, 12 Feb 2024 19:16:45 +0530
Message-Id: <20240212134645.7972-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 13:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195320

This change adds ptest for alsa-lib.

1) Adding CFLAGS change for include the header file path for resolving
 below compilation issue;
        In file included from ../../../alsa-lib-1.2.1.2/test/lsb/config.c:4:
        ../../../alsa-lib-1.2.1.2/test/lsb/test.h:5:10: fatal error:
        alsa/asoundlib.h: No such file or directory
        5 | #include <alsa/asoundlib.h>

2) Removed the test suite execution 'make' call using 'sed' command.

3) Compiled the test directory source code using "oe_runmake check" command.

4) Copied all the required binaries into PTEST path using do_install_ptest()
 function.

Signed-off-by: aszh07 <mail2szahir@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../alsa/alsa-lib_1.2.10.bb                   | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 9057c12b09..78b4920996 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -5,6 +5,7 @@
 #
 PTESTS_FAST = "\
     acl \
+    alsa-lib-ptest \
     apr-util \
     attr \
     babeltrace \
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb
index 83bc6877d2..f3a4693a45 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb
@@ -44,3 +44,22 @@ RREPLACES:alsa-conf = "alsa-conf-base"
 RCONFLICTS:alsa-conf = "alsa-conf-base"
 
 BBCLASSEXTEND = "native nativesdk"
+
+EXTRA_OEMAKE:append = " AM_CPPFLAGS=-I${S}/include"
+
+do_compile:append() {
+        sed -i 's/^.*$(MAKE) $(AM_MAKEFLAGS) check-TESTS.*$/ /' ${S}/test/lsb/Makefile.in
+        oe_runmake check
+}
+
+do_install_ptest:append() {
+    for f in control client_event_filter namehint
+    do
+        install -m 0755 "${B}/test/.libs/$f" "${D}${PTEST_PATH}";
+    done
+
+    for f in config midi_event
+    do
+        install -m 0755 "${B}/test/lsb/.libs/$f" "${D}${PTEST_PATH}";
+    done
+}
-- 
2.17.1


