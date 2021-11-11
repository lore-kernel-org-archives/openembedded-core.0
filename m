Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102A4C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:09:31 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.6226.1636603770222259033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LItZfiID;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso3655048pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3lyP2igKmBTcEmzpGhj6aoXztTm+GZt6aWN55EdNBgQ=;
        b=LItZfiIDpLRR2g61suR+1e82rE5uSkliN5QF4AsNz19Kq3JIdSiiKyXl+Uwr6THOZn
         LIZrZ9w5fp5osgoTZJWUGrFnuQFovnEH87xr8Ten3fX3gWIcZop1wMT070xdtvhTCoHc
         5YZ/BhtB/YiPFQ02HpuI5Cv9bmMrf2t4Xb4IQ44cPi2ZvyWPL+zYmebqKkp28J/RqsuQ
         ah8Hy/Mohdq4zT+avJ1a1N5GeJgy9TpxhqoZ6lOtV8QiK9jFQst7V8cIgVj5TykQjB3x
         651DUQ+MrzqiJssTxS16PgzeMSmcxb4wEJaE1DUl0uhXz++JprwyKpAAVkRbIfStueyS
         ktpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3lyP2igKmBTcEmzpGhj6aoXztTm+GZt6aWN55EdNBgQ=;
        b=35+Xn2hohl7lducrnPzDTcaw5LMok1844j2IRLMmKqA8YA3ZAHxFQW5i7cA68UQgP6
         GI/i1RH5IP50s6suDzY2Y15LgEznY6s2pyks86/8nnmvhn6A86ZOsU7D3l6vP26W/ORL
         0GCbU6FxdaK3RomPyTVqy3n1DWwiW/wLvLWLOsHUWnA69MAx79ouYpy5JJHj+pgDf97E
         GRqA0N+KvKGlQoCZpoGLSJxKNAe2AGEIBHlKkiQV4oiFKHT3YHOZVsyes7Zb9ynRtWJh
         Nnq0mtuGK7om8FcLMEsw6dzo+ak1hB/gsHvMD7vvASVkqspHr0iYFdAjLb+lEMny8JCF
         7/YQ==
X-Gm-Message-State: AOAM5322e/7ZtfaNgan58gm2iN5CF8YbA7BDKdKruCeiYrVw15zw/4su
	nfJDHCAiouyxDLSFRsT471D/gmMTVayb+sQHYPw=
X-Google-Smtp-Source: 
 ABdhPJzcgEMGzQUu+yE3tYsgUbPJwYWq53vF80DumxcbM51t+mw4BoHpWD5kW0gtZEW3LpT8V3CGpg==
X-Received: by 2002:a17:90b:1106:: with SMTP id
 gi6mr23610544pjb.115.1636603769202;
        Wed, 10 Nov 2021 20:09:29 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm1207686pfg.90.2021.11.10.20.09.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 20:09:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/14] reproducible_build: Remove
 BUILD_REPRODUCIBLE_BINARIES checking
Date: Wed, 10 Nov 2021 18:08:38 -1000
Message-Id: 
 <814bedacac9f5c343c9888c0b14649189a84f817.1636591208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636591208.git.steve@sakoman.com>
References: <cover.1636591208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158145

From: Mark Hatle <mark.hatle@xilinx.com>

Previously if BUILD_REPRODUCIBLE_BINARIES was set to 0, the system would
fall back and select the default epoch (April 2011), but still perform
the reproducible build actions.  This resulted in binaries that had an
unusually old date.

Simplify the functions and remove the anonymous python as no longer
necessary.

Also improve the documentation to better explain what the class is doing
and how a recipe can override the behavior if necessary.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1976013b026cfba94de32a13e994d92d7e9e39e5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/reproducible_build.bbclass | 53 ++++++++++++++++---------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index b44053d076..2b402b9966 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -1,17 +1,38 @@
 # reproducible_build.bbclass
 #
-# Sets SOURCE_DATE_EPOCH in each component's build environment.
+# Sets the default SOURCE_DATE_EPOCH in each component's build environment.
+# The format is number of seconds since the system epoch.
+#
 # Upstream components (generally) respect this environment variable,
 # using it in place of the "current" date and time.
 # See https://reproducible-builds.org/specs/source-date-epoch/
 #
