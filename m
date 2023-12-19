Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F2CC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 13:38:39 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.13745.1702993117604172809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 05:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=C2UytaiO;
 spf=pass (domain: snapchat.com, ip: 209.85.218.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a234dc0984fso298852866b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 05:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1702993115; x=1703597915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=woNZNu+gKa0Jvm/VGM29HcXc1DD33BW2J1msGwNsmXo=;
        b=C2UytaiO+5eD0vVH/H7Xe0s6sBqC8DFX/9xGnWpPxb8wMRSN6MPpZXB8d5kH9XIg6+
         BOOsD4Ybv0B1x1EfFBKKumY6hCdVLhahMNGjv8lO7zWrqZyD3HgHlDNNN5qv2otHkXlT
         UrF3bO8UHYLGc99VpHT9bZjkuUFUNnU6FvcP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702993115; x=1703597915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=woNZNu+gKa0Jvm/VGM29HcXc1DD33BW2J1msGwNsmXo=;
        b=eqJrveQObrloa7zUd9y4bVsaVsMCacTFfbf+IKvJ085Zw5QjemMjr08ctf7Hx6h7C+
         F3ua+GimZewSWKrH2X+BPrBOK0OudsaO5znxJdUalUjoY+1b3FKdd6Du8/5e6XEL349m
         YXxypzqAt6rMeir7iORFqTiPMw3fQ990uZaZR1HUlzsdUSBwk7Ogtbdp6DDezQjUW0DB
         3lnEgOM3I6tfD1o+z9cxFFXbPf/0K92TVN3rxHAKHK1hOTqDkHYqQEyEkOlwcGuZ/lUW
         MCfOnbwGXHtjJ7RyorV31tBqCywsdV3484r2vQ7/yYe5TeQnnZUNkiN/VeW9zy1EVnkb
         xMwA==
X-Gm-Message-State: AOJu0YyRGvopFH+CTIvgkac8+m6MjFPgqf6R9V3ciXykIvm5YRcIy9K9
	sTSOs5pVFzwkD1kLqSJJ5QTp0ZGdlMD43Ie/mPmtag==
X-Google-Smtp-Source: AGHT+IHqCf+ffPVS3gZJbhQobPfLQpYy5h5EJTii/FUvRSl+Vdmnrbbmb0eRAZGrAjp71yAB3g7w8g==
X-Received: by 2002:a17:906:8a:b0:a23:40c7:ee61 with SMTP id 10-20020a170906008a00b00a2340c7ee61mr1902719ejc.149.1702993115231;
        Tue, 19 Dec 2023 05:38:35 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id vb1-20020a170907d04100b00a1b7769f834sm15289609ejc.81.2023.12.19.05.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 05:38:34 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v4] kernel.bbclass: make do_symlink_kernelsrc reentrant
Date: Tue, 19 Dec 2023 14:38:18 +0100
Message-Id: <20231219133818.1540284-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 13:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192730

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
index 9ff37f5c38..42c5519f81 100644
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
+                shutil.copytree(s, s_copy)
+            bb.utils.remove(s, recurse=True)
+            shutil.copytree(s_copy, s)
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
-- 
2.36.1.vfs.0.0


