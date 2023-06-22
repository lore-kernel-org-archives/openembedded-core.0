Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578BCC3DA40
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:43 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.1226.1687401403015194838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=DSqQcVDT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-54fac3b7725so3103029a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401402; x=1689993402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1ZxTiTfMkGdr/JcyFWeEvKu426GmfC4pA0fAmg+qnk=;
        b=DSqQcVDTp0PED2qBFrHdYkhs5hzKfv6CEvabuq3X/xPwHxNkj+9xS4XNUT076KxgIE
         lSZxqj0k63K3q6Tj6vvDw8zZyU6dr/uV94Urq11hD2RLI4ZmC1IjzT7fS3aAUi3lr5Hr
         3l8ugFvqM27SuSJO7CA/QGrGqx4W3VLk/UxTNWeZWGa2pxi8fpMoP5/yf4QNsuaZ4Al+
         VC/7fZ/xwEB7mY9lNd7oNw9rBcPJQlSpwVMeGDemnJVkW+2eoMIEf5jlDXrf73+UUtLv
         4Hu4Clq6TmHhLYEkA/Jc0KEN+n5yOH1AvgJ7fQ24V84nWaal46wR2yaLMFKGyjMt726l
         2+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401402; x=1689993402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1ZxTiTfMkGdr/JcyFWeEvKu426GmfC4pA0fAmg+qnk=;
        b=fmGjvEmQGBEFMkxpaBJJ69Ekb/GxQZXZ3OOHXaEw9XrnAg2Uj34buwi4ODkZC0MDU/
         7+Dvtep/bWrFWPbZbsF772Xro3cmCjWhLc8dqWl+1FiKi+Y8TiSUzSjp7oCI5uZxslTr
         EBVM0lfzTTuPJsC0nljOUnOMDMEAgDgqg7EUfmZu6ha6Wszz725E5Hk/zvRhyITDOrw/
         QmnbFaOCfjQ16L1kSkbPQ3jrXQpu1KviJInzQDpekX7dD1RC+ei6hl7HYK4JLpxIkWz+
         PJHDAo5BUzezUZyoAmvl7DxqkLdtthib86u7p6BI+/VGkUE4yvqbJoB9a5ydqSMmo3AV
         hZXw==
X-Gm-Message-State: AC+VfDwhYhBn8KUvwyElxsF2i3AExvWYxs0m6u+OFu1HiNUrlpJfq4Wk
	7wpCEhBd2kme3QjTinNun5xmLGt3b/PT8CAEo8c=
X-Google-Smtp-Source: ACHHUZ5yyCDQxlgK5cnCOCTHKIcGb7+PCZEjTIjXs7XViIqjPmAtwzA9b/4obibjf8uvKxULeU8ptQ==
X-Received: by 2002:a17:902:e74e:b0:1b5:40fd:7bb7 with SMTP id p14-20020a170902e74e00b001b540fd7bb7mr9624768plf.54.1687401402018;
        Wed, 21 Jun 2023 19:36:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/23] glibc: stable 2.37 branch updates.
Date: Wed, 21 Jun 2023 16:35:52 -1000
Message-Id: <8b0928acc22596614bc8a87ce57813cfc87c57de.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183220

From: Deepthi Hemraj <Deepthi.Hemraj@eng.windriver.com>

Below commits on glibc-2.37 stable branch are updated.
3593050c27 (HEAD -> release/2.37/master, origin/release/2.37/master) io: Fix F_GETLK, F_SETLK, and F_SETLKW for powerpc64
e2974d26ce io: Fix record locking contants on 32 bit arch with 64 bit default time_t 0e3e9dbb0e Document BZ #20975 fix
f5d377c896 __check_pf: Add a cancellation cleanup handler [BZ #20975]
b4f76ecc9e Ignore MAP_VARIABLE in tst-mman-consts.py
7c32cb7dd8 gmon: Revert addition of tunables to the manual
a908c18d47 gmon: Revert addition of tunables to preserve GLIBC_PRIVATE ABI
ff3a71ec1f gmon: fix memory corruption issues [BZ# 30101]
d230623264 gmon: improve mcount overflow handling [BZ# 27576]
5d750495db gmon: Fix allocated buffer overflow (bug 29444)
78ab913eab posix: Fix system blocks SIGCHLD erroneously [BZ #30163]
9cc2f41e52 x86_64: Fix asm constraints in feraiseexcept (bug 30305)
97ad4c64b9 gshadow: Matching sgetsgent, sgetsgent_r ERANGE handling (bug 30151)
1d63573f81 stdio-common: tests: don't double-define _FORTIFY_SOURCE
590d0e089b elf: Restore ldconfig libc6 implicit soname logic [BZ #30125]
790e504a17 stdlib: Undo post review change to 16adc58e73f3 [BZ #27749]

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 37bb9fd34f..69e637e810 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.37/master"
 PV = "2.37"
-SRCREV_glibc ?= "d8e1a7590d375159fb5aac07ad8111ab4699e994" 
+SRCREV_glibc ?= "3593050c27dcf691f670fd3fa9d347c99351ed2f" 
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.34.1


