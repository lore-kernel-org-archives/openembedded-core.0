Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4170FCF6495
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:58:06 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.45594.1727661482002631712
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=h9AHMysj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20b7463dd89so8257015ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661481; x=1728266281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gi/J0DBPJPBVhEV7QsWE2MdY6+V0Pq4PrkmZYeuL4j8=;
        b=h9AHMysjlJmNUqaX3Sa7GBhJJpZ1tK78YigsjLBmYYu3gXrvGZSdHSDO0oT6jRspY/
         Xn7Zn6TJ96QcPbwSMGt+nuhjcDrBiUgKppPAoCpaMix8Hg5EhavilqKlSYG9rZT7fAGz
         uzN0HcBRpI5xYWc8KmUFhaIdd8dbB5lNGqvjMdQ9qA5SubTBGTQhLezOJZoflnvFQbT3
         k18931J0WkQX9HWoxhBNkb3R4KlKY9SWVGeHC3/SmNHcxcLIIVakMJl9WhNTxcihGx7/
         XBp8wpkRmS/w78Kmu8AefIWP0sxIKjp4nGzWlre3GZCa2sGVpXN3NFR449866rzHTLri
         YmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661481; x=1728266281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gi/J0DBPJPBVhEV7QsWE2MdY6+V0Pq4PrkmZYeuL4j8=;
        b=RW3RjAZxoHT/9gHxe8PhswwZGHCr9V/qdBfSe64Gs3/5RtA/gB63gNDjIkSdCFGvhb
         Tp0Np9Zk+i6W5TcDzb5eQSjCscY0qd0OJBNELIzoXDk9Qut/Qlf5hosEyawJt3uqRQDm
         OPUJvM7IBzkf2lngLG+546yVBY5aBMIvCp/9me/fok2wx50ejXk+wL1bcx8/xB0SOt1a
         c/fdleFypaezaqX415M8/mn10QQL5xltTkfQ6Nm7ejinm9VASYszJWIoYctj6vHiBL9R
         9u5yWW9Bp5YjuqQbk0sskls+HEbzILXEJOIq3rHkqY/wbke7sCtvA3IJgjkEkusN6iZr
         nfDA==
X-Gm-Message-State: AOJu0Yyd4J065atWYw4tOm6RkrcNPhlmO+QV1uWrj3Zr6bxSmsDwEADP
	nrRoEqqheAs1Q3e+vru6TyWjJejh7Z0PAbwVhbalCLEmGq1N757093z2oL0rQCP4ZcGS67ietz2
	73yY=
X-Google-Smtp-Source: AGHT+IGBpbyTxKB6HPADlSDM/ipuis0GfPgXbou95sSqC0lpjegdbPG+tH4iX9yFWBoWTKWfmhRqXA==
X-Received: by 2002:a17:903:2285:b0:20b:6d5c:8ed with SMTP id d9443c01a7336-20b6d5c0b9dmr56728215ad.61.1727661481297;
        Sun, 29 Sep 2024 18:58:01 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.58.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:58:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/27] install-buildtools: fix "test installation" step
Date: Sun, 29 Sep 2024 18:57:14 -0700
Message-Id: <915c48232b0e66915720bff9c745825fa169fa65.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205081

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


