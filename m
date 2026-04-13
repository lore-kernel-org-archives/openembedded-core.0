Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA1EF34C67
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 16:09:19 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.275919.1776096550290408052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 09:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J0Z1K1D4;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-128b9b7e3edso6546198c88.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 09:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776096549; x=1776701349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lChoGqyGO6Euyi47rAzNhSDrdq2pu9sfW7h1cXpEEnU=;
        b=J0Z1K1D4BVhjP+ZYmhF+qXO2Jxil9Kn1NhK3BIgS5eb0V0v2bc77npjL3eoN776Gw7
         UCqaoYBa8l0TyoczVdlwmfuJClDXaXUUy/fGUlwpFDbWhlQCO4zsT+ABnQZLDrycyGNf
         YHiMWFgHH7CgYv4PHO7eW7bYGWxMUayeguvNvaRvyFX2T3i7Yc1WbcCRy0hS2qEBI8mz
         jWwcspGErJ3ciw5b6a6MaFNe0eS0nELWQ1gccAxDJxeisOkfO1iFhFmSBEA5zGj5av1l
         lO54RD82PUuctkTZsoVdP6O/VAEGwC/9WRKcIzJ+YIOazXneb0mXkmeFRRCp+tH4DuNj
         SHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776096549; x=1776701349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lChoGqyGO6Euyi47rAzNhSDrdq2pu9sfW7h1cXpEEnU=;
        b=SoFyvaPDNK3a9y53FqgwXq+jAinJIZ1uZWjJm4zLnjSCB+CM2n1N7WawPMHQ3eOaFq
         tAAD0YkTUxB7YMlXR8KwG0iOvXkCU8OYpqtD+e31w6L1rbc3FfB/hvhfkKNPxpuO9rrL
         inhGmzmrgrM3NT8CrUKVSGBtV24ru4wd9vKlR4TR6Yiuwfixn0uEAHWS4WiGsTIqWCWk
         jUXpORwNJ+gtgIXuoFRH6vykL1rTwF/DjqZxnNPF4ls7xDg4lZf4VIKYtFT4wYyBbRzl
         j21Ogg5FgLfAYGZNXMqr4U7YEo0XvhdKM1QM/mmvnIS09npiIwQBNDwEpmgnPBQKlFeg
         pbVQ==
X-Gm-Message-State: AOJu0YzkcqXOSSNa8xBTzFb6v/KfaaSAw5W2XtlTtU1yTPbkk5vAGAvD
	Y4di1h0xhPUpsy8ZoreQMMyn16gRsB1HzblHXlCAPrAhzQFhgwmJh2Fzctv0Dbi9
X-Gm-Gg: AeBDieuaBwyzLeLg/B+t0sbzZo3Bdtqc6cGr3rjwh8TaVyZR79H1dgKIJuJ2OJGp7Fv
	T0ggZv8LOoK3+gN0wvNMi5hJm8mo2xuZwUbnT696n/ub+vpXPNhDYzSkmGYF2ya887om2PirFN/
	M/x4cOgPwX/8zvQ8uOTZst9tYJ9Iwb2p2WwF2kZ49jihkGsqg5pVJoi/6VTdkxJKZ2t1HyLxS0L
	v+KxgPQWyW0Po9kQr2UF1dH+dCL0n5o/pSSwrc4yGu1dyaw3/kyjcDpDJvh7xNRiAWq52qR+9K0
	Rf+NFIE7OqE+5ovwJNdNfYmZBGY1B0YGWSnhJQVOvg7VHO7UNxSt4XS7DSrZ2w73myMi2n34qe/
	ShQvqyhpWRm+dCSIN0lJ16Jw9gMRn6cuGD75iW/1R6Sumu8fK0SJy6RjaSZ8DEKq2T2+aTq+n4E
	PQutOX45qB73dRTydd/pZS5B3oIkr983ZrwjKm3boq+LPVsOn+9LOmkwa2akbQBrLiSVB36fKiA
	WXFLI2lbpol6jbgbHvKAJ31XC1Tx/CXp48ashJdbY6biShnhHDy7B9b6UW888vzlGgSWvmzkHbf
	pIiFN4xsEbFDGopEl9R9RgQcPDltOkABIxV5b0v4FShGocDOJ74=
X-Received: by 2002:a05:693c:2c85:b0:2be:6f30:f2f9 with SMTP id 5a478bee46e88-2d58a39d35dmr8249771eec.26.1776096549190;
        Mon, 13 Apr 2026 09:09:09 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5621d5e43sm16286235eec.21.2026.04.13.09.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 09:09:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] avahi-libnss-mdns: Fix build with LLD linker
Date: Mon, 13 Apr 2026 09:09:05 -0700
Message-ID: <20260413160905.3928534-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 16:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235117

Fixes build errors e.g.

| aarch64-yoe-linux-ld.lld: error: version script assignment of 'NSSMDNS_0' to symbol '_nss_mdns_gethostbyaddr_r' failed: symbol not defined
| aarch64-yoe-linux-ld.lld: error: version script assignment of 'NSSMDNS_0' to symbol '_nss_mdns_gethostbyaddr_r' failed: symbol not defined
| aarch64-yoe-linux-ld.lld: error: version script assignment of 'NSSMDNS_0' to symbol '_nss_mdns4_gethostbyaddr_r' failed: symbol not defined
| aarch64-yoe-linux-ld.lld: error: version script assignment of 'NSSMDNS_0' to symbol '_nss_mdns6_gethostbyaddr_r' failed: symbol not defined
| aarch64-yoe-linux-ld.lld: error: version script assignment of 'NSSMDNS_0' to symbol '_nss_mdns_minimal_gethostbyaddr_r' failed: symbol not defined

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb b/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb
index d45c06357d..6bef43262f 100644
--- a/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb
+++ b/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb
@@ -17,6 +17,8 @@ inherit autotools pkgconfig
 
 COMPATIBLE_HOST:libc-musl = 'null'
 
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
+
 EXTRA_OECONF = "--libdir=${base_libdir}"
 
 RDEPENDS:${PN} = "avahi-daemon"

