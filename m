Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764A1C35FF1
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 13:36:47 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.37889.1741613799732544959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 06:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T70Ezo+S;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22409077c06so6728335ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 06:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741613799; x=1742218599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lz9rVcWajbdtrjZzpBqvZ7xBxzyMxa5elfPIbN312kg=;
        b=T70Ezo+SoDgSKQpQInir72pi7KD+Qt+MJGuyGu60Cn0nhdpQ+9yogLy5gi03TlM9pm
         7MY7Znp6Y1lhXuYSnLrB217Jpr//m9DjOSu9ScMhSM2UNbyKjYz0P4vWFHNhqeMOOaXC
         zanjSDTtPFiV35jJk/zSKA+6MFXjmFmLpyOYgVL1PVQroeL1IbE3ScfZPhoadpC1FAby
         VZWuijokkFnXx5ecbGhWNsH45MNVjDdIXEkR9rN1l94+MmvgZYsiTz76VXED6oe5V6lQ
         ULEtJWvP+yoXxL32jHh/qyW9loioC9cPSr4YAWF8EtBYLXHgJwcgN1sxeEGetSxW2d4Z
         Kb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741613799; x=1742218599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lz9rVcWajbdtrjZzpBqvZ7xBxzyMxa5elfPIbN312kg=;
        b=Z3vqjaNnckTx533GuPKDNJKthtq1+LiZsfYgfFt7TwuhYC1lyOQmtwpyF5ZHzWJVaG
         1N8fM9BT8wR7zoD+ddQ2yhq9nF6dY+5xxM5QrnkfVeLIlirCo3J7K4CpvtDNz83PmkRe
         e1y/xlcs5q6xdwPzWHlKeOekkcgyka9ASDCCnn6+pfhhCeaYhoB0kQ/jg4L1COBRP/5j
         3qtb50V4pZpxcHLG/O20vyxbhOIX8pNHGbRwfuqqE+y/LAg0x9sgsM4OkD8VbW0OzPMd
         l0A0CNSpV+fENWYsAXEIgnnO6kCo3ycu9HnGqheWXmoK07EhVmsNkNL7pcAA4HYaMIHU
         qmoA==
X-Gm-Message-State: AOJu0YzJSDzKXuEGsN8BoQCZTXtOB0LU8wOhryCU3NAJcDT2WzYOJEOl
	brZO8C62A4a0vwlQugcSjwiNOLoniSLKEsLHU/a1qIpD/IAkfAEFUcYX7EyoTxbsu2KjvgZTYKK
	O
X-Gm-Gg: ASbGnct+bN9acoR1b5Kl8snbTZeszsmR/qrNrlUqNcb1LOHKwDLxaYVvfGijN+H8fpl
	Ifw9WGNupl+RYLcDV8my0JcL1JjKWAVMzr6oxHzJP+ipsnDKUXT0l86VwH1wI2wKzMVp5uhFk0h
	mr4O5r/6i1pcDqCKRgNVaeSXE7gt94bRv2stI7cDr/iLupLLjTKU4LXNd9J2ciu/nZdRQLhXOfo
	8eekQmMn6sNvmUHedcxMWPdIxtn909D9tHj4c+cROisQ5wmT6Cjnu8qAPI5EAeleCXOePKIQffc
	ZXMw36oXYN14d/NgRNyAjImMkNT2ejAKZgUGKoN3FtaZXEc=
X-Google-Smtp-Source: AGHT+IEZ4IdrXBSLEUSfKkmyTiZHfdEWgGijUIi4caM06zMHmRrghMCKxik+EBtDJJCh5wcqoOsEPA==
X-Received: by 2002:a17:902:da8c:b0:223:8256:533d with SMTP id d9443c01a7336-22428bf7ad4mr218822175ad.46.1741613799031;
        Mon, 10 Mar 2025 06:36:39 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2ea8:96c2:9f70:5c1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddfbcsm77820095ad.21.2025.03.10.06.36.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 06:36:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/6] tzdata/tzcode-native: upgrade 2024b -> 2025a
Date: Mon, 10 Mar 2025 06:36:23 -0700
Message-ID: <4dc7731d350eab8952330f01beb5acdba7d88bb9.1741613667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741613667.git.steve@sakoman.com>
References: <cover.1741613667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 13:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212525

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a15c4e6793c55c8084a61298ef3695e1db2f60cd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 8935d1cd8c..3fe6c3142b 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2024b"
+PV = "2025a"
 
 SRC_URI =" https://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            https://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "https://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
-SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
+SRC_URI[tzcode.sha256sum] = "119679d59f76481eb5e03d3d2a47d7870d592f3999549af189dbd31f2ebf5061"
+SRC_URI[tzdata.sha256sum] = "4d5fcbc72c7c450ebfe0b659bd0f1c02fbf52fd7f517a9ea13fe71c21eb5f0d0"
-- 
2.43.0


