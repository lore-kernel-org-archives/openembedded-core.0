Return-Path: <bero@lindev.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DE9ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 23:14:32 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.328.1666912462086544443
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 16:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=PRgootNj;
 spf=pass (domain: baylibre.com, ip: 209.85.218.67, mailfrom: bero@baylibre.com)
Received: by mail-ej1-f67.google.com with SMTP id d26so8955578eje.10
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 16:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HdMnKW9rRmL6JALsoEulmu3y5lkbuZe3H5tpXLdiJCg=;
        b=PRgootNjDr7T/Riauf8p2ibMxw8Yh8+FPlc8JCknZB7UBH948S+XBE4TnJGT0t9zOi
         Snu9T3EEWo19mzUMz09cUYWFZhLloku1PrOhemwDwwtjeIziqbW7/q6McV6zjToWvNvm
         Sy7wumhbKON0ozueyCL0AHzmGaUeLVZDIwm4wor93JPOj5J1fFByb/JtjAY4TbIqdpEU
         ON4qyi2eTqI5uBls8MZu9FcQLhBfKJM3K3PD0oT4zqOv3mcbapL5JlPL/2SkRw8i22A3
         q/tCCPqt2aXeH4B4o6Av93Ro3iRqbfc5aT+z3JFl4YSvrGsl4tYnNFY9XlWjvoBWMIFi
         rWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdMnKW9rRmL6JALsoEulmu3y5lkbuZe3H5tpXLdiJCg=;
        b=KFi0H+Ne9bIyNm5oHIkRz+cUuS2L/XLlvwkHoZ9wG9tq/2QMlOdcnQgrJkbhtLarZa
         9M/78YUj1wyWfmB4sIKTB1GkDZMe1vpcbYnPKwupGvvrCLP9tCf50Lqiuuv8G6gPvxyW
         uFyFCnyONP40PGhKU/J2IHejxv6zo+WnZSanS3zkgvtiRG7vWhbd55tA/LkArnWLcJWB
         EisXEw17Q43/QI2VxhjZbGBwLWwWe1cHTC1YGak4bB0yQX8ke1J1Omee/lqwfZOVf8yW
         9Z1+GebN7cSjhCb9GUG7mKtqeElG/eaDuIcuQlSvWMI+zPp2i+98TgrSExxXKVKruA7u
         LYzQ==
X-Gm-Message-State: ACrzQf16hH0m5S4oFJfuEDT3+0AyrSdjA+Q63BudG03K/ApICPu2vkIM
	8zIu70Wh7JA2D8hw8xuB7Htdgmd62KM7Yw==
X-Google-Smtp-Source: AMsMyM7NjPIIKHOrTySOocod4FcXAsZTL7m5SqObuUzh4QEDdOk8yzJUNolqI7yXTk39vQZ/OplNqA==
X-Received: by 2002:a17:907:31c3:b0:770:852b:71a2 with SMTP id xf3-20020a17090731c300b00770852b71a2mr44468285ejb.557.1666912459789;
        Thu, 27 Oct 2022 16:14:19 -0700 (PDT)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id g19-20020a056402181300b004619f024864sm1622062edy.81.2022.10.27.16.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 16:14:19 -0700 (PDT)
From: bero@baylibre.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Subject: [PATCH] base.bbclass: Try harder to find a compatible tar implementation
Date: Fri, 28 Oct 2022 01:13:50 +0200
Message-Id: <20221027231350.418471-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 23:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172229

From: Bernhard Rosenkränzer <bero@baylibre.com>

base.bbclass currently symlinks the first copy of tar on the PATH
to hosttools.

If that copy of tar isn't GNU tar (some Linux distributions use
libarchive tar for the fact that it can handle zip files etc. as
well; some others probably use busybox or toybox tar for space
issues), the build fails early on because path.py uses --xattrs
and --xattrs-include

With this patch, base.bbclass checks if tar supports --xattrs-include,
and checks for gtar if the first tar found doesn't support it.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 meta/classes-global/base.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 8203f54519..b6391501ca 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -135,6 +135,16 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
             if os.path.islink(desttool):
                 os.unlink(desttool)
             srctool = bb.utils.which(path, tool, executable=True)
+            # copytree() uses tar options such as --xattrs and
+            # --xattrs-include that are currently specific to GNU tar.
+            # If the first tar in PATH is libarchive tar or busybox/toybox
+            # tar, GNU tar may well be available as gtar.
+            if (tool == "tar"):
+                import subprocess
+                if not b'--xattrs-include' in subprocess.check_output([srctool, '--help']):
+                    gtar = bb.utils.which(path, "gtar", executable=True)
+                    if gtar:
+                        srctool = gtar
             # gcc/g++ may link to ccache on some hosts, e.g.,
             # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then which(gcc)
             # would return /usr/local/bin/ccache/gcc, but what we need is
-- 
2.38.1


