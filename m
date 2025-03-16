Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25434C28B2F
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.31746.1742141594782684182
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TVeeLWHl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso7714225e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141592; x=1742746392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gqUdn7JFv+x+jF229WBPvvfcKDRSIbrJoRrNjuXUqw=;
        b=TVeeLWHlqVzGtuYBl2ZJ4gM0ifjWp99Af2SiIh26K7uMwqASQDms/pfwA7vL0we8QQ
         srSH9RgeLGT9gYeZn82jvvWvY3HSlMuYR5jH28sRelilvooqsELucJODlBrcuxetur7g
         mh7Q07GSgVhmM/0kq7dKjp3bPvEzkAsKBlMrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141592; x=1742746392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gqUdn7JFv+x+jF229WBPvvfcKDRSIbrJoRrNjuXUqw=;
        b=bCF0ru9Bp5PYbAVfc4GYPhULFFoF38ZENIcHmXU7gV07WEUW4iiLPw3FC45rz5r1Y4
         Hd+2Vs0xKPEl3gy7ax2cWJq4DJ5Qijvnv8duCpRZR1jVbhbea3DzRzPyDMxrUX3j3Q/g
         WVPdkWau2/fY5Ypi8CodniKd2d6V3vum6BLnq+9IHFNztfGsOhZE1swiQHyREnH9BnRr
         6VSZBO2o+5gQBBEd2mBfa6c8m/DKssIgKCsNFPAZNFiGc/QsKm2K2TfIo/5NxUNRl8iG
         gKu0Hjtlj4imi9yy+xN8IydMCTQcxhuF6WNB78Sy/lowxv+zUEcCGt31OjFInTJTGCsE
         X2Eg==
X-Gm-Message-State: AOJu0Yx7oOwezLXD06qnHkk1n8/jTyKpORQJwNNa8iaOS4l2XNRS2FC2
	Z3s+/baeN75ciPdFRy2OGWqFERWzdlCs26SlS2ZjzJ9DiEBHLFAmpin3BsZ67tmLlb5uCU4FINN
	b
X-Gm-Gg: ASbGncuPjs/5f8W3eumR4flsZpWNAwz+Au9pGsM4AjqjlcdbHmfkIo6DiRUgkATqlBu
	kWL9TVtuTIfm9y3DtLkOimUtJcIND+ahvqZnwSeUH7Jacda0iUiyyLF7QYg5D/0ROPzCfjhAeQt
	ao6c3FljBQq8AwzeCvxzZbMutlE+Ga9nS743xdE4HaWxzCOUTNCF9nI30z0IxFTmL6MgGcPkRN/
	VVtYAKpDjW/9secDoAcvBV9SlSSU23UZvyFFNfkYbXpLS8NJgGqGhHWhqLeo/zZD0G0c1Lh0gI0
	vrGqsA5Z4kcCAhV8nNBEejAIutObUcoNatjezcGopyzUMYJEYxQNJWzM5rZratAusH0afwHbTA=
	=
X-Google-Smtp-Source: AGHT+IFDYtnKEPFW4bcTymxl4k8y/irwmdxlq5zNTrveWjifEzeioKV56YO/S1cHBWBCWUZtTCgjOA==
X-Received: by 2002:a05:600c:3b0a:b0:43d:526:e0ce with SMTP id 5b1f17b1804b1-43d1ecc3931mr90208485e9.21.1742141592466;
        Sun, 16 Mar 2025 09:13:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.13.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:13:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 42/43] libidn2: upgrade 2.3.7 -> 2.3.8
Date: Sun, 16 Mar 2025 16:12:08 +0000
Message-ID: <20250316161209.3629986-42-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213045

License-Update: Upstream moved the GPLv3 text to the COPYING file as the main
license. Our LICENSE field remains correct though and the main license and
the library license remain unchanged.

https://gitlab.com/libidn/libidn2/-/commit/61ee87ee229c811bd9bf945084645058249b52cc

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libidn/{libidn2_2.3.7.bb => libidn2_2.3.8.bb}    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/libidn/{libidn2_2.3.7.bb => libidn2_2.3.8.bb} (68%)

diff --git a/meta/recipes-extended/libidn/libidn2_2.3.7.bb b/meta/recipes-extended/libidn/libidn2_2.3.8.bb
similarity index 68%
rename from meta/recipes-extended/libidn/libidn2_2.3.7.bb
rename to meta/recipes-extended/libidn/libidn2_2.3.8.bb
index 7ae933e0479..a53ac47d66d 100644
--- a/meta/recipes-extended/libidn/libidn2_2.3.7.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.3.8.bb
@@ -3,16 +3,16 @@ DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specification
 HOMEPAGE = "http://www.gnu.org/software/libidn/"
 SECTION = "libs"
 LICENSE = "(GPL-2.0-or-later | LGPL-3.0-only) & GPL-3.0-or-later & Unicode-DFS-2016"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d834ea7d480438ada04e5d846152395 \
-                    file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-                    file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
+                    file://COPYING.LESSERv3;md5=3000208d539ec061b899bce1d9ce9404 \
+                    file://COPYINGv2;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://COPYING.unicode;md5=684cf5f7e3fded3546679424528261a9 \
-                    file://src/idn2.c;endline=16;md5=afc1531bda991ba6338e33a7eff758a0 \
-                    file://lib/idn2.h.in;endline=27;md5=f88d218005a5c45b68a83cecb5bd7f26 \
+                    file://src/idn2.c;endline=16;md5=c44fb6f201f22da3a19857499b49b15d \
+                    file://lib/idn2.h.in;endline=27;md5=f27aee1b44326be3a28961c55319099f \
                     "
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "4c21a791b610b9519b9d0e12b8097bf2f359b12f8dd92647611a929e6bfd7d64"
+SRC_URI[sha256sum] = "f557911bf6171621e1f72ff35f5b1825bb35b52ed45325dcdee931e5d3c0787a"
 
 DEPENDS = "virtual/libiconv libunistring"
 

