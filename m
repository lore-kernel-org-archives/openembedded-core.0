Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37EED1950D
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 17:25:58 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26117.1769448354672933906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 09:25:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=x2bBBtgl;
 spf=pass (domain: baylibre.com, ip: 209.85.222.193, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c6f21c2d81so247168285a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 09:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769448352; x=1770053152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/fpa5NOJAJdNxGQTNYmk/ETv50/MifIrOkElXvahcOg=;
        b=x2bBBtglqCmaRb5w9GF7fNXYILzW9cKhttUTPUH6dcJtm0b5SrP4SFV/jYSdleCOwh
         jRc1vSG+0n1k31dfggs404oO2vjKyTfJS65aZaaNjgZIEjHG2o+5ddMq//9PcD0EMnT+
         KZb5xIox57/k7dbYtlcWTWIdeX0IEH0DHRKEIjXxjfatejdhmMknPemwSb488zq1vUlr
         aLxYIO5uUHZyjrqdy8qzdzkKeNupUTHcnKVnGDzGAS93kxwD+5hcbWSWT+iN0XZ2pbNg
         DfsHVhi+5gbauVZ5tMDrp07K66WbxzfwTmiGgQJy7MYPvaLGNmG1NeacJlISM//2OpYK
         2ihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769448352; x=1770053152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fpa5NOJAJdNxGQTNYmk/ETv50/MifIrOkElXvahcOg=;
        b=XgJnH//KbkYSAFGYLbtldRPJrTFV8RU4uQbbywxOMnQLdALSQBJq3Am70E62SpUJEZ
         b0+xHHsboKi2Qxhki3gIfwGoesX/LdKzkh7GCzPMne8f3YuVfjGGXCBOPsAcYUn3C2gL
         bO199wHAYPu6BDFkj9uqk0cI41wUvA0o7i95KYqb221zCLXGROSup0vHnmQ0Iei5Y/Of
         rRWfGWslLyXZIcGX4O1FqE6KqTcl+uEZPdQqTZkNmKcScWjLZ05JYp49wtZmyt93KKHb
         IQMGSQiE7cMEl4Z+2xqe/SZ6o7GfWMl63ID0voHh41rt5jDqW/8LQKjIuQwsHpVxrYJe
         vqaA==
X-Gm-Message-State: AOJu0YwZMzOnPJXOJH1aBwmFqK5a2weLaP7mPXrcfsi7R7TCgfduXAxr
	aiciJ/tbOwN2QOsN8AmBk9zh/BObefF7edxb9IxzKQBhB61d5xjABZgK6LZcnrNkTRiaNGNL4Ew
	G8voeC/U=
X-Gm-Gg: AZuq6aI6u1/XNJOw5QbvQVWXwt7DS94PhTrdeEslg6QGxjyd7BVHQufsGdGDn995hdO
	3HYq3iQ+aHh713M34e9MiX3IEXTwudsASCXV+sAElyGthT2YaOctRO0g/cQyJzAswRD7+fo4SJ7
	SZEG2S06iPjYQbL2KsZNGKMVczyN42Z5ZqM7nJxMnPO1rmaA2gy4nYlZmgxOZRvsMOtvV+/zDIV
	vTL2cpuvHNcslhsBGp8Ko0RZxjjmpvn/UjngBawi3HzR7nLPW6ucEoVjGRa+qEk4atA/RTJInz0
	lvffTFCJl8JI0TGnz1DnjhjBKRJsM94uCtr0jSJMYaaR6PotVqBOjAlt3hw2B0RZza8RwmUwpw1
	NNZLrYR/zqsWVC0RxZeF4pJ+Ee7qUR3LmUwnR13VoGWJnjyp7Tg0p/bUBtqh72HZ47VBoh/tEsy
	iyDIANX4x2V3UqvEQ=
X-Received: by 2002:a05:620a:4152:b0:8b2:bf20:f0ef with SMTP id af79cd13be357-8c6f962d681mr589847185a.54.1769448352307;
        Mon, 26 Jan 2026 09:25:52 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e383994bsm1029913285a.33.2026.01.26.09.25.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:25:50 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] package_deb.bbclass: replace 'codecs.open()' with 'open()'
Date: Mon, 26 Jan 2026 12:25:47 -0500
Message-ID: <20260126172548.2402273-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 17:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230021

With newer Python versions, codecs.open() is deprecated:

https://docs.python.org/3/library/codecs.html#codecs.open

Replace it with the preferred call to open().

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/classes-global/package_deb.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/package_deb.bbclass b/meta/classes-global/package_deb.bbclass
index 1f10b15a00..38c9d16c50 100644
--- a/meta/classes-global/package_deb.bbclass
+++ b/meta/classes-global/package_deb.bbclass
@@ -64,7 +64,6 @@ def deb_write_pkg(pkg, d):
     import textwrap
     import subprocess
     import collections
-    import codecs
 
     outdir = d.getVar('PKGWRITEDIRDEB')
     pkgdest = d.getVar('PKGDEST')
@@ -107,7 +106,7 @@ def deb_write_pkg(pkg, d):
         bb.utils.mkdirhier(controldir)
         os.chmod(controldir, 0o755)
 
-        ctrlfile = codecs.open(os.path.join(controldir, 'control'), 'w', 'utf-8')
+        ctrlfile = open(os.path.join(controldir, 'control'), mode='w', encoding='utf-8')
 
         fields = []
         pe = d.getVar('PKGE')
-- 
2.52.0


