Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFDFC001DE
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 02:33:58 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.39381.1690166031378755815
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 19:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=1Q+yGZoJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-66f5faba829so2367734b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 19:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690166030; x=1690770830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gw+r46iwmZo1MzTnQueqi5V1bUEhNZPfAC1U6x1oL7g=;
        b=1Q+yGZoJx/97SYVdRVnD9ohu6tiPSL7q3omCkfIzZpH0g6CqzcbHZ5XE2cP2dyeeDb
         FU2YStlOzYnVZAawCHQTQmOAYS8FqFm+Jiq1eEkN0wSO4tfuWnFM0lsW0H+WaH7EXbLP
         ZpNgMvhKZftMgj4ySloQaRNxpxXVxZmQGrK5MPypw4+RXiu8fU8ArCSb372ttl1b+6Ni
         5z4lZ4PuyzfOMHW38hh53bVfFPjyPhoTtjXhaJJu9A96oqOCPxAGXoihD280BbuSZ08l
         qiREwEx2+7z17qblDsyB22NjDKET4ujIQweGLvRcZvChxynePmg83tZgjdWGHw2W/iUC
         OpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690166030; x=1690770830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gw+r46iwmZo1MzTnQueqi5V1bUEhNZPfAC1U6x1oL7g=;
        b=lD4r4jAAAS6zsP0nsWJbInLcVfcUDcqZnlDYKDJJ2M2F7rrbmcSEFG8V5ToDF6ADNR
         nYhNcW8jDOTK2N+Rf0cz5OqIqGjh7UBsYRSrXx1xq+vKy/ahpHuQfMF0eBT41AnzSoNa
         NJCrtRzCBLO9agzVbuU7jr6eFpMXvPBQFwlEc0SAL5rebWAPHIHrOtXp/DAC3rsflgnR
         IVHq4ZTw6CRpwlJmHTLwhkJaDtAZOqM4kqGD0VwWbvPssQp9YrlvXMLaNJzXo5tV9kh5
         AM5UqzNMziQDaTRVf4NkdGl2TFl/nxT4QUO1pMEEw9Rw0IbGs/JZyUpDt0YKv/GxbnBD
         YGrw==
X-Gm-Message-State: ABy/qLYmhRdx77wRbkT5bWSmQpSUmMQFkux0Bpg8X3W3qI+ECmFBB8jy
	K4vI8KLuSi6Jk0J4zsWT9qmJd3wItFdeBBXUYOuu5g==
X-Google-Smtp-Source: APBJJlHy6KdTfuxFKglYVaw97y+ON5p6TlUogEvsla4J0k80/J2lE/fx28ZFKnOBVa/Ie4sbWlkzHA==
X-Received: by 2002:a05:6a00:17a8:b0:679:bc89:e5b with SMTP id s40-20020a056a0017a800b00679bc890e5bmr8950465pfg.19.1690166030425;
        Sun, 23 Jul 2023 19:33:50 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j1-20020aa783c1000000b0063f00898245sm1024174pfn.146.2023.07.23.19.33.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 19:33:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/8] gcc: don't pass --enable-standard-branch-protection
Date: Sun, 23 Jul 2023 16:33:30 -1000
Message-Id: <759327cf6bd79118bae0c68e63742ae4721471d8.1690165924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690165924.git.steve@sakoman.com>
References: <cover.1690165924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 02:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184774

From: Ross Burton <ross.burton@arm.com>

By changing the default code generation of GCC we're inadvertently
breaking the GCC test suite, which has ~120K+ more failures when run for
aarch64 compared to x86-64.

This was because the generated code fragments included the BTI
instructions, which the test case wasn't expecting.  We can't tell the
tests globally to run without branch protection, as that will break the
tests which also turn it on.

Remove the enabling of branch protection by standard in GCC, we'll
enable it in the tune files instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb4b9017db6a893ed054a2d2ad4cc671dec09c42)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index e4cdb73f0a..dba25eb754 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -40,7 +40,6 @@ EXTRA_OECONF = "\
     ${@get_gcc_mips_plt_setting(bb, d)} \
     ${@get_gcc_ppc_plt_settings(bb, d)} \
     ${@get_gcc_multiarch_setting(bb, d)} \
-	--enable-standard-branch-protection \
 "
 
 # glibc version is a minimum controlling whether features are enabled. 
-- 
2.34.1


