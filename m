Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B45FB5192
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 05:44:26 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74796.1775540665496723022
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 22:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gR1zEnHl;
 spf=pass (domain: mvista.com, ip: 74.125.82.181, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c54c68db4dso9245237eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 22:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775540665; x=1776145465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZikaZEBRYmLQN6w/Gnm1zrDPEZ1R9T03E214+GXamMw=;
        b=gR1zEnHlLeniJdZYG5e4/8UVNjXgHO3kICEzaYD3Jd6VXZvGV13g+sCrOTSvCjCy3N
         yJgVuOK1uIFOL7TkS6goSYtG00TjD3UkjLnzbkBYAmhykLAukVDe3tY1vy3GfJ+Jz2Mf
         dbBCzJDbkMWPQMh8mohTIoAcTquZBjHlP15oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775540665; x=1776145465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZikaZEBRYmLQN6w/Gnm1zrDPEZ1R9T03E214+GXamMw=;
        b=sAPFn+r156bnhDv5IvZW1v5QmpMOj0+Wosr0F5fsx3MKr7SoqNWmV/S5NZHSRiyaNa
         pgh9eHy9boy4teHaVaTPFPJyN2k+ce0NEI5eWmEOLZKkAmGX/hYzwPmL5coCFH02U4jz
         0yeOCrtgVLmk6zWQ8P7j5wKhiDh8jZtLRBONx5RxDME8CmbQraRO8T/9+7laafyOzUj/
         apuQ07e0fDVvUQEJ3VJo+K6YLGdzZOZIdDVdb8D4MLNCwhbQv3smRAVasV6h0ZvOO8di
         CaSe8ZU2mbRtpioItWNkRaP4CFsXdqDhHhB0LP4tJ1yajDpBlx2dukVUDKYHm4YeducQ
         jSWA==
X-Gm-Message-State: AOJu0Yxu5AtMl+WhVwFDyNbVV3PVJiGhKeLRjSHzwG69N6REsbzO1FGD
	mdlza5GDwQfUE/zMfYf1OBQsPY0sL+PsjG9WkxPez6YImeT7L8aMRLtyvOGjagdADrloCtofm69
	xrHpM8h4=
X-Gm-Gg: AeBDievqWDH5hW+jZ3VsKwVJHDFvazQDTXjGzAHftQy5lOdfDyjq08ghVsWflBWULtt
	IJhqm960BABomQWVbFTCv4RiRPSVrpzVfWGhGLCygJf8uuUXpBQvpGqxIVz/9b8hgfzVe8C3fy2
	Tah2W0O5Po94viLoyLh4JaJZv0IGDZ3xCHQCtTEF/jKfVvgjOe12/c7Qg0WCL0qqlgnV0UUDLnE
	qE2U/8Yc0POFnEa5R2WXG0MZ4YhAIXXcomNp87QVxntQaKNva9oT8oO9lL+HIhID9VctQiq2ql+
	fQpfDqOPiv3umvCn9cvnV1vas7kwUAIxmTv7SXX7KaUOopBiVV+nrtRIqWHzz2mfPCOqSWbslyS
	GmYIc5A6kcijoNly2PRdqs53vZeVXNJO6vXI1p8CWMJ91HpOl3AfJOzMVXBsjXQ2BId8G7Hv7h1
	F87IB73JvMdzk1HnyB7rHZ9uUrC/h/BMeXM/yC
X-Received: by 2002:a05:7300:dc88:b0:2ca:7eb4:3e37 with SMTP id 5a478bee46e88-2cbf9afd418mr7965991eec.6.1775540664678;
        Mon, 06 Apr 2026 22:44:24 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cae7e3ec57sm17056403eec.1.2026.04.06.22.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 22:44:24 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] ncurses: fix for CVE-2025-69720
Date: Tue,  7 Apr 2026 11:14:03 +0530
Message-ID: <20260407054403.21041-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 05:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234695

Pick relevant part of snapshot commit 20251213, see [1].

That has:
add a limit-check in infocmp -i option (report/example by Yixuan Cao).

[1] https://invisible-island.net/ncurses/NEWS.html#index-t20251213

References:
1. https://github.com/Cao-Wuhui/CVE-2025-69720
2. https://nvd.nist.gov/vuln/detail/CVE-2025-69720
3. https://access.redhat.com/errata/RHSA-2026:5913

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../ncurses/files/CVE-2025-69720.patch        | 42 +++++++++++++++++++
 .../ncurses/ncurses_6.3+20220423.bb           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-69720.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2025-69720.patch b/meta/recipes-core/ncurses/files/CVE-2025-69720.patch
new file mode 100644
index 0000000000..d570b2007a
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2025-69720.patch
@@ -0,0 +1,42 @@
+From 6f6db0e8fd14e40096a0ee6f8bdf32dedbd3fc9e Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 6 Apr 2026 18:08:09 +0530
+Subject: [PATCH] add limit-check in infocmp
+
+origin : https://invisible-island.net/archives/ncurses/6.5/ncurses-6.5-20251213.patch.gz
+Refer: https://github.com/Cao-Wuhui/CVE-2025-69720
+patch by : Thomas E. Dickey <dickey@invisible-island.net>
+
+CVE: CVE-2025-69720
+Upstream-Status: Backport [https://github.com/ThomasDickey/ncurses-snapshots/commit/6f6db0e8fd14e40096a0ee6f8bdf32dedbd3fc9e]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ progs/infocmp.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/progs/infocmp.c b/progs/infocmp.c
+index 0ee0b958..538aca5a 100644
+--- a/progs/infocmp.c
++++ b/progs/infocmp.c
+@@ -816,7 +816,7 @@ lookup_params(const assoc * table, char *dst, char *src)
+ static void
+ analyze_string(const char *name, const char *cap, TERMTYPE2 *tp)
+ {
+-    char buf2[MAX_TERMINFO_LENGTH];
++    char buf2[MAX_TERMINFO_LENGTH + 1];
+     const char *sp;
+     const assoc *ap;
+     int tp_lines = tp->Numbers[2];
+@@ -846,7 +846,8 @@ analyze_string(const char *name, const char *cap, TERMTYPE2 *tp)
+ 	    if (VALID_STRING(cp) &&
+ 		cp[0] != '\0' &&
+ 		cp != cap) {
+-		len = strlen(cp);
++		if ((len = strlen(cp)) > MAX_TERMINFO_LENGTH)
++		    len = MAX_TERMINFO_LENGTH;
+ 		_nc_STRNCPY(buf2, sp, len);
+ 		buf2[len] = '\0';
+ 
+-- 
+2.50.1
+
diff --git a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
index 68a845f27c..15ea2756cd 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://CVE-2023-50495.patch \
            file://CVE-2023-45918.patch \
            file://CVE-2025-6141.patch \
+           file://CVE-2025-69720.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a0bc708bc6954b5d3c0a38d92b683c3ec3135260"
-- 
2.50.1


