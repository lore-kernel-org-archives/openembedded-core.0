Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAE5CD98C5
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33645.1781132120072717742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fWoI84Ig;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45eedc94d37so3773747f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132118; x=1781736918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0zvRY+X2mSAhtdN835TMIKGsAxpx4X9jFNgAHs1euc=;
        b=fWoI84Ig4KzhD0hJTWAw26EzqAj0z1BygmpK7dYcl2Qx4KMXsYaeRJmOOYr1JqG8UV
         bB2BH4UO3MLhAgz9SRmJNdXCqVBm1QP3r5vJrAdcH5qB7k13UY8tEXNmZ9kNdIFQwJwV
         ZXur0ysGxV063RQH1yvoMSz7CoJVUsW1SrhOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132118; x=1781736918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J0zvRY+X2mSAhtdN835TMIKGsAxpx4X9jFNgAHs1euc=;
        b=DpNN9aVtH+KPDHVhFn2jky5Us7+hKVzjDpS71N6LKYCzoma+rb4lD81Cn1zY33FEUM
         dv9JBZLSjapRs5gYFKd0j/kN6E/o56f1uUgmD7yVlOiC3v0GMs/7EvKSbwDVE9ZH+F/2
         TqNzm0O5PoHT/56Myeu+B0mrrpXaV40vBLXULriIGR0ECNcaK6+pJ8ajd0KmkwAWyig2
         tkRWzPZz4LP/cG2hJoemHZKdYsqWa6iaqG8F7Lmo3l7W7/GgSwEMo/DfgKT6wIb1NpxN
         dWIPrL9zVauyF/ZKD7HoKwmODTLNKLP0bOIPmIJjamR/yXnkuYBYJXkjCPS10Bq9/E/5
         t5Ow==
X-Gm-Message-State: AOJu0YyqN+LsYQiwKfaiBHpyPp0JazWvnzrRih3SrtsjkToeejWd4qve
	L9/2RUbnBYhaQDW1wqBiQy32PTGQ2Ym0BuUdxIpcg2gee54V3jgTt+wvKYCmhA7XK6uMxJCUSSW
	l+oVX
X-Gm-Gg: Acq92OEZaWUwOyy6vBkcmtnOWDwBKMD/lnK6L/fzghpTXoJKzdI5il/x4GeS0ElDwh9
	Z9YJEKegn7QAI6JZezWuLoPloyRRJqnNhTdX2YmFtT/FTn6dZFTpl6TINPiIDsyG866FQu6Ofx/
	CH6i8ogr+wLyEufWeoO+Tnt2Php2a2QCUO0j9+EDXwlOU89uyZMZOEltcV20UWUeiiDE1r+JCCZ
	JZJSK2uQwp5qoissuyErRQsPYEX0O6ouhezok9KGX/jwsT0qwVyiXR9pLcE+aMDeKIRx6fE70HR
	exQxefDI+qnleAiccQND6MhLGMJ6fmxZXUfcDHa8kDKFGlyuzZ99pgv20kuDiKf7jz/dmfOxSUF
	MK+NIL1S1gmA2hYLvOCrYIK+1rJ2xwkk04a/0hJHQbzHydSD2QCikme4M2SgK3riRwB1vPN8aBI
	5sM6OscfDx4OKkA28VMgdVO19q2FXT7Ea2qXanqIZ1W7Nn7aUgIi3aSwULgOPRxGOhMdASsfZQ4
	cTypIlVTQ+MRXqyyKDWclMi81/h7vIP5SFP6DS65LyOd/2oxw==
X-Received: by 2002:a5d:5848:0:b0:45d:817c:b8b2 with SMTP id ffacd0b85a97d-460677baf9fmr220097f8f.30.1781132118410;
        Wed, 10 Jun 2026 15:55:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/21] cups: fix CVE-2026-34979
Date: Thu, 11 Jun 2026 00:54:56 +0200
Message-ID: <6ddc509160bb1b6b68b7066883aeac80df42e373.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238401

From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>

In CUPS versions 2.4.16 and prior, a heap-based buffer
overflow exists in the scheduler when building filter
option strings from job attributes. A malicious IPP
client can trigger this overflow, potentially leading
to memory corruption and denial of service.

Apply upstream fix to ensure safe handling of filter
option strings and prevent buffer overflow.

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-34979.patch            | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34979.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index e739cfa5797..78e0495d1c1 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
            file://CVE-2026-34978.patch \
+           file://CVE-2026-34979.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34979.patch b/meta/recipes-extended/cups/cups/CVE-2026-34979.patch
new file mode 100644
index 00000000000..eefb2ed43b8
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34979.patch
@@ -0,0 +1,57 @@
+From 0ff8897367c7341f2500770c3977038cdd7c0214 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:50:06 -0400
+Subject: [PATCH] Expand allocation of options string.
+
+OpenPrinting CUPS is an open source printing system for Linux and other
+Unix-like operating systems. In versions 2.4.16 and prior, there is a
+heap-based buffer overflow in the CUPS scheduler when building filter
+option strings from job attribute
+
+CVE: CVE-2026-34979
+
+Upstream-Status: Backport [ https://github.com/OpenPrinting/cups/commit/0ff8897367c7341f2500770c3977038cdd7c0214 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ scheduler/job.c | 16 ++++------------
+ 1 files changed, 4 insertions(+), 12 deletions(-)
+
+diff --git a/scheduler/job.c b/scheduler/job.c
+index af6390687..0494d7196 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -4192,18 +4192,6 @@ ipp_length(ipp_t *ipp)			/* I - IPP request */
+ 
+   for (attr = ipp->attrs; attr != NULL; attr = attr->next)
+   {
+-   /*
+-    * Skip attributes that won't be sent to filters...
+-    */
+-
+-    if (attr->value_tag == IPP_TAG_NOVALUE ||
+-	attr->value_tag == IPP_TAG_MIMETYPE ||
+-	attr->value_tag == IPP_TAG_NAMELANG ||
+-	attr->value_tag == IPP_TAG_TEXTLANG ||
+-	attr->value_tag == IPP_TAG_URI ||
+-	attr->value_tag == IPP_TAG_URISCHEME)
+-      continue;
+-
+    /*
+     * Add space for a leading space and commas between each value.
+     * For the first attribute, the leading space isn't used, so the
+@@ -4279,10 +4267,14 @@ ipp_length(ipp_t *ipp)			/* I - IPP request */
+ 
+       case IPP_TAG_TEXT :
+       case IPP_TAG_NAME :
++      case IPP_TAG_TEXTLANG :
++      case IPP_TAG_NAMELANG :
++      case IPP_TAG_MIMETYPE :
+       case IPP_TAG_KEYWORD :
+       case IPP_TAG_CHARSET :
+       case IPP_TAG_LANGUAGE :
+       case IPP_TAG_URI :
++      case IPP_TAG_URISCHEME :
+          /*
+ 	  * Strings can contain characters that need quoting.  We need
+ 	  * at least 2 * len + 2 characters to cover the quotes and

