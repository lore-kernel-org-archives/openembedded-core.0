Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94361C3DA41
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:34 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.7302.1687919427372495920
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=WU1yNkKn;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-39e86b3da59so4705910b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919426; x=1690511426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P85p6aV/KmHTok0XSQ/cX+m7ePj0S0sCUd7LhS+NWtI=;
        b=WU1yNkKnb1jZlMxvlCiTlkxcCbYlX9gF0CvTphte9/EizwwySD3zaFE/0lklcc9rPV
         /JePcv14sf3nLPjTVy1FHcZUppL+P3a3JfV2B9PhgA67dYTwVcpaxblnXaTkeErG7VUf
         6WrmN/fFS2xu0Wp+crVawVjD2j1l407O1hUWVyXbb5w55Ivo7TAz7o2CJJ1H6GtvCCnF
         GF7+XF8zsZpr7TGV15a5zwBO+s4qZjAoZAq5WugZ4cf7IGt11OOWBnYBM2fWwZ5QSZXn
         i1JM7xeQ6ll8+HGTTb7210eiNEVr9A73GnQbiRk4nw9RsG9kgqxngoB3zZJ4Bybvs5s1
         v1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919426; x=1690511426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P85p6aV/KmHTok0XSQ/cX+m7ePj0S0sCUd7LhS+NWtI=;
        b=EGDcb+bH8vhxGwVW/U+CN8LbEGEL7pqtBBMKIXEcPnXX3STELgpVMLS6N25n3POIT7
         TFfkMv3XO1ll2uTogI2e/MrdZPFZkQl3OWAQc+ncWkNcBaXtx4/MUC0xt83PSqrEBY2Y
         Dj2WETn7qv/2Q7zTd4yQhw4AZgj6GxGzbOHBsROOQww6tO+Nm5lmU7CRoK4ds0SJN0Mo
         S3wcGwq1S5lAIM5qLLDxveYW/CpgfJpUeK8dfUN86fx+VLuFXyJWYzq6S7v4506LPYsu
         +Z6BZJl6P6cX0ZCcOmEeqqCyBobPu0vGEMLfrgYYD2/trar9cGC4ZtfxCJceXYhYSx5T
         AjVA==
X-Gm-Message-State: AC+VfDwWedP+cilbrpzkv3hbI2u0k36PK8wONYMv7XQctNzUWVjirfrM
	iLT082YAvrGq9ENR5n5lbA21nl0fn76p+4R4ISnwpQ==
X-Google-Smtp-Source: ACHHUZ5yeoSvr1v7lKTxUtqW8z4VaNr8Y7aoAsyWA+jjPaym2FHOpYGTDYf2NQYPQd96wuV5FXv3wQ==
X-Received: by 2002:a54:400a:0:b0:3a1:df81:a22d with SMTP id x10-20020a54400a000000b003a1df81a22dmr6292990oie.37.1687919426269;
        Tue, 27 Jun 2023 19:30:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/30] qemurunner.py: fix error message about qmp
Date: Tue, 27 Jun 2023 16:29:35 -1000
Message-Id: <60466c8ee5c055bdc01582f3809c7b36bb646a1d.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183528

From: Chen Qi <Qi.Chen@windriver.com>

The error message is a little misleading as the qmp module is a
directory with __init__.py file, not qmp.py file. Also, put the
path where we try to import it from in the error message to make
the message more indicative.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 08bacbf797f6a50ae8abe8fc3455b3a15a0a94b3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 8bb35f5a8b..49c70727a2 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -188,7 +188,7 @@ class QemuRunner:
     def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, env = None):
         # use logfile to determine the recipe-sysroot-native path and
         # then add in the site-packages path components and add that
-        # to the python sys.path so qmp.py can be found.
+        # to the python sys.path so the qmp module can be found.
         python_path = os.path.dirname(os.path.dirname(self.logfile))
         python_path += "/recipe-sysroot-native/usr/lib/qemu-python"
         sys.path.append(python_path)
@@ -196,7 +196,7 @@ class QemuRunner:
         try:
             qmp = importlib.import_module("qmp")
         except Exception as e:
-            self.logger.error("qemurunner: qmp.py missing, please ensure it's installed (%s)" % str(e))
+            self.logger.error("qemurunner: qmp module missing, please ensure it's installed in %s (%s)" % (python_path, str(e)))
             return False
         # Path relative to tmpdir used as cwd for qemu below to avoid unix socket path length issues
         qmp_file = "." + next(tempfile._get_candidate_names())
-- 
2.34.1


