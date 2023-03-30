Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BFAC7619A
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 23:27:04 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.42094.1680218818140873332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 16:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=AVvEnFpD;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id r11so82987409edd.5
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 16:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680218816; x=1682810816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TdGc7kmm9yIC9jTQt8yr1rq7WUYbmY5ElMf4Z/fQRog=;
        b=AVvEnFpDhRzRqsrZof7amcsQBKERUIbLOSEqHJfosyJBaopcO59CM5LswpnzA8WCVr
         T4OWMpdBKjsvYVEOi2iTk4TzLW7/TeP9ntMP2F6bvZC6Ejh/iLIDjdH55UCPAhA6qQc7
         vQFd9I8FwnMsWeU19N87xk7A1KuhfPk08kLlCJQc4q9Vbi1YoVNyjirkDOxEJy/RbxTf
         IbThH2uP6ssSMDsDHuneqGCGzQJenajUtMPpCKaCQeZwWwgd384s7YAIymm2mvcUCuc6
         bFFIqadzqvUPxMSdODSpMWV40K+o4BtaCtk0rI4jMJhe/PBWCnxGxXZtTOuOjB/hiYTp
         MKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680218816; x=1682810816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdGc7kmm9yIC9jTQt8yr1rq7WUYbmY5ElMf4Z/fQRog=;
        b=mlMENeVLlUqxSAdujUWK8sp3dsqrkOEbfRhosQxKU/qoJGhfzMjgX3+bnJ8dHQN6c1
         BIK3r9I7spLMgN3AepCxaRqXC5/GsvqiFSEXvw6ABguJd4nA1nA0yrspVBrPKTV2OBdr
         SD81B66sih+4Trd2ZC9dzLWGkoxAS56eKBOXQ0zMInR5d1rZY1uj9BmL9WLE7Fkg9lPc
         OpJFTghWKw+9YrXj2rKw6+tkBma7FP5GlVR5KkuWYCU6QjUwVqwNhA1gn5tX3GHc4aaK
         sJwhiyCun3K7Ombekg0AYk0PA7q8/ywnHcHKdEUi30ZKVSr1+IPj9MfXS81WTRm2AC+W
         pMcQ==
X-Gm-Message-State: AAQBX9fmLfobwgTBALIFS8gnHDNOoVpJuTvxrnwWvhyIfFLg+W7bb1JT
	0lcGng16w3TIjbTa6nnw3oesa9qeslg=
X-Google-Smtp-Source: AKy350YVYGCUzUIe/IGs5Bl76pI5Gt60HcdcFO1o2e4gAaYKXXSB4gQPhpOvmLLqs2WL7uY0SVki4w==
X-Received: by 2002:a17:906:13d3:b0:930:1178:2220 with SMTP id g19-20020a17090613d300b0093011782220mr26273508ejc.40.1680218816468;
        Thu, 30 Mar 2023 16:26:56 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h11-20020a170906530b00b00922a79e79c2sm308079ejo.217.2023.03.30.16.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 16:26:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] selftest: imagefeatures.py: don't mix tabs and spaces for indentation
Date: Fri, 31 Mar 2023 01:26:50 +0200
Message-Id: <20230330232650.2747383-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 23:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179377

* introduced in:
  https://git.openembedded.org/openembedded-core/commit/?id=96d4486df6d870ef19e2055b026729e66bc118f3

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index d31b43d9cc..0292c882f2 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -229,10 +229,10 @@ UBINIZE_ARGS_mtd_4_256 ?= "-m 4096 -p 256KiB"
                     self.assertTrue(os.path.exists(image_path),
                                     "%s image %s doesn't exist" % (itype, image_path))
             else:
-            	image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.%s" % (bb_vars['IMAGE_LINK_NAME'], itype))
-            	# check if result image is in deploy directory
-            	self.assertTrue(os.path.exists(image_path),
-                            "%s image %s doesn't exist" % (itype, image_path))
+                image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.%s" % (bb_vars['IMAGE_LINK_NAME'], itype))
+                # check if result image is in deploy directory
+                self.assertTrue(os.path.exists(image_path),
+                                "%s image %s doesn't exist" % (itype, image_path))
 
     def test_useradd_static(self):
         config = """
-- 
2.40.0


