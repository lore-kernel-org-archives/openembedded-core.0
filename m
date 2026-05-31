Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2A1CD6E56
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 20:11:19 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14007.1780258278119749891
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 13:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JVI0pgUf;
 spf=pass (domain: konsulko.com, ip: 209.85.216.53, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36da151a152so235001a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 13:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780258277; x=1780863077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJu/FPbNEpjTgMLZgfYQM1XspEgJexxjC7JjzgVNHV8=;
        b=JVI0pgUfzI/kO/H5B9W7/qMKFnsS+It+a9T/uJprsOGVVvM+wzKnfE7fw4SJp5TnS7
         tPjbExo9HDGHoxl6Dp9kAwWhgQK1ims477KKj3cjs4Uk1FO3SsFH05mZQfIZh6vWDOxS
         qiAsky1RjopDA4b/gl8uY64CKDjVcEhUO6Wdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780258277; x=1780863077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rJu/FPbNEpjTgMLZgfYQM1XspEgJexxjC7JjzgVNHV8=;
        b=dS38w4/tqyxEWE/XoCUdor6h00oy4y/J7kUbW8KDJNJUOTmBHh9JLiNGbwhaefHj7H
         ufJzKRCrcJu4Yl5e7h8VjA01TammOswwNZKfMPdvinBVnlGhEnWN7pNELPJv7Y1eC+rO
         D0+U6PrQajj/b7hMCjUUtN/npx3F6OVZDOTOO2LMyma4wZinizMGLP09HitQHD5IRDSI
         7pfM+kH/5FubrLvWnGqeD9I4fogZcICXlXZDSWbnjkS0yz/ydEC96H0odwDbJhNPzlPv
         UNYEhNEDR7kRTi5FgMLJwCXEgvG+9UkJScwjxtBdF73AGU0OhY3y81Q4WAMyft51QI47
         972Q==
X-Gm-Message-State: AOJu0YzDWltWGMPtmoc8JaG83aZ7sJCmlG506QIyGKa+qQDScwOy+2mz
	Dz77w2hPx9nyhJCeCEdNvR8wPAloqeWeN3Dr05gNhvreWsbp7IkLRpx1o+eWHdGzIomIqwY6eOE
	TNB+/
X-Gm-Gg: Acq92OGfgm0g8r9f8/DEoXRQHCnkcmElaKICeM+ehtZXsWp47hZXd62vikQTImZpLx9
	r1Sj815W0DKvRCf5q0M1YHAO+MEvSMIgzPOm5NQSGsruUXDcCeATBxus7iDs/021frDT1gH0aGw
	gybqUuQv39Jd8mqOEOb6eEocZzZ/DXdEXZzTdWG2gC5r0UbN5fwavZ6PP41fC+cYGYGPxe87Tyg
	U1kofcXbVcns5Y0zrMAYP3FUNoZLLhJyKOb6LGGqJVYJDHV4RpDRJi1IxKD9WxHleDNa59Vs/0+
	fz16CsDgLIYMO581bAP/HSQZWzefGVRzki3mv5g5T83+3NcBReFkATR6/wyoDXlTWfL8BZBMza6
	B3kRdjVETemQIOL51OLlK/Qa0GLw5e0nY+dkY23KmKrFe5+7GgnIvqyluA0cX1IEG8Yx6rmdrrE
	cUqFhKIdJXiC2+Oh+fMmVdV8ugeiHAlIItK7CNwAF46hYWD9//wSX6xxDo5JAXqDx7YGv/lJVSA
	g==
X-Received: by 2002:a17:90b:4cce:b0:368:147f:bd27 with SMTP id 98e67ed59e1d1-36c68195a28mr6992483a91.23.1780258277479;
        Sun, 31 May 2026 13:11:17 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbfc90570sm8901851a91.4.2026.05.31.13.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 13:11:17 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-packaging: upgrade 26.0 -> 26.2
Date: Sun, 31 May 2026 13:09:44 -0700
Message-ID: <20260531200953.3104853-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531001756.1582306-3-tim.orling@konsulko.com>
References: <20260531001756.1582306-3-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 20:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237801

From: Tim Orling <tim.orling@konsulko.com>

* Add python3-hypothesis to ptest REDEPENDS

26.2 - 2026-04-24
Fixes:
* Fix incorrect sysconfig var name for pyemscripten in (PR #1160)
* Make Version, Specifier, SpecifierSet, Tag, Marker, and Requirement
  pickle-safe and backward-compatible with pickles created in 25.0-26.1
  (including references to the removed packaging._structures module)
  (PR #1163, PR #1168, PR #1170, PR #1171)
* Re-export ExceptionGroup in metatadata for now in (PR #1164)

26.1 - 2026-04-14
Fixes:
* Fix > comparison for versions with dev+local segments in (PR #1097)
* Fix incorrect self-comparison for InfinityType and NegativeInfinityType
  in (PR #1093)
* Canonicalize when deduplicating specifiers in SpecifierSet in
  (PR #1109)
* Fix charset error message formatting in (PR #1121)
* Handle the key parameter in SpecifierSet.filter when specifiers are
  empty and prerelease is False in (PR #1096)
* Standardize inner components of repr output in (PR #1090)
* Specifier’s === uses original string, not normalized, when available
  in (PR #1124)
* Propagate int-max-str-digits ValueError in (PR #1155)

For additional changes, see [1].
For full comparison, see [2].

[1] https://packaging.pypa.io/en/stable/changelog.html
[2] https://github.com/pypa/packaging/compare/26.0...26.2

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
Add python3-hyptothesis to ptest RDEPENDS
All tests pass
Testsuite summary
# TOTAL: 61782
# PASS: 61782
# SKIP: 0
# XFAIL: 0
# FAIL: 0
# XPASS: 0
# ERROR: 0
DURATION: 259
END: /usr/lib/python3-packaging/ptest
2026-05-31T20:09
STOP: ptest-runner
TOTAL: 1 FAIL: 0

 .../{python3-packaging_26.0.bb => python3-packaging_26.2.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_26.0.bb => python3-packaging_26.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-packaging_26.0.bb b/meta/recipes-devtools/python/python3-packaging_26.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-packaging_26.0.bb
rename to meta/recipes-devtools/python/python3-packaging_26.2.bb
index ff45cb5133..eadd70602a 100644
--- a/meta/recipes-devtools/python/python3-packaging_26.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "00243ae351a257117b6a241061796684b084ed1c516a08c48a3f7e147a9d80b4"
+SRC_URI[sha256sum] = "ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075aadb987c2fb221661"
 
 SRC_URI += "file://run-ptest.in"
 
@@ -32,6 +32,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN}-ptest = "\
     python3-ctypes \
+    python3-hypothesis \
     python3-pretend \
     python3-pytest \
     python3-unittest-automake-output \
-- 
2.43.0


