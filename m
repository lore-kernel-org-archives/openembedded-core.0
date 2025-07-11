Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F21C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 16:39:09 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.18452.1752251943432889105
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 09:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mv04cr9c;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so5014315a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 09:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752251942; x=1752856742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0UYjtuakVZsoVGR0HqggGStpnDKvnRooHxNrjI63zY=;
        b=Mv04cr9cHr++ZNGw0MJIZJTzfR9fqbsBHwXKhrzdh95ECc6wB/FhhkO0PfP2zqRR+U
         8WMu1LTpPpV28Gb+oehBt6MiiUKb+DyBRp7HSd/Ui4AmCxvA7J6K4NCXaoqsihVKLVi1
         p9WpCylrJ3fJnJeCF3kjeLVckvd71dikXP7XQL4AaHwwLXRUHJgLsSOKZNQYzTwNg8DN
         kOHo3dQooxouXROKRvKX48FSznzBv2cQw14wAd5f3DSIzhkGpBWf3MeIJK3gG1sOotod
         uYxzQxKrNh79BGI8gYPKexmq4/VhNx0cJumspjtTClTFfczxSA2LPMNRU/9Q/BpQMCOJ
         cDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752251942; x=1752856742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0UYjtuakVZsoVGR0HqggGStpnDKvnRooHxNrjI63zY=;
        b=IIq1rycH8pG19cbKCtenheX6uz6d69zdiHk/XkXPK2Dz16WyrK5fb7z+OWMeBs3K/P
         PoE0Y3lmCnEjOTGNy6yocnlQhDm9kJiU3hXTJYAqkmUtEx+f+uT5osxBYzo0GMmbZgFY
         vHeo8VelIz3NrBlAvGSzghhihCz4+KkRrUT/s22VxjHh3OETQACk1l9J9rVeC97G/hH9
         ev5G2jBbFoyMsjUfzkPbjOKTCBok+CgXbhvGR4j/DFD48zVbMKo8iXC2d2vs1/uOr6Vd
         YVmtjg14BrevR22RCC6qPiwS9J8fDua9lOz+jtIV+FfRJnBmJD5vdIrJkKunmoX+YsC8
         yuEw==
X-Gm-Message-State: AOJu0Yzr1r+GybdYxvpmSFJCCdFxwQOcXeqZJqeP/1GiY6OAKiJsIEGb
	WNmb8Iw3yx33uXfs7JklcMd3fzWt7QHhaku3PSWBlbwBe6wWbUsGjSbT6v1KpCcb
X-Gm-Gg: ASbGncvsBLF1BDm+7aoBOJ7ZMy6vbGV+jpPrxM4GFZLDP5e5ryR2LCLMzSGVo4WOsWU
	l8yVdPEfPnNsn/ZUhoZs2ryNp69asduHf7nWtvr4bjRpRrZJUFbKm1UXlD/E47GkpSaKroecmoY
	1agEiAQyEfFBsChzWB2kT1bc0A7ntX4fxBqW0GIauy3D9ifb1ZnWCNoP3d5pyYuEAGg9J3p+4/2
	VL/CZB8mV0QYI0DuXWHag+oi6lM21dt630BumkRFLuZ+h07qLE7lo9pHUdqD18+TZDuCu/CSTAh
	7p0cDycdmt+akVK/TgCEw6svdJmZcP3nwbOc4D9iqzvM5dbifnUF7G7G2Fl1mkpieMyZZV737LQ
	/+9wAxy2dpmSGolgibJ2R
X-Google-Smtp-Source: AGHT+IFKFVP37D/RIhh48FjOPVpoQ6DlR/ICXyQ+KkkVYDrMs/eRYHwdGg6G6tUSTbiV779NORSh7Q==
X-Received: by 2002:a05:6402:518c:b0:604:a19a:d84b with SMTP id 4fb4d7f45d1cf-611ecaa1297mr3069808a12.5.1752251941435;
        Fri, 11 Jul 2025 09:39:01 -0700 (PDT)
Received: from elitebook ([93.159.20.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9794876sm2375082a12.71.2025.07.11.09.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 09:39:00 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
Subject: [PATCH] bitbake.conf: Remove PR glob part from STAMPCLEAN
Date: Fri, 11 Jul 2025 18:38:49 +0200
Message-ID: <20250711163848.111907-2-michalwsieron@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 16:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220161

It's hard for me to explain what exactly are the consequences of the
STAMP value and STAMPCLEAN glob being mismatched. The issue is present
since the PR part was removed from the STAMP variable in
OE-Core rev: cc83e45484656a6b577ff84817131735023daad4.

I will at least show an example use case that I found was broken due
to this:
1. Have recipes foo_A.bb and foo_B.bb
2. Build foo-native with PREFERRED_VERSION_foo-native = "A"
3. ${COMPONENTS_DIR}/x86_64-linux/foo-native has version A
4. Build foo-native with PREFERRED_VERSION_foo-native = "B"
5. ${COMPONENTS_DIR}/x86_64-linux/foo-native has version B
6. Build foo-native with PREFERRED_VERSION_foo-native = "A"
7. ${COMPONENTS_DIR}/x86_64-linux/foo-native still has version B

In my case the PREFERRED_VERSION comes from different machines.
The issue showed itself when a bar-native compiled against foo-native
version A was pulled from sstate-cache and foo-native in version B was
kept in ${COMPONENTS_DIR} after previous build for a different machine.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---

I am not sure if there are any consequences that come with the
STAMPCLEAN not having `-` in the last part. Maybe too much stuff can be
removed? I am also not sure why STAMPCLEAN can't be generated from the
value of STAMP. This way such error wouldn't even happen. Is there any
situation where you might want STAMP and STAMPCLEAN mismatched?

 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3a97fa1ac0..4d232a62e6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -404,7 +404,7 @@ LOG_DIR = "${TMPDIR}/log"
 
 STAMPS_DIR ?= "${TMPDIR}/stamps"
 STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
-STAMPCLEAN = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
+STAMPCLEAN = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*"
 BASE_WORKDIR ?= "${TMPDIR}/work"
 WORKDIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
 UNPACKDIR ??= "${WORKDIR}/sources"
-- 
2.50.0


