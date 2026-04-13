Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99675EBFD03
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 06:43:19 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.266366.1776062593978285448
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 23:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JXSlTlCl;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c1fcce8f8so6792799c88.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 23:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776062593; x=1776667393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=huspHqz7Qfwuqh64pMZONwBbfWN3rjj7NATHOBUbHbg=;
        b=JXSlTlClvC6bbR9Xhi+dJv0+TOezE5dd7+877crcHLIEHGwo39AnCpOex7e18QYNHv
         /TsXHPEyMLgeJ5pDcXJXhYe+sB+GdHlxxv1vDA0zorS27Gbt4eyr795MlmxSFVIbfnEC
         zDeP6ZSjzKXbimkZfPbOsq3ji62NSPNV1eB9lqjQ+0P6YhxuDWpy1bXFChfRDaBSxAQx
         fEeEXKIR8Z9cc6PKRj2UWY7CJ75otKE5pIHl1RlbRnA6IVmGmwztkSxFSW9YIQmlI3xp
         3/F6FER60ytSk1Z43bHTgt2GYFhiRC3QIi0fTc+Qjw8DGuguLJuP2NzO3MS0AF7P2ju7
         SHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776062593; x=1776667393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huspHqz7Qfwuqh64pMZONwBbfWN3rjj7NATHOBUbHbg=;
        b=lzC6Tasy0OvL+5Qrxn0sCGP3r7lspG8lkdNq61WLBpSF/42ljLqpI0JDQdBn3sjpjC
         L1RxmPKrhniCXgyBbkExNs6BZ+wpWHmiQBf1468WYKU8yBsF5PXxcU8IJevdcmsJJjYq
         TLQufW8e7Eo66xsgs+wd+P5gYepabejFF7/MmW+5YvJOI4a/5IxO5hdCYhs8ZKf0B/gv
         vVrEXrly8GKBypf/Htjnff9RvbHQYUYkBWn6SKR0xvVcb9v1XWK/Fi70+IyJbKNx3qlp
         +/9vCwzjCE7lUgNjpB1T2K5OJmafQWymcm7AMGqb01BnsA5XwE7an/9GDUdsEeNy0UjZ
         +Wiw==
X-Gm-Message-State: AOJu0YxWrOPs+05mc/yMiWjbX3+meeCQkGCy3dcmMU45DZNDNwwLnJXj
	VwnFVaetkqHsOrly+Zs5YBbDRJJ5owtGHOnjm1Pq5hBBSLRfPobcMg/a5a5CU5xU
X-Gm-Gg: AeBDiessv/21O9+bCvpWUscTRPk/1ua4cwBvtf97u/IHuw7QXbStOPbqo6cAjGcvmz+
	C222fZYvUBOrnqjYn/wbFDxqGTuIHr6rvg7h6GruEwM8pdrM79gzp4OOjxWlGWHJh0lnJ4pUhur
	3+Wbsu9k9bR7Bx34Wc762L0N5cEhTmHSq2xuo0HJGHozvLJcfH9sTQH953IJQf/z7pyKqbTgGjc
	M6q8Vo+JgPtHD67HQNyDiZzcpsXxowyzZP0A1wXMJYvDwy97wPQ0tzyeJfvsyTLfu6eN25T4UyF
	rSZzXctKQPOgPcbPcEaazEcj0PNdh4KBgQ8uJ+P3LZNlQxJToWGXJ2QKQ5L0MVS39BossVJAnol
	sfXeSLv7Ax/e9NJwv+jF2/1/yFLSDXGFRnkO+AKBO2FEaSJEkGESCXTwFHdF5I5mm7wQR43DjYb
	m2+gNmyfcoL8A+2zc8u4heG/hzIM8fcOk9OB1yO+RYenJ/EeNHTf9/BFupNmVmgV3Yaq/8yVj8w
	Pe3RF7QUZWnl3xAgYHdhkmFbv3L6jVwkfDqUNv9PaL5hU2CuFa0wFkZh8IJPGRARbmQWy7xmKC8
	Vj5eBhdo2Et666TI4EtRnO8fGILPexzJTBZvVG0K
X-Received: by 2002:a05:7022:f515:b0:12c:3d30:37e1 with SMTP id a92af1059eb24-12c3d3039c2mr2810497c88.1.1776062592643;
        Sun, 12 Apr 2026 23:43:12 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb228sm14014607c88.9.2026.04.12.23.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 23:43:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] bluez: Fix linking with lld linker
Date: Sun, 12 Apr 2026 23:43:09 -0700
Message-ID: <20260413064309.690276-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 06:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235083

Recent upgrades have been breaking with LLD as linker

aarch64-yoe-linux-ld.lld: error: undefined symbol: __stop___debug
>>> referenced by log.c:0 (/usr/src/debug/bluez5/5.86/../sources/bluez-5.86/src/log.c:0)
>>>               src/log.o:(__btd_log_init)
>>> referenced by log.c:0 (/usr/src/debug/bluez5/5.86/../sources/bluez-5.86/src/log.c:0)
>>>               src/log.o:(__btd_log_init)

This is described in LLD docs as well [1]

[1] https://lld.llvm.org/ELF/start-stop-gc

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.86.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.86.bb b/meta/recipes-connectivity/bluez5/bluez5_5.86.bb
index 7f9972f59e..2d56fc642d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.86.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.86.bb
@@ -1,5 +1,7 @@
 require bluez5.inc
 
+LDFLAGS += " ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-Wl,-z,nostart-stop-gc', '', d)}"
+
 SRC_URI[sha256sum] = "99f144540c6070591e4c53bcb977eb42664c62b7b36cb35a29cf72ded339621d"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"

