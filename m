Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4FAC46CD8
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 10:11:34 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.20369.1703239886948942657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Dec 2023 02:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=clEm5LIu;
 spf=pass (domain: snapchat.com, ip: 209.85.208.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55436c4a65eso943113a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 02:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1703239884; x=1703844684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=icVMc+mlMbzh34ufbeHJXw/YoWQIXvBSl7GyXZ6T+DI=;
        b=clEm5LIui8/P1caJji+Mboz6WR/npKlllhRogD0v4U9lFgb6FN1z3flR7d5XSkYc1k
         PMomL8CfYP0issc2+ARbpgXTn/1/CMgFX97+tcPurt95ARTUURbD1F83X5S1NBKfPdRH
         CXYmnrUwoxm13uhss1ZggUbIheHmdDZiTPIXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703239884; x=1703844684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icVMc+mlMbzh34ufbeHJXw/YoWQIXvBSl7GyXZ6T+DI=;
        b=YMAfcAXHv4CjB6mYmN8tiNNlayuu5ZFC97mX/bI6W9r1t3VHiSx2jxWRACDCSAYXNH
         F2CUJz2twXHmCSSHOVWY0nRltlba9BLXHhR7DkIrnGJxlqCYB//HI1mD0u5MYsJZ7PPe
         I8HI2pOaTqJeUQc0fEnpw+pjRRoujxVaiMgoVET/qZR9C+vNTKtpasxlyGvtrWDiwmzm
         C416wjS58JWnqB0BE/Rno2QcPG0+BJh5TaRqxIMFPavFmgRqreMaPd1MzxrPMMIEPvnB
         jUT0SzUf0PEK4hMaZtmN9h060x8mOfIgG7N7RbDFmqOMx8E7z2BB/y/bQk2UNgQT3s5s
         8eFw==
X-Gm-Message-State: AOJu0YyfAqirFHw1Nu8ksKiN6WvPBgDkOYubRv0rZtnedf2LAefy3Msd
	ST1iSxwTS6m2S0QYCeEvVc8D1xM1LQEAsINR4qSgiGQuxsC/dg==
X-Google-Smtp-Source: AGHT+IGkwQDr+ZuB20Fw0TjA1na+13CYAO5yOxPkHWLWHawpeRfAsNbeysdX41NVu5DirgmOeFuU6A==
X-Received: by 2002:a17:906:280f:b0:a26:8994:6491 with SMTP id r15-20020a170906280f00b00a2689946491mr658235ejc.17.1703239884488;
        Fri, 22 Dec 2023 02:11:24 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id wb8-20020a170907d50800b00a234ae227d2sm1902787ejc.219.2023.12.22.02.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 02:11:24 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v5] kernel.bbclass: make do_symlink_kernelsrc reentrant
Date: Fri, 22 Dec 2023 11:11:22 +0100
Message-Id: <20231222101122.517029-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 10:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192867

From: Etienne Cordonnier <ecordonnier@snap.com>

The function do_symlink_kernsrc is not reentrant in the case where S is defined
to a non-default value. This causes build-failures e.g. when building linux-yocto, then updating
poky to a commit which modifies kernel.bbclass, and then building linux-yocto again.

Bugzilla: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15325

Tested with a recipe "my-custom-linux" which unpacks sources to a custom ${S} directory
and ran symlink_kernsrc several times:
$ bitbake -f -c symlink_kernsrc my-custom-linux

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes-recipe/kernel.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 9ff37f5c38..45b63f1fa1 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -189,11 +189,17 @@ python do_symlink_kernsrc () {
             # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as
             # directory name and fail
             s = s[:-1]
-        if d.getVar("EXTERNALSRC"):
+        if d.getVar("EXTERNALSRC") and not os.path.islink(s):
             # With EXTERNALSRC S will not be wiped so we can symlink to it
             os.symlink(s, kernsrc)
         else:
             import shutil
+            # perform idempotent/reentrant copy
+            s_copy = s + ".orig"
+            if not os.path.isdir(s_copy):
+                shutil.copytree(s, s_copy, ignore_dangling_symlinks=True)
+            bb.utils.remove(s, recurse=True)
+            shutil.copytree(s_copy, s, ignore_dangling_symlinks=True)
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
-- 
2.36.1.vfs.0.0


