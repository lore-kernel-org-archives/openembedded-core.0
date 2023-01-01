Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2326DC53210
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:06 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.15987.1672594681059811528
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2khrMnHH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id k137so12646409pfd.8
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mj8lvRL5bxgH9hLoMG+rZXr1tyTWxKnzCDD8oOM+bVM=;
        b=2khrMnHHqwOlM/M6/vBLzt8rJkZn1tJcMjTe3VMXnQl+BOS6u+sSLgSC0a1o+ni1WI
         ELHbX3/imu6trWetIPRKqZNyZy2R2ATGy48nxpYIBJBra1oVTxcvh11wIqp5HYHmL1cU
         LwWWoPqNGcbBhLggyHKxc5weBrnfVJcdAv7eUmsUG5tNXvtcexB2GK3ZhEcB/cHvsg9m
         eq0UoUBY0XloRuGfI6FvxVjBGs5eqvJ9mMoD22ns4qNwvVFkqzhJbsvVeQuk47HBlqTU
         07nc9ZAPUP9m6Xe0bCX93b86EmB6aCwNDfCn6nGzPDZmlboN4HI3VqjCTzSR8Cp+ALiZ
         Shaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mj8lvRL5bxgH9hLoMG+rZXr1tyTWxKnzCDD8oOM+bVM=;
        b=73vFw+kMhmjkSwMKe4HzOTq1TiaznmTmMUuylAcR+Hy2c60iQbA2E5SJodny+VD2tD
         73S1i/r88u8/+HZbgB44rGu2z9CaEOhqUW5kTNDI3Y0W75p/YUuUuBqwwMDcHqjJeY4u
         tin3sVRWzmn9k4jyUeMJ4erEhM6mpQ+5CY83aOQDZxEMnNd230j1AfjLxWUpOLpvUWOp
         xQ7OhXZqbSTpNJDZbqOYo5feICSqJrocIzebUdFK0uOa08Oa2G2QoYytVi4XsPies5ZT
         M6QArguiBKy54TkGmBS4jatahdP9TBhKfo1kGE3IKaaCzl68eTfoymbEBoymx5VvYyPJ
         4g4g==
X-Gm-Message-State: AFqh2kr8J0qxy/IE0Fe4mRIeW4IFgJv4+rt6ygYE9AIjme97DOIhT3rN
	kYzGaYQrsE37sC05hCekp3D/YF5UM38otTJuv84=
X-Google-Smtp-Source: AMrXdXsstTeBIexjjzcbn9zSlGdlCkZinqQjHwC2pzSoKRMsqLRrgFQYDIQ6r/gbAL+6jhJFKO0PzA==
X-Received: by 2002:a62:ed08:0:b0:577:272f:fdb with SMTP id u8-20020a62ed08000000b00577272f0fdbmr32307328pfh.29.1672594680091;
        Sun, 01 Jan 2023 09:38:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.37.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:37:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/29] sqlite: fix CVE-2022-46908 safe mode authorizer callback allows disallowed UDFs.
Date: Sun,  1 Jan 2023 07:37:24 -1000
Message-Id: <d86cf217976c539067698178290390e910263b5f.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175190

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2022-46908.patch         | 39 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2022-46908.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2022-46908.patch b/meta/recipes-support/sqlite/files/CVE-2022-46908.patch
new file mode 100644
index 0000000000..38bd544838
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2022-46908.patch
@@ -0,0 +1,39 @@
+From 1b779afa3ed2f35a110e460fc6ed13cba744db85 2022-12-05 02:52:37 UTC
+From: larrybr <larrybr@sqlite.org>
+Date: 2022-12-05 02:52:37 UTC
+Subject: [PATCH] Fix safe mode authorizer callback to reject disallowed UDFs
+
+Fix safe mode authorizer callback to reject disallowed UDFs. Reported at Forum post 07beac8056151b2f.
+
+Upstream-Status: Backport [https://sqlite.org/src/info/cefc032473ac5ad2]
+CVE-2022-46908
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ shell.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/shell.c b/shell.c
+index d104768..0200c0a 100644
+--- a/shell.c
++++ b/shell.c
+@@ -12894,7 +12894,7 @@ static int safeModeAuth(
+     "zipfile",
+     "zipfile_cds",
+   };
+-  UNUSED_PARAMETER(zA2);
++  UNUSED_PARAMETER(zA1);
+   UNUSED_PARAMETER(zA3);
+   UNUSED_PARAMETER(zA4);
+   switch( op ){
+@@ -12905,7 +12905,7 @@ static int safeModeAuth(
+     case SQLITE_FUNCTION: {
+       int i;
+       for(i=0; i<ArraySize(azProhibitedFunctions); i++){
+-        if( sqlite3_stricmp(zA1, azProhibitedFunctions[i])==0 ){
++        if( sqlite3_stricmp(zA2, azProhibitedFunctions[i])==0 ){
+           failIfSafeMode(p, "cannot use the %s() function in safe mode",
+                          azProhibitedFunctions[i]);
+         }
+-- 
+2.30.2
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index 628f630657..313c15dff4 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch \
+           file://CVE-2022-46908.patch \
 "
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 
-- 
2.25.1