-# After sources are unpacked but before they are patched, we set a reproducible value for SOURCE_DATE_EPOCH.
-# This value should be reproducible for anyone who builds the same revision from the same sources.
+# The default value of SOURCE_DATE_EPOCH comes from the function
+# get_source_date_epoch_value which reads from the SDE_FILE, or if the file
+# is not available (or set to 0) will use the fallback of
+# SOURCE_DATE_EPOCH_FALLBACK.
+#
+# The SDE_FILE is normally constructed from the function
+# create_source_date_epoch_stamp which is typically added as a postfuncs to
+# the do_unpack task.  If a recipe does NOT have do_unpack, it should be added
+# to a task that runs after the source is available and before the
+# do_deploy_source_date_epoch task is executed.
+#
+# If a recipe wishes to override the default behavior it should set it's own
+# SOURCE_DATE_EPOCH or override the do_deploy_source_date_epoch_stamp task
+# with recipe-specific functionality to write the appropriate
+# SOURCE_DATE_EPOCH into the SDE_FILE.
+#
+# SOURCE_DATE_EPOCH is intended to be a reproducible value.  This value should
+# be reproducible for anyone who builds the same revision from the same
+# sources.
 #
-# There are 4 ways we determine SOURCE_DATE_EPOCH:
+# There are 4 ways the create_source_date_epoch_stamp function determines what
+# becomes SOURCE_DATE_EPOCH:
 #
 # 1. Use the value from __source_date_epoch.txt file if this file exists.
-#    This file was most likely created in the previous build by one of the following methods 2,3,4.
+#    This file was most likely created in the previous build by one of the
+#    following methods 2,3,4.
 #    Alternatively, it can be provided by a recipe via SRC_URI.
 #
 # If the file does not exist:
@@ -22,20 +43,16 @@
 # 3. Use the mtime of "known" files such as NEWS, CHANGLELOG, ...
 #    This works for well-kept repositories distributed via tarball.
 #
-# 4. Use the modification time of the youngest file in the source tree, if there is one.
+# 4. Use the modification time of the youngest file in the source tree, if
+#    there is one.
 #    This will be the newest file from the distribution tarball, if any.
 #
-# 5. Fall back to a fixed timestamp.
+# 5. Fall back to a fixed timestamp (SOURCE_DATE_EPOCH_FALLBACK).
 #
-# Once the value of SOURCE_DATE_EPOCH is determined, it is stored in the recipe's SDE_FILE.
-# If none of these mechanisms are suitable, replace the do_deploy_source_date_epoch task
-# with recipe-specific functionality to write the appropriate SOURCE_DATE_EPOCH into the SDE_FILE.
-#
-# If this file is found by other tasks, the value is exported in the SOURCE_DATE_EPOCH variable.
-# SOURCE_DATE_EPOCH is set for all tasks that might use it (do_configure, do_compile, do_package, ...)
+# Once the value is determined, it is stored in the recipe's SDE_FILE.
 
 BUILD_REPRODUCIBLE_BINARIES ??= '1'
-inherit ${@oe.utils.ifelse(d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1', 'reproducible_build_simple', '')}
+inherit reproducible_build_simple
 
 SDE_DIR = "${WORKDIR}/source-date-epoch"
 SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
@@ -89,6 +106,9 @@ python create_source_date_epoch_stamp() {
     os.rename(tmp_file, epochfile)
 }
 
+# Generate the stamp after do_unpack runs
+do_unpack[postfuncs] += "create_source_date_epoch_stamp"
+
 def get_source_date_epoch_value(d):
     epochfile = d.getVar('SDE_FILE')
     cached, efile = d.getVar('__CACHED_SOURCE_DATE_EPOCH') or (None, None)
@@ -116,8 +136,3 @@ def get_source_date_epoch_value(d):
 
 export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
 BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
-
-python () {
-    if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
-        d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
-}
-- 
2.25.1


