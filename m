Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA14CF9C5B
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 09:00:22 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.32357.1727082017705120479
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 02:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h0fGXtK3;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c5b9bf9d8bso1249662a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 02:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727082016; x=1727686816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+EVVUyriSRISktFcL3urEYG8k1ilHplCPD4Q014u3o=;
        b=h0fGXtK3BgwruBbRam/n8pUDt2gyUGdNo7B0c9BcovLQZ9zhEmrzn4x5yatHz+RI2d
         n1qz6OGf9YIvwXCbbBeLUqtiMS9FNsG2Qiaj5rT9IH1gXL0ZX9yMxatONPl9dHSRGqyR
         HdTJXQ2Z/qgj8yPpVKXpQ5Vih5Z26NdDqX1SSoEQoUxg0dFAyGJWF8C3EBMsb54WzkTe
         MPxstOVDONUNqkKz2UYPH53rmIENzliU7v5U6cmU18SvlwMCsp35CQJUgi6bCfwLAWZL
         IDvvRZcWWgQ6XmWw5PXnxcEA9tsnYh3N/4b5OxEtA6Fo772kBKppHQNeBp96DEi3ZXTW
         PTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082016; x=1727686816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+EVVUyriSRISktFcL3urEYG8k1ilHplCPD4Q014u3o=;
        b=GjfYAHOw+MwARySHmW3+jk0Gl0UgZxX2PHdlopx0PXPE06wn4h4eCxYzh9kBukJlUH
         4GvK6EfQXrfVQTq31yFyxTMnhq+3nzR7cAwkh5Q0QzpXbPEpeY2VtCUmlo1XDPlp4jG3
         vvvpwBvUYcNzr4kN6R3bA4d0PqqYZsXLsNVO8En6JmHk//JMTmaEGe5odvI3LsyI/3Ct
         VKcICpZRHAt3EwItFuMmSBkeelBiFO6M60CyL8rpeRV2KelKIY40hNQQNzqgZz4jdJpG
         0xLw8ocCpdKl3UatgrpgWnBHKjPATrNPiscp3L5qdGMTvUZvbQ/Z1RMLAfKHYp8TokPt
         C4vA==
X-Gm-Message-State: AOJu0YzSAzuw8Yu+YyD9KpieuiwNnSxiWOkqHHUYx/CprjF8uAV7WFP1
	isHEyhv1J2S/9azMM8Yh4oGL2DI999x6wQ4y3enX484+qmbRDbe56IBBiM4Jv5I=
X-Google-Smtp-Source: AGHT+IEHdAaOWTR6K7O9i2KdUVTZoD+h89KBGN6agxpabyMgbvUmA55uEBWDn5+agHc/LQRjY/jCoQ==
X-Received: by 2002:a05:6402:2713:b0:5c3:c296:1bc9 with SMTP id 4fb4d7f45d1cf-5c464a7d174mr13322315a12.29.1727082015959;
        Mon, 23 Sep 2024 02:00:15 -0700 (PDT)
Received: from an.. ([2a02:810d:600:2744:e855:ba31:e4ab:c4bc])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb94a01sm9872262a12.91.2024.09.23.02.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 02:00:14 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/4] install-buildtools: fix "test installation" step
Date: Mon, 23 Sep 2024 10:59:47 +0200
Message-Id: <20240923085948.49447-3-an010@live.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923085948.49447-1-an010@live.com>
References: <20240923085948.49447-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 09:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204798

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

The "Test installation" step fails with some harmless error messages
(see [1]). This can however make a user think that the buildtools
have not been installed correctly.

Two reasons for the error messages:
- some envvars in the environment-setup-<arch>-pokysdk-linux file
  start and end with double quotes (e.g., PATH) and are as such
  written into python os.environ. This leads that their usage is
  not valid later when testing the installation. This patch removes
  the double quotes before writing, if they are present.
- if installation directory (install_dir), given through the option
  --directory, is given as a relative path, checking if the path to
  a tool (e.g., gcc) in buildtools starts it will always fail. This
  patch converts the install_dir variable to an absolute path.

[1]
ERROR: Something went wrong: tar not found in ./build-tools
ERROR: Something went wrong: installation failed

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e4eb0b14ecf9bd2fba13260441c9d86eb348f41e)
Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index a34474ea84..4f85fe87d4 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -102,6 +102,16 @@ def sha256_file(filename):
     import hashlib
     return _hasher(hashlib.sha256(), filename)
 
+def remove_quotes(var):
+    """
+    If a variable starts and ends with double quotes, remove them.
+    Assumption: if a variable starts with double quotes, it must also
+    end with them.
+    """
+    if var[0] == '"':
+        var = var[1:-1]
+    return var
+
 
 def main():
     global DEFAULT_INSTALL_DIR
@@ -273,7 +283,7 @@ def main():
         os.chmod(tmpbuildtools, st.st_mode | stat.S_IEXEC)
         logger.debug(os.stat(tmpbuildtools))
         if args.directory:
-            install_dir = args.directory
+            install_dir = os.path.abspath(args.directory)
             ret = subprocess.call("%s -d %s -y" %
                                   (tmpbuildtools, install_dir), shell=True)
         else:
@@ -294,7 +304,7 @@ def main():
                 if match:
                     env_var = match.group('env_var')
                     logger.debug("env_var: %s" % env_var)
-                    env_val = match.group('env_val')
+                    env_val = remove_quotes(match.group('env_val'))
                     logger.debug("env_val: %s" % env_val)
                     os.environ[env_var] = env_val
 
-- 
2.25.1


