Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F037BC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:10:27 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.2123.1743577827380549686
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IPyeln/K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43690d4605dso43229145e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577825; x=1744182625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9uRcP+SDsOFcmO3MvtCiFwXsuGjrwVK0sUIA8b9qRI=;
        b=IPyeln/KLdNu4qFkAWC/TpAt6y+iT/p7hhVwS0RhPVbDqmQNzT/KBw+klwVFgNpfsA
         ypLPhmqrnCtYhGBib9ok/0OpnSVzT0lS/bydYZiOITs5Xzbq4fOOxTksCd3ULYcypY6A
         /Ba8u4Kp7AhWArMiYvyzPNwRA1BTwGR7vdT2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577825; x=1744182625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9uRcP+SDsOFcmO3MvtCiFwXsuGjrwVK0sUIA8b9qRI=;
        b=pA9/d+4m/uX7LTyBYc55tol7RYwNpkPgqrEjTUoIWF237u/f8Mb025CQ3GIglq/lN3
         KiAmtI0U7Cm8PWHRvmX2EpUoAD4PWUkUV6PdIg/SuJMtUH5qCL5NUF0D+1wLcV5Zebqy
         oWtDtGrf6n+WBGvn+LoWPC6+3bNziOYrKAN2YtJ50Dznulnx1Me8JTzt1IkRLjn4AJLC
         oK3FPBar2R9clWaXDzrupoG8wG0WJoQK96K9S9dYtZrvzMEHFYrwo9HHP0EmeBmcIWnd
         u9u4QmcHslL1LetYn+s2No3Qhe/uU9CCbOjQEmbIxwd36rI74629x9mvjdIydOgCanu0
         MZ5A==
X-Gm-Message-State: AOJu0YxdokGZIyD5XkFemI1KzHfeq0dZLMIL2yG7PWOsy1F6+W4wjuCv
	cKAMb2DGMYTMvK+pLw/ilnsdWnb0J2qsPhw2uAQwE0zCWMhx2IEq9sLs+h2Bs8WsB3HXzdmDoFR
	V
X-Gm-Gg: ASbGncs8KEUw2jAXFB4PFzqvDeizffIdNGtfYnH7rgdrQJHyfwGNGf36n/EvRe9/nHZ
	aifnhVgnJY15/04CB1oJA4AhXP7EV6DqQY+Got/dGmYWwpr76YCuqJ1Xr3QQxN8sQHH5UbfqBfX
	JQMdcWAfkoWUeZm8nNpE/qrLxY7m0iYPr8SoKKf+9rAW/jWdGFHhXW4CPAomdZmfhLz210jpI/N
	buXmNe8zUxhrOCGgZz5taWV134D5Bym2t0FAPlis+4YfwUg8vc4OozIhvvRuGoZ0Qneo98fySRj
	/qmgDbicqvRH66MpVcOMwiThZYiMqOgls9unhe/akQSl8FYMwuBtNuxXyuKalZbEq19P1UsAyg=
	=
X-Google-Smtp-Source: AGHT+IGzwuaPYu/33dz5YZabXbYQ3fmFzfRprhsqXvRozfWJyeuW1paI6z6vUZknjMTjHpQaeM0QJQ==
X-Received: by 2002:a05:600c:3b1a:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-43db61d873cmr120151385e9.6.1743577825334;
        Wed, 02 Apr 2025 00:10:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/48] base-passwd: upgrade 3.6.6 -> 3.6.7
Date: Wed,  2 Apr 2025 08:09:32 +0100
Message-ID: <20250402071017.2157620-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214176

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../base-passwd/base-passwd/0001-Add-a-shutdown-group.patch     | 2 +-
 .../base-passwd/0001-base-passwd-Add-the-sgx-group.patch        | 2 +-
 .../0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch | 2 +-
 ...003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch | 2 +-
 .../0004-Add-an-input-group-for-the-dev-input-devices.patch     | 2 +-
 .../base-passwd/base-passwd/0005-Add-kvm-group.patch            | 2 +-
 .../base-passwd/base-passwd/0007-Add-wheel-group.patch          | 2 +-
 .../base-passwd/{base-passwd_3.6.6.bb => base-passwd_3.6.7.bb}  | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.6.bb => base-passwd_3.6.7.bb} (98%)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
