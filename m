Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.66925.1629359617179218512
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 00:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Za/Eq6xQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id z9so7559918wrh.10
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 00:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m5nsZFgeSZowsMkbZm444sb7BbP6TAGK6oR099jJlh8=;
        b=Za/Eq6xQOdIGBKbk/LiGFyOAEihEThpMNja3qtkw48AdlH9tnT1zLlrgsAiebWGOuW
         lqzD7GI3nVhbVZK+bVd6jAFzYFgt4UqFfkm4HjI8jo46IDxY40awzrRXTbkGhYY/cGOW
         wKqSU82QEog5Zd77ymDEt+tYk54PmQjH5pMDnE8dBcmk2ooXkC7sUqmnuO8GPxQdZ4Q2
         b5EAp+MyXaG9gVxuE6XyHasAsFlfZ88rDylDKPGhGWA5jnAoTFIoza0SLFuB0XtCeEAY
         NszgQLGv7Z/oowDSHoU9E1bKEGs0Q/T1uE+mbDCIgnNODY6sA7MebTWj2drwX3RJ+2lD
         pXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m5nsZFgeSZowsMkbZm444sb7BbP6TAGK6oR099jJlh8=;
        b=I1mEN6oPfH7NGGMNTY0UdcfJDXYt6utkITT+DeGKb4pT5oOl1z01mHLXJ0NJi1h4BV
         yq9k54X08EoqvgvsA0WNKVzCHrhlYTMZe3/pJvXFXQfQVndYOh35YnGInH7ZWciLaZjF
         ewfKqLQ5WxOjcuSGI4J4/vsiKqtggJvAE2Ak4UYWe35Hbs6DOZlYYrBPu9wxSPYojS3q
         lxHc3DDlpy2CJRDM4t4hq8sP8ev/lDjg6nKnwSTmJuRTvdsSefSey7IUVtpiIZc6sqzx
         zOKVBuJbQtEq5To0nbSO4GLNEOe5rgxw69bfUQCowJ3QswFcYH8eIyPIPCzgXx2b+rDc
         6ijg==
X-Gm-Message-State: AOAM533EzwP/qBTTFwii9AXzOf+XY0K+gbUkYgUPHJ2V+ehoJAF6lATP
	mQQJP2+zvqfleFo+qBQzmtp1jVt6PWw=
X-Google-Smtp-Source: ABdhPJxZeBLbGg19NfcuGXUBuK/pUHbmUybfJ1cp1nfmhe28IuOfaqIHeoxlz0ucQB8CCFSTg8OOKg==
X-Received: by 2002:adf:aac9:: with SMTP id i9mr2052310wrc.231.1629359615330;
        Thu, 19 Aug 2021 00:53:35 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id f10sm2143785wrx.40.2021.08.19.00.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 00:53:35 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2] patch.bbclass: check if patchdir exist before appling the patch
Date: Thu, 19 Aug 2021 08:53:26 +0100
Message-Id: <20210819075326.8611-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

if the user specifies a relative path on 'patchdir' that don't exist,
the patch will fail and there are no message that indicates the real cause.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/patch.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 559c6f45bd..4b38be7e3f 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -134,6 +134,9 @@ python patch_do_patch() {
         else:
             patchdir = s
 
+        if not os.path.isdir(patchdir):
+            bb.fatal("Patch source directory don't found '%s'" % patchdir)
+
         if not patchdir in classes:
             patchset = cls(patchdir, d)
             resolver = rcls(patchset, oe_terminal)
-- 
2.33.0

