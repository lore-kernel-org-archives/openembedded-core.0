Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FF1C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 07:38:03 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.16402.1709624279590650601
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 23:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bCuLXK3T;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-563d32ee33aso6429608a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 23:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709624278; x=1710229078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2yMim6/Q5rrizc6kFntCl/OYnHB8vkTXH7ULTtI7sFs=;
        b=bCuLXK3T/pxvg9y2949CSOdQAa4lCK0pFF3126NsZcrWia8bq4f3LqTNieyi2g3EzD
         j5IrlpNuXol0TdaFjtzgPVeXsbwbf/j1S5e6Bzc57SQ3oeK/7XmEHyIh6QJHcCfvd6kP
         w6txSv6ati6T1av3Q+wQWNP1joTgCFrNLicQPtAi7XdBzjzGZzCOfNgnfWXNe4CGab9R
         RDSDG2dzWSvkBCoVk7faJdDu9Lg9j9oTVBJBQoPfr6X7V84jdlJabs07O3a54fAazcqI
         JaBrCJzTT5O0yYqmjwoRj5uSrLjRK63y0U0o+uaimQUhoqjstF1O6BoqGkBWK/h8FA9c
         H1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709624278; x=1710229078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yMim6/Q5rrizc6kFntCl/OYnHB8vkTXH7ULTtI7sFs=;
        b=Hj+KVWT+TLaskW2IQ5tccRoZ0m7GF90bLaScwI7KPgUUlmSrYu0UXMe+Q17qRjxYna
         oJweoL/zWFQWPRBw7kKAhsq+Oy68zDKIYeuvKJT6s6DZzPD1HSl5AM8Dt2Z+9pkSkE4x
         /GJgEA/glfh0pQZ8yGX/mZltV+FFMeRtWzHj5bJSOPKpn2n0J468tXkPovnBRGzsPw1U
         LD8EZdsaEJ2r+sMT9T7INLRrZ749szlmJGK5I9N8sb+9BclF7b7CJYwTfe1NSZgoZJ2q
         sUwt1WPBCl7BoerVeC499UOXcnzTMtntYlC2lGY26BHOxoEm5dSPsoPF8zkC5a7ba+pr
         gxeQ==
X-Gm-Message-State: AOJu0YyazzsJRpdvp6Wg/TplOuYJghonzxjJlCcR//12ORABjEeahwUc
	PnnGEFKQq4CwZl1yBFAuljlqZOPHLkPe7lsl60mRHo+cPKXThr/L+1DBm+Ia
X-Google-Smtp-Source: AGHT+IEdCKs6KWKFiR1TtCYwrqcnmNbqDReUN+7QkF9cBSYQ7NZJnHN+bK4NUaoXVNSEutiuexQY3Q==
X-Received: by 2002:a50:cbc8:0:b0:563:ccd1:26bd with SMTP id l8-20020a50cbc8000000b00563ccd126bdmr7910163edi.2.1709624277735;
        Mon, 04 Mar 2024 23:37:57 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id p17-20020a056402075100b005662f95fa6dsm5474138edy.89.2024.03.04.23.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 23:37:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] scripts/oe-setup-build: write a build environment initialization one-liner into the build directory
Date: Tue,  5 Mar 2024 08:37:49 +0100
Message-Id: <20240305073749.4133403-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 07:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196623

With this, users no longer have to know where oe-init-build-env is relative to the
build directory; that information is contained in the one liner and then
it's possible to simply use that:

. /path/to/build/init-build-env

This will particularly help with initializing builds in unpacked
build bundles, as users won't have to know where oe-init-build-env
is in the bundle directory tree - similar to esdk initialization.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-build | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index 5364f2b4812..c0476992a2a 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -91,7 +91,16 @@ def setup_build_env(args):
     builddir = args.b if args.b else template["buildpath"]
     no_shell = args.no_shell
     coredir = os.path.abspath(os.path.join(os.path.dirname(os.path.realpath(__file__)), '..'))
-    cmd = "TEMPLATECONF={} . {} {}".format(template["templatepath"], os.path.join(coredir, 'oe-init-build-env'), builddir)
+    cmd_base = ". {} {}".format(os.path.join(coredir, 'oe-init-build-env'), os.path.abspath(builddir))
+
+    initbuild = os.path.join(builddir, 'init-build-env')
+    if not os.path.exists(initbuild):
+        os.makedirs(builddir, exist_ok=True)
+        with open(initbuild, 'w') as f:
+            f.write(cmd_base)
+    print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
+
+    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ['SHELL'])
     print("Running:", cmd)
-- 
2.39.2


