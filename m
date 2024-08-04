Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F33C3DA64
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:31 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.30111.1722791371629627258
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q3ZOpBGg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70d333d57cdso6953810b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791371; x=1723396171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MwsdBJPBWcMD+kJIih8oEFYb0QIEYk//P3J997Ffyg=;
        b=q3ZOpBGgj/s0ayuKVIpbCLv+3esssaOkEFAxBFvQDnP3Jucd7YQmbzPw7AYdd4D9FE
         vQYG0A64OYgjciknC2ClX8QBggRqfUQTI8x/FWlbuTOq/NAO/8TqlvcMEQfSvke9l3rC
         epcbgl63mTKdZJd3UQH2aLPx1PPdquTdRwf9ZAhadZHbym3k9hRLBBh8XKu/9vjZfPGS
         N73XLoyAfJtZlXswrhE9y8gZ7Azwxj4SYwmEo4yDUTVJY//cME4JPpSPMzsd5wwnBNNf
         GguPmZDXieK7Vg2dluDe6fIAF3LIsmIdm0/gBmBhnxBFS0SoI/xbbk9/b7DzLDuNo4F3
         2fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791371; x=1723396171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MwsdBJPBWcMD+kJIih8oEFYb0QIEYk//P3J997Ffyg=;
        b=O2cPQsVNuZ6uVJH1ddDSgWJjOUH83sUiajE7Sw1aNC50Bz9qHhz1aKWl+IddMoLhEO
         dryoma+BPp85eSkHNYRbD/W3KNAlqlVXpDKlWCQQ+T9t4bBSo7JB2a/i46uw8dt/aVxb
         KIZE36AzVgkiFN9BUEpCBJ4S1+rmx1Jri8KRWDLYi0sNxSTgmwaWBWDtjP5fYrx35aTM
         YrBGY9cWW4/NaGcdIi6mt6NqH8PDM293azyswuedcZx0+zogjoV/U6HzgCFZw4JRH2S6
         eSPp6hI6HDiowCn6KA+AD/euHbxFtVUgD3ar7uxVbttmmqz29bkmvJM+YnGSELwoq4lG
         cYAA==
X-Gm-Message-State: AOJu0Yyf7cb6eeMDuDQhybmi4fz5fM8umQAcAsOAd9XoHSl/ENFeHYDj
	zpOcVCCzOTZZUbTRQZjDCpURCGA4rgzSJ4EsFp1uwtm8ZE15fNiBM2XBT/JhPEblCaPSyKS4SQ0
	IpW0B1g==
X-Google-Smtp-Source: AGHT+IHp51woAkvqFbpcccPjNfWNEhZyFwklDKfTOZSVs5GASVhJXEFUDCla4z7h/XwcWKa6cUMpww==
X-Received: by 2002:aa7:8887:0:b0:70d:2583:7227 with SMTP id d2e1a72fcca58-7106cf8c01amr9847861b3a.6.1722791370841;
        Sun, 04 Aug 2024 10:09:30 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/18] busybox: Add fix for CVE-2023-42366
Date: Sun,  4 Aug 2024 10:09:06 -0700
Message-Id: <25554f0a542894416ad17e1334c8a05feb56b12e.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202962

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-awk.c-fix-CVE-2023-42366-bug-15874.patch | 37 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch b/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch
new file mode 100644
index 0000000000..282c2fde5a
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch
@@ -0,0 +1,37 @@
+From 8542236894a8d5f7393327117bc7f64787444efc Mon Sep 17 00:00:00 2001
+From: Valery Ushakov <uwe@stderr.spb.ru>
+Date: Wed, 24 Jan 2024 22:24:41 +0300
+Subject: [PATCH] awk.c: fix CVE-2023-42366 (bug #15874)
+
+Make sure we don't read past the end of the string in next_token()
+when backslash is the last character in an (invalid) regexp.
+a fix and issue reported in bugzilla
+
+https://bugs.busybox.net/show_bug.cgi?id=15874
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2024-May/090766.html]
+
+CVE: CVE-2023-42366
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ editors/awk.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index f320d8c..a53b193 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -1168,9 +1168,11 @@ static uint32_t next_token(uint32_t expected)
+ 					s[-1] = bb_process_escape_sequence((const char **)&pp);
+ 					if (*p == '\\')
+ 						*s++ = '\\';
+-					if (pp == p)
++					if (pp == p) {
++						if (*p == '\0')
++							syntax_error(EMSG_UNEXP_EOS);
+ 						*s++ = *p++;
+-					else
++					} else
+ 						p = pp;
+ 				}
+ 			}
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 86dc9e86bf..bc1619d1a8 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -55,6 +55,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2023-42363.patch \
            file://0001-awk-fix-precedence-of-relative-to.patch \
            file://0002-awk-fix-ternary-operator-and-precedence-of.patch \
+           file://0001-awk.c-fix-CVE-2023-42366-bug-15874.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-- 
2.34.1


