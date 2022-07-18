Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C348CCA480
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:32:18 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.21796.1658104288602879558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=d59GasTu;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id p9so10304534pjd.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=95qz1f/n2JEqMhpgg4Cr+mNOPWDS/BGv5NaAdexqBAs=;
        b=d59GasTuLypZNhwGqe1yCp/2iSyaBaxdShkmaJhs91EeLXINCXzqAHi1K+QvcwrhqL
         7EEvyeknjajx0Kh8L0gyxxh1ADJyyatDHMubtwXRdeMnSOxKcm1Wz9KP1NpFVM+KZ7F3
         GDIX9wnDwj7rehtGag1xTKps7bM2BfWshr+X7vaZqC4hKJBEnRDXtMhAtljo9Mjbx7cC
         nESYVSlwyKjGMrHI6tOxZUnEXclWRPiJ9981Sk4G/BxuzOA5/yHlJFeOQQTYMSE1u8G0
         kgaSNi7GN6nsMOsG2Waq5MlhwRsm1i2xy0b20hmiYw5LFpI9Tx9CBLGr4pWbp0sv40Uz
         NozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=95qz1f/n2JEqMhpgg4Cr+mNOPWDS/BGv5NaAdexqBAs=;
        b=tfhSRLQ1R4r0EogmJqPv3ywcS+T6vhkMbmmHnUPfR7eoXoNEqopMZSr13aawboxsGN
         GiuHYgyx1WKIfs9uVbbj7S+813sCe+uhGLIwJPjUgd1A4qOhApiR03GdSNpUgjXyafcx
         l0FuHnK+IGuSDQJEZuKRUIvdu6U8VlQQGquso/NHWdDhjaAKqgXIeaiy2Jw+Cazqa4xl
         u4V0uKkFy0M2d7fbTrWivNqRIhjHg/jzpeCN7MUWvoo+ErCBxUwGgHmEX8AZj5XBuHgl
         Dqmj64LAItRGPaDNDMPR+46CTWN/NckhSSbfJhXMOk4p4emteKJbD0F5S8RsifZN7Kyu
         SBcQ==
X-Gm-Message-State: AJIora/2BcV0YjkQ2eBgH6Ioy4TSNVnPX5+HcRmtnf5hS6lIhIFmiW3N
	ITF3IH+lzkmw+1m2B/hiZmq/qSr7IuxuwbFp
X-Google-Smtp-Source: 
 AGRyM1s+TNWUIfa9lP9Vx16rpxrtFCfcuba+mfMYGpn9aBjcgemK9Darj1gHYU6MZINcMIo/cWaBGA==
X-Received: by 2002:a17:90b:4d05:b0:1e2:bf91:8af2 with SMTP id
 mw5-20020a17090b4d0500b001e2bf918af2mr29829182pjb.210.1658104328987;
        Sun, 17 Jul 2022 17:32:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.32.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:32:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/23] gperf: Add a patch to work around
 reproducibility issues
Date: Sun, 17 Jul 2022 14:30:22 -1000
Message-Id: 
 <21f36f1df42829eec0ea7b5441513d31dece960c.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:32:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168186

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a patch to avoid writing the full pathname to gperf into source
files which leads to reproducibility issues.

This fixes issues with systemd reproducibility in particular.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dea3c7ee2a413f7dc5f13ec006592084f7fb266c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gperf/gperf/reproducibility.patch         | 26 +++++++++++++++++++
 meta/recipes-extended/gperf/gperf_3.1.bb      |  2 ++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/gperf/gperf/reproducibility.patch

diff --git a/meta/recipes-extended/gperf/gperf/reproducibility.patch b/meta/recipes-extended/gperf/gperf/reproducibility.patch
new file mode 100644
index 0000000000..9f80828dbd
--- /dev/null
+++ b/meta/recipes-extended/gperf/gperf/reproducibility.patch
@@ -0,0 +1,26 @@
+By default gperf puts a header into generated files with the full path to
+the tool along with the commandline used. This patch removes the path to
+the binary, allowing reproducible source files (which can be included in
+debug source packages).
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: gperf-3.1/src/options.cc
+===================================================================
+--- gperf-3.1.orig/src/options.cc
++++ gperf-3.1/src/options.cc
+@@ -280,6 +280,13 @@ Options::print_options () const
+     {
+       const char *arg = _argument_vector[i];
+ 
++      if (i == 0) {
++          const char *shortarg = strrchr(arg, '/');
++          if (shortarg) {
++              arg = shortarg + 1;
++          }
++      }
++
+       /* Escape arg if it contains shell metacharacters.  */
+       if (*arg == '-')
+         {
diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb b/meta/recipes-extended/gperf/gperf_3.1.bb
index 82750fca05..3564ac0805 100644
--- a/meta/recipes-extended/gperf/gperf_3.1.bb
+++ b/meta/recipes-extended/gperf/gperf_3.1.bb
@@ -9,6 +9,8 @@ SRC_URI  = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "9e251c0a618ad0824b51117d5d9db87e"
 SRC_URI[sha256sum] = "588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2"
 
+SRC_URI:append = " file://reproducibility.patch"
+
 inherit autotools
 
 # The nested configures don't find the parent aclocal.m4 out of the box, so tell
-- 
2.25.1


