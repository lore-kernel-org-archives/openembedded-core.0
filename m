Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A32FCA0EFA
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:41:45 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.2499.1755816104302112774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RxcQsnXb;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb731ca8eso243041166b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816103; x=1756420903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uInjuRVwLYme8iQVxgIXZoVu2/pi+UaHfMuBDJXN0W8=;
        b=RxcQsnXbrWvMZcYK+6Fpo1Gmyd2HU1I11faHjeioixc0ls+u0jQ0Ct/Z6/eO+ETp8z
         polySWuQj0VmRQ9+GcQ9yhLu02rJ5KT9N1+IZKVgndhZGS+iJ1sQUccIa/GwTYn3IIUG
         baD4SXUelnC5s2vCaQPjMfpDAF4v36Cp8IKbo+/jbkK5mUh28lOGnXGplfr5Wg5bGSJw
         LNyCNBkQxoYRzGX4mNyqR3Gl8NhojJEiNxe6nN8BdhCEG2BLlxoiJiVUbZVd+5Chafqp
         Thar1y7Mx0B9FwJ84JHueTtRU19HcofQv75is3+VWcq3QLATC2Tj+Phj44crzY8CXYCV
         zZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816103; x=1756420903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uInjuRVwLYme8iQVxgIXZoVu2/pi+UaHfMuBDJXN0W8=;
        b=M8iQFNQhgjzs97AjW654rnCMJVUpf+bEDPgsgALbZQvWYHy746PQoAdXkviU3bOfaw
         acjzrl/gmPjg4JcJXC/fOsVt5HPOtq+YESiX2bLiUeWqoyTQab8Es3v+I/CcCDSv2lWh
         fDQwPKgRD7lXIFba3cmo4lHeePhvChjKN7Q7uCqI/6SkPoPG9OcDiBI5mGbF8soetE2B
         ED1Lhbxvyo42WHVZB0sk2bEULS3qYEQREGqJYyosa/Rb06M28uFVKbdEHBolwB1ptQzN
         duH18sTCcQWdUhx3tPbPqQEbV3CszxhtPRKtQiFbPq/HfZLaUaZIevxMF0q1bsD6LxoK
         IieQ==
X-Gm-Message-State: AOJu0Yxqr5/O+0zQllkNehK/lA6G/8B2zrP88eIqyWmtNEjyJwH3cRcE
	RfMDklfg3Bp4w+hCdqRbt5td58PZSUUz/9Ci3/jrAp3RAV+HI1VpCl4SSPM7Iw==
X-Gm-Gg: ASbGncuiLP/lme5ZnYxr2dS18ce4zW35GuMIX8ZKEPKKZzdjqgUrhS61qcK6J+14j+6
	9tDNxet25cV4bdcgBR94bpryb7R0FNZv/ht88mHNNTWpzfe9EMzK3H8t9rQ1ePuw3OkNaZkuwqV
	ZB68goNLds5Ab3wy6X4EfRqjjF9Iqm13kTvn0rpiPj6oM4F+kYzHaL/HUfzGj61/oB4JFxfDP6i
	8lcWzYciHuL9IFMTsC0HFIsKH4G36EgI968FOJbpQtsjLImSZ3y0UyRaxkaLUQbbegFRJyRBSkA
	MjYN5SRUMB/3QxT5sdYXZPSnQeh3Pm4s7rvjTOP9yYDpzJP1Zf4vqoIQeMXwRgibXponphEXlQV
	A2oI9/2QlyJvDMgTTuVT7YamCp+Ov9RQpdwLWKL2v0GWi1hI/13sYlHfN
X-Google-Smtp-Source: AGHT+IHlVTiIy90L3CmxTX6fQMaegyzeCzVMsVpFaxdQtSlybE4rNPymZ3c1D1wJ1hFeMppfp1J59A==
X-Received: by 2002:a17:907:97ca:b0:ade:7c6:498a with SMTP id a640c23a62f3a-afe28f767a7mr73901666b.10.1755816102633;
        Thu, 21 Aug 2025 15:41:42 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afded2bc53dsm482606866b.7.2025.08.21.15.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:41:42 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Michael Halstead <mhalstead@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [walnascar][PATCH 1/2] yocto-uninative: Update to 4.8 for GCC 15.1
Date: Fri, 22 Aug 2025 00:41:35 +0200
Message-ID: <20250821224136.1674019-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222284

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 3d0f1fdccd..dabd604e8e 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.41"
-UNINATIVE_VERSION = "4.7"
+UNINATIVE_VERSION = "4.8"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "ac440e4fc80665c79f9718c665c6e28d771e51609c088c3c97ba3ad5cfed197a"
-UNINATIVE_CHECKSUM[i686] ?= "c5efa31450f3bbd63ea961d4e7c747ae41317937d429f65e1d5cf2050338e27a"
-UNINATIVE_CHECKSUM[x86_64] ?= "5800d4e9a129d1be09cf548918d25f74e91a7c1193ae5239d5b0c9246c486d2c"
+UNINATIVE_CHECKSUM[aarch64] ?= "0d75ae3cc6e8245be40f55d48612285248ad331896ca3f4c772ed2fb34239fcf"
+UNINATIVE_CHECKSUM[i686] ?= "2cbfd7ad3e1362538764999dd4962eb2511211867ae17a327b65631f64f38e31"
+UNINATIVE_CHECKSUM[x86_64] ?= "6d5e28258176c52b9eecf882d4553033fa700902e60ba80d4b7ce0edacbe41d6"

