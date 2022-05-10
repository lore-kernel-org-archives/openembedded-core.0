Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3260CC433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:37:55 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.10739.1652193467326475049
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1GYd+NZ6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so2175465pjv.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CK/E0MwofIvmmmArSMdtUFQXK1dMKL5HC1YAx9/UwqY=;
        b=1GYd+NZ671M9RxfObZ0UYJHTDJzUgsg4tKFNbBkjO1ijUoag4dWpzdSCGvhPAEbhDK
         /tNnDb1SwVsSv6NY3Ku0pggokuHbMQPn08iMpZ3QuCxGr7fUeVCOM9p9PjJf7a/rifYl
         k3cBXCNktcwqzXCyRjg902NPyOWZEcsS+gdPpm6H3P13Je+Iluv2k3mVNPisa63kQffX
         gRq0Xxe6bGnzqpPZREC6GlCOL8pjMCdfsBMvenfkG1ysit2E+KJO5v87mr2fdD0MZMW5
         bHIJqEb1tfA6+bphyYHKx5972kJy8ypGPnxEx95dPfETIUaNvTd89cx/VvbYCsQpb3Pl
         ZcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CK/E0MwofIvmmmArSMdtUFQXK1dMKL5HC1YAx9/UwqY=;
        b=B0RZKiiiwys0ssbZdu0PSj6opvpj9czh3NyVOPxOVlJshZ3csQcIPgFQotl+eF3WWc
         7vfEPmXEAw6EAwODdKvmWsGiCyUSty2YL7TNx9U0v1A6vcqNDJ4bJbIIL2En8yKNBgZZ
         URZPqawh8ZNPlPgXaDhXi8VbrBiMJ3St1TZXJ8bOYR5b1ka2KRqOzzHX+CHmiTpA7HcK
         bIeQdF0VtB4JHdefR2w2bbmlJHloyXtG8BqY0Rhxy6L0F+7V9dyMOlxpnnDwoytoA3nk
         1TXHXfPFXTKxvJ1oJ/3ADkjnZZ1wtqExvaB85ym+Eax3lbd04ePsmf0CMLXDtvq1NcKG
         XKNg==
X-Gm-Message-State: AOAM530ukLS5redYfmGqy8kHWr8gBsd2RHlgzJzIruwEfuzVQNGgQvnM
	vNGHyspGgmGgRJUC2YMP1pJ35yrBxWmdgNbc
X-Google-Smtp-Source: 
 ABdhPJxbKCKLdRVuODlw3VcH0VbAAKPFoG/ad2SboFJYVd+7DgF5iAeG/sOhyt7lalno/X7IFK6EmQ==
X-Received: by 2002:a17:902:9a4c:b0:158:b6f0:4aa2 with SMTP id
 x12-20020a1709029a4c00b00158b6f04aa2mr20869656plv.163.1652193465974;
        Tue, 10 May 2022 07:37:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.37.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:37:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/40] kmod: Enable xz support by default
Date: Tue, 10 May 2022 04:36:42 -1000
Message-Id: 
 <4c8be443515deadaee97ef4ed470a167594e8102.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:37:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165420

From: Khem Raj <raj.khem@gmail.com>

RPi kernel has started building compressed kernel modules by default
starting 5.15, currenrly therefore meta-raspberrypi kernels are unable
to load kernel modules since kmod and kmod-native do not entertain xz
compressed modules. There is a fix proposed in meta-raspberrypi [1]
but the fix is needed for native and nativesdk recipes as well, perhaps
its best to enable it here for best out of box experience with
meta-raspberrypi

[1] https://github.com/agherzan/meta-raspberrypi/pull/1056

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 20e9917b8d40f576b3661bc29e13602a24e86b7b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/kmod/kmod_29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod_29.bb b/meta/recipes-kernel/kmod/kmod_29.bb
index 9b66349066..32dc49c126 100644
--- a/meta/recipes-kernel/kmod/kmod_29.bb
+++ b/meta/recipes-kernel/kmod/kmod_29.bb
@@ -27,7 +27,7 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--enable-tools"
 
-PACKAGECONFIG ??= "zlib"
+PACKAGECONFIG ??= "zlib xz"
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[logging] = " --enable-logging,--disable-logging"
 PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
-- 
2.25.1


