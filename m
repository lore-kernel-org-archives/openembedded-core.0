Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198C7C624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 11:58:04 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11087.1788350276811886515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 04:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c74rMdSe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso5917485e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 04:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788350275; x=1788955075; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTabEjYarvX9Qlo5tobrPbnftowDLxZaPOn9ymRqeLc=;
        b=c74rMdSe6dPq9hDhs4sq6ULPP9m5OSD0vYZX6d+d0QvTpx//bJIn8yW7MxEi+jREmH
         Nz5PKuef24RV1qX5TYTKWHL2EmTDqKgXf7MVIJtToJtyj+LAosEgl+pjW20hgTUjHKsh
         ZizxnUoZChWuZ2T37OMv/h/M6LITtiXTAmjpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350275; x=1788955075;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTabEjYarvX9Qlo5tobrPbnftowDLxZaPOn9ymRqeLc=;
        b=WI0Gw221fbNuS/Om4BeN2FJIF6tlCMPUBYksY+gw96Xp1yfAQjoK7puk19UYucP2Nh
         otQntL0JfW1xnmhjtrV5rq/vhETQPUDaiCRjknh9ulZcTR1IxbIXPlfWmS4njPGPk5yG
         nbUf3YhByXl94vTvQpNmEPFnrfcUepEzf0ICDOvDGcxzriF+F5snEbnBGS7Eii3KYhA0
         Vo7gvdtVhaVb1o0XpxVImRkXBPdprYC+XBKECU36KZEjMZXIN3uYHqKYfys0KFbDRnT7
         wdRyalX5JJdBV7s3jwfY8xHN+TglgeKUpgh3KYpeH8nIJO4k7iJsC9mi2mIOOG//tZVI
         jUog==
X-Gm-Message-State: AFuF++miYhhuIgtDUcntSX9pAYbVHUMww33xYAPkAOdNo4bjlKMZ6TKd
	UeHy+O7vCqPmIyFYu9CWQYthOMKaaPV3RkziOmh7nkPFzUTJUf33g6+pTu5zNI5yokUGdarU+Ck
	NWtbgGes=
X-Gm-Gg: AR+sD11hrLTtSV0h61+iXKXvteM42hHdnyW8XcOW368isdSzcaJoPsvTZKHWvLTXQs5
	gbhVyHt3szjp7HQdoXWtTxffijdcu3hPEfnSgOQY+0+8qAkqRWVCA5aJGMjJawf2ELyzhwBOFzg
	oIb8tMi9hvyD95Thtm0accJseK6qxs6+JHdU1OnL3D1NnNEcb1vCsaBiVVliwNhH96GHH5xt+zj
	CMGdzN2PQBDWyVNGt+zwVxQ5B/fNUpnJjKbmMu0O9D1VDCjsCIt7p2fZAQglMEOqyot7jR59wBs
	BoHI8hPcx0Axhn93JT0wnyy7xTIHuWyX1a64oiH3Hhj2x34M1im61wPgzxtuNWH2WTvpYb6Gode
	SSEy+9yj6XzTf5stKqUsr5pHff504RmqopvbknoakjCDiFZPmFhSpIBPQZH/1eEAhxbKAmehOo8
	v3iRiJ7oZcCKmk/IVENvtJQQRUhahU2j/6JExTIchuItj8BHlc8qVed5fD2HqW3cQH0ANNsqEPa
	UjTKRoRceK6UdMRWQ==
X-Received: by 2002:a05:600c:630e:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49ce55ecea8mr76483405e9.3.1788350274926;
        Wed, 02 Sep 2026 04:57:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:89b1:8875:2e41:59f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47820e2sm66574265e9.13.2026.09.02.04.57.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:57:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] python3-build: upgrade 1.5.1 -> 1.6.0
Date: Wed,  2 Sep 2026 12:57:49 +0100
Message-ID: <20260902115751.2762897-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902115751.2762897-1-richard.purdie@linuxfoundation.org>
References: <20260902115751.2762897-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 11:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244934

