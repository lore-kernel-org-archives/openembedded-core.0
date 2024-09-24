Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2F3CF9C74
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 23:05:41 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.2801.1727219135765887958
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 16:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OvzoGipi;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c40942358eso615270a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 16:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727219134; x=1727823934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+EVVUyriSRISktFcL3urEYG8k1ilHplCPD4Q014u3o=;
        b=OvzoGipiJeVtm6+0L+QggqpDuPWbKP1LaFw6fxnkoyAaIFIczaTlOy/BCX8EQcrC+t
         cDW7MkBh0GDrJUsswHwjrMPtlo/juW235puJxCRTalDAfN0XHnCqkwRLaC54ilFfjzM4
         S8vWmgPBZgZIxaxB9oz4lRnOcbHfGJMJKegXDu1PhVnFC9JBpwOCP746YWL2h1tKJlPt
         jq922x/x5mioD/KofLUGkdQsABMZSLTdIU2TaEOVGBA638z2kFrZCZ4l4GzKuqE89tVw
         0thWDJ8vPKSxXOUbH6/JLJqIh0SRyUXh/qwhfpM/4ttHe6xJIHMGCbbaapdhLBWDDCMv
         vEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727219134; x=1727823934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+EVVUyriSRISktFcL3urEYG8k1ilHplCPD4Q014u3o=;
        b=NBi8hKO+npUe+wXa9/o4Xat9bD0Z4K3LebwDvtjejp0tRHql7uvDGA+xHIzs+sKiF0
         z8ZDHhIIoe+IiAG+m9mOiTcJpObyB3PDR/vJ8vDgL8sCOkx/UOSogf99ccDipgX+iyiL
         g2m6C/J+wgRaCEJugsrRaP9dxZoeQeLfECUnb/XJW8bjQTfxJJ+CJFzD/3Eb5UuEdcuv
         pXsz3nY1UW80zIk5JFIgaAF9uVp9xCdjz0IF/aNDr2B4F27bm04Iq4gKdtoDEd+YzEo2
         /mE5ANkftEbYSbreQw2buS5dUDVV7HQRDSkFFd2qDv+wd4Vwf/BWRmlgJc/FMQgtRtjA
         iV8A==
X-Gm-Message-State: AOJu0Yz6ZYtNSfiyQaIzigeVHrG5jruONYGT92Z3snGR/293oV/mq2O4
	RnA3eKbQio45BhN1vmOPuEH3eE5dC8Y8+6u/WzQy8UspN8OE6vXU7ywqPOsF
X-Google-Smtp-Source: AGHT+IFPu+z4xrULA1ScUtuGgGibgopE081stulUMZGvIcTblthYMggBhzzw5bdG7IjWCbCrOVqKGw==
X-Received: by 2002:a05:6402:2688:b0:5c2:5f31:8888 with SMTP id 4fb4d7f45d1cf-5c5cdfea23dmr5695903a12.15.1727219133896;
        Tue, 24 Sep 2024 16:05:33 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:600:2744:7bc8:c715:17d:4d03])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf4d75cdsm1291721a12.81.2024.09.24.16.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:05:33 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 3/4] install-buildtools: fix "test installation" step
Date: Wed, 25 Sep 2024 01:05:16 +0200
Message-ID: <20240924230517.19994-3-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240924230517.19994-1-an010@live.com>
References: <20240924230517.19994-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 23:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204886

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


