Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F7CC5478A
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 19:40:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.456.1708544444138156589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 11:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GMtB0UDr;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33d118a181fso3714639f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 11:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708544442; x=1709149242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVL8wByLrW6dg1mHYJG3likhEODBdq7COnQlgST22uo=;
        b=GMtB0UDrbUgblpX7XwdBNQ3LXxsAYYS1n4LMTM0cyuYH86YfKt4Z49BSdw+Ajh7NaN
         bji4sTOxDwnsaKZVrD9hd+I5gOlRMfqNebWnQuUvG7DjlIB0TH+xeH1vXvPCRBy4UBvl
         kC4kwnFnxA+UO7u1FwqhrWCjwJkEncIRMfoD/kh34keEwcIkxBX/FEX+jAAt/9Tfk1GC
         yxwHl4Ll05N+myXEFI+yrh1cIFGHuI3bHH9zJSG6rEAjyfA/5ikBdQwMAO5GUajBgBSn
         bMkq1jHKAXLOhJkSd56HrJ8+JE8URfs1nZWQkPZsK3wGwbeMNscBbb7rTtEnZ3EgsSgr
         pmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544442; x=1709149242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVL8wByLrW6dg1mHYJG3likhEODBdq7COnQlgST22uo=;
        b=EFBc7ALTtyI5zhGdGzaxSfcHPauJNS2EjaDtrgYkJ3HLMiQWkuuWE9/VkMgg5yp0ye
         7oSa9y7jyRa+IgyqORUCdjbFLXULNtnupwEItbVkpEFbOahX6rI1uKzx1LkMmw+eQvRy
         VM4Q0obblidTrJAHg5YfmFCn+UBkSwE6tjwdR6V7SKsoH1lAEnz5n8odHeiAamVx8CRf
         ap04iekXuGf8Li9l1AJ6Mli4bzibhhIO2nC/sVok0aI8TGzAYZ5iIdqz0f0/qUpriQVE
         ZJow4OUy0GzHlItc8HdS5SY7LQtb1Own3g3R4+HtuMd/aCEh6i1BBmBieCGaMUgRHmIc
         aJyQ==
X-Gm-Message-State: AOJu0Yzob9J620JwZjs+Gpxiu4TZsNaac0VEsmRbSWnup6cN1lEXId3B
	007COo2Qy4t/dMavfGysFr7WB/OeiluOhBKF646uFQrZ0JAkuwXt1qd5+Ele
X-Google-Smtp-Source: AGHT+IHWHbolLa8ZMHyx08jTZWEGtmOXvssuf9rdrFqPQKrzWkHqXU7HEhW1/XmF7FBSofPmdZ33pw==
X-Received: by 2002:a5d:4ac9:0:b0:33d:679d:a033 with SMTP id y9-20020a5d4ac9000000b0033d679da033mr3841042wrs.36.1708544442357;
        Wed, 21 Feb 2024 11:40:42 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600016c500b0033d60cba289sm8764686wrf.68.2024.02.21.11.40.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 11:40:42 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH v2 02/13] scripts/runqemu: fix regex escape sequences
Date: Wed, 21 Feb 2024 20:36:54 +0100
Message-ID: <20240221194036.1804463-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
References: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 19:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195986

From: Trevor Gamblin <tgamblin@baylibre.com>

When invoking runqemu with Python 3.12, the following warning is
encountered:

|SyntaxWarning: invalid escape sequence '\.'

This is because the interpreter scans the string before it is processed
by the regex module, and it interprets the backslash as part of an
escape sequence, but not a standard one. This will be registered as an
error rather than a warning in future Python versions. To avoid the it,
simply add an extra backslash so that Python doesn't misinterpret the
string, while the regex parser still sees an escaped '.' character.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backported from master: 0e8a4142bb90a92d175df6b2537d24a372356f98

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 729b067a9f..b7d7c7b4e7 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -362,7 +362,7 @@ class BaseConfig(object):
         if p.endswith('.qemuboot.conf'):
             self.qemuboot = p
             self.qbconfload = True
-        elif re.search('\.bin$', p) or re.search('bzImage', p) or \
+        elif re.search('\\.bin$', p) or re.search('bzImage', p) or \
              re.search('zImage', p) or re.search('vmlinux', p) or \
              re.search('fitImage', p) or re.search('uImage', p):
             self.kernel =  p
@@ -376,13 +376,13 @@ class BaseConfig(object):
                     fst = t
                     break
             if not fst:
-                m = re.search('.*\.(.*)$', self.rootfs)
+                m = re.search('.*\\.(.*)$', self.rootfs)
                 if m:
                     fst =  m.group(1)
             if fst:
                 self.check_arg_fstype(fst)
-                qb = re.sub('\.' + fst + "$", '', self.rootfs)
-                qb = '%s%s' % (re.sub('\.rootfs$', '', qb), '.qemuboot.conf')
+                qb = re.sub('\\.' + fst + "$", '', self.rootfs)
+                qb = '%s%s' % (re.sub('\\.rootfs$', '', qb), '.qemuboot.conf')
                 if os.path.exists(qb):
                     self.qemuboot = qb
                     self.qbconfload = True
-- 
2.43.1


