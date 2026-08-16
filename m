Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A02C5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 17:25:10 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13808.1786901107458078711
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 10:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nyYbGYrG;
 spf=pass (domain: konsulko.com, ip: 209.85.216.50, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e08baf860so2625932a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 10:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786901107; x=1787505907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CCnwB0yHGo3K339yBeini8RmUYVwl8XT8szv0R3s1IE=;
        b=nyYbGYrGJxxTVJ1etAueUUmkdrAq0+WsFNPhs/wH0mIolVbwxGqo1LQr2PaaKm+W+U
         v5nYUkol74BEFqnXlos8OQ+E13H3LuVpW2TkgK0QsYZRWnxYYq63NfOGr4vyXelvE3gA
         1V79yVLPLTtF+rToh/fSORTt+mdrQmtBB5+24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786901107; x=1787505907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCnwB0yHGo3K339yBeini8RmUYVwl8XT8szv0R3s1IE=;
        b=PukrMsd9zYMoBmNSCHIwfm2No/Yk2zSaOQ0IzZFRB2wkSkQnWVRQssJLRsSe0olffK
         JdacvDhVhFZrvWRvbb4caGTEDmWMsUwiAKmjdP1bjBn6QBtneendIBGmWQ3OnvbXKD9t
         IVOkk5qHPpvWI8k4fP93JykiyZVMuYyDSarBfLdBfdyWoMxezncXVZtihkjhyIKC7tpi
         tZs8gF6ToGZZe8i6KxY3xzCgS8IBsbLxwFbArFmt1FWFpvp5GtoYr5+DvClmljt/M9WY
         23MkGdKbxDMPusYTww7/h1v/KZf4WwMWG5/HN4UZz7jbhYtoFG7jpn10Up6+GgIwcYtB
         2bAA==
X-Gm-Message-State: AOJu0YyeOEgqHZrBFixOUh4ntDEHdnAk7n2T9iHBspn1CjMQmrSJ3JVH
	11OKG8UNoREDFkK3vl325mX71z8Gt811+2dQyGOGZL53H7k4bNK92LYfJ8oxP/tED//itoo+enW
	oqrlp
X-Gm-Gg: AR+sD11jtsDk88YIFrm6Apmgsx6xeAnJDoWMO6F08e7Y7xOD7z5xiWJH1SWBRYLg1Zw
	XB7YB63rjCb4emfByh5FU8WpywYQ70jj01IRwtjzrym3rFqlpnriPtwQ4WD3bk4QfcGllj2+oMy
	aktEQIrEjFU22A9DG4jwEYUqHPkaIXjegcfATuY3cSPtjEtbw18WtOyHFVk1SHw8mM4HC0XkMmh
	Aqdrts7cKSqoU9zvNJjlwTzc1c4pc/OM3JlKIHNYdRRl6jUBu/tKsSToQ4cm4dpr++QGEnsoqSp
	Gd1NJ3DnZqK/B8yyBAr36QyQWS6qIsIboQVeuVUf6LqehKh4h/vwkqV7QcGzEPSdvcaWb6MUFrP
	5p3dnVmQz2yj1EoHmazOamhee0wKfgiGtfJ8P/R7+Z9YjtN82JytVrg/8zSpkBBEZOP2vJaTJRo
	+d7BQGDa/BcoXCnWThrYfX6OwIdieSIUsNG58i0m715eLqgl/78NLBkuIOnpL2luiDtD2fJ4S+k
	hXolnQ=
X-Received: by 2002:a17:90b:4f:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-3933b833613mr23759263a91.0.1786901106593;
        Sun, 16 Aug 2026 10:25:06 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:9a1e:93e3:2a6f:adab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fba7e8sm1959650a91.11.2026.08.16.10.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 10:25:06 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-scons: upgrade 4.10.1 -> 4.11.0
Date: Sun, 16 Aug 2026 10:25:03 -0700
Message-ID: <20260816172503.621607-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 17:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243543

From: Tim Orling <tim.orling@konsulko.com>

For a full comparison of changes (311 commits, 1736 files changed) see:
https://github.com/SCons/scons/compare/4.10.1...4.11.0

Release announcement/notes:
https://scons.org/scons-4110-is-available.html

**Highlights** from a summary of the changes since 4.10.1:

DEPRECATED FUNCTIONALITY
========================

* Deprecated Python 3.7 & 3.8 support.
* Deprecated using signature-file-per-directory (aka old-style SConsign)
  via the SConsignFile(name=None) call.
* The legacy job scheduler, which was superseded by a new scheduler in
  SCons 4.7 but remained available as a fallback, is deprecated and will
  be removed in the next release. The --experimental feature flag to
  select the legacy scheduler is renamed to "legacy_sched_deprecated" to
  give a clear indication of the status change; the flag will also be
  removed in the next release.

REMOVED FUNCTIONALITY
=====================

* The qt3 tool module, deprecated since version 4.3, is removed due to
  the general unavailability of the obsolete build-time Qt3 package.

CHANGED/ENHANCED EXISTING FUNCTIONALITY
=======================================

* The tool search order now prefers clang over gcc on FreeBSD and OpenBSD.

FIXES
=====

* Fix --debug=includes for case of multiple source files.
* Adjust race protection for CacheDir - now uses a unique temporary
  directory for each writer before doing the move, instead of depending
  on a one-time uuid to make a path to the file.
* Fix handling of AddOption for option-arguments with spaces (when
  omitting the = sign or when an option takes multiple option-arguments).
  Arguments unknown at the time the first pass splits the command line
  into arguments and targets would put such arguments into targets, and
  they remained there even after the AddOption calls were seen.
* Fix CPPDEFINES test using pkg-config, which was failing on GH Actions.
* Fix -n / --no-exec support when using ninja tool

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-scons_4.10.1.bb => python3-scons_4.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.10.1.bb => python3-scons_4.11.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.10.1.bb b/meta/recipes-devtools/python/python3-scons_4.11.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-scons_4.10.1.bb
rename to meta/recipes-devtools/python/python3-scons_4.11.0.bb
index 5fb896f8bc..585cad271c 100644
--- a/meta/recipes-devtools/python/python3-scons_4.10.1.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.11.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
-SRC_URI[sha256sum] = "99c0e94a42a2c1182fa6859b0be697953db07ba936ecc9817ae0d218ced20b15"
+SRC_URI[sha256sum] = "5ba48f9e2eb6b9178cabdc9893792418e6970c84f43f4b027e4468e20616a89c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


