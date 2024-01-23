Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9371C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 14:06:58 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.12949.1706018817981530562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 06:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=mF4xYMfm;
 spf=pass (domain: baylibre.com, ip: 209.85.221.52, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-339289fead2so3599626f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 06:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1706018815; x=1706623615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgQiHXprsNxqlLgZ4HJwptnUCvdcOwvzMqzu1nwYn6Q=;
        b=mF4xYMfmXe/RdAHP+0RGzWtf8AiTQXT6IdVyq6QSmUmInH3WILk+u3Oi9pRXkYTb1u
         siryPOkNed2F/mGHBeGekJJHT5IvUIjstClBIZ4xC6r6BNhscMLI56au2Z/D7jwIRovd
         eLAy4aCAciY10B3NxVKah9BXdK61bXKedEE+jq+1R1VTgqL0tRWe+nPxwxSTzyH2DXf+
         3KFu3sbQ4QXLJTINhn1fmS3NdRSl4ZbEQYLMv60oK65fcO1bf9AvEM+faDaurqFOfFaq
         k8D7hVE0sOmNt34OUv9mKGjm2nFm6yyusmSTqUOnTo6+WZ6XywMdobH8kIa3/yeJx78f
         QFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706018815; x=1706623615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgQiHXprsNxqlLgZ4HJwptnUCvdcOwvzMqzu1nwYn6Q=;
        b=cf9aK1E+Ojzhl3+DmFhzjnJeXh2fRvuwLR/dwg6r1E0wAu6lK6mTKPy3z15qX9qPqf
         6Kz/xgRXFbeOENEkEqsHPwncorQUDpCHW+3sJR2lLB+dUThtQ0ju3P4iLlZVJ0Df+6t5
         4UC07MueEyzSjAsa5bQIac7ZBrwyZ9EauQfb25yI0wgxx+Sdnn1dxQCFu8K5I5enb81E
         JQRVs0NFWFjEx3Vlu7KPef+uXZ5CZ8N8UV30vz6ADOg+E2jwG0JdEm6GiKEvwC90GAi3
         3KEWmujXff1ptzZSDfd4aF9TO+F2ae/bhLwtqQvtDo8ZKqjEBYh7aUOq9UPBAsMfIPaX
         uNqA==
X-Gm-Message-State: AOJu0YwCouyCu27Zt2TVaf9lYukn8a5sNj2kdyndSI1jnPOj47FXqp9K
	vtIs1ClqkNmjujP3x/bWm6PUgXmcLPs4KRb6TLg/2GBOX8aT+0h7WT6r69wkQQdLI0DEqTPZ83c
	9IpI=
X-Google-Smtp-Source: AGHT+IH7y3395KSjn4PZYG629aai21TYfLcuqQ9kLkfT+wDbG8Zc8aoS8LcE46UczbLOXqT+3k6LCQ==
X-Received: by 2002:a5d:4bc5:0:b0:337:c0b9:f6f5 with SMTP id l5-20020a5d4bc5000000b00337c0b9f6f5mr3577567wrt.102.1706018815256;
        Tue, 23 Jan 2024 06:06:55 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id q9-20020adff789000000b00337d6aa3912sm12998447wrp.10.2024.01.23.06.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 06:06:55 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 2/3] devtool: modify: add support for multiple source in SRC_URI
Date: Tue, 23 Jan 2024 15:06:50 +0100
Message-ID: <20240123140651.930307-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123140651.930307-1-jstephan@baylibre.com>
References: <20240123140651.930307-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 14:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194239

[YOCTO #15162]

when doing devtool modify, sources are extracted into a devtool
temporary workdir. The main source is moved inside
build/workspace/sources/${BPN}/ and local files are moved inside
build/workspace/sources/${BPN}/oe-local-files. Secondary sources are
currently not handled and are lost.

Here is the output of devtool modify/build on bzip2 recipe:

NOTE: bzip2: compiling from external source tree <...>/build/workspace/sources/bzip2
ERROR: bzip2-1.0.8-r0 do_install_ptest_base: ExecutionError('<...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368', 1, None, None)
ERROR: Logfile of failure stored in: <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/log.do_install_ptest_base.3368
Log data follows:
| DEBUG: Executing shell function do_install_ptest_base
| NOTE: make -j 16 DESTDIR=<...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest install-ptest
| sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
|            ../../../../../../workspace/sources/bzip2/Makefile.am      > <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/Makefile
| cp ../../../../../../workspace/sources/bzip2/sample1.ref      <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
| cp ../../../../../../workspace/sources/bzip2/sample2.ref      <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
| cp ../../../../../../workspace/sources/bzip2/sample3.ref      <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
| cp ../../../../../../workspace/sources/bzip2/sample1.bz2      <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
| cp ../../../../../../workspace/sources/bzip2/sample2.bz2      <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
| cp ../../../../../../workspace/sources/bzip2/sample3.bz2      <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
| ln -s /usr/bin/bzip2          <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/bzip2
| cp: cannot stat '<...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/git/commons-compress': No such file or directory
| WARNING: <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368:189 exit 1 from 'cp -r <...>/build/tmp/work/core2-64-poky-linux/bzip2/
1.0.8/git/commons-compress <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/bzip2-tests/commons-compress'
| WARNING: Backtrace (BB generated script):
|       #1: do_install_ptest, <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368, line 189
|       #2: do_install_ptest_base, <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368, line 158
|       #3: main, <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368, line 226
ERROR: Task (<...>/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base) failed with exit code '1'
NOTE: Tasks Summary: Attempted 776 tasks of which 765 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  <...>/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base

externalsrc class modify SRC_URI to keep only:
* 'file', 'npmsw' and 'crate' sources
* url with type parameter matching 'kmeta' or 'git-dependency'

So by forcing to add type='git-dependency' on secondary sources, we
ensure that when building the recipe, the secondary sources can be
unpacked into WORKDIR.

This allows recipes containing several sources to be built under a
devtool context, but it has some limitations:
* user would not be able to generate patches for the secondary sources
* type="git-dependency" is added for secondary sources even on non git
  sources, so we may want to rename this parameter

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/devtool/standard.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 13612d64c4c..8fb4b934d43 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -956,6 +956,26 @@ def modify(args, config, basepath, workspace):
 
         bb.utils.mkdirhier(os.path.dirname(appendfile))
         with open(appendfile, 'w') as f:
+            # if not present, add type=git-dependency to the secondary sources
+            # (non local files) so they can be extracted correctly when building a recipe after
+            #  doing a devtool modify on it
+            src_uri = rd.getVar('SRC_URI').split()
+            src_uri_append = []
+            src_uri_remove = []
+
+            # Assume first entry is main source extracted in ${S} so skip it
+            src_uri = src_uri[1::]
+
+            #Add "type=git-dependency" to all non local sources
+            for url in src_uri:
+                if not url.startswith('file://') and not 'type=' in url:
+                    src_uri_remove.append(url)
+                    src_uri_append.append('%s;type=git-dependency' % url)
+
+            if src_uri_remove:
+                f.write('SRC_URI:remove = "%s"\n' % ' '.join(src_uri_remove))
+                f.write('SRC_URI:append = "%s"\n\n' % ' '.join(src_uri_append))
+
             f.write('FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"\n')
             # Local files can be modified/tracked in separate subdir under srctree
             # Mostly useful for packages with S != WORKDIR
-- 
2.43.0


