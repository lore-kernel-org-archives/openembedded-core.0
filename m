Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C436C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 02:46:34 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.313.1650308666907908657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 12:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=FS+LGDhV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id q12so20470915pgj.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 12:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yz9hxmt51LfSfWem2MgtHZV+N7rtVlNLb6FwkF+GoeQ=;
        b=FS+LGDhVhPcWzpEDfP8ngNbFAGQRZ7aAk/5qeg+ZDucEM97H+7DbgbaWqDTrY9YEQO
         hdam+GpG3MgBmM+B66+tV0sZF7QoUZivyyYeQbSQePbL+UQ4kfth4EO7QePAVJKfUDuh
         gSkjrN4h5hzO5AvW7cioSz/N+Prpn5l7iw++nj3bQOLkDsoC72eLEdCxZzHlaQoq/fXk
         whHj6MoRVLKeSphy/YHgDBMk25klUGmClo40JR6MuFZf9iqKxl+GMLDXDsGxbhI696YD
         KWA36Fsj3Y+ecZe9W6MOSeJDBNfa1bhlJ9nMalGg5CSjR/i7F1RAHRt+kACQ7B1Zc8nO
         FYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yz9hxmt51LfSfWem2MgtHZV+N7rtVlNLb6FwkF+GoeQ=;
        b=B3rq1zjdmWaIVqoADkvnrM3CBt32Fca4hT4RAFmDEH5Gb2C5rmNY23Wz6HPkesyH7A
         VdL5hehZ0XzoP+xzECFBX6AygW2v5pu9kJMhif6UsehMwM4kRsaSS9w7UyTYK2+xV1OC
         9YkGD43VOH9fsjdjeoXldDjjP9cQSdF8nmU4rPp2i8kbAloEjzARLBUg54xe+mg3o1ZY
         4zN+ibLae+4WMNVeN0wrs/iZGV57AJe4owUy+qTfVkdNK9YFyNgSovPl7iT6BMn4/KNH
         LeVRtDTE7lww9tFqdKkQSQDGJZ2SxRaLCVGDS4glDIprbONu+CDWeIaXRT4g5YjhM20y
         Yeyw==
X-Gm-Message-State: AOAM5311b9yJn1T03j7IN5WNC7KpG6mOkY9pcjsivgw+u1FmqthpNSSr
	slWhniJfZbZyslCIK8dcAd4Nd26WtH2DU5uxekE=
X-Google-Smtp-Source: 
 ABdhPJyNt1rdxNyyKH093GTOpryDkSg+oc0vEgFYJtCjxU796cxV9VRAQONPp1meMJxtEFsscT0SIQ==
X-Received: by 2002:a63:590e:0:b0:39d:1a2b:5907 with SMTP id
 n14-20020a63590e000000b0039d1a2b5907mr11344864pgb.188.1650308665789;
        Mon, 18 Apr 2022 12:04:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm13274670pfh.174.2022.04.18.12.04.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 12:04:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][kirkstone] lua: fix CVE-2022-28805
Date: Mon, 18 Apr 2022 09:04:08 -1000
Message-Id: 
 <9e6a5e5366b6c6ea6cfb666d7e26d287ba9a42f0.1650303227.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650303227.git.steve@sakoman.com>
References: <cover.1650303227.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 02:46:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164606

singlevar in lparser.c in Lua through 5.4.4 lacks a certain luaK_exp2anyregup
call, leading to a heap-based buffer over-read that might affect a system that
compiles untrusted Lua code.

https://nvd.nist.gov/vuln/detail/CVE-2022-28805

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lua/lua/CVE-2022-28805.patch              | 26 +++++++++++++++++++
 meta/recipes-devtools/lua/lua_5.4.4.bb        |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/lua/lua/CVE-2022-28805.patch

diff --git a/meta/recipes-devtools/lua/lua/CVE-2022-28805.patch b/meta/recipes-devtools/lua/lua/CVE-2022-28805.patch
new file mode 100644
index 0000000000..8a1a69d60e
--- /dev/null
+++ b/meta/recipes-devtools/lua/lua/CVE-2022-28805.patch
@@ -0,0 +1,26 @@
+From 1f3c6f4534c6411313361697d98d1145a1f030fa Mon Sep 17 00:00:00 2001
+From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
+Date: Tue, 15 Feb 2022 12:28:46 -0300
+Subject: [PATCH] Bug: Lua can generate wrong code when _ENV is <const>
+
+CVE: CVE-2022-28805
+
+Upstream-Status: Backport from upstream: https://github.com/lua/lua/commit/1f3c6f4534c6411313361697d98d1145a1f030fa
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+---
+ src/lparser.c         |  1 +
+ 1 files changed, 1 insertions(+)
+
+diff --git a/src/lparser.c b/src/lparser.c
+index 3abe3d751..a5cd55257 100644
+--- a/src/lparser.c
++++ b/src/lparser.c
+@@ -468,6 +468,7 @@ static void singlevar (LexState *ls, expdesc *var) {
+     expdesc key;
+     singlevaraux(fs, ls->envn, var, 1);  /* get environment variable */
+     lua_assert(var->k != VVOID);  /* this one must exist */
++    luaK_exp2anyregup(fs, var);  /* but could be a constant */
+     codestring(&key, varname);  /* key is variable name */
+     luaK_indexed(fs, var, &key);  /* env[varname] */
+   }
diff --git a/meta/recipes-devtools/lua/lua_5.4.4.bb b/meta/recipes-devtools/lua/lua_5.4.4.bb
index f50328ecfd..d704841378 100644
--- a/meta/recipes-devtools/lua/lua_5.4.4.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.4.bb
@@ -6,6 +6,7 @@ HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
+           file://CVE-2022-28805.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
            "
 
-- 
2.25.1


