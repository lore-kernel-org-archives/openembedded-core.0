Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07659EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 17:06:26 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.413.1688490385418352252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 10:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lvbU5H6p;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-55af0a816e4so2959694a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 10:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688490385; x=1691082385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mZX94jFQNFsN2fy73bqu/73MBcnhDs2QXkuNqaAjr+M=;
        b=lvbU5H6prg0Uj++6SLqBrHQaDiJm44CEv8SCit6sGBBRU8iyPCQS2lV7FoCiJZUTHW
         qd/PcZmBWMTDrP1cxaDz1LBuJcqjwMVSZxMBnBwhiqO64f4pKjuch8GgcgHmG0e+P4Yt
         uYDlHvrnoNyUNqh6ukd2l5LzrqvLID3vJvyvADkVX8PSaCLVMyRZFtMg57AJdYYxkh8x
         WaISUqfV1/oNFDOOP4xuovwKYgZzxnG1t7/gOX8W+1v5SQYd/kIsK2AgmM1C20VN7YOS
         4SKcU23KzN0o5N+balBCIlJEkhuRs4vyUPQuuVoc41lbKttj7Zurbtfp4Pyiwq/mu9ie
         9PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688490385; x=1691082385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZX94jFQNFsN2fy73bqu/73MBcnhDs2QXkuNqaAjr+M=;
        b=le6WYQXFlFX5fgTE2kPKvexjeePU+Hp49Jtik6BosCYL4aXR8df77nao9btYGnMmbD
         +Rh5ds8HS5Oh/k6LznOeWJG0xoyrc0D/5MIQjEEQVnsq36D/M2uSQSo9705JBXkLFUXN
         g1By6iFPi51MyV+RUgDZNagl4aM7cuvLnsprqJNCMh7dLuedt4NeuWuqVChhYlQNbUlk
         23BGwpDyBKrKTCn91R8vuxm8DPeM7wY+yYRuljv+gprl1i5f/zeADS4OYbCXnBxhdC1z
         FdwtIodefx+HNIrA8sI7q8TVmWTH7b/mySnQVVe7tPp6BeExLJgeSVJYbdm1BPB4hGv7
         +olw==
X-Gm-Message-State: AC+VfDypYnpTNJam7vRiiRcp+O7+0Dsi0qNqYTdvdCSu52dGkc0cJa/R
	VZ/xzBE3fXFbKVp23YhmKSaOHgBx2z0=
X-Google-Smtp-Source: ACHHUZ7Jxy9eMjJg3EPBHcNDswSq2XO6EC27JYNfcBatT4wRmHpX7t9SCgkZXHGy0HpjxZIXR7r51w==
X-Received: by 2002:a05:6a20:a20d:b0:125:5bf3:f62f with SMTP id u13-20020a056a20a20d00b001255bf3f62fmr9108986pzk.8.1688490384452;
        Tue, 04 Jul 2023 10:06:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::9b32])
        by smtp.gmail.com with ESMTPSA id 204-20020a6300d5000000b0053051d50a48sm16442319pga.79.2023.07.04.10.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 10:06:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] meson.bbclass: Point to llvm-config from native sysroot
Date: Tue,  4 Jul 2023 10:06:22 -0700
Message-ID: <20230704170622.432086-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 17:06:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183870

Default search in meson would grok /usr/bin for llvm-config and if found
will use it, which might add wrong paths into cflags/ldflags, since we
depend on llvm-native when building gallium support ( thats when
llvm-config is effective), its better to point llvm-config into native
sysroot so it can add correct paths into compiler/linker cmdline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Move the fix from mesa to meson class

 meta/classes-recipe/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index 48688bed755..7f5e9b19433 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -111,6 +111,7 @@ nm = ${@meson_array('BUILD_NM', d)}
 strip = ${@meson_array('BUILD_STRIP', d)}
 readelf = ${@meson_array('BUILD_READELF', d)}
 objcopy = ${@meson_array('BUILD_OBJCOPY', d)}
+llvm-config = '${STAGING_BINDIR_NATIVE}/llvm-config'
 pkgconfig = 'pkg-config-native'
 ${@rust_tool(d, "BUILD_SYS")}
 
-- 
2.41.0


