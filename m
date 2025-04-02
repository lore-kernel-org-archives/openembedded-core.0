Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1542C36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:10:37 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.2225.1743577830064979398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AQNgk1JV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3996af42857so327666f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577828; x=1744182628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8drXWQmWGna5UHo1mhsLRiwQgn4H0WKDsMRR4NFwTBc=;
        b=AQNgk1JVhXCNtHO2WtR8DN/bCD4AjNYfhuc+HCcZQjAiUGCDi3/eMUOt6ROPnP/hrU
         RLNP2Hs6BrMvVRb7DoSxzeg8xOKPGyVLlcXnIQy+XDMSvMoYbIQhtSFdMA6o1A2TKsY2
         kEhVfg9BnMXL3pRXufZWeyx3a0vyeuhMZwI+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577828; x=1744182628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8drXWQmWGna5UHo1mhsLRiwQgn4H0WKDsMRR4NFwTBc=;
        b=iwp3Re0OVyo4VqwHmM8AltJHkiRvI8DGog0ztOnM3YbIxUTvLMoG2M6vjYVnjWI/6w
         a021Pv534CMDv6vYmV/2/9ePLfRY12klf5gkdeWc3VM6fGeuJHC6z0TQzuv4Orwktuu2
         AGyPZEOvQ+VoJ3xoS3IflfkSR4KP99UTeV43ItAxsi5zdVbagUem0i296azEaCBin0MN
         ZwZklFhjxGRMMDsZA/iUX3m1U8s0qnx/rPGuBbRsVga+1IriK8JgVU/7DNEBJxdp7QnC
         4JLTx1dkXEDWdFh1sN3QZ61W1lxd+ndxuWuhaDs6+/Cvfovk7eOm9EfswpWyYFFQolio
         B8ZA==
X-Gm-Message-State: AOJu0YzrZCxhObhkw4gFoZ6i5asJkWV9dDhnryoqKIJ+nfXlwL9wj634
	GNZcgqDTRgldaJnfC6Nh+5kUMnqVpwVaTzsok4ygXQjyLTwGg9v6jit6anF5tqSsXPWBBvVV64I
	v
X-Gm-Gg: ASbGncvHplBtHnJ07VYjaHcrb+3Yq9x7y+8pItNOm1EQ5TeFzU/g+tzJi2QmoGWiV4x
	5wZ65lZjTHtZ0ODMBEBc6vMsDZUGDFrbDKiSAmtfKjpRHutJfwc0Mh3Gs9vB5Kx1A0iFs08mFZW
	A2QnNq3OHvx1J8NPGZnHANbFwgEtcpGy7bFcZm2d+MBHt3dAygJtWx4p3UezI5lwKnClvIZbFsa
	gti5MaK8hyyr20KWQKyKL0GMIfA4I/MP+4c5iQvxstf3Y582z8SoQ7dPPAEr5dYxitgtp4ym82F
	JVCdj0Xzyp3qlyavkmpPH9A88gEY1q7HNmX0CKnNoANbXRGxABnqPypEo5yOtSMHrxXY/agaEQ=
	=
X-Google-Smtp-Source: AGHT+IGlXnMfkq8bqeSPmu8lMQpnwBhLthAzUbWdJp62SttZ4UYn0sxMcTE/MswVoCoLFEptRXiyQQ==
X-Received: by 2002:a05:6000:430b:b0:391:3207:2e68 with SMTP id ffacd0b85a97d-39c2a34ce11mr712957f8f.9.1743577827920;
        Wed, 02 Apr 2025 00:10:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/48] bind: upgrade 9.20.6 -> 9.20.7
Date: Wed,  2 Apr 2025 08:09:33 +0100
Message-ID: <20250402071017.2157620-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214177

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.6.bb => bind_9.20.7.bb}                   | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.6.bb => bind_9.20.7.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 0d670edda60..78ab6b87fc2 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 0a45935f9d1207535f83df62ed52f358ed546bbe Mon Sep 17 00:00:00 2001
+From c70f74164bea8a8c54c03becffb2f21103dd1f31 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 10b8caafbba..53e439721fc 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From dd484b0bd58832fc241afdc8ea05693228348353 Mon Sep 17 00:00:00 2001
+From 0dd67d85705cbcfa9a2759c46f3cdf3d0d6375de Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 13f9d7f..6516d0d 100644
+index f9cf4a4..0ce3d26 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 49b0a5eea1e..38d208fc1c0 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 9a06dbf831f012c6019237527d2bf1aa7a3a543a Mon Sep 17 00:00:00 2001
+From 8c9c817933eef20328f10237bbd964580db0a3ad Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 168a77a..13f9d7f 100644
+index 334b551..f9cf4a4 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -863,7 +863,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 16ac510cfab..102fe46ffec 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 27d1113a4c378583e0fcff91d70256bdcd78de0b Mon Sep 17 00:00:00 2001
+From 83a892af19bf1455ce7132350332ed6d7f1e2b94 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index baeeafe33e3..984d401c708 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 1fa4d0eb9631771bd751f04ce898433580996e5e Mon Sep 17 00:00:00 2001
+From 1393cbf6b0084128fdfc9b5afb3bcc307265d094 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 93aa3041264..74f2ef83a05 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From 2ea2e4e502e5840d52e76461e071882cc65f1766 Mon Sep 17 00:00:00 2001
+From ce06506bb3fe661e03161af3a603bd228590a254 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.6.bb b/meta/recipes-connectivity/bind/bind_9.20.7.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.6.bb
rename to meta/recipes-connectivity/bind/bind_9.20.7.bb
index 7a03f8598d5..b4202f1a59a 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.6.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.7.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "ed7f54b44f84a7201a2fa7a949f3021ea568529bfad90fca664fd55c05104134"
+SRC_URI[sha256sum] = "43323c8d22d2144282c37b4060ec11e98c24835e225688876fad08ba7b95dca6"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2