Features:
    - Add --report=PATH to write a machine-readable JSON report of built artifacts; --metadata
      now also accepts .whl files - by @gaborbernat (#198)
    - The srcdir argument now accepts .tar.gz source distributions, extracting and building from
      them - by @gaborbernat (#311)
    - The “Unmet dependencies” error from --no-isolation builds now shows the wanted version,
      found version, and interpreter - by @gaborbernat (#504)
    - Add --sdist-extract-dir to extract the intermediate sdist into a persistent directory,
      enabling compiler cache reuse across rebuilds - by @gaborbernat (#614)
    - Add --env-dir to place the isolated build environment at a fixed path, enabling compiler
      cache reuse across builds - by @gaborbernat (#655)
    - Print a summary of resolved dependency versions (name==version) after installing them in
       isolated builds - by @gaborbernat (#959)
    - On build failure, print a tip pointing to --env-dir and --sdist-extract-dir for debugging and
      link to the “Debug a failed build” how-to - reported by @dimpase, implemented by @gaborbernat (#966)

Bugfixes:
    - Drain verbose subprocess output inline instead of using a ThreadPoolExecutor, which silently
      swallowed logging errors - by @henryiii (#1098)
    - Reject a file passed as --env-dir with a clear error instead of a raw FileExistsError - by @henryiii (#1100)
    - Emit CLI warnings to stderr instead of stdout, so they no longer corrupt --metadata
      JSON output on stdout - by @ymyzk (#1111)
    - Fix the Windows symlink support probe always returning False due to a stale object
      interpolated into the destination path - by @henryiii (#1118)
    - Fix metadata_path’s build-backend fallback returning a nonexistent dist-info path for wheels
      with a build tag - by @henryiii (#1119)
    - Write pip/uv requirements and constraints files with \n instead of os.linesep, avoiding doubled
      \r\r\n line endings on Windows - by @henryiii (#1120)
    - Batch of small robustness fixes: correct macOS release parsing for the minimum pip version, avoid
      sharing the mutable default build-system table between builders, keep the original error when
      isolated-environment setup fails early, and raise BuildException for an invalid wheel - by @henryiii (#1121)
    - Decide color support independently for stdout and stderr instead of only checking stdout.isatty(),
      so redirecting one stream no longer disables or leaks ANSI colors on the other - by @henryiii (#1123)
    - Pass --dependency-constraints-txt files through to the installer unmodified instead of re-parsing them
      into a deduplicated set of lines, fixing a case where a hashed requirement (e.g. from pip-compile
      --generate-hashes) could have its --hash continuation line separated from its requirement line and
      silently dropped, depending on the interpreter’s hash seed - by @manfred-kaiser (#1140)

Removals:
    - Remove exc_info parameter and attribute from BuildBackendException. - by @layday (#1161)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python3-build/check-valid-dist.patch       | 18 ++++++++++++------
 ...3-build_1.5.1.bb => python3-build_1.6.0.bb} |  2 +-
 2 files changed, 13 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-build_1.5.1.bb => python3-build_1.6.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-build/check-valid-dist.patch b/meta/recipes-devtools/python/python3-build/check-valid-dist.patch
index dd6f256e266..82c31a49a4e 100644
--- a/meta/recipes-devtools/python/python3-build/check-valid-dist.patch
+++ b/meta/recipes-devtools/python/python3-build/check-valid-dist.patch
@@ -1,4 +1,7 @@
-Ignore invalid distributions when checking dependencies
+From a2a217409e01e3ebea88dce85d81dbe6b3c79187 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 12 Aug 2026 12:35:29 +0100
+Subject: [PATCH] Ignore invalid distributions when checking dependencies
 
 If there's an empty directory foo-1.2.dist-info/ on the search path then
 importlib will return that as a distribution called "foo".
@@ -12,12 +15,15 @@ the dist-info directory is empties but remains in the sysroot.
 
 Upstream-Status: Submitted [https://github.com/pypa/build/pull/1145]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/build/_util.py | 5 +++++
+ 1 file changed, 5 insertions(+)
 
-diff --git i/src/build/_util.py w/src/build/_util.py
-index c365003..ba047c7 100644
---- i/src/build/_util.py
-+++ w/src/build/_util.py
-@@ -67,6 +67,11 @@ def _check_dependency(
+diff --git a/src/build/_util.py b/src/build/_util.py
+index cce8f94..54bc02c 100644
+--- a/src/build/_util.py
++++ b/src/build/_util.py
+@@ -63,6 +63,11 @@ def _check_dependency(
          yield (*ancestral_req_strings, normalised_req_string)
          return
  
diff --git a/meta/recipes-devtools/python/python3-build_1.5.1.bb b/meta/recipes-devtools/python/python3-build_1.6.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-build_1.5.1.bb
rename to meta/recipes-devtools/python/python3-build_1.6.0.bb
index d572ca846fc..acec9cd9efd 100644
--- a/meta/recipes-devtools/python/python3-build_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-build_1.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
 SRC_URI += "file://check-valid-dist.patch"
 
-SRC_URI[sha256sum] = "94e17f1db803ab22f46049376c44c8437c52090f0dfdf1adc43df56542d644fb"
+SRC_URI[sha256sum] = "bd2c8afc603e7a2e0ce70e2ea85f0a6d02043bafbd307f5bada0f98669eca5af"
 
 inherit pypi python_flit_core
 

