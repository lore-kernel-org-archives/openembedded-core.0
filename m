Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998A9CF6D43
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:34 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.6958.1727874806477519206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IrjdL+DW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so5633898a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874806; x=1728479606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gi/J0DBPJPBVhEV7QsWE2MdY6+V0Pq4PrkmZYeuL4j8=;
        b=IrjdL+DW23nt9EIYQa29M7mazjiipqhJFJPHHmNp2HkNC5nSGMNpDbToUgcJK1cyW2
         wkn/S+69uvSTbgkFioe2MBykq66XoeBmm0Y/3qAytxcl+bKVG3/0PBgIE1ZBTJ1SVIH3
         KcJgQJvPxETyXiYh6zlt9B2xjAbEIj4uplF7X6RrBT5JmTAbVLHNN+WJNqel8H9QbWvZ
         QFJQVxLjIwlWT3HMJGQ2Y58KZVloXGkg9Qc7I0dbAcBsaARo0NDCLibXTF/Cynks4Iee
         NKOq7dliYAbQRtn/4qcJV99zU24eSmhiOfEakC/RCzqp/gGYLdaMNrp17CRsH3tWCBYa
         ntkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874806; x=1728479606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gi/J0DBPJPBVhEV7QsWE2MdY6+V0Pq4PrkmZYeuL4j8=;
        b=btP45uvu/Dd1gLuWM8oIRlRArCzt+YoVUDqW6gUG41zXSSADhdHKxaBy6H6TBdCAQX
         beeVIsrdlacUw6TgBmibx46+ZPzYah27B0FbnPBRf/C4BtiAIJ5I4s+orl7KeyYPrYii
         zQkAwcLg6Z+Q+0UNSE2rXwWKBvgPrlVX/O+YzD0nKS/84YPYM5W/GMdMPkdielg2HDwp
         TzCPn9dopEX5lfmZE5L4zBbd3mY1LXoTZl3hXofdsSwadiufIRcDWep73cLd5Ih/I/5D
         0Y4ECezn0bofzFezpfnnCsdkwZDCzHXThTRKKotQGCFoCXrRqZGroJnxTT8wlKKWF7BK
         awLQ==
X-Gm-Message-State: AOJu0YzY++AR+GozJwzt2HZnOVVcNGGDAlTyFKK3uOpRU459OdnG/kjw
	SVjWm94x1tvB3X3cI2B2qtOS77029Th2Lbd2g0IxwrH2ijGU4xV84lZ7WZbJoUBKz1uDRVzpBuG
	Aasw=
X-Google-Smtp-Source: AGHT+IG/VY5w7fS0RnMjgYFIqgD+dkIJ1JiDLMuAVFzcTI/MDQ52xumJWfrL6RF9O8ioyQd8wjcxzQ==
X-Received: by 2002:a05:6a20:6f8c:b0:1d2:e78a:cab with SMTP id adf61e73a8af0-1d5e2cb134bmr4864972637.35.1727874805682;
        Wed, 02 Oct 2024 06:13:25 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/16] install-buildtools: fix "test installation" step
Date: Wed,  2 Oct 2024 06:12:53 -0700
Message-Id: <69dfedfa7ee8cf1666e1292ef25028b978131fe0.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727874367.git.steve@sakoman.com>
References: <cover.1727874367.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205197

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


