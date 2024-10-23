Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6C2CF5382
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:31 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.7703.1729686926974678890
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T7nRyZPj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20cdbe608b3so55654295ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686926; x=1730291726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQOM68sZAMcScazpofvNtlEbzNB+eft/MF8rlEJAotM=;
        b=T7nRyZPjOQKNZZB+SnIFdXZ66DKTDuwBFLZq0YSzDcsYCeGnONJnH1q9vlev7Fwdth
         PHp16tdsrcVbqfgdFMsXCbZ/i+qzv5CfAztTzoYHsRe2pY2kEQULrYxL1qtiMpbQzi8Q
         QEl2VvExij392Uv959+Sop/Rd2NkuA7AiN3QT7CuieNjcjF5ndUT+bv4kp4IUfLOABZj
         lDonrn4SmF/+eSIcZTuuTNJh+OO3EjFdpEIQvRWbDidysxIq/ilXjb5PRoMKmO40vZDn
         geXzzN8pqDIEqGKfB30olO2ii/BQABXBHwH5ea8vcbb2k2CtRFLzsJeNgWCeEdVYHpDq
         T3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686926; x=1730291726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQOM68sZAMcScazpofvNtlEbzNB+eft/MF8rlEJAotM=;
        b=IRkag+je1JS/KI8G8+KTYfl/YoqJCRxvVMZBZmZ8ZbUfu+M1WrTJfGKNjGbAq1mbdA
         7JgyPlA4k4Bh7mbcIEpF/qwzsS7Or30rK/NehcGjVLnTLQi6vS2HY4W5uKNqdrsPo04l
         pJES2baXyYorb6pxvNmc32uvKerWu0RXK4iXo9jc7vcsa2p2ip4jZaZtXaSPesdSSNYa
         o8ewoFe6Pi/gWbAxvWrrycFqJv4PJhV0u7b71MKtcXg1OAu5aJDq6td+BPuVQWSoZ5nH
         +HEGNhfCnINwl6JyufxRa+jwO0AwCYzKfcaIUWQYoaYqguqJt8MRfvrOO1CRYJwcwmga
         lR+w==
X-Gm-Message-State: AOJu0Yxg1NuRuoOUy8rMpMNKIWksXYXATE/zYWKJ9y6a7+Ohn2H+C4Un
	B6NBIDHcpWWHZMG+8endICncaMvBo8PlOysFNQeE8arJ4BLJunVJhLXtjbPdzyAftVGVCyH3zwH
	N
X-Google-Smtp-Source: AGHT+IFvqsxbPTMEmgSU78ghhfLd6TiVE2H32nkDYL4YPizQzyi5m/MCdtndltevrLWH2ce0m/lLRg==
X-Received: by 2002:a17:902:d510:b0:20c:f648:e39e with SMTP id d9443c01a7336-20fa9ea9470mr25885845ad.58.1729686926239;
        Wed, 23 Oct 2024 05:35:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 27/27] image.bbclass: Drop support for ImageQAFailed exceptions in image_qa
Date: Wed, 23 Oct 2024 05:34:35 -0700
Message-Id: <c00ad42b6a26ceb7a2878ed2c7f6c2821fe513cc.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206238

From: Peter Kjellerstedt <pkj@axis.com>

After commit 905e224849fbbed1719e0add231b00e2d570b3b4 (image_qa: fix
error handling), any unexpected exceptions in do_image_qa() would result
in a variable being set, but never used, effectively hiding the error.

Since image_qa now calls oe.qa.exit_if_errors(), remove the support for
oe.utils.ImageQAFailed and instead rely on the called functions to call
oe.qa.handle_error() themselves. This matches what do_package_qa() does.

Also update the description of do_image_qa() to explain that the called
functions are expected to call oe.qa.handle_error() themselves.

[ YOCTO #15601 ]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c3e111c965af2bc56533633c376b70b7fa5e1de)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/image.bbclass | 15 ++++-----------
 meta/lib/oe/utils.py              | 13 -------------
 2 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 834ae03f3c..00f1d58f23 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -324,27 +324,20 @@ addtask do_image_complete_setscene
 # IMAGE_QA_COMMANDS += " \
 #     image_check_everything_ok \
 # "
+#
 # This task runs all functions in IMAGE_QA_COMMANDS after the rootfs
 # construction has completed in order to validate the resulting image.
 #
 # The functions should use ${IMAGE_ROOTFS} to find the unpacked rootfs
 # directory, which if QA passes will be the basis for the images.
 #
-# The functions should use oe.utils.ImageQAFailed(description, name) to raise
-# errors. The name must be listed in ERROR_QA or WARN_QA to prompt.
+# The functions are expected to call oe.qa.handle_error() to report any
+# problems.
 fakeroot python do_image_qa () {
-    from oe.utils import ImageQAFailed
-
     qa_cmds = (d.getVar('IMAGE_QA_COMMANDS') or '').split()
 
     for cmd in qa_cmds:
-        try:
-            bb.build.exec_func(cmd, d)
-        except oe.utils.ImageQAFailed as e:
-            qamsg = 'Image QA function %s failed: %s\n' % (e.name, e.description)
-            oe.qa.handle_error(e.name, qamsg, d)
-        except Exception as e:
-            qamsg = qamsg + '\tImage QA function %s failed: %s\n' % (cmd, e)
+        bb.build.exec_func(cmd, d)
 
     oe.qa.exit_if_errors(d)
 }
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 83f1440887..c9c7a47041 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -482,19 +482,6 @@ def get_multilib_datastore(variant, d):
         localdata.setVar("MLPREFIX", "")
     return localdata
 
-class ImageQAFailed(bb.BBHandledException):
-    def __init__(self, description, name=None, logfile=None):
-        self.description = description
-        self.name = name
-        self.logfile=logfile
-
-    def __str__(self):
-        msg = 'Function failed: %s' % self.name
-        if self.description:
-            msg = msg + ' (%s)' % self.description
-
-        return msg
-
 def sh_quote(string):
     import shlex
     return shlex.quote(string)
-- 
2.34.1


