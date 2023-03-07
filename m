Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACF5C6FD1E
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:45 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.8636.1678229322284071356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=r1tOmsFn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id z11so9100884pfh.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19z5GKXTYGNLD79eWa8gQem4879XoR8N4mCLO6flHm8=;
        b=r1tOmsFn9PpAbCfz9Nc18wqiP6YEsldU/zF2iUM9EIlQ6ieEF+zR0Q6IEqgksP5uom
         wej7BNMdkN5ZRtahEXvaL75sU4uV8Yuk6R8Wp286bJ4F3I6ZiCDFwSElKpQ1VgheNEel
         w02F4TELKpOznzc7ZOABuXtcNGiyLiPQlO2dhfTN+3FFusVf86srOH4KuZc1W9M0tg+V
         e5Z8SF/CCe6AhV4BDHgSmh9UHGENoUtAou54yZfKKmBUg/A7FUSo+Fh0o3WkpOoBYoMe
         nxkKagpq3rGU4TJ9vCbzCwA9K8khgt9O1ysKvZlkGG4CckdPo1ntciuIdJZKk494eo0W
         XKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19z5GKXTYGNLD79eWa8gQem4879XoR8N4mCLO6flHm8=;
        b=KOoOczYYVkJfar/YIPonkYgdiwO+x+gsZz83sLn/Kx6J+FoO036ecmUHhmF4T7KRme
         ih6UuBEzLD+GcPXumJW303irAXRTpzy9IQA4SuAnJcPjyf58WbT5dayQKldlufd0973R
         ADx5/gWIBiTL9COEtmjEfEFN3KLxJKWY1KbrDIWaQyV2yFBcc0de7DQgItUsltceIGd4
         ZEdLdsKv3FCCTM3e07kQUYp7E/0yXMdQ3w6y3yTxW7ufxe+6Uk0b7Dp0fjDX2g4rLn21
         hEQYbltq1IoAaQeuQgpj/wDLFV8ClKavQadGBF+PVIvI9TidJSxa++0rO+OdSjs/OXJh
         prGQ==
X-Gm-Message-State: AO0yUKXhjLGMKOdPUyA3kLQQzZ0vrNzz5X9cZwfojj7OH50/bAc5Gmel
	M5QCs6FGuEqXhWOsIK6+VYbOq3soB6iYGqSahQ8=
X-Google-Smtp-Source: AK7set9EnRxwlk2qoo2oG4Y6042rltrWpViFd0A3rvUNgxfmGg0Pjb9TFzLVqXEXwkRkkJhJ2Fl0+Q==
X-Received: by 2002:a62:1dd4:0:b0:5aa:6125:dbf4 with SMTP id d203-20020a621dd4000000b005aa6125dbf4mr17149969pfd.11.1678229321336;
        Tue, 07 Mar 2023 14:48:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/23] apr: Fix to work with autoconf 2.70
Date: Tue,  7 Mar 2023 12:47:47 -1000
Message-Id: <41121149212b3684991a62261c17a45afd50bb83.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178135

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix an issue with autoconf 2.70 where duplicate macro includes
caused configure failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ross Burton <ross.burton@arm.com>
(cherry picked from commit 4e5d7c86a8a5e752df451d988861a86236e8c8ff)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-support/apr/apr/autoconf270.patch | 22 +++++++++++++++++++
 meta/recipes-support/apr/apr_1.7.0.bb         |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/autoconf270.patch

diff --git a/meta/recipes-support/apr/apr/autoconf270.patch b/meta/recipes-support/apr/apr/autoconf270.patch
new file mode 100644
index 0000000000..9f7b5c624c
--- /dev/null
+++ b/meta/recipes-support/apr/apr/autoconf270.patch
@@ -0,0 +1,22 @@
+With autoconf 2.70 confdefs.h is already included. Including it twice generates
+compiler warnings and since this macros is to error on warnings, it breaks.
+
+Fix by not including the file.
+
+Upstream-Status: Pending
+RP - 2021/1/28
+
+Index: apr-1.7.0/build/apr_common.m4
+===================================================================
+--- apr-1.7.0.orig/build/apr_common.m4
++++ apr-1.7.0/build/apr_common.m4
+@@ -505,8 +505,7 @@ AC_DEFUN([APR_TRY_COMPILE_NO_WARNING],
+  fi
+  AC_COMPILE_IFELSE(
+   [AC_LANG_SOURCE(
+-   [#include "confdefs.h"
+-   ]
++   []
+    [[$1]]
+    [int main(int argc, const char *const *argv) {]
+    [[$2]]
diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
index 92cc61a864..b70edfaf42 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch \
            file://libtoolize_check.patch \
            file://0001-Add-option-to-disable-timed-dependant-tests.patch \
+           file://autoconf270.patch \
            file://CVE-2021-35940.patch \
            "
 
-- 
2.34.1


