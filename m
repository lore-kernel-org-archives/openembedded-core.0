Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720EACDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:51:39 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.57857.1697817095439987829
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YgaNvTgp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c9e06f058bso16053255ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817094; x=1698421894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+W4JhMFZW2E0xdHdsXpdPk4MYX7Vn4+HZG+CrTp+E8=;
        b=YgaNvTgpk/gi4ZmxCv4Z5rGbywWajLO8W6a0H8vyaB2Qw27Z8kZteJuZluYhP4FG6i
         GWIifyy4B+NdnFvzlQq2CfQWefx+f23nDNGdtn+/OL3UhrRG3C5L7qYe25EoKLfpG6Sk
         /fVrG6oorPf1XXW26d2/M3IXHMV6/rA1namBCY0Pl3ON+yeU0Qz+y4MWIpzAPuCjcvp0
         JR/fcL83Fod3LzJCtPo/5ZSkbKM5a4ZXwZ9edXAyRwCMveHH+An55FHOvpDL41ZxEyTQ
         ctlHq46BNsyY0oKj+ZJL2RL+xaY+srJyHWc0KsLpyNX03Ba8ngDoIXyXtr/aUTQ7zqU/
         X+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817094; x=1698421894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+W4JhMFZW2E0xdHdsXpdPk4MYX7Vn4+HZG+CrTp+E8=;
        b=D+B77D1jFIAX+G62dtf2zBNMoL5Ad/KiJ+U3RMqmiTVksPsOiDA53YlBlYvN20tCTG
         8/Bg5kLcoAjA4TaNJmksjXFa8xmgq1Tqhmld5qytWxgOcihmAm79hEbNut2jPvjYoD5Z
         wP7nz3u7eLmbPDPmqJcVA8SW/Kma8OPHQOAOQl+bkHmVrUrK0q9gQF/08wiZ4yfI38em
         nJwmSHtaPzCSLajceLVcYJCxspene0xucsv3h8dJkI4dmVBY0zDFpfKpMXILPBrSJi6P
         chfXRZap+NY4rhJrFJoSUEmTVBTzkbHG0ketXPhk6UoQRp6ZbUjGVDEGrHs6u7zuoRr6
         XcWg==
X-Gm-Message-State: AOJu0Yy3z1L/UKTN19gyhUfvuta8OyRr4X0wgh8PS/aWmtakQE8/aWgy
	y3urp5d+GPUR5nmyRQhQf5mJiaWmLIIKNv/nDyg=
X-Google-Smtp-Source: AGHT+IFZgPWPBaqfRgQVqtcgZpbpMaIz0OHZilBP3A9rWmKrMobMyAGM7Lxl98OvQy1A7buVRhaIjw==
X-Received: by 2002:a17:902:cec6:b0:1bd:d510:78fb with SMTP id d6-20020a170902cec600b001bdd51078fbmr8233441plg.3.1697817094484;
        Fri, 20 Oct 2023 08:51:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.51.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:51:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/24] cups: fix CVE-2023-4504
Date: Fri, 20 Oct 2023 05:51:03 -1000
Message-Id: <a1138dfc1e9394966dcca8f6259767a8ce5ca4cb.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189546

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-4504.patch             | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index c6a676b747..d09ceb203f 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -17,6 +17,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://cups-volatiles.conf \
            file://CVE-2023-32324.patch \
            file://CVE-2023-34241.patch \
+           file://CVE-2023-4504.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch b/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
new file mode 100644
index 0000000000..e52e43a209
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
@@ -0,0 +1,42 @@
+CVE: CVE-2023-4504
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/2431caddb7e6a87f04ac90b5c6366ad268b6ff31 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From 2431caddb7e6a87f04ac90b5c6366ad268b6ff31 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Wed, 20 Sep 2023 14:45:17 +0200
+Subject: [PATCH] raster-interpret.c: Fix CVE-2023-4504
+
+We didn't check for end of buffer if it looks there is an escaped
+character - check for NULL terminator there and if found, return NULL
+as return value and in `ptr`, because a lone backslash is not
+a valid PostScript character.
+---
+ cups/raster-interpret.c | 14 +++++++++++++-
+ 1 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/cups/raster-interpret.c b/cups/raster-interpret.c
+index 6fcf731b5..b8655c8c6 100644
+--- a/cups/raster-interpret.c
++++ b/cups/raster-interpret.c
+@@ -1116,7 +1116,19 @@ scan_ps(_cups_ps_stack_t *st,		/* I  - Stack */
+ 
+ 	    cur ++;
+ 
+-            if (*cur == 'b')
++	   /*
++	    * Return NULL if we reached NULL terminator, a lone backslash
++	    * is not a valid character in PostScript.
++	    */
++
++	    if (!*cur)
++	    {
++	      *ptr = NULL;
++
++	      return (NULL);
++	    }
++
++	    if (*cur == 'b')
+ 	      *valptr++ = '\b';
+ 	    else if (*cur == 'f')
+ 	      *valptr++ = '\f';
-- 
2.34.1


