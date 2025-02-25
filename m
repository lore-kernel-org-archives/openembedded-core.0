Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F35CC021BF
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:32 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.9098.1740493828933290739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yInTMfk1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220c2a87378so96210405ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493828; x=1741098628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+F8+Q7PfZVy2KPs7jF5KrttBH8OTZSbeAp2Fn7Mk5M=;
        b=yInTMfk1jLi39AQFdja1nTgxSpP3CtXhRFrGVlnzfuFiAn7pWDYq5wA+sCfKkOnSgZ
         Pl24DYmz1XgzFpZ24jSMVNYYvlQsdcKBlO9RHl9U8vemzsmwgDqCSHd4XXVtEK2MFPbw
         YjGd1bTz2HFf/+YTTDbVMF9C3v+dWkt0UavGVAiTd9iy52duJG8qKMPlGr4SWR9Nk/vI
         GBdo8JfXLIZbP0QfF4WXNmkzWUuoN4OGlMFpiJBvMMHyVHXmrmk+uAVMjPuKBZ9bIwac
         Xxr0/ndS4tgo012mmHXixwtCeCbEZsoUn3W1bzmmHNOzwIA40CeIjeBeTEeo5LT92+Zu
         zoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493828; x=1741098628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+F8+Q7PfZVy2KPs7jF5KrttBH8OTZSbeAp2Fn7Mk5M=;
        b=Cur9TB13TGeLE4OTjBDZaOKUrXVQ0QiWAfOD8GE2Y9XviUl1G9MLvE0HwbT+lMBkzU
         S5SCrkn8TIwFlkISv/t/IYSwV/XYTVtfdOEDJlq8WrW5g0dm3zPxaQ2hTUYwrMhCnr0h
         UFN6QCjsRuCsUzv+AN5nXrqfnfuWvJB94Rk6cXD6gjvP2f+VKPVCskm+0aDs7Y0amr6V
         7PeHIpI/tYRSy+xL5cyG212zEkrxmppKsknYXYhDtsVK+pQX3P96Q0uAzlT5U5BR3HWS
         +HMbJJdj+wgeMfv3mG/RHRnKQ7L78R8gcclmmgyVzt9zrSFO2Iz9qL5FPapKQY996Eih
         wtzA==
X-Gm-Message-State: AOJu0YwVJix0EMqnlhWiGN7ph0k2VqMf33QE9FjGHQyTxqTPury5ijmy
	NmuNafeFLReu6weYRWnn3+rf4KW3iDWETOXTDxcGcy6QWocF4rP2PF92ObrMbqBJ4sMvW+9em5o
	g
X-Gm-Gg: ASbGncvsrrbuv8+r6+VdBgscmpXlKF8knpqzov4+6GLwaQk/c0N5gq3Ql1ftQJlg0el
	1xnnjyUa4suY6QHZvsQmPj51enLIbo/a+iIwLq0UwyvrYDCmwVdcwedQHtBqH4/YP2FLnBhF5io
	C8y8jEJWD8BXCMGM+CJ8JKA4SoiOQf3qF0J08n6QA4h0SyMtv6qaGtRPgNoVAL8dYHSVggluICJ
	Q4btq7XsD86zi+E6BBEhja3bUy5QLkg32hhaVTxf/g4rFkpErHZ7uDR7OBz8bV2j24RbTSB9Tpj
	K9ki+2d3gOfkVhwgrA==
X-Google-Smtp-Source: AGHT+IG15wZDvi3Fca6FW33XfQxndX+86xKIj1NQ1811qFtOBZ5dJUcaVbZxM+KLEBVJSqKymxHEpw==
X-Received: by 2002:a05:6a00:3cd4:b0:730:99cb:7c32 with SMTP id d2e1a72fcca58-73426ca5379mr25907039b3a.7.1740493827159;
        Tue, 25 Feb 2025 06:30:27 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/22] libcap: fix CVE-2025-1390
Date: Tue, 25 Feb 2025 06:29:49 -0800
Message-ID: <142715b83fb2c5f4dfeeab2c6e7feccecd1ca46f.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211899

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=1ad42b66c3567481cc5fa22fc1ba1556a316d878

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libcap/files/CVE-2025-1390.patch          | 36 +++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.66.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2025-1390.patch

diff --git a/meta/recipes-support/libcap/files/CVE-2025-1390.patch b/meta/recipes-support/libcap/files/CVE-2025-1390.patch
new file mode 100644
index 0000000000..339feaba92
--- /dev/null
+++ b/meta/recipes-support/libcap/files/CVE-2025-1390.patch
@@ -0,0 +1,36 @@
+From 1ad42b66c3567481cc5fa22fc1ba1556a316d878 Mon Sep 17 00:00:00 2001
+From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
+Date: Mon, 17 Feb 2025 10:31:55 +0800
+Subject: pam_cap: Fix potential configuration parsing error
+
+The current configuration parsing does not actually skip user names
+that do not start with @, but instead treats the name as a group
+name for further parsing, which can result in matching unexpected
+capability sets and may trigger potential security issues.  Only
+names starting with @ should be parsed as group names.
+
+Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=1ad42b66c3567481cc5fa22fc1ba1556a316d878]
+CVE: CVE-2025-1390
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ pam_cap/pam_cap.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/pam_cap/pam_cap.c b/pam_cap/pam_cap.c
+index 7e8cade..7b3d2d1 100644
+--- a/pam_cap/pam_cap.c
++++ b/pam_cap/pam_cap.c
+@@ -143,6 +143,7 @@ static char *read_capabilities_for_user(const char *user, const char *source)
+ 
+ 	    if (line[0] != '@') {
+ 		D(("user [%s] is not [%s] - skipping", user, line));
++		continue;
+ 	    }
+ 
+ 	    int i;
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libcap/libcap_2.66.bb b/meta/recipes-support/libcap/libcap_2.66.bb
index 7534063b7d..42dacb301e 100644
--- a/meta/recipes-support/libcap/libcap_2.66.bb
+++ b/meta/recipes-support/libcap/libcap_2.66.bb
@@ -18,6 +18,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://CVE-2023-2602.patch \
            file://CVE-2023-2603.patch \
+           file://CVE-2025-1390.patch \
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
-- 
2.43.0


