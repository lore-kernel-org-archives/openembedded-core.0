Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC1DC43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:38:09 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.109.1667835466913995909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xuH2yvpH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id m6-20020a17090a5a4600b00212f8dffec9so10688194pji.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6+/7e+XFoaIiHWCVGpVKcerr7Ipa8CYUrZ91muxn2c=;
        b=xuH2yvpHG/gTk/Qn2cryCgnDPJzhkmD7UjbP9NxERSUAhJg6YjMsTSO1z7FdXeLuCo
         Q9lmsTVdw4zhyDuFZU+Yww3a54TRxb8Ln4ylK1BCff5juDEkptJitJzcvU4n6D+k7heF
         TFYcNB4hFjuxkC1neD5/kO7Wp3v9Oxp1bi50YZslvL05ZQ/hnq0ph7x4ush1AMiyWEj4
         Be23dY4T7Fz1prcOJaVHlh9J6Ees45ioJWWJBF/z1GCwe3u+Oc7iIPmuzypOb8qYOF88
         kzxd3hNnuDjqmEP6URSCh9LptzuXTypuDiHkiga1r4DQTUfGq7SFITT7sNjLSxvkptod
         pDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6+/7e+XFoaIiHWCVGpVKcerr7Ipa8CYUrZ91muxn2c=;
        b=opbnqABB/FY4+hYgXEFbYU1fbmo7kiILQgBlCiYc8HP0eXmuJvAYyhLUM4jwa3agK5
         mBXA2b+5LpO4QqleM9AngDuTqiEvcY/FaGil/vfqdN+e+CHDzNFyg42IT+rsisPluZFY
         en+uf7gHnhOciKE2x7J7sZkLKF00CLG/5i1ydR6ILJkytcc3a8s0FNk43CvpudM9XgMn
         j8TNsnEsezhL2in0upOMkAkrSuuskwgCEVTJO5dcwa+eRhA+nuERsPzgtOhjw09GxhMo
         W5C7rj9CGYN51BuAUiV/sKaF62w6Rbg4CtUhP4liSCZttdrygyFrl+McoqJ8n+AwSrSd
         BSIg==
X-Gm-Message-State: ACrzQf11TBAwHtkEDnTE+xIHlNBnvgc3c/BIZlDNHY6mFWiDuVjS3LLy
	5aHs8Et2lWHXvHe+bibbZPgYuAoCqQd973N3
X-Google-Smtp-Source: AMsMyM5uwfHZFiOEjOXQq+U7+NkPwOi0wSvHJN2MEUwfv9qZ4+p0yrrcAgIbIZp8/isngSbbCHBlFA==
X-Received: by 2002:a17:90a:e60a:b0:213:e299:b8e8 with SMTP id j10-20020a17090ae60a00b00213e299b8e8mr41468486pjy.85.1667835465854;
        Mon, 07 Nov 2022 07:37:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/25] mirrors.bbclass: use shallow tarball for binutils-native
Date: Mon,  7 Nov 2022 05:36:44 -1000
Message-Id: <0c0723757fbba9a4b88c0f98477a18d1e220da2e.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172924

From: Etienne Cordonnier <ecordonnier@snap.com>

This is useful e.g. when using meta-clang, which introduces a dependency to binutils-native, and then a
full tarball of binutils is fetched additionally to a shallow tarball.

The original BB_GIT_SHALLOW lines were added because of https://www.mail-archive.com/yocto@lists.yoctoproject.org/msg08752.html

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bd83b8b502ae935c75b59aaf71bbb531c9771dcc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/mirrors.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index ffdccff5fb..b8926fa6e5 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -84,6 +84,7 @@ BB_GIT_SHALLOW:pn-binutils-cross-${TARGET_ARCH} = "1"
 BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "1"
 BB_GIT_SHALLOW:pn-binutils-cross-testsuite = "1"
 BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} = "1"
+BB_GIT_SHALLOW:pn-binutils-native = "1"
 BB_GIT_SHALLOW:pn-glibc = "1"
 PREMIRRORS += "git://sourceware.org/git/glibc.git https://downloads.yoctoproject.org/mirror/sources/ \
               git://sourceware.org/git/binutils-gdb.git https://downloads.yoctoproject.org/mirror/sources/"
-- 
2.25.1


