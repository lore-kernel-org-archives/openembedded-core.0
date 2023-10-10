Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D39CD80DD
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 13:50:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.92072.1696945812548360654
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 06:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=xZOCN2gq;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40684f53ef3so55418415e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 06:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696945811; x=1697550611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZGKz6a1wGDLxDXWoOhYu9ColshQLVRHCAtWkm4X1c0=;
        b=xZOCN2gqDYPf5u7cIDAf6ZWTt6LmzhqWJup+nUoFWVCOAHZQNo5MqzpHS3yBJbCSVU
         w0EhtSduJCV2+cXld7d4a/RvsDk6nvy3nI+h1nhcUUcMzYiOAr7z5oF8E+YKsGYdEdtG
         jlf2orRuxm08Cd02ij4oRAoica9Dxm5WCUyq21m57w1rmFtSHSh1T2y8P34Iw+J40gwh
         25bnB45m0dg+WmnJnqifDAiheq9HCkZ7suE8aL5VyFh9r9il4la/SjfH4KeL2Uv9NufI
         7U17yGfOU17IPdKdP4vvlxaZtCPTPe98lUhfXC6yY3HiaqPOMwwxo9ZPxqRhhClXZjhd
         4LOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945811; x=1697550611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZGKz6a1wGDLxDXWoOhYu9ColshQLVRHCAtWkm4X1c0=;
        b=Hmp+j6GRZwwHOnosE7Z2C+V32WktYPAtnPa6lkTsLoPcXaR1BymdDkpxkmNNbQofiC
         C1s4oEjYQEIvJlJGAnIaxjN2TetsLfz022qNY5GXzEuoZcwP24xLtXW51/ja0nzDVirj
         wMhh96E8xumopWMO74w2nNGN1ZhM3Msvd8EZNzt1vnpH9pg25tjbZ2ptPT2NhPwJQYiN
         97pa/50oQO5YfsblM8r5o60lBxhuSOHzuWBFxrx5VqB38vZqPvw4fl7LrLlRPp9SulBC
         ppP1SxaU55aHWMB6y4akDGpOawa13wRMi4VxXZSqHEM/UAROiJYHV59LKFsSyqX232du
         hC9w==
X-Gm-Message-State: AOJu0YxI9RG7ZOg4pSvkw2JlIMwcrIJFXfwjrmthB+KVvZjH8CWPoNsa
	WH9HZ9NVbG82bfWutCkgmvImb4AuFxmA6YVukAU=
X-Google-Smtp-Source: AGHT+IFy2fq8Gv92pJimr8AG7QAvb9WLA+/osA0ZNmjN3GKhjJA7DxiDJseCeT+zh6Zcxzwn8k33ZQ==
X-Received: by 2002:a5d:538f:0:b0:323:306e:65cf with SMTP id d15-20020a5d538f000000b00323306e65cfmr16690261wrv.10.1696945810642;
        Tue, 10 Oct 2023 06:50:10 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id c14-20020adfed8e000000b00317b0155502sm12716070wro.8.2023.10.10.06.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 06:50:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3 2/4] insane: Detect python and perl based tests
Date: Tue, 10 Oct 2023 15:49:29 +0200
Message-Id: <20231010134931.3994720-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231010134931.3994720-1-yoann.congal@smile.fr>
References: <20231010134931.3994720-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 13:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188894

From: Jérémy Rosen <jeremy.rosen@smile.fr>

match_line_in_files will look for a regex in all files matching a glob.

we use iglob to avoid a complete, recursive scan of all source. iglob is
based on python iterators and will scan as we walk through the directories

pytest are detected by looking for "import pytest" or "from pytest" in any
python file.

perl Test:: is detetected by looking for any t/*.t in the toplevel source
directory.

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/insane.bbclass | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index c40bae7e3d..99b8faccf5 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1351,12 +1351,34 @@ python do_qa_patch() {
     ###########################################################################
     # Check for missing ptests
     ###########################################################################
+    def match_line_in_files(toplevel, filename_glob, line_regex):
+        import pathlib
+        toppath = pathlib.Path(toplevel)
+        for entry in toppath.glob(filename_glob):
+            try:
+                with open(entry, 'r', encoding='utf-8', errors='ignore') as f:
+                    for line in f.readlines():
+                        if re.match(line_regex, line):
+                            return True
+            except FileNotFoundError:
+                # Broken symlink in source
+                pass
+        return False
+
     srcdir = d.getVar('S')
     if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
         pass
     elif bb.data.inherits_class('ptest', d):
         bb.note("Package %s QA: skipping unimplemented-ptest: ptest implementation detected" % d.getVar('PN'))
 
+    # Detect perl Test:: based tests
+    elif os.path.exists(os.path.join(srcdir, "t")) and any(filename.endswith('.t') for filename in os.listdir(os.path.join(srcdir, 't'))):
+        oe.qa.handle_error("unimplemented-ptest", "%s: perl Test:: based tests detected" % d.getVar('PN'), d)
+
+    # Detect pytest-based tests
+    elif match_line_in_files(srcdir, "**/*.py", r'\s*(?:import\s*pytest|from\s*pytest)'):
+        oe.qa.handle_error("unimplemented-ptest", "%s: pytest-based tests detected" % d.getVar('PN'), d)
+
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2


