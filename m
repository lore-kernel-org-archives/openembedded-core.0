Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E624C4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 10:24:34 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.8364.1705573468337445410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 02:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N8rX8gs3;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a2cea0563cbso920462866b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 02:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705573467; x=1706178267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BvWcf8PWZHr2rVUa/Izl+ADiqjVaetZgyb/LHiMC0c=;
        b=N8rX8gs3EL9T23smmTDymjavlAO/PWzR8cBTmb8iunYaLPn4u48w6SwwZET0zetDXp
         U/qVXhglJNM0U7txoiDi8sGr4OUtUi/pPEnzqM/chkc0u8NtF4JUiuU0VG+WAdTVzUIv
         51imkoeNKgRsuzZiFN2vqdz7HRRDuGAnU7GLGwasz2EBdSJ9xgmlcgenepGAAO5e/h6Q
         SN+TylYyBkB9BZqsvCUH+T9BjCRXMnlkWge1JSP6BY1rYG6wcYlvigPa4NM/5ejGm9sZ
         /WCB/yIqlTRVno9LyYzAQ9jNebx5ckHwynXrvOK4qoxFQQHtdV3qxdkpq8zae6evk613
         NU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705573467; x=1706178267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BvWcf8PWZHr2rVUa/Izl+ADiqjVaetZgyb/LHiMC0c=;
        b=sdtphICMSXI0apbN3nOZAxGJkDTQiCc6bVqFaexd5OBO19hqVgKdeopCH4vhDnViVX
         69Z5N2qLwihO0VPOMSVS6g6Nts0YMW20TJJPgACrX5DIcLoZL41Q20K1g6kaSj4rFS0g
         OCHGmhUhY5rtDjwVktuXAI3x0yqIncgb/fE0W6Si+TI/oVJjxRi9vWico6UCUXG3UFZT
         pGhfs7NW3/GeT3d4MQpmjr58i9ejozYtHvGoqQ40p1Bn2XxbVdF8Ms2ePesGJo7gtP4H
         E8UvIAELKywsfpxwUzEMEGP3j8F6o8M5c0z9HYZi/cJQLU6E6tYz16YvLgBA4N1m5bkh
         Xg9w==
X-Gm-Message-State: AOJu0Yxg0zG0twmSUctoGwU+/ArsFFLu2C798aqIFFlfjoNggHPC2qGg
	H/v9gilWZIal26ARfKEjXO73hEEXK9RcHhHTMrSeXV+8qlMvwqeY39wmy67v
X-Google-Smtp-Source: AGHT+IF80ga57kbeVjOkvOTenA5n4xKlekqMf0gQOFYEiIj6hnne8akOzMD4OQdIxoJqe6dNSFwkYg==
X-Received: by 2002:a17:906:4547:b0:a19:a1ba:da2d with SMTP id s7-20020a170906454700b00a19a1bada2dmr381249ejq.84.1705573466405;
        Thu, 18 Jan 2024 02:24:26 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id hw10-20020a170907a0ca00b00a2ea4f1b0cesm2461003ejc.2.2024.01.18.02.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 02:24:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] classes/package_rpm: write file permissions and ownership explicitly into .spec
Date: Thu, 18 Jan 2024 11:24:07 +0100
Message-Id: <20240118102409.2680941-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240118102409.2680941-1-alex@linutronix.de>
References: <20240118102409.2680941-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 10:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193970

Per https://github.com/rpm-software-management/rpm/commit/77d3529c31ca090a40b8d3959a0bcdd721a556d6
rpm 4.19.1+ will not consider actual filesystem permissions and ownership, and will quietly default
to root if not expictly set otherwise in .spec file.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 2fc18fe98c1..09cc7d62681 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -103,6 +103,7 @@ def write_rpm_perfiledata(srcname, d):
 
 python write_specfile () {
     import oe.packagedata
+    import os,pwd,grp,stat
 
     # append information for logs and patches to %prep
     def add_prep(d, spec_files_bottom):
@@ -198,6 +199,13 @@ python write_specfile () {
         # of the walk, the isdir() test would then fail and the walk code would assume its a file
         # hence we check for the names in files too.
         for rootpath, dirs, files in os.walk(walkpath):
+            def get_attr(path):
+                stat_f = os.stat(rootpath + "/" + path, follow_symlinks=False)
+                mode = stat.S_IMODE(stat_f.st_mode)
+                owner = pwd.getpwuid(stat_f.st_uid).pw_name
+                group = grp.getgrgid(stat_f.st_gid).gr_name
+                return "%attr({:o},{},{}) ".format(mode, owner, group)
+
             path = rootpath.replace(walkpath, "")
             if path.endswith("DEBIAN") or path.endswith("CONTROL"):
                 continue
@@ -221,24 +229,28 @@ python write_specfile () {
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


