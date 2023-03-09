Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1A3C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:45 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.5726.1678402716076949138
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=IaeV/jjl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id nn12so3553055pjb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bc7OZbz8NhgtqJosBCjNCdfiDHgxg5FYJW4TWBkL+7c=;
        b=IaeV/jjlghL4fBzT+OcoPSu0n2p+1l2E+9k4nHF2tkkw3nTTWDzvTQWbYHkjSuwTm2
         8Jte5DhTZsu0rjubuApkNFR9WPmH0a/WG5PYpcL0mTheAVD8T94Jb2eFQUTbDFAmq7WO
         wjGug9PRL3p7HWqWah+MC9QSbgV4+GWClrSVnJCG56WhfGeWFRjjSkOg2ZJySvKibeWg
         +cYS5El5PmqE2iBRTL/jGG/Fk68c0Wb0sOCkqm1r/atC/5p84Ap3nG6fPASUuekaU5VQ
         NPtiUQeXqtIxziDfRyY7KXUW2vvZQ6IMEzXlRz40+PrkbqFAvrH8gKO3EB5vBcUad4X+
         A/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bc7OZbz8NhgtqJosBCjNCdfiDHgxg5FYJW4TWBkL+7c=;
        b=AaK44daqdIuEroAVUnbZniKai5ZlctFMEXDviK9uDUHC5SOEk15WAg3DuVF/fLQmFk
         9i/gqjtpF4hY63W8ff8P/R66BuZ9K1JZGIvhDoFY+K/Hhw0b6TKXHrzO0Ue6unvGAeeP
         UQachqxIGlqq1KczoVQ6B0zSEETUq/y1pv0g8du9tNSvrtvbK5nWo2v2+0vH8MNxi7Da
         kqnDJAAXQEIv5jie+pSGPm8OdrrodYiH81D9zQuAnWiIV9RdkUz9LrenLvSSOQPGNaqa
         Guqv/ECHiRjuUj/MYu58RttYW1ZwOPwvOeR/u4lw9aJbDk1UHcq1MK5A1tzDpNJL2t8s
         cDEA==
X-Gm-Message-State: AO0yUKVNuuo0QGzF8/d6W598h0GpWzKObpraDV1byawcYMd56Z0ir1Xt
	5+vHi+OAuqLG+M2JaE+kUzQnQ87GV0fZfHy22Og=
X-Google-Smtp-Source: AK7set+JbGbmsWi4zE+o18W2dj9hHnqU+qIMEIbxhmJYQxlo8YKqncL2zfz6KQoMFbprCSvktoeycQ==
X-Received: by 2002:a05:6a20:6615:b0:cc:5c57:7a0d with SMTP id n21-20020a056a20661500b000cc5c577a0dmr25549212pzh.40.1678402715131;
        Thu, 09 Mar 2023 14:58:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/27] devtool: ignore patch-fuzz errors when extracting source
Date: Thu,  9 Mar 2023 12:57:48 -1000
Message-Id: <aa256e62df4f31de1c2c1ce7d0a6ab8bdba4a032.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178286

From: Alexander Kanavin <alex.kanavin@gmail.com>

So that patch fuzz issues can actually be fixed,
as extracting source with 'devtool modify' is the first step
for that.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7067abd31d9dd4b98ec70c1c7effbe2904797cd1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d64e18e179..0339d12763 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -567,6 +567,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         logger.debug('writing append file %s' % appendfile)
         with open(appendfile, 'a') as f:
             f.write('###--- _extract_source\n')
+            f.write('ERROR_QA:remove = "patch-fuzz"\n')
             f.write('DEVTOOL_TEMPDIR = "%s"\n' % tempdir)
             f.write('DEVTOOL_DEVBRANCH = "%s"\n' % devbranch)
             if not is_kernel_yocto:
-- 
2.34.1


