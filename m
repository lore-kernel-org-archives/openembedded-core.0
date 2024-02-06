Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0AAC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 12:31:36 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.20244.1707222688805215061
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 04:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yxoz6AO5;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d944e8f367so43596815ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 04:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707222687; x=1707827487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WrNSV/FXbLXHaEE1jWjpxClHUSACijevEUe1cXbrMTU=;
        b=Yxoz6AO5P7rsbpO715MuNeMvJKslhClOxA+BFbJEDQnkPMyVwf4iCAhsCv8ejGURqs
         B9ri8bLSMZnJwKUTBrVrgSzb/m9iPp4X6Sa6tPEuRTRbc7fPkPu2RNnPnVTpFGgq55yZ
         j7AnqfUnJTz5cC/Ap/YYkmPbki6rrpNwCdsRMDUEAIZyKC3G5iDFby65//0gvPifCX+J
         5yFhfueBLIpPCR5G6Wz5Y4Xuj7WosG/2uupcurFEl2kDSDRMRycE18VgcbzxnycB1ZmL
         eEsVPzZghfLjQqOX/ZnrirmEi/VMyeMSNUZB/MWaLLellTh5i7ZSM9uxra+5xPck/Sy/
         34Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707222687; x=1707827487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WrNSV/FXbLXHaEE1jWjpxClHUSACijevEUe1cXbrMTU=;
        b=vkAB0D8uOFdSwBhv45UDpUZRPgFsJgQyT3G6gDItJ1rSodK0ueVq7UEGsYgaams1e+
         keYoE1k9q0fls5Vd+Jf43RjQ/PKZduqHm+jYvn4dzsSNYblnTt2MUJgwYbztuAfqjxWn
         aS3bC+U77BW1cH1LzEapQ1kfFjBYKMd30QoOaSaIgPfpAcstlFMIBKrxskwMsMLh7h5s
         Fy3GA8Pr4pcJR9Z8cwJjuIUuqhvWII/W99O3nbUv+IWNlZ4Tz8PsJAHvIF054i8Eh1tI
         5HA1atwSzIA7ccD6oIPlexC/G1WgBd2FRctHAiLyZdyqafg4OI/kHxf+D4MzzqvQ3ymj
         dntQ==
X-Gm-Message-State: AOJu0YxJ8jXRlXyC90K5N5tvbhHV9t+uiKMmc8ygJ+wF2vusqjHoK6an
	L/rQ/WwB5OM4yrka1oPcydpme74YXVJExFVVMTtdGzrlc1IDnv/GZV1QuCmQ
X-Google-Smtp-Source: AGHT+IGRxwWsnges7AgnkD/sh1sjY6VUeJuLV7FZoSyPn9BcrAd6mkpaJoSohsWRvAzVL+hxe6uy0A==
X-Received: by 2002:a17:902:9f8e:b0:1d9:61f1:571 with SMTP id g14-20020a1709029f8e00b001d961f10571mr1397606plq.31.1707222687131;
        Tue, 06 Feb 2024 04:31:27 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUKA4N2RTl1on2BT3ifYOAR5vi1nsCLg0yXqtjWYza/7qM6CzXG5+KtJYMVeb713VDUUlwp1+Sj/i2BRgO9pYtpIFHopnKLwR4=
Received: from L-18076.kpit.com ([2401:4900:1c45:feed:57f0:8eff:acfa:f44c])
        by smtp.gmail.com with ESMTPSA id ky4-20020a170902f98400b001d7274cbd33sm1745683plb.121.2024.02.06.04.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 04:31:26 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-core@lists.openembedded.org,
	hongxu.jia@windriver.com
Subject: [dunfell][PATCH] ncurses: Fix CVE-2023-29491
Date: Tue,  6 Feb 2024 18:01:04 +0530
Message-Id: <20240206123104.99595-1-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 12:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194991

memory corruption when processing malformed terminfo data entries
loaded by setuid/setgid programs

CVE-2023-29491.patch change the --disable-root-environ configure option
behavior.
set --disable-root-environ in configuration options.

--disable-root-environ option with a few additional changes
to the code allows us to mitigate CVE-2023-29491 and avoid
other issues that involve the possibility of malicious use of
environment variables through setuid applications, and, therefore,
it was the fix chosen in order to resolve this vulnerability.

Reference:
https://ubuntu.com/security/CVE-2023-29491
https://launchpad.net/ubuntu/+source/ncurses/6.2-0ubuntu2.1

Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 .../ncurses/files/CVE-2023-29491.patch        | 45 +++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.2.bb      |  3 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-29491.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2023-29491.patch b/meta/recipes-core/ncurses/files/CVE-2023-29491.patch
new file mode 100644
index 0000000000..0a0497723f
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2023-29491.patch
@@ -0,0 +1,45 @@
+Backport of:
+
+Author: Sven Joachim <svenjoac@gmx.de>
+Description: Change the --disable-root-environ configure option behavior
+ By default, the --disable-root-environ option forbids program run by
+ the superuser to load custom terminfo entries.  This patch changes
+ that to only restrict programs running with elevated privileges,
+ matching the behavior of the --disable-setuid-environ option
+ introduced in the 20230423 upstream patchlevel.
+Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1034372#29
+Bug: https://lists.gnu.org/archive/html/bug-ncurses/2023-04/msg00018.html
+Forwarded: not-needed
+Last-Update: 2023-05-01
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/ncurses/6.2-0ubuntu2.1/ncurses_6.2-0ubuntu2.1.debian.tar.xz]
+CVE: CVE-2023-29491
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+
+---
+ ncurses/tinfo/access.c |    2 --
+ 1 file changed, 2 deletions(-)
+
+--- a/ncurses/tinfo/access.c
++++ b/ncurses/tinfo/access.c
+@@ -178,15 +178,16 @@ _nc_is_file_path(const char *path)
+ NCURSES_EXPORT(int)
+ _nc_env_access(void)
+ {
++    int result = TRUE;
++
+ #if HAVE_ISSETUGID
+     if (issetugid())
+-	return FALSE;
++	result = FALSE;
+ #elif HAVE_GETEUID && HAVE_GETEGID
+     if (getuid() != geteuid()
+ 	|| getgid() != getegid())
+-	return FALSE;
++	result = FALSE;
+ #endif
+-    /* ...finally, disallow root */
+-    return (getuid() != ROOT_UID) && (geteuid() != ROOT_UID);
++    return result;
+ }
+ #endif
diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core/ncurses/ncurses_6.2.bb
index 451bfbcb5d..33285bcb5b 100644
--- a/meta/recipes-core/ncurses/ncurses_6.2.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
@@ -5,11 +5,12 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            file://CVE-2021-39537.patch \
            file://CVE-2022-29458.patch \
+           file://CVE-2023-29491.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a669013cd5e9d6434e5301348ea51baf306c93c4"
 S = "${WORKDIR}/git"
-EXTRA_OECONF += "--with-abi-version=5"
+EXTRA_OECONF += "--with-abi-version=5 --disable-root-environ"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
 
 # This is needed when using patchlevel versions like 6.1+20181013
-- 
2.25.1


