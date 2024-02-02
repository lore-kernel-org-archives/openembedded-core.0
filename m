Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F60C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 13:24:09 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.22419.1706880239852530679
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 05:24:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BLRFSuxd;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a30f7c9574eso299363166b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 05:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706880238; x=1707485038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mKmePtTHgGt0Itf96rZjo3aNeEpj+gvnLYROSnvjBes=;
        b=BLRFSuxdlMI7nPczUNvQL/ywqGe4roy0wMq0hFF3ZY2DdzZFxmKVMeiWCuIp7kYIQc
         ltDlJxxylnTplYqD1TfVxZJ6C9+0D6AqBR1nrJstK1+gO1ECcvW5xi75bTRISb4YFbAi
         mgxn2Y4EIOEFXtJQ3p/K/SjTmJ/0TGYvxOQWxQ6YJf9ckUJtZj3KhILB+SCRjvfvsWTj
         rx17pvK4lm6M3Z3Ur8IxdrHhSCGku1SzFyLvMLMtsEzRqyTwQ56Ctd1o2nhZas2Bd944
         3uUKDBCAyV0/oiUqx64Gf81uzOasWQnz57OMKzzroMZwaN86HTjbS8RxHKge+YQnWvHo
         txvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706880238; x=1707485038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKmePtTHgGt0Itf96rZjo3aNeEpj+gvnLYROSnvjBes=;
        b=j4br5EyCVev7OcX7gSkPD48YgdNqxuMkbRVcOHF4d4Sewzit33Xe762RYw5l0zSuee
         MP2Z0ajnYeXQu112HyWzrr71OyQKGU1HN7EPN/IIZ3P1f7yQhbrNPXzdN8QlMP6BVCWh
         1Vr4LVVfQxad8OSLD4yauUkH2vibXyY+wNYr6/qIwQCxihoYMoCiL8BKBvxOc/ZRr5Qu
         1N4C68vkOeCBMge8MAl6m1ptZNZcu5c+ZCUYOgsxOQe+ShwjnzXoyfQqDAeNWujhAaGU
         v6wDrhdULVbb4JMqz773XFdPppAXx4PkMJOWCr/HTCW8F+pFmXRFBnaQft7gb/H0FOh2
         16mA==
X-Gm-Message-State: AOJu0Yy0TcQLkkC2txxA++eyxPNTSiMCIcTKkmtrFpz1OugT3q/4QInw
	z2HOlxcesV9JKfWJH9YB9dpMf8VlD+9cDOXzJSEuZItkELGXJkXw3RGk+JKd
X-Google-Smtp-Source: AGHT+IGb5UVGjOwyJhPu3n9u35Xv+vY/e0jrPNb9gkHgeWn3o81qtbbk5tWQpnItKfgaWn7i0maFTw==
X-Received: by 2002:a17:906:2648:b0:a36:ce3a:6c90 with SMTP id i8-20020a170906264800b00a36ce3a6c90mr3300063ejc.10.1706880238024;
        Fri, 02 Feb 2024 05:23:58 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id wb14-20020a170907d50e00b00a36fc7f0f85sm767427ejc.47.2024.02.02.05.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 05:23:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] rpm: override curl executable search with just 'curl'
Date: Fri,  2 Feb 2024 14:23:52 +0100
Message-Id: <20240202132352.2185807-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 13:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194794

rpm is searching for curl executable at do_configure time
and result is non-deterministic, depending on whether curl
is in native sysroot or not:
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240201-8dcic6ea/packages/diff-html/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rpm/rpm_4.19.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.19.1.bb b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
index af11dec5ef3..086f100229b 100644
--- a/meta/recipes-devtools/rpm/rpm_4.19.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
@@ -51,6 +51,7 @@ S = "${WORKDIR}/git"
 DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 zstd"
 DEPENDS:append:class-native = " file-replacement-native bzip2-replacement-native"
 
+EXTRA_OECMAKE:append = " -D__CURL:FILEPATH=curl"
 EXTRA_OECMAKE:append:libc-musl = " -DENABLE_NLS=OFF -DENABLE_OPENMP=OFF"
 
 # --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
-- 
2.39.2


