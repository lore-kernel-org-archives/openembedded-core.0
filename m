Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F25DC4828A
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 13:35:22 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.15940.1706276119514068608
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 05:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cfDZ54Fg;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a310409589aso24882466b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 05:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706276118; x=1706880918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLam///cWW4a2fL9Mhk2CmVKUUVWhrRoU33kEPyj5Dw=;
        b=cfDZ54Fg4JP347ynHXnnNTulHMjt/vuOXHS4hDLRgavJzLhBRPchG0+lTtfQKVBlDX
         6zgFims6U0GiXUfU+ZmGDFnXR1uCKlQgJNI4u2MxqXYQZMRjk0mtxvQ4upBkub/vuKVT
         mKGc2Rdz/NbUCFkJAUzVE8mvibI5nSVI9zWcSMsN45ZVeseF9WcIwZ8qBUKZjzeC+e8L
         tFsBue6XNhdFtAAus25uBK0lpvQQdglqGk/a06rjdTZ+Ie1E9knXVmEN0oq6yTtHamvW
         dlXDuEIibvWPKEzXVO9HxemkpLDDJ41fX6xEqJu6SPWx01Cr/Y7OFM8mG+ieD1jIgj2T
         jXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706276118; x=1706880918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLam///cWW4a2fL9Mhk2CmVKUUVWhrRoU33kEPyj5Dw=;
        b=rGHiu74XMeoBNQEf0bKf2W9Onh9JClcSPVj6RoKu6p8NBTaHf2Kod+Mo91NfgDII6s
         GgRhFq/oNwcjd8iVmuBIjSy+Mpj6jQT2vLXaYHEjQFrYIGc72kpQRBmghg4c6bQVErtt
         qY3PNj0yR7j+l0NHoCHVMzHHBaBKOoCPHzhw+esYN5eTjmZsxc6gK2aY5q/vPZJMAzlf
         zPnDrvkB+y28UZI6Y3xjbp2YdcE66HdZif/BqSGuMPyiUrxcfRHZTgfUtD8oL/yyfDj7
         8Mkhi4sawn08USUzPCgGc7yy3jTVxi6iyTOK3geBkbwdM1ngRiGGT0hJpTc4jpWO5yqq
         HbkQ==
X-Gm-Message-State: AOJu0YwBniG9rOqhjSBfV0eNI88puoQlf0kjftQdtDVefgxvGeBisEvj
	bgIPAv1uLNVxGAspQ0CKDveYk7Eq/6UAAav3N8iH0CZhclFSFNoPcO5vZj3F
X-Google-Smtp-Source: AGHT+IG7jo/hOsIc1Rqif4jzbEEQyhBKpC31QQCslVs5HFrs/tHyPdQCsP/dV8vUZe53CEedObx3tQ==
X-Received: by 2002:a17:906:1694:b0:a2e:81d4:524e with SMTP id s20-20020a170906169400b00a2e81d4524emr556507ejd.12.1706276117943;
        Fri, 26 Jan 2024 05:35:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vg14-20020a170907d30e00b00a30f3e8838bsm631554ejc.127.2024.01.26.05.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 05:35:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/8] classes/package_rpm: write file permissions and ownership explicitly into .spec
Date: Fri, 26 Jan 2024 14:34:51 +0100
Message-Id: <20240126133455.2609378-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126133455.2609378-1-alex@linutronix.de>
References: <20240126133455.2609378-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 13:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194364

Per https://github.com/rpm-software-management/rpm/commit/77d3529c31ca090a40b8d3959a0bcdd721a556d6
rpm 4.19.1+ will not consider actual filesystem permissions and ownership, and will quietly default
to root if not expictly set otherwise in .spec file.

There's also additional diagnostics (printing what is in passwd/group)
when user/group name lookup against the sysroot fails.
That is never supposed to happen, and yet there was one report that it did:
https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/8493/steps/23/logs/stdio

Investigating that issue led to the first three commits in this patchset:

sysroot user management postinsts: run with /bin/sh -e to report errors when they happen
classes/multilib: expand PACKAGE_WRITE_DEPS in addition to DEPENDS
classes/staging: capture output of sysroot postinsts into logs

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 34 ++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 2fc18fe98c1..a641dbdb299 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -103,6 +103,7 @@ def write_rpm_perfiledata(srcname, d):
 
 python write_specfile () {
     import oe.packagedata
+    import os,pwd,grp,stat
 
     # append information for logs and patches to %prep
     def add_prep(d, spec_files_bottom):
@@ -198,6 +199,23 @@ python write_specfile () {
         # of the walk, the isdir() test would then fail and the walk code would assume its a file
         # hence we check for the names in files too.
         for rootpath, dirs, files in os.walk(walkpath):
+            def get_attr(path):
+                stat_f = os.stat(rootpath + "/" + path, follow_symlinks=False)
+                mode = stat.S_IMODE(stat_f.st_mode)
+                try:
+                    owner = pwd.getpwuid(stat_f.st_uid).pw_name
+                except Exception as e:
+                    bb.error("Content of /etc/passwd in sysroot:\n{}".format(
+                        open(d.getVar("RECIPE_SYSROOT") +"/etc/passwd").read()))
+                    raise e
+                try:
+                    group = grp.getgrgid(stat_f.st_gid).gr_name
+                except Exception as e:
+                    bb.error("Content of /etc/group in sysroot:\n{}".format(
+                        open(d.getVar("RECIPE_SYSROOT") +"/etc/group").read()))
+                    raise e
+                return "%attr({:o},{},{}) ".format(mode, owner, group)
+
             path = rootpath.replace(walkpath, "")
             if path.endswith("DEBIAN") or path.endswith("CONTROL"):
                 continue
@@ -221,24 +239,28 @@ python write_specfile () {
                     if dir == "CONTROL" or dir == "DEBIAN":
                         continue
                     dir = dir.replace("%", "%%%%%%%%")
+                    p = path + '/' + dir
                     # All packages own the directories their files are in...
-                    target.append('%dir "' + path + '/' + dir + '"')
+                    target.append(get_attr(dir) + '%dir "' + p + '"')
             else:
                 # packages own only empty directories or explict directory.
                 # This will prevent the overlapping of security permission.
+                attr = get_attr(path)
                 if path and not files and not dirs:
-                    target.append('%dir "' + path + '"')
+                    target.append(attr + '%dir "' + path + '"')
                 elif path and path in dirfiles:
-                    target.append('%dir "' + path + '"')
+                    target.append(attr + '%dir "' + path + '"')
 
             for file in files:
                 if file == "CONTROL" or file == "DEBIAN":
                     continue
                 file = file.replace("%", "%%%%%%%%")
-                if conffiles.count(path + '/' + file):
-                    target.append('%config "' + path + '/' + file + '"')
+                attr = get_attr(file)
+                p = path + '/' + file
+                if conffiles.count(p):
+                    target.append(attr + '%config "' + p + '"')
                 else:
-                    target.append('"' + path + '/' + file + '"')
+                    target.append(attr + '"' + p + '"')
 
     # Prevent the prerm/postrm scripts from being run during an upgrade
     def wrap_uninstall(scriptvar):
-- 
2.39.2


