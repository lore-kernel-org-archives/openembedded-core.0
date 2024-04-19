Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32853C10F19
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:02 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.19148.1713529191868610547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dxRPhAll;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-571bddddbc2so1605320a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529190; x=1714133990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rILufnBvPTdYWl1SCq7e13Mz3ZczWMIi2MjGTRZZkQo=;
        b=dxRPhAllruNCj3pNOkJcnh84MjubFljB7TqheRjltAhBljvI2hQ0RzjGkQ/3VzIoay
         q7+QgIGfJNhy/yuQNRXj1yr3lNPh8qlO52Qrmpnfty184VujQlzum8w6K2ZzIUg+ek6K
         XrxdaZOK2eC/B2yVLmtRTK0UQXx7VawSWbfwDhaOUmc8NA0H5q+3ETFwlrg8h6jMYh7j
         cXjeoV623IlHjpjMts0e8/TO/9ktmKbuAsjG5ZYYFapYcUgB5TvXBc3p1VLfVT12IU/w
         gkcT7XfIXl0aq++QC8nktQ77G0hiWqLCS9vdJO3R5yRJDXCnOfLm+wpgRw6pW2bn6R20
         f0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529190; x=1714133990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rILufnBvPTdYWl1SCq7e13Mz3ZczWMIi2MjGTRZZkQo=;
        b=kYO/DH3RuBX+pXhuxzg6JmVVW30U0nIaJlGxx4jp2SHHRuRcJX9OusKVKPM8altLB+
         +bXJcGcmXX7sWnPihltdfVAMbW8r9i2IOs4iHwykVAWYGsfKRvsfZLQqy81wPZg/EbSv
         oHMw0AB+lpZsvMKqZKRDaayBDtjNxs3H9T0NhmTwAi/QU+Erjr3jqeB280juHMXkrqmI
         OcZucCKbmXqMqHp/8jE/FtqG6mdY67aUQ0eTrSQFJaCihoXILy0F+1rTThYFc+7LKWhm
         l7NOZz4iCV/c2kkaG8njd7yGrLBCCA/aA817MEAhaZuqGCETWDlyqOYs7X6JH8XT9WqZ
         HvgQ==
X-Gm-Message-State: AOJu0YxG7moD9ZYwVrNUJywnyxS5zrhEx27zevkqrJIL135Y9E0y1A35
	MJ4hY81q6bh9Wof5gbzgJb60G+lZlQzzjhPBxiDStWAd6g2UObIGNBgQOw==
X-Google-Smtp-Source: AGHT+IHy9WYH6rA284PWYOyGl3yotlCD31yrbLzXpQjEKZZZgIsFea1hI5S3pl0GrkKJOaJM++nQmQ==
X-Received: by 2002:a50:ccc7:0:b0:56e:23db:3e87 with SMTP id b7-20020a50ccc7000000b0056e23db3e87mr1556536edj.11.1713529189782;
        Fri, 19 Apr 2024 05:19:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:19:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/19] package_rpm: remove support for DIRFILES
Date: Fri, 19 Apr 2024 14:19:28 +0200
Message-Id: <20240419121945.1920944-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198530

This was added here:
https://git.yoctoproject.org/poky/commit/?id=2f42ef8d8fb1febf28252b98884cebabc931f720

It's undocumented, untested, rpm-specific, and currently
broken, and to begin with looks like a workaround for
Tizen/smack security label conflicts elsewhere.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 31 +++++++------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 2e3e4e8c790..790ccbfaf0c 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -191,7 +191,7 @@ python write_specfile () {
                 if not len(depends_dict[dep]):
                     array.append("%s: %s" % (tag, dep))
 
-    def walk_files(walkpath, target, conffiles, dirfiles):
+    def walk_files(walkpath, target, conffiles):
         # We can race against the ipk/deb backends which create CONTROL or DEBIAN directories
         # when packaging. We just ignore these files which are created in
         # packages-split/ and not package/
@@ -233,22 +233,12 @@ python write_specfile () {
                     return False
             dirs[:] = [dir for dir in dirs if not move_to_files(dir)]
 
-            # Directory handling can happen in two ways, either DIRFILES is not set at all
-            # in which case we fall back to the older behaviour of packages owning all their
-            # directories
-            if dirfiles is None:
-                for dir in dirs:
-                    if dir == "CONTROL" or dir == "DEBIAN":
-                        continue
-                    p = path + '/' + dir
-                    # All packages own the directories their files are in...
-                    target.append(get_attr(dir) + '%dir "' + escape_chars(p) + '"')
-            elif path:
-                # packages own only empty directories or explict directory.
-                # This will prevent the overlapping of security permission.
-                attr = get_attr(path)
-                if (not files and not dirs) or path in dirfiles:
-                    target.append(attr + '%dir "' + escape_chars(path) + '"')
+            for dir in dirs:
+                if dir == "CONTROL" or dir == "DEBIAN":
+                    continue
+                p = path + '/' + dir
+                # All packages own the directories their files are in...
+                target.append(get_attr(dir) + '%dir "' + escape_chars(p) + '"')
 
             for file in files:
                 if file == "CONTROL" or file == "DEBIAN":
@@ -363,9 +353,6 @@ python write_specfile () {
         localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
 
         conffiles = oe.package.get_conffiles(pkg, d)
-        dirfiles = localdata.getVar('DIRFILES')
-        if dirfiles is not None:
-            dirfiles = dirfiles.split()
 
         splitname    = pkgname
 
@@ -430,7 +417,7 @@ python write_specfile () {
             srcrpostrm     = splitrpostrm
 
             file_list = []
-            walk_files(root, file_list, conffiles, dirfiles)
+            walk_files(root, file_list, conffiles)
             if not file_list and localdata.getVar('ALLOW_EMPTY', False) != "1":
                 bb.note("Not creating empty RPM package for %s" % splitname)
             else:
@@ -522,7 +509,7 @@ python write_specfile () {
 
         # Now process files
         file_list = []
-        walk_files(root, file_list, conffiles, dirfiles)
+        walk_files(root, file_list, conffiles)
         if not file_list and localdata.getVar('ALLOW_EMPTY', False) != "1":
             bb.note("Not creating empty RPM package for %s" % splitname)
         else:
-- 
2.39.2


