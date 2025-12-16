Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4785ED5E378
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 14:39:16 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24241.1765895947799790832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 06:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=i34Ss6YQ;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b2627269d5so477239385a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 06:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765895946; x=1766500746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7uI3PqtYqM36cPrk1NBF+QiCauejB25gGjFWJlezgNs=;
        b=i34Ss6YQzzeIx7aml9YHPPCFtZfWQqQ0SU8KDBNHwDYYeVSa+y8LlPnki4X0s7nNim
         leQJws24TiZ6vapXrqA6Da8l2MIvRB6zWgBIQnuWCojCOTTflBh8dTouQwei3Q2ofx/H
         wIWsvIb4z/ljenjGTLWKVQazTtO7T7AhbR7Zd2el4PVSUKC9IreJ6zVCafL5R7z1hFUf
         VCobcM9GhPVvgOEtaULtbfGNox/VW9yeLPYhoRxaYrYjwum530WNZda/kZfZUNTE+rkf
         9oM/vsxKg4gLfMrVBWN2moXqQNPHXG2yugmQPFO5L41rTJkgp7h/6RaAgCfe8b+XdFUZ
         4HXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895946; x=1766500746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uI3PqtYqM36cPrk1NBF+QiCauejB25gGjFWJlezgNs=;
        b=kiHnExsW9K+/UFbZQblOsxYvlwrjj+HhG7RYjG1C2V7sFoXOOIXow2z5HpskvRIFHq
         Y6erBATzzbiO1ZkTHAmrrG1fqo/U0DpUEyvCBayWiMDBvclz2tG+6vYDPYlfafyO4QBI
         QlNeZki6Sof/kPQHgMoevbS3ahpRTUvyo0pUsQWo7v/Od8XlEHl5W/3RHg2YhaXaRjO1
         7FD12ftuWZ33V3yjf0G0fMSfl6ExmYgGiy3VU/QvC1fR5zgwZcmch+YoFJf0FI4dXKap
         KlPqfzvJKBx4cxvwB2CbJXNf3rV7tVcrMiRAALl839uyahrHiRSHZYau2xMvFA8K77XU
         BdCA==
X-Gm-Message-State: AOJu0YwKYMQF4WEfzh3YXfs0B2qQI4sXYxoFUHBGhm5XkoE1hYpWriMw
	VItJ1OldKt/WHFeZw6GVQ4EpxjXp/5n/rpsbdX3IlZZLJx/yVXlka0yjWysgE7rwTKJfLVlI/Tz
	w3qUP3Tg=
X-Gm-Gg: AY/fxX6XLaqjMaSwWtrdafASYgBo0GKmzIqO0Vmc4OyPc8ZjLIbhP6hRGfznklhxLnN
	JH6ZInqgf3qMWFjH/5L2gDct94LZSNqnRHHSZKu+cp8ynvoxKp+zXMRs7r/G0mkEJXmB8nUFq7f
	J46avRfhy0au4cN13CJomDRRPm3tKnRII3vpYAUk5UuvakQu+HwCWQM+XBGUCJik75mWh72Xc8p
	oYHVuGzcwHwaEjB8cmF0VcZ+Qg0UlA26F2t0qUNBjmr5lBKVpvMvtf8X8xVKrIktEMZgoIlN9vB
	s6CeXRlSp7on8gpayvJH/lTfDXoUy2WZXfbz62EVyDQAuS5yV4m3xDI/gTPIaL7Cj+ib98+B6Po
	gCStO0LJQhjxkkxTGtuSbHce35RvGkp0pPd05XHurfamGAi1LmbNylBSop5lEwhr8/CegMgNsoH
	isMsFgNHjbI2Llhsw=
X-Google-Smtp-Source: AGHT+IFpC0T8Tpy6vIj2cYSRJtJWlBeeBtLUW6rUPFp9FJ5NePcinl5SV34gpnb7zDn9HJFYODo8NQ==
X-Received: by 2002:a05:620a:31a1:b0:8b1:2fab:30a8 with SMTP id af79cd13be357-8bb3a38ff33mr2126937585a.74.1765895944350;
        Tue, 16 Dec 2025 06:39:04 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be31b66d74sm196008385a.40.2025.12.16.06.39.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 06:39:03 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/6] python3: upgrade 3.13.9 -> 3.14.2
Date: Tue, 16 Dec 2025 09:38:55 -0500
Message-ID: <20251216143901.2542490-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 14:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227955

This supersedes a previous series sent, which only did the 3.14.0 upgrade. 

Compared to the first series
(https://lists.openembedded.org/g/openembedded-core/message/227310), I've
done the following:

- Added a commit for including the '_py_warnings' and 'annotationlib' modules in
  python3-core;
- Adds the python 3.14.2 upgrade;
- Removed commits for adding python3-misc to RDEPENDS for python3-pytest and
  python3-jsonpointer, as these are now solved by a new patch to add new modules
  to python3-core in the manifest. Doing it this way was fragile in the sense
  that there were many other recipes needing this same fix that testing didn't
  easily catch, and it doesn't make sense to add python3-misc to recipe RDEPENDS
  just because (for example) python3-logging (another package split) is trying
  to make use of warnings, but can't find the right module;
- Modified the rpm commit to apply a patch (submitted upstream) to fix
  CMakeLists.txt, rather than a do_configure prepend;
- Fixed the Python 3.14.0 upgrade commit so that one of the patches we carry to
  skip tests doesn't include duplicate calls to the relevant skip functions.

I've kept the upgrades from 3.13.9 to 3.14.0 and 3.14.0 to 3.14.2 separate to
reflect separate testing and let people review those changelogs individually if
desired.

Trevor Gamblin (6):
  python3: upgrade 3.13.9 -> 3.14.0
  python_pep517: add --prefix to nativepython3 call
  python3-bcrypt: upgrade 4.3.0 -> 5.0.0
  rpm: handle CMake Python paths in EXTRA_OECMAKE
  python3: upgrade 3.14.0 -> 3.14.2
  python3: add _py_warnings, annotationlib to core

 meta/classes-recipe/python3-dir.bbclass       |    2 +-
 meta/classes-recipe/python_pep517.bbclass     |    2 +-
 .../python/python3-bcrypt-crates.inc          |   90 +-
 ...crypt_4.3.0.bb => python3-bcrypt_5.0.0.bb} |    2 +-
 ...r-OpenSSL-3.4-and-add-it-to-multissl.patch | 1452 -----------------
 ...-use-prefix-value-from-build-configu.patch |   35 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |   31 +-
 ...ctive_children-skip-problematic-test.patch |   17 +-
 ...1-test_cmd-skip-bang-completion-test.patch |   31 +
 ...-test_unix_console.test_cursor_back_.patch |   46 +
 ...kip-test_sysconfig.test_sysconfigdat.patch |   32 +
 .../python/python3/python3-manifest.json      |    5 +-
 .../{python3_3.13.9.bb => python3_3.14.2.bb}  |   20 +-
 ...s.txt-allow-overriding-Python-instal.patch |   53 +
 meta/recipes-devtools/rpm/rpm_4.20.1.bb       |    3 +-
 15 files changed, 290 insertions(+), 1531 deletions(-)
 rename meta/recipes-devtools/python/{python3-bcrypt_4.3.0.bb => python3-bcrypt_5.0.0.bb} (86%)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
 rename meta/recipes-devtools/python/{python3_3.13.9.bb => python3_3.14.2.bb} (95%)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-python-CMakeLists.txt-allow-overriding-Python-instal.patch

-- 
2.52.0


