Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C73C27C5E
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 09:26:25 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.5276.1718097977574736512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 02:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OTCBTgIf;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6266ffdba8so432906366b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 02:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718097976; x=1718702776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ztjrd1C/aQAR/QtnX9LzXzDVRvZ2pTZdez1KxPKjmc4=;
        b=OTCBTgIfbbFXZs6CYuA2zN01wX4Mft4ZyHX9Scy3A4sfUbaos/2MGnz1uNwB4t7LgK
         KEVNI3ddx5Lek+gM8+JrnrYev/GDWorK4Rx1nrHmekW6NvA1cw5qzQospoY002MEONId
         nemOvO8PwDfVoAcLSg6qysZ6DfCviG0k89quVpNJ9f2tpZgn819aZ4Dbj1DpRuCBeQvq
         2cRk4ODiM9nzPr3UEMYRpsrZCHjirvsUYmWUMGs7RjJT8Vqaz1uWKkPbSRqYVvjz5tUm
         uMaznkmaxziFE6gUkbhKlNIs1lQsICOlAVkZgqy1LdvbRzI0DYA3LVqJ2Ie2LJ3yf4Nj
         qrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718097976; x=1718702776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ztjrd1C/aQAR/QtnX9LzXzDVRvZ2pTZdez1KxPKjmc4=;
        b=WiZjsefxb4GB/TyclDyplYlJIi+p1d4+CGM6frg1y91j0Xmz7BeodlsLyITAe9P4yg
         YcVZ+Pz3yCTViDeaX1RmyCOCuPLuTSVMt5Z1UO6pCv2c+1pWk2v/0eJzWHHfifNnI1YY
         kX7VIZlhCTC9Gk2uNbK8Ojl/VowduLM6YoQ9RAkzYPr6fqTfWgPs1QwXjePsvQf3tLI+
         fGwXRLz4y/CvSTd7I6eSD6SkJk2/K3aAhXG/u6p/uEod7JrQS7Pbo6rhU6EgDNCGdQbI
         AznOoKwS8eJo/gmZaCztMbY4fPoBF6NkaZWTDUb3Z1o434GgVs309J7RsPG5YUz9g8Ff
         ViMQ==
X-Gm-Message-State: AOJu0YyyyyQFRJngxadS9WKi94YxDJ7TGAOEtQP4nwJ2pii+OqIiWOT2
	+/5VpidPx/Tyo3+kdz78hd6Ay7+R9/ziltDiHE7M+zCrKfHoInz8Xk2szbeq
X-Google-Smtp-Source: AGHT+IFB/vn4UBuYN5SeVrLRuLogz7vqoRUjgypmkXnCtlrCm7sCnv1L3RvrwEdJaW4WyVis8jyJuw==
X-Received: by 2002:a17:906:eea:b0:a68:e7df:350b with SMTP id a640c23a62f3a-a6cd7891b58mr739666166b.35.1718097975519;
        Tue, 11 Jun 2024 02:26:15 -0700 (PDT)
Received: from an.. ([2a02:810d:640:170::d5f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6e23c9f22asm570173966b.171.2024.06.11.02.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:26:15 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [PATCH 2/3] install-buildtools: fix "test installation" step
Date: Tue, 11 Jun 2024 11:25:57 +0200
Message-Id: <20240611092558.513238-3-an010@live.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611092558.513238-1-an010@live.com>
References: <20240611092558.513238-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 09:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200499

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


