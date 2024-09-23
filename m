Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794C7CF9C5B
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 09:42:22 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.32874.1727084537161068808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 02:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lwrs8iA1;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8b155b5e9eso611748266b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 02:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727084535; x=1727689335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+EVVUyriSRISktFcL3urEYG8k1ilHplCPD4Q014u3o=;
        b=Lwrs8iA1JdhxTru7y7iSrAkGaXxRQSYkgC3CkUeN8A72lXbH0PQHM2wxh4fvHuF9Ts
         F1o792hhAiXguhjmA3b9Z2m04m4K0JmKh7k6qILyJXNWfokPyyWlSZMOG6onjXM0M2OF
         kEbyQBcRZmPihiJbyUdrbGHjVMMnjgtmQnMBN/ynD4IoisUGAgkoRGoOO6ThVjYFHIlI
         UwluBF6aqgrVlqtDVXAdMRDZy2Dke8CAMJX9wSNLMRPA1tfrl6qdV09NTIraCZ5cJDE9
         jeck7puPNAO39fIUjPANHSCOzF/xIw9BiC4LT9/pgYqk2pXATRWVLGet8uz7jzFMUwG8
         5kWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727084535; x=1727689335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+EVVUyriSRISktFcL3urEYG8k1ilHplCPD4Q014u3o=;
        b=tCopMvpG4uyHwtD1Z8nej3sgy1KdPTeHiIb0P8hlG5goy2p0MRMONyr5l6tej1OtpE
         IAhnDiUSJnMqBwXVCCvKTfMQkE4SxqpiVMhKe1kMWdubzMRNG5Ooa0DhSeBFZyb7ML/X
         WNCsGNQTWwuduUgByQnva85n4+MOXFFt44iWtsivE47NwkpKdVHTdMiOdCCLwuti5G2L
         0pUEOWxBZlIUOdLbVkLNBIAQsHMBF8WUTSsX57rtt4tmU+cJx2W7vlrUsVM/prOj+6Sr
         dyntdZce42sZGTWMoaoRcmNPuEoYI6ZYEdCZoLc/HroDSatrSl6G+h9RXNhw26sIheKH
         W5SQ==
X-Gm-Message-State: AOJu0Yx9Vdc+HEyKNSvP04/wpR/fXTtVdnsJeqJ/eMG9HWCgZepuzRt8
	ELKVbTBHeG2YigL8fu/bvPJemYmowg4Toj/7+o3A/Xb+ky/wE1PbyzZmzqEpgfk=
X-Google-Smtp-Source: AGHT+IHHmX5ue9LDJxVvEFbiBLY6fpyRJlLVZUw3FD8DMpI+jCLVL59xjaoCL2RSoXyLnE6LcJTlvA==
X-Received: by 2002:a17:907:2d93:b0:a8a:809b:14ed with SMTP id a640c23a62f3a-a90d50ef6aemr1202082066b.44.1727084534914;
        Mon, 23 Sep 2024 02:42:14 -0700 (PDT)
Received: from an.. ([2a02:810d:600:2744:e855:ba31:e4ab:c4bc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3877sm1183903066b.112.2024.09.23.02.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 02:42:14 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 2/4] install-buildtools: fix "test installation" step
Date: Mon, 23 Sep 2024 11:41:57 +0200
Message-Id: <20240923094159.51274-2-an010@live.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923094159.51274-1-an010@live.com>
References: <20240923094159.51274-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 09:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204802

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


