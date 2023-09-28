Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E23CE7AE9
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 02:49:18 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.6275.1695869351252416903
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 19:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MM7alTJ6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68fdcc37827so10098612b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695869350; x=1696474150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2VN2RY6L03AvAbzYxvWHpZS6jfkihjkjUSJcqlT0IQ=;
        b=MM7alTJ6YoSqQQev5KPx/OKbQ5ESkgeG7HFHiGmi6zww0eXSRFfuMgqHSRLxi01cpk
         uyMHROnCqVItICZOPgU2ZsCXzjlCbiv1X1FGmEmVEgnPPQYYVKvcXLV5G3zoX4allmfV
         LFBNW9mNbE7tbqsmVNi/fPxCqTUDKtVuTvu1J2m4sAcNYq/kSR6OREu7qoCkzTZWCEEK
         8KWGjQW5Vw3e1XBwSIoygOF/mMzB94TCwiv6qXlcLKdSzjb0dslO2LQoHgmccNoJITa4
         hfpgLyX8AVQwpD8HVwl8gtiV34nxF9QlNENX2phLzxrauB1PtIh1FO8Sz7ddF1vpfSYb
         2Mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695869350; x=1696474150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2VN2RY6L03AvAbzYxvWHpZS6jfkihjkjUSJcqlT0IQ=;
        b=TnOBydArIUm3kwmVCJ8OvoeGiWTvjNloeMOlwEboYdyPApFUcehemhYg1Hrqjo4A7q
         v7at6X/R4xg9etyjOol1CdDYr+6e5z+R1az0KIb0hJy4pee9IMwgp69oA+dQia4Sxvp1
         RstzULHIPsQclMGSfq7QqVu3kUDIbXCkdkoB5vNVB96ekNeuUxWC4wtn/Y+HdrLwT3TB
         IJClXKuOHIT956lnGpSgqmAbg7jzJQ04A63pxdQuiBQNJoKdtzpGTzz0xEyg1m0ExTBm
         4k4b1awEEUu1+r0f27LK/9yXkRJbYiPIlNFE4juQGFbk/Y+RYdR/z1GBFoYKNcxuM7mb
         hGow==
X-Gm-Message-State: AOJu0YwbVs/kwdmC4VGrDMZB/3sA4fPjiFWtPUunzY8DItVkGdxagP4m
	jn+QS/qMRYgCRNh8uM0x4e588MRJHzwqx39aRTo=
X-Google-Smtp-Source: AGHT+IHw07Phuvwxc4b2rH4jSM5s3fLsI369EXxEK9JMEFUUZTxcOz9i3mjhUM52oXrOJ8ZyuH/NAQ==
X-Received: by 2002:a05:6a20:549d:b0:155:1710:664a with SMTP id i29-20020a056a20549d00b001551710664amr6564880pzk.18.1695869350321;
        Wed, 27 Sep 2023 19:49:10 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0068e12e6954csm1850214pfo.36.2023.09.27.19.49.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 19:49:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/17] cups: Fix CVE-2023-4504
Date: Wed, 27 Sep 2023 16:48:40 -1000
Message-Id: <dc5c06da7a793e85276ce8ce9de1c06decb6e133.1695869144.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695869144.git.steve@sakoman.com>
References: <cover.1695869144.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 02:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188361

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-4504.patch             | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 4d0c52eab8..047ab33898 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -18,6 +18,7 @@ SRC_URI = "https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
            file://CVE-2023-32324.patch \
            file://CVE-2023-34241.patch \
 	   file://CVE-2023-32360.patch \
+	   file://CVE-2023-4504.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups/releases"
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


