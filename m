Return-Path: <ecordonnier@snapchat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1F3C38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 07:58:25 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.3823.1666943901549447506
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 00:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snapchat.com header.s=google header.b=S4syoUKB;
 spf=pass (domain: snapchat.com, ip: 209.85.216.46, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pj1-f46.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso3835119pjc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 00:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snapchat.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MQaUIik9eSs593/s3MsEy/KCONjCg388JU62RAch+UI=;
        b=S4syoUKBoQyv38g56DeiEj9K4c3aLv6sdmacZ3uny41oL4eakbNd+RRh+Gz3dYRWy3
         aTwTf9xMq2Eg8OGlvNlkUjMM+DLuaFj7qgROdkTt2Mzh4qoalKLp2cb1cNSJ1jDDynWT
         c+URavZz/aW4KRnBYcawP3HgHJGzAu/DpLOGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQaUIik9eSs593/s3MsEy/KCONjCg388JU62RAch+UI=;
        b=QX3ebC/nZoNiEshpoNetF+7421Ps7w8yG0vA8II1W/BVBWYl6ftRDCAV7BgVVqWQhC
         Kq4XOo4YWkzfA8NFvvav9PGicEzELJSqJyJySO/qCpDoIaVdNoeveE8FQY5QE/0fBoM5
         0tFV7MOE0nsdjzTGgIoEWgY9nWN9rAmZAk8YPj7IwoST53SCHIgvJIZMV4ZrIlq14aJR
         mKjFGUezK/zhQnxD00ngbv9jJP5LzVbSHfP+GpLO4F22tBHdF6k7/lRmuV/bX7WILwkb
         D1M/2fmOSavDLBMMP4j7Fo4v+slm/SPdQLsBlRQYFS09B2ESTnyZWQYyFLXIG7Zthm+f
         Cv0g==
X-Gm-Message-State: ACrzQf0u7jgd0Xyh7g2tbDmbpBgOLm6Ls3GTSQlscTEtNyxdVeavCTvu
	1MaV+tOhZxijTa8LjgPy51aYFzvwmnk7FPZ8
X-Google-Smtp-Source: AMsMyM7aHIvBZriMvB1JZSK7jX3HGMOt3KZvBqRJPiKAwfhSuOFiwI6X/+lzUKdu1/gJYYCOQHk16g==
X-Received: by 2002:a17:902:d54b:b0:178:a6ca:1dbc with SMTP id z11-20020a170902d54b00b00178a6ca1dbcmr3906343plf.115.1666943900466;
        Fri, 28 Oct 2022 00:58:20 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.86.25.14])
        by smtp.gmail.com with ESMTPSA id u16-20020a170902e5d000b00186c6d2e7e3sm2466755plf.26.2022.10.28.00.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 00:58:20 -0700 (PDT)
From: Etienne Cordonnier <ecordonnier@snapchat.com>
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH v2] mirrors.bbclass: use shallow tarball for binutils-native
Date: Fri, 28 Oct 2022 09:58:05 +0200
Message-Id: <20221028075805.2390535-1-ecordonnier@snapchat.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 07:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172237

From: Etienne Cordonnier <ecordonnier@snap.com>

This is useful e.g. when using meta-clang, which introduces a dependency to binutils-native, and then a
full tarball of binutils is fetched additionally to a shallow tarball.

The original BB_GIT_SHALLOW lines were added because of https://www.mail-archive.com/yocto@lists.yoctoproject.org/msg08752.html

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes-global/mirrors.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index 9643b31a23..81fef7f660 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -90,6 +90,7 @@ BB_GIT_SHALLOW:pn-binutils-cross-${TARGET_ARCH} = "1"
 BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "1"
 BB_GIT_SHALLOW:pn-binutils-cross-testsuite = "1"
 BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} = "1"
+BB_GIT_SHALLOW:pn-binutils-native = "1"
 BB_GIT_SHALLOW:pn-glibc = "1"
 PREMIRRORS += "git://sourceware.org/git/glibc.git https://downloads.yoctoproject.org/mirror/sources/ \
               git://sourceware.org/git/binutils-gdb.git https://downloads.yoctoproject.org/mirror/sources/"
-- 
2.36.1.vfs.0.0


