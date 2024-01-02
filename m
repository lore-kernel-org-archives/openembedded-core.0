Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CC0C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 16:53:08 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.33466.1704214382058248250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 08:53:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=S6NcEH+6;
 spf=pass (domain: baylibre.com, ip: 209.85.160.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-427eabbaf25so37721241cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 08:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1704214380; x=1704819180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q8hzyNvAYW2pc43qZ2eVfXmZrc+gR95VL9i9HCLEygQ=;
        b=S6NcEH+6AVRQOFJB7UvrkdbcEz+kkhyFCjNh6VdMfbJ+WyBwJiIdFcEEpPNMRK50RS
         Afjc3tZs3XvfjZ9CriCe6B7wlh8fFOVmN8J+SL75rPewofptqAGR/gvkjsziJYvtJVRh
         Ns0Wuv7oVgpgcsXzpIYPV4kAq9xtf+4+VtFYlutj5d7AvY5S75zm0nXNSmqGNLB+aZmY
         IQB8juh5K28sbrJ3/2Guqe9pOQ3x+hRymdxromySsmJMz4EUSI3tLd85MfpC6tNpZs8I
         FmuIDCCz32cr21FmNV57BHMCVK1iSgSiHIYJOAGz19VookcLF4+yGw6nOwGZ5wyc2CMo
         j44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704214380; x=1704819180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q8hzyNvAYW2pc43qZ2eVfXmZrc+gR95VL9i9HCLEygQ=;
        b=GW0I+0wXZLoAH9zvI4VgFdo8YO6sQBVJp7djYNqj3ig3f8ceb8rxlj5FuBBvNEsYEg
         HLLpydTPro98mSrBjetHFrilTKwXFhU9DRCiuj0McBlOxQvWBPnGrcJ0pUBkmfYU8p37
         jqzZQNXyiOB+RRmw5movCEC9bH9J1nj/Wx9Z28gIuDGq6xDXDobBPpgL+dR7fqFDyEjB
         CPR1qKTEZyYioh5+qs2no084yip9z6cuBl5mcmvIN+ve5u8VIdLe67XlekfaW6JRbczL
         AdhuQNv6OgYvrl74TITD+BikGDs9/oPbleYDw8KMGipRw5K2HwF/WosrS+N5c0IZsN11
         7uxQ==
X-Gm-Message-State: AOJu0YwWUcgJa5+ZMdm+V1z7SutKzstaZueBdGGEALYM9nRBtXCGyeoL
	3XuT6LFxlisTk1EMJOtMPQOJbHRRJSF6ZPxD0KTXu2yB7s8=
X-Google-Smtp-Source: AGHT+IHFiIKWKV72SLGtsl46U+igIVzjFska43YGVuyEWEd3AGT44LV5DAj9p7wGiXwDYDTsbZgLaQ==
X-Received: by 2002:a05:622a:590:b0:423:8f37:fb08 with SMTP id c16-20020a05622a059000b004238f37fb08mr24229878qtb.32.1704214380473;
        Tue, 02 Jan 2024 08:53:00 -0800 (PST)
Received: from megalith.. (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id ff7-20020a05622a4d8700b00427f31cb30bsm6084372qtb.92.2024.01.02.08.53.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 08:53:00 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] scripts/runqemu: fix regex escape sequences
Date: Tue,  2 Jan 2024 11:52:58 -0500
Message-ID: <20240102165258.2706155-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 16:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193247

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
---
 scripts/runqemu | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 6a5a6451daf..f4d04201092 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -371,7 +371,7 @@ class BaseConfig(object):
         if p.endswith('.qemuboot.conf'):
             self.qemuboot = p
             self.qbconfload = True
-        elif re.search('\.bin$', p) or re.search('bzImage', p) or \
+        elif re.search('\\.bin$', p) or re.search('bzImage', p) or \
              re.search('zImage', p) or re.search('vmlinux', p) or \
              re.search('fitImage', p) or re.search('uImage', p):
             self.kernel =  p
@@ -385,19 +385,19 @@ class BaseConfig(object):
                     fst = t
                     break
             if not fst:
-                m = re.search('.*\.(.*)$', self.rootfs)
+                m = re.search('.*\\.(.*)$', self.rootfs)
                 if m:
                     fst =  m.group(1)
             if fst:
                 self.check_arg_fstype(fst)
-                qb = re.sub('\.' + fst + "$", '.qemuboot.conf', self.rootfs)
+                qb = re.sub('\\.' + fst + "$", '.qemuboot.conf', self.rootfs)
                 if os.path.exists(qb):
                     self.qemuboot = qb
                     self.qbconfload = True
                 else:
                     logger.warning("%s doesn't exist, will try to remove '.rootfs' from filename" % qb)
                     # They to remove .rootfs (IMAGE_NAME_SUFFIX) as well
-                    qb = re.sub('\.rootfs.qemuboot.conf$', '.qemuboot.conf', qb)
+                    qb = re.sub('\\.rootfs.qemuboot.conf$', '.qemuboot.conf', qb)
                     if os.path.exists(qb):
                         self.qemuboot = qb
                         self.qbconfload = True
-- 
2.43.0


