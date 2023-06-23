Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF8DEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 09:33:44 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.38453.1687512817976081884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 02:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WKfLi96J;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fa71e253f2so15382115e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 02:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687512816; x=1690104816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XTKTrGJOoFH/5HkI+MAWkohmw07zgkpcrmTmCkrzV/M=;
        b=WKfLi96JE1am/9EVhq9A92Eu4+fxbnCI+kISxuncAAELUblrvpaiPg6NzJ4PUf4Dbq
         jXUcDx1zJxBP90vOa6zlsoAEREKZxutGphd8rcjyB1vlaayZYxbGxshK/xnb1Lnl87b1
         rQkr7+zPdAc8aVBd6N6+V01Ic5C4pUXJ/dKdo6j3Hg3FOdcKSaNnx0nxIKkDUEpX3Ma0
         mXbJiE/Y3havPWVBn+tqA+XXSwt0OLmH1nVsElDTlzgyfgwnGo/pbP0cdQzTfT/PpPPk
         ThIeJ+98vBjC7od6ZbjRBCxQorNQJGrSzKvn8ykfWEQ7z1ETF55dVKSQ6bwC2+MRmJ64
         tjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687512816; x=1690104816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTKTrGJOoFH/5HkI+MAWkohmw07zgkpcrmTmCkrzV/M=;
        b=HhMgRqGPSlgcsf9ifHd6DNueXXZ/EiBEABfn5vJPuqnsYWg+wpmKjf9+K6azQ0YeFj
         1oUQbnUstKflwh0UNLDjrYKeD7osSRZ86xn6zvkBCKgjXWxOW6uJ27iYjf+GbJ+/wpNH
         t/Twpq2SxUhM/LjAtJRJyy+88vdfZd8nMHQDb1wegU5FzSX/hsZqqogzTmSD0r/nCWiU
         BadOPaVcG37ux9UqJ6YeVxxwb1cRWH6u8dftv29qOhIq/jzAm1r4K19rk5YayUxTegZp
         bGzH2puCQ7UBdddActWjdz+BQPSbirEVdTbAUpP+7TP7Rr3TG24ioxw+uUqcvFeou4qp
         HxxQ==
X-Gm-Message-State: AC+VfDy/CJtEViiaYiMUWFlwRxHfjlBo/oOXjd/QnwHT8aq2mgTICalU
	Aohnp3Nq9QM7eNiQsMTuRI0L9jF5Y2s=
X-Google-Smtp-Source: ACHHUZ7mqVEc9NYn9oP5vsm4znN3LsDKXnJbH2MXkY1wGSCZKJZj9IeYIZTFv22C4YgqEyWRu2S88Q==
X-Received: by 2002:a05:600c:502c:b0:3f9:b3b4:c8aa with SMTP id n44-20020a05600c502c00b003f9b3b4c8aamr12588326wmr.5.1687512816229;
        Fri, 23 Jun 2023 02:33:36 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d66c1000000b003079c402762sm9177469wrw.19.2023.06.23.02.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 02:33:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] uninative: call patchelf-uninative only when needed
Date: Fri, 23 Jun 2023 11:33:23 +0200
Message-ID: <20230623093323.4058529-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 09:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183314

mke2fs.real, mkfs.ext2.real, mkfs.ext3.real, mkfs.ext4.real are indentical
binary with multiple hardlinks and we end calling patchelf-uninative 4
times even when the interpreter is already set correctly from the build

To avoid corrupted binaries created by patchelf-0.18.0 when set-interpreter
is called multiple times (on some systems like ubuntu-18.04 this leads to
segfaults elsewhere just ldd complains that the executable is no longer
dynamically linked, but doesn't fail when executed).

The issue was reported upstream with mkfs.ext4.real as possible reproducer:
https://github.com/NixOS/patchelf/issues/492#issuecomment-1602862272
alternatively we can revert
https://github.com/NixOS/patchelf/commit/65cdee904431d16668f95d816a495bc35a05a192
and create new uninative release with update patchelf-uninative, but
better to wait a bit for upstream to have a look and possibly backport
proper fix later, until then this change fixes the mkfs.ext4 issues I was
seeing in kirkstone, mickledore, nanbield since uninative-3.9 upgrade, as
reported in:
https://lists.openembedded.org/g/openembedded-core/message/182862

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes-global/uninative.bbclass | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/uninative.bbclass b/meta/classes-global/uninative.bbclass
index 366f7ac793..b54acdd542 100644
--- a/meta/classes-global/uninative.bbclass
+++ b/meta/classes-global/uninative.bbclass
@@ -175,7 +175,12 @@ python uninative_changeinterp () {
             if not elf.isDynamic():
                 continue
 
-            os.chmod(f, s[stat.ST_MODE] | stat.S_IWUSR)
-            subprocess.check_output(("patchelf-uninative", "--set-interpreter", d.getVar("UNINATIVE_LOADER"), f), stderr=subprocess.STDOUT)
-            os.chmod(f, s[stat.ST_MODE])
+            current = subprocess.check_output(("patchelf-uninative", "--print-interpreter", f), stderr=subprocess.STDOUT).decode('utf-8').split('\n')[0]
+            if current != d.getVar("UNINATIVE_LOADER"):
+                bb.debug(2, "Changing interpreter from %s to %s with %s" % (current, d.getVar("UNINATIVE_LOADER"), ("patchelf-uninative", "--set-interpreter", d.getVar("UNINATIVE_LOADER"), f)))
+                os.chmod(f, s[stat.ST_MODE] | stat.S_IWUSR)
+                subprocess.check_output(("patchelf-uninative", "--set-interpreter", d.getVar("UNINATIVE_LOADER"), f), stderr=subprocess.STDOUT)
+                os.chmod(f, s[stat.ST_MODE])
+            else:
+                bb.debug(2, "Interpreter was already set to %s in %s" % (d.getVar("UNINATIVE_LOADER"), f))
 }
-- 
2.41.0


