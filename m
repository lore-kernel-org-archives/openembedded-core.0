Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003B9D1F9C5
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:31 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.4803.1729018290074098910
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FGYZL4VQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7ea7ad1e01fso116743a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018289; x=1729623089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmdzOR/XoH0QBHB6d8Ste7GecB7HNBJWYo2es0+abBc=;
        b=FGYZL4VQG2oK7/mMel2259qmV9j+LmhxV0n3qMcpZZ2AHvEbkDLdZftMW7yChyK0aa
         nqiRHX8qpNktKJ3Pp4AQ4P+I7GHZ7QBAni4HVprDM1TUrLF9/1VfvWd6WmotxekIkfeH
         DeYwpfIEqqdfcn+NfuWZcwYP3Lkq+MPd+6kc86OQRuqYizmq+M9JEJ5DE2t1y4uGJNQs
         /Z9ION63oOuWZc8WOkLnCB4J+c86paDhAQKKElVhoLe2EQF6CaHvZW4lv8Pswl0FHqcn
         xGydyBx7NuF7rBwFn286uunZP+aC/hoQKXEl+m/Za/dvNWVw7ypG0lCmRFC6E3i0iY4K
         XmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018289; x=1729623089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmdzOR/XoH0QBHB6d8Ste7GecB7HNBJWYo2es0+abBc=;
        b=IelX8g75Yiz3Aq9LDMU3J4eJw55ONv9L9wyKqGID3gKi2H1AyuKr9HHSzi6MKuGCza
         a8RQkith1iin3STPn53K1kQost8Wibsezurw8pyswC60BCArjAoxqVhnwiDPQORetYDA
         flhrUACvLSTerMsWRXbX2meH+i9unW8zeLMK+FKFlUqxsOZJOSAVAy/fErGeLd3zgoXa
         VDh3RoD127/xQ3uniH00jDn63fT0j5JeUi5sArc5VPqvBYgzZTztjrxkA0XmEjP6Ppkf
         SX9of1h/7bddTDlIpSauvDtuzvnVPuWocWF0ji2GdEkxSMROhSBqXIi0VDJWpXXUAQo2
         jogw==
X-Gm-Message-State: AOJu0YwmrMy22IlWaS4O79bxP1UqdhbiH1SsuUYQEAJOv/vrhDkXPXkA
	g01n16itmR67XKc656VOXhT9NICtsrFXa+v540RRCif/ZbcOZRzYPa4pqCg4IRloUWhMiwr7/Um
	k
X-Google-Smtp-Source: AGHT+IHirkvQdBsou87f1n9fp3DDqejqZkqu/5bRQkiWnfsnbpYGlhc/l9IXI/Z7KmQYZPrGI7Kf/g==
X-Received: by 2002:a05:6a00:4fca:b0:71e:44f6:690f with SMTP id d2e1a72fcca58-71e44f66cb1mr21789879b3a.8.1729018289317;
        Tue, 15 Oct 2024 11:51:29 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/18] image_qa: fix error handling
Date: Tue, 15 Oct 2024 11:50:53 -0700
Message-Id: <8fe7aef17eefa70e3f7c07077b8c695e5c00ed5e.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205940

From: Louis Rannou <louis.rannou@non.se.com>

Make ImageQAFailed inherit BBHandledException so exceptions raised in tests are
catched when the actual test function is executed by bb.utils.better_exec.

Change the do_image_qa tasks so errors are handled with oe.qa.handle_error. Add
some comment to explain this requires to list the test in ERROR_QA or WARN_QA.

[YOCTO #14807]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14807

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 905e224849fbbed1719e0add231b00e2d570b3b4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/image.bbclass | 11 ++++++-----
 meta/lib/oe/utils.py              |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 28be6c6362..a682b5f3b2 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -308,23 +308,24 @@ addtask do_image_complete_setscene
 #
 # The functions should use ${IMAGE_ROOTFS} to find the unpacked rootfs
 # directory, which if QA passes will be the basis for the images.
+#
+# The functions should use oe.utils.ImageQAFailed(description, name) to raise
+# errors. The name must be listed in ERROR_QA or WARN_QA to prompt.
 fakeroot python do_image_qa () {
     from oe.utils import ImageQAFailed
 
     qa_cmds = (d.getVar('IMAGE_QA_COMMANDS') or '').split()
-    qamsg = ""
 
     for cmd in qa_cmds:
         try:
             bb.build.exec_func(cmd, d)
         except oe.utils.ImageQAFailed as e:
-            qamsg = qamsg + '\tImage QA function %s failed: %s\n' % (e.name, e.description)
+            qamsg = 'Image QA function %s failed: %s\n' % (e.name, e.description)
+            oe.qa.handle_error(e.name, qamsg, d)
         except Exception as e:
             qamsg = qamsg + '\tImage QA function %s failed: %s\n' % (cmd, e)
 
-    if qamsg:
-        imgname = d.getVar('IMAGE_NAME')
-        bb.fatal("QA errors found whilst validating image: %s\n%s" % (imgname, qamsg))
+    oe.qa.exit_if_errors(d)
 }
 addtask do_image_qa after do_rootfs before do_image
 
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 14a7d07ef0..83f1440887 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -482,7 +482,7 @@ def get_multilib_datastore(variant, d):
         localdata.setVar("MLPREFIX", "")
     return localdata
 
-class ImageQAFailed(Exception):
+class ImageQAFailed(bb.BBHandledException):
     def __init__(self, description, name=None, logfile=None):
         self.description = description
         self.name = name
-- 
2.34.1