index 1cdf993f537..4bb0634a003 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
@@ -1,4 +1,4 @@
-From 6bbd3d01d123b042167aa6dea30b5e8d9d4de4dc Mon Sep 17 00:00:00 2001
+From caf4344849c67e939689bc7d57a6f5dc24884937 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Add a shutdown group
diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
index 54b96c877b3..714c5b40fcf 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
@@ -1,4 +1,4 @@
-From dbd66c0ab1fd134ecba2eb1c040445e20d92f79a Mon Sep 17 00:00:00 2001
+From 2ac953ddd31dae19568cc7925d9d56444e3232a7 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alexk@zuma.ai>
 Date: Fri, 28 Jul 2023 10:28:57 +0100
 Subject: [PATCH] base-passwd: Add the sgx group
diff --git a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
index 47712c4f0fc..6cac38eada7 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
@@ -1,4 +1,4 @@
-From e2e6880587d4ada13e815bf132f21b42a979a607 Mon Sep 17 00:00:00 2001
+From dffeea1a44064c11d9035be008db8c628b93c7ab Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Use /bin/sh instead of /bin/bash for the root user
diff --git a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
index 9396d134600..7c3642fcc9f 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
@@ -1,4 +1,4 @@
-From 022cf6956c647cc193fce2b0ccdf1308d3e208cd Mon Sep 17 00:00:00 2001
+From 8a79e64654eb4ee38a7971cf99ad37df7f5dee63 Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Fri, 29 Apr 2022 13:32:28 +0000
 Subject: [PATCH] Remove "*" for root since we do not have an /etc/shadow
diff --git a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
index 85f40a9829b..4fdbc47b6e4 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
@@ -1,4 +1,4 @@
-From ef6d3257ca8308feeff40272a18e87ca7e2dc81b Mon Sep 17 00:00:00 2001
+From 2d02a1e4e3202691e2ddc11f80565d5fa53d532f Mon Sep 17 00:00:00 2001
 From: Darren Hart <dvhart@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:28 +0000
 Subject: [PATCH] Add an input group for the /dev/input/* devices
diff --git a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
index 7264c29c827..742d696a241 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
@@ -1,4 +1,4 @@
-From 6c81c51ee49427175cc8bcb09b236677be4c0815 Mon Sep 17 00:00:00 2001
+From 3f25f39802657de55f41fa4d5773f1d1c2bdbd93 Mon Sep 17 00:00:00 2001
 From: Jacob Kroon <jacob.kroon@gmail.com>
 Date: Wed, 30 Jan 2019 04:53:48 +0000
 Subject: [PATCH] Add kvm group
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
index d3b1b12246e..00eff1b7248 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
@@ -1,4 +1,4 @@
-From 00b7725977043c628129560dd8ca798c0ecb8791 Mon Sep 17 00:00:00 2001
+From 4980807167a5b7c4d9c91e2af6de61efff548868 Mon Sep 17 00:00:00 2001
 From: Louis Rannou <lrannou@baylibre.com>
 Date: Thu, 15 Jun 2023 13:43:55 +0200
 Subject: [PATCH] base-passwd: add the wheel group
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
similarity index 98%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.6.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
index cc5c9055035..3d5247ee87b 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "cfcb17a5cfb5d7ce53f062b2a30c74ac7f9425af81010d3591aeffc60f269263"
+SRC_URI[sha256sum] = "cf869870fed7862b57bfa9e99cd5cd6f365e2349705a1b65af7fc182629bd1ab"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated

