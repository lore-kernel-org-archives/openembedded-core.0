Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A4EC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 04:24:09 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2078.1784521438887151676
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 21:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BU3Wfnfx;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8484a0b998fso9329010b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 21:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784521438; x=1785126238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnKd80E4xj0uPBvntwrXBk5Zhfz93kiXBZnYbFdzjNg=;
        b=BU3WfnfxcWxFnr7i4m903G5W7w57Qk5dHYIdZqYKASc07h7551j+P7LozGZcf95LPB
         szwG8mddg6xH7WieeHAr3gX548QJmwZF5DNI2Gzw1Fx1VX1R/jhQMLBgzERPN+Gv6pIJ
         7j3l0j9iautPkmHEWljKrYvLgCYQXXEx6/O8QxreWi6LlyPHwYBQszidrQGFw6RhpBTm
         Axh3w7ZsFrFU7mg8Ben7JQYPEDmSPCjXDwP+CCkl8SDJjMZAo+9Cb4ATbeJ6Q6EoA4Qe
         ikkBjwPYgFBfYyJ+s6oCvx/joaDfeRd8ieIFNYexmGhik/JS41zEyOk7gtavJ7XHrLi8
         SL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784521438; x=1785126238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fnKd80E4xj0uPBvntwrXBk5Zhfz93kiXBZnYbFdzjNg=;
        b=LSCj3hurXXIG7yac6NTCTqjxCeWMEGYiFnQYBtWI2XudiF1Oq5j8oXGBpfhkLMmU7b
         g/wgzfiKBX3baiiirLHDTt03ssC+V0UYSCtSc0rUrNhYXPLmlc5gJVtnWNkfiQV/syYv
         ez6KhswkYo3X4p512lY9pgMmQ6ZO+WVpyXMqpDsh4IPWC571p81ljjyBZk8XZbCnO9vb
         MK7igOUfx/gqxUKQnJ+5MSrFB02gXWoaImKzVYz4wEZP4QXc/CYhXT9QdCrRMnX8lOap
         KDctoXchjc/SJF6izzpjA8QfoBCMzTqyiQKVqAxjqyIiKMiSC4hWw2PL2DxbAMBUMTWp
         08GA==
X-Gm-Message-State: AOJu0YzccoP9YkBrSDHkOEuUuwpAZdlseFn2N3YSsWJFHRVeSXLjQZe5
	KeKg6EQ2ROdEbgoM//JiB7Hr1plbRskC5UwoFGMBCxM6DQTUmSHaTz5WmWqZJA==
X-Gm-Gg: AfdE7cmwx9JOxBE5TYz8ad7PODf/9cnC7HkjnxYJSxBtFjs24xSiIUQcDlEkQ5g/FsJ
	UVTBMBbZmJN5M753Ov8cAONUyZJwdXZb0jOnZc27qLjpk4kOsDyRJmbKl9Wr3RbCXmWiPAwI6PW
	n4UIdXuqOWx9m9kkl34+GEpLsaaFI75JD2wM/syIn0ZZPmS6TcEJDXiq3zf5X13Q4F7Pgdg4eJr
	swPpMm1RAn2WOzRhq0lREdIaMO0Q8nPlNFAr3XP/3IxNqi60Xcq0IgmaL3jNOeFAjuIqtCpiQYb
	Eieu1zPFCPGWDIBWJGKEesXnFRzDDE/m1XmcZBHRgcx0pIybPFxFHXrcaRty/khaQDuYLt1Nhcc
	WNS52pbgXAIpqQoh6oaBlqq5ZS0CKkmXcCNgXD3X9DTaK+7li2EqInsWK9fg/ix2PBriO6NaBzO
	4vSl9qfJDJWf+9sxEMlfjnO++MXg==
X-Received: by 2002:a05:6a21:391:b0:3c3:9a32:70b6 with SMTP id adf61e73a8af0-3c3ad8e8598mr14168697637.44.1784521438306;
        Sun, 19 Jul 2026 21:23:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fdcaefsm31046004eec.10.2026.07.19.21.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 21:23:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH 2/3] wireless-regdb: upgrade 2026.03.18 -> 2026.05.30
Date: Mon, 20 Jul 2026 16:23:43 +1200
Message-ID: <20260720042344.695725-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720042344.695725-1-ankur.tyagi85@gmail.com>
References: <20260720042344.695725-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 04:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241312

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 86e35bc1ab5fb2132b06b666fe73fc9bd6446ab6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ireless-regdb_2026.03.18.bb => wireless-regdb_2026.05.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.03.18.bb => wireless-regdb_2026.05.30.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
index a70e9dd0da..e544b72965 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac"
+SRC_URI[sha256sum] = "8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993"
 
 inherit bin_package allarch
 

