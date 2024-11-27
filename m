Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E873D5A6DA
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:12:17 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.64675.1732680735264120006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u8X+GbwY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7252b5d7b1dso313321b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680734; x=1733285534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbHg2LwIPLRvTFdwdKV44HmOkdogxZMkEjTV7ZUJdhY=;
        b=u8X+GbwYBBKrRRy9Ke2ZrYoItlMydKcIlFj7bPraM5nZMKV1yURgrTknD4wjazqrT8
         rvTnRWKVDrYVfk6EI0cIJ6EpS0CFdvB8YWgVkmoSoO+6JO7q4VTW5e1SldGTjwxPWNAW
         YYtApO5OU2OfIXFVQq9Bu1fYmT6DsiDHPVZnZfi7ynkpg+t6UbW+Eyg7HWDUk7wr/M2J
         WHUSZgAtBgfxyb6KzYVL+jmD1lQk7zEKwK+hWCSAhq7hDrbA9QA5EVNMjAk10Bn7G2Ov
         bGL+X2r5Xko72Z1jjcDK0+VGXFX0rFLa3WbbI34ewKrtOBhm1jp/VxlZ93IUQCP7TH7I
         1Kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680734; x=1733285534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbHg2LwIPLRvTFdwdKV44HmOkdogxZMkEjTV7ZUJdhY=;
        b=U9PdclU++o34LmBc3keKqVYBK5WUN2uO7OwnTidjcrvAng1C9P14xiaoPwkZdi5o3e
         scMH2PVV/znhoqyfqG6iTC1AX7oTBlVvS5LxtEU2thgN6A1JYHS8azWXSe3niXnMKqIr
         Gxa1gerXQBsTjDPaGH5FNWpK11ZhWFlST3HuJvBDeQAvKjNbdB0OYqthxq13sK1navCB
         F7m7Me1hdReu63SiN6Bizd4e14csewJIxnjIQg/i/fL+7pgAgPOaIzvmYpo1d6408y2R
         xr1oTOtVzCJ/luIXNXAttDBxS2sA5c3xvSmWt/9qldYLUPto/q3cFmyIbM3OL6V4Fb35
         qw3g==
X-Gm-Message-State: AOJu0Yz83JyEo88L1yjGteM/x3fS618yD4OqcYZb9GZKO/ugQ6RoVCLl
	lZLqFn4ctcG5UA7YKNFj+0qQlzwSxGkIPbZxQ5SDR9Lm3va2gqva9GaxsFG5QpmOmnNyqkomi/W
	M
X-Gm-Gg: ASbGncu0hFcBeQ7eBVpKpKm3lG5UuZ7qdIhmd4jmjrP40iY3tImNOigYTK9A7hXztgq
	SYn7d96/C4+0XHLl9TRKBzRNPDOtOOdohVMiTVVSdKOg2WC3JN2+b2GdXV+kYFt1I4rMc3AaLi/
	RL+y2eYjLmOcOl+LzOl+4vVW2ty5tM28ut5kyXxa/hiKvTkGSmecl6j+/2i6f+ahi10jQU8th75
	FMXfCP977U4nUCnQvaXg07rPFkA3+2jJmCs59c=
X-Google-Smtp-Source: AGHT+IFThhdzBPsYfPURB0KdAlTZ/yYwDoINklQ/c6txFh75AQst/VQqRHDNRYp0iP9uCR2/TxtwCA==
X-Received: by 2002:a05:6a00:1747:b0:71e:41a6:a0c6 with SMTP id d2e1a72fcca58-7252fc2100emr2714862b3a.13.1732680734503;
        Tue, 26 Nov 2024 20:12:14 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.12.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:12:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 15/18] kexec-tools: update COMPATIBLE_HOST because of makedumpfile
Date: Tue, 26 Nov 2024 20:11:35 -0800
Message-Id: <6922821ab9a0e72e666e57e4b941e5821503509e.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207909

From: Kai Kang <kai.kang@windriver.com>

makedumpfile is not compatible with mipsarcho32 and riscv32, so set for
kexec-tools accordingly.

And update packagegroup-core-tools-testapps too.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9107d9c09c7dab385c6034778cefadca3613be9c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../packagegroups/packagegroup-core-tools-testapps.bb          | 1 +
 meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb                | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 34af40a43f..180660adab 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -13,6 +13,7 @@ inherit packagegroup
 KEXECTOOLS ?= "kexec"
 KEXECTOOLS:e5500-64b ?= ""
 KEXECTOOLS:microblaze ?= ""
+KEXECTOOLS:mipsarcho32 ?= ""
 KEXECTOOLS:nios2 ?= ""
 KEXECTOOLS:riscv64 ?= ""
 KEXECTOOLS:riscv32 ?= ""
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
index 2c2901f19e..4edd6b2c65 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
@@ -81,5 +81,8 @@ SYSTEMD_SERVICE:kdump = "kdump.service"
 SECURITY_PIE_CFLAGS:remove = "-fPIE -pie"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'
+# makedumpfile would not compile on mips/rv32
+COMPATIBLE_HOST:mipsarcho32 = "null"
+COMPATIBLE_HOST:riscv32 = "null"
 
 INSANE_SKIP:${PN} = "arch"
-- 
2.34.1


