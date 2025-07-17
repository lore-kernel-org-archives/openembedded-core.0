Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B93C83F27
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:59:31 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.40273.1752721168657879616
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gSDtm/I1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-31393526d0dso450394a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752721168; x=1753325968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Bs0tLdg35vY313ByYwTjqILVDveKfqKQ0PlzAaPBVE=;
        b=gSDtm/I1mTcGj2LMQqxHKBMDPXxlK45+d8qUzOqBDWfh7uUeRYHoaeZkSD1uG6Nzoc
         oK2vHhz8cYF8ols9d9xGF2XvJxboqRy6W4kuXdhOfPRVku1sYhGQL1snm2IK0y/ZQism
         lOBhrE7OmpyB+SD7fTujIzdrEJuLMv58eZaXUzWYHGingZ0EkEnU8J1izBYRB/g/i5nr
         WTOh6+j9+OKmmjE9G/lIUH9GqGmHhBPq1H/tXVq9nBeKSMYlJkF0ROpd7o09hOjHgGjm
         +J0u5pUtOYrjLNqe1SXzdcw2xlq2VbgdEg57zVMhN3Bnf4rdV9o1SQsuzGi5cEF6GdOB
         J21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752721168; x=1753325968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Bs0tLdg35vY313ByYwTjqILVDveKfqKQ0PlzAaPBVE=;
        b=ZR+d5hjCe3er3i8M/ELMTeio56dOtVUAy6YNRFdaN73zStDbLzOndKsS4X2rQ/PmOU
         D3smGnBhDcCodPWUPfc6wXg3EawTRaYrssCW6aCrsEnaEdBPgYmH9G/Z6F9U7KrRt3Rs
         2eTIqB7apXM3YQo2+OHJig+NLNCZyYwajewXABg4HMV+RSwaYM9oDI8HHRaNZBIY7hLz
         Xn9Rc9LKJAkEs4eTX0qW68ykuDQRHqPrTU0S932D08b4rkNS1bE+f/BrV7670g34QrRG
         e4HRO6PZP5pyd85tcOWOOYQZomh9CNNsMDDA8ZM65HWtYN7vKHQLsAPyyKjXmbrmt3K/
         K0FA==
X-Gm-Message-State: AOJu0YyvcGnaMjf9dmPvy0Na8IWfCLPy8oEO3j0WGXkf98CNIYIKUmbN
	q3VhUrX5Z470uF+OT7VlFA2yD7f8tOWEi8EfBJ58H/PczXaLjNob+Ta15wNTYUtL1ihLIr+cDSI
	YkcXJ
X-Gm-Gg: ASbGnct8bo1NqSb0o8akTt0kuL0jr5WOZYrV1dA0ewweJr/2xo00tL5bMOffWXXecSQ
	o63lm19rvKYDN7hXkdNek4XpZq+/tXvhkzKMRBkY8wHAN/iQLcUBGWumadrWag/GYDcbGHmsT/I
	9QoDkFmxSR6L+8mCk8vARXGg5IoV626hX2uyFpum0XvjdDAnSX7bIq8yRkPVeU5ruCO1FXQiIYO
	RubdZe0oIGxRmM0/svZjHPoP5RjX3QSjaBPFPJzvNWkyAeCRcLz8MWFAw/MZ407lMAQWKLuwOOK
	pEm7HRwnUmLIheKmZJC7cmQmH0nHhJ1q3ZCIf/+dkpEcptkIyM3Pq97zWjjWNA6sHVzHRm67IRS
	5tgr3xcEgvixFGw==
X-Google-Smtp-Source: AGHT+IGQqmoJKKIaQTWziFeOjAzEOwQj6UrdMtbiAM5Y3gQluTmqFeI6FyVUgylauY1Q83BL54fy7Q==
X-Received: by 2002:a17:90a:e7d1:b0:312:e9bd:5d37 with SMTP id 98e67ed59e1d1-31c9e6e2dabmr7854967a91.6.1752721167887;
        Wed, 16 Jul 2025 19:59:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e313sm2204547a91.35.2025.07.16.19.59.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:59:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/12] oe-debuginfod: add option for data storage
Date: Wed, 16 Jul 2025 19:59:00 -0700
Message-ID: <24c0ab18045920bb5c1e965c0ea6d176fd6de234.1752721028.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752721028.git.steve@sakoman.com>
References: <cover.1752721028.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220512

From: Joe Slater <joe.slater@windriver.com>

Storing the data files under $HOME can be unreliable if debuginfod
is used for several projects, especially if $HOME is shared
between machines.  We provide an option to save files under the
project directory.  The default behavior is unchanged.

(From OE-Core rev: e1e0cf82f559077e2a51447baf137086202c0c4a)

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/oe-debuginfod | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-debuginfod b/scripts/oe-debuginfod
index b525310225..60e51addfd 100755
--- a/scripts/oe-debuginfod
+++ b/scripts/oe-debuginfod
@@ -15,14 +15,29 @@ scriptpath.add_bitbake_lib_path()
 
 import bb.tinfoil
 import subprocess
+import argparse
 
 if __name__ == "__main__":
+    p = argparse.ArgumentParser()
+    p.add_argument("-d", action='store_true', \
+                         help="store debuginfod files in project sub-directory")
+
+    args = p.parse_args()
+
     with bb.tinfoil.Tinfoil() as tinfoil:
         tinfoil.prepare(config_only=True)
         package_classes_var = "DEPLOY_DIR_" + tinfoil.config_data.getVar("PACKAGE_CLASSES").split()[0].replace("package_", "").upper()
         feed_dir = tinfoil.config_data.getVar(package_classes_var, expand=True)
 
+    opts = [ '--verbose', '-R', '-U', feed_dir ]
+
+    if args.d:
+        fdir = os.path.join(os.getcwd(), 'oedid-files')
+        os.makedirs(fdir, exist_ok=True)
+        opts += [ '-d', os.path.join(fdir, 'did.sqlite') ]
+
     subprocess.call(['bitbake', '-c', 'addto_recipe_sysroot', 'elfutils-native'])
 
-    subprocess.call(['oe-run-native', 'elfutils-native', 'debuginfod', '--verbose', '-R', '-U', feed_dir])
+    subprocess.call(['oe-run-native', 'elfutils-native', 'debuginfod'] + opts)
+    # we should not get here
     print("\nTo use the debuginfod server please ensure that this variable PACKAGECONFIG:pn-elfutils-native = \"debuginfod libdebuginfod\" is set in the local.conf")
-- 
2.43.0


