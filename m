Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1484EC47DB3
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 18:06:46 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.1906.1706551597770638818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 10:06:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XJMT+/q/;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55eb1f9d1f0so4054995a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 10:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706551596; x=1707156396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0o3Dw9hdsRNkrs9RcE3veWRhnNYIxOgRbdvwafI2vc=;
        b=XJMT+/q/b4dcu7J64a6ZGgJHjiSkA10irX7Q+cst2Pv8okcGcrdfHMNbMT4TgbT6Ni
         bf0iSTFSlgdtY1IbYYc5i0y0Kdwz535pPw7mGxlP3q/aUWSuBUldKQ7+5htPtP6naY1i
         3+3y3BCqzVycJLFtQl79saulgZjv8h6ssvxPzI/a4kEN+1lcOTj3V0pITy2/kfQyBxxd
         RmL8mevgiaqvDhHF2LUZf6JKxQYH+VATmMO8H7BaAOGsL6n/FfeYvyosOQPOKZHmEnKj
         vcYwLLfkPz1N7YW4QuBW9VNr7smqhLWtAeLo+zvAtfM457RRVRyQjJ8ha+i4fv1Uthw3
         79Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551596; x=1707156396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0o3Dw9hdsRNkrs9RcE3veWRhnNYIxOgRbdvwafI2vc=;
        b=BvVDH5jV7qcxZ7gUx5eLOJoyg2o/qsjmy4svDvhh3qoAhceyPUrUl0nTdY/LXJO9Tu
         bvslvN5XlZBs/qoJjbHIuekBRomojRJKIzVQN78QoiRNA8vse5MNoUnYqaWCS2sIi4yi
         2VCe/OAW+07s8AYDamIT9hdbzaQ241xV88eMRNcOd2bqMIYvu6Yp9EdSKIAQ4S9oVhyw
         DNdVN4wzp0YehEUl1tRXrj48MZwgEcFajmK/8Rm9VRzRb3byEBdzw3BTRz3DSRzNmLFk
         AzmDCdEK6WlIHqos7JBGnz3fU0MZM2ZXv5iFgJ2R9g8E7RXTX4q35R+o4RkOooQ29VZA
         1eUA==
X-Gm-Message-State: AOJu0Yx4XTFtr2c0Ssxm4aeHTHDc+QfF3urWbeBkZw1y5gaOK1YyAJRi
	frq47LLaWDIYxGHWJjeveH6sbkmuLfbGrMeTVb6ZmqFNuHHTEN+OfhVy+5+g
X-Google-Smtp-Source: AGHT+IHYl0FkBlu5uQrb2v13FXHHg3Ap9Kt0AF8C35Sg0EQt8Jlbu7EaLPsBH/1WJy7tLGDkix6y/g==
X-Received: by 2002:a17:906:c346:b0:a35:fa5c:3e1e with SMTP id ci6-20020a170906c34600b00a35fa5c3e1emr918489ejb.38.1706551595759;
        Mon, 29 Jan 2024 10:06:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ub11-20020a170907c80b00b00a353ca3d907sm3087045ejc.217.2024.01.29.10.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 10:06:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] classes/package_rpm: correctly escape percent characters
Date: Mon, 29 Jan 2024 19:06:29 +0100
Message-Id: <20240129180629.1631473-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 18:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194473

This many characters doesn't work with rpm 4.19 packaging
(as shown by nodejs recipes), and per documentation a single escape
is enough:

https://github.com/rpm-software-management/rpm/blob/rpm-4.19.x/docs/manual/spec.md#shell-globbing

It also should be done in a function, and just before writing out the
corrected filename to .spec, not earlier where the path may still
be needed for file operations (such as gettings file attributes).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index e0f4de42a15..819ee502783 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -216,10 +216,12 @@ python write_specfile () {
                     raise e
                 return "%attr({:o},{},{}) ".format(mode, owner, group)
 
+            def escape_chars(p):
+                return p.replace("%", "%%")
+
             path = rootpath.replace(walkpath, "")
             if path.endswith("DEBIAN") or path.endswith("CONTROL"):
                 continue
-            path = path.replace("%", "%%%%%%%%")
 
             # Treat all symlinks to directories as normal files.
             # os.walk() lists them as directories.
@@ -238,29 +240,27 @@ python write_specfile () {
                 for dir in dirs:
                     if dir == "CONTROL" or dir == "DEBIAN":
                         continue
-                    dir = dir.replace("%", "%%%%%%%%")
                     p = path + '/' + dir
                     # All packages own the directories their files are in...
-                    target.append(get_attr(dir) + '%dir "' + p + '"')
+                    target.append(get_attr(dir) + '%dir "' + escape_chars(p) + '"')
             else:
                 # packages own only empty directories or explict directory.
                 # This will prevent the overlapping of security permission.
                 attr = get_attr(path)
                 if path and not files and not dirs:
-                    target.append(attr + '%dir "' + path + '"')
+                    target.append(attr + '%dir "' + escape_chars(path) + '"')
                 elif path and path in dirfiles:
-                    target.append(attr + '%dir "' + path + '"')
+                    target.append(attr + '%dir "' + escape_chars(path) + '"')
 
             for file in files:
                 if file == "CONTROL" or file == "DEBIAN":
                     continue
-                file = file.replace("%", "%%%%%%%%")
                 attr = get_attr(file)
                 p = path + '/' + file
                 if conffiles.count(p):
-                    target.append(attr + '%config "' + p + '"')
+                    target.append(attr + '%config "' + escape_chars(p) + '"')
                 else:
-                    target.append(attr + '"' + p + '"')
+                    target.append(attr + '"' + escape_chars(p) + '"')
 
     # Prevent the prerm/postrm scripts from being run during an upgrade
     def wrap_uninstall(scriptvar):
-- 
2.39.2


