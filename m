Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B75D7877A
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 13:47:49 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17032.1766152059274295962
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 05:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=l9eVD/LH;
 spf=pass (domain: baylibre.com, ip: 209.85.219.44, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88a367a1db0so27767736d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 05:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766152057; x=1766756857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oWXE3bjMu9jzve4eEXZ0PyIDErlSS7pBtRLSkvNYtTg=;
        b=l9eVD/LHJUIgjnNLjwewunLO6rbIkAo6iqWaI1iqjqmN3oEtHle0Mli73oFcGeUUgB
         BgdHUj6MzTJaE3XwYSpqw1Wi5SdOuc9dizYfEB2JX/4b4RrrFciLQGmdyu09tSBCWDx2
         o+K1q9yCiBIZBL80BOqeYj+4sPGPtrbIW8Yr7iCmVkl10sdRP5goHn2Qavs4LCrc6xyL
         5F2tGpjaLzG7vcQEaUXYh730OTNZovZTp33E5K0sObtL5sfl76eXAfA9+NdOpOBPnlGY
         cn3dnnejUqdXF02rZ831OCyVFm6gKdqOI2x1kKlI8QboFhMn0dlZtNIkeMDitFGZ8F1/
         AsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766152057; x=1766756857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWXE3bjMu9jzve4eEXZ0PyIDErlSS7pBtRLSkvNYtTg=;
        b=BJ2sbxyki1BAOBJQdJluZINXROGqlhTL0JH1MvZs8Uq9UJBOBp7TxPJvcapzfIh2lX
         gG32d/zxV1CK6vQUqb+LNGTkV6/Oyl8gy0v12qGh5x97CkxTr/OqNvGhPE4BrIH+VNBg
         J8tdsbbUXyoHL9JFIcWqNLPkfG27yevjbDzU6H5CCBOie7h/IZjsNyCFUnE3l5zmR4cW
         VkGMasSfz30N34oXsl04VaknRdCCyCSOSeimULfb/fgFxjw57D9vhVv6q1PcZ9mvdBws
         eTnkWHoWzFRWanLik0BperHdoUoVFoH7OEdyvWMZRCtQ1HWbqGMqyBIR1IFsgByc4ps9
         i3Yw==
X-Gm-Message-State: AOJu0YzMf2i9krbuBzjwEGGnBaqTY/cVbeyChxjZJnckY4QI3KR/RDd2
	9sdY5gfbKN8DTQZ7sW0wY0WsAuPRNNJ6HxsTWdzalGJlMaoq04B/fIw8RvjBuvvWMqVw90KxWd5
	uKyKCoIQ=
X-Gm-Gg: AY/fxX4hvoCelvD/l+EC1Jcxcobrn4cT60cMmaACc2HK54WZ52BB6ItQbsJJMu1mOfk
	6ieEL+BpeLQvl0BKg4ZHUExPXzqb0C/klkoGYwuW26XGEmbf4Hd3Rt22CTs5G/0zepBz4etbIr/
	OMvEGRpi+5BnGnyFEjIbMaBgcw1mSNujuS7RoDloulFgAC3uptIdK3jQPuPVm/J9Hj+drErl3Gy
	DF8iVbMp1BFkcmoo25VBAB9O4390jAy9pwemcakCVMGPvepfUQW5WsphLXgH1TDbc9ZHEd7ZOIL
	gBMJ2uFPHk0zQeTHCLNy3YepCgA6AhnlxbZstmZfgbd0rHdqMYE9YbJ6KvAKI5CXO98EYreaAaL
	Ov3gi7RT9xxMA/kxVcgm6Lm1qtBAJkwKMFVHoNEaFCtHnakirK2u3qPTn0DAYy95bLInkkEhwn4
	8TTHfrT4PExWgKSLE=
X-Google-Smtp-Source: AGHT+IEwKdmUR7um7R3SmvpWnEaMtkHgmqS93HrkmPwRCEXRyqsI6GfwQ02vEPDQBP6m5V4hdBuHGg==
X-Received: by 2002:a0c:d647:0:b0:888:7f91:e276 with SMTP id 6a1803df08f44-88d8242f9famr36167706d6.30.1766152057169;
        Fri, 19 Dec 2025 05:47:37 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9623ffddsm23164606d6.1.2025.12.19.05.47.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 05:47:36 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/5 v2] python3: upgrade 3.13.9 -> 3.14.2
Date: Fri, 19 Dec 2025 08:47:29 -0500
Message-ID: <20251219134734.842422-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 13:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228232

Compared to v1
(https://lists.openembedded.org/g/openembedded-core/message/227955):

- Drop python3-bcrypt upgrade, as someone else has submitted that;
- Drop rpm patch to manually override Python3_SITEARCH with a patch, as that was
  masking the real issue (see below);
- Add a new patch to fix python3targetconfig by exporting _PYTHON_PROJECT_BASE,
  which Python's sysconfig looks for (as of 3.14.0) when doing
  cross-compilation. The absence of this was resulting in packages like rpm
  finding paths for the native interpreter when making use of sysconfig, when
  they needed the host values.

Note that I've dropped my own version of the python3-bcrypt upgrade, but I
tested this patch series on top of the other one that was submitted, as
otherwise the ptest images would break during build (version mismatch errors
around PyO3, which is fixed with the bcrypt upgrade).

v1 details below.

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

Trevor Gamblin (5):
  python3: upgrade 3.13.9 -> 3.14.0
  python3targetconfig: export _PYTHON_PROJECT_BASE
  python_pep517: add --prefix to nativepython3 call
  python3: upgrade 3.14.0 -> 3.14.2
  python3: add _py_warnings, annotationlib to core

 meta/classes-recipe/python3-dir.bbclass       |    2 +-
 .../python3targetconfig.bbclass               |    1 +
 meta/classes-recipe/python_pep517.bbclass     |    2 +-
 ...r-OpenSSL-3.4-and-add-it-to-multissl.patch | 1452 -----------------
 ...-use-prefix-value-from-build-configu.patch |   35 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |   31 +-
 ...ctive_children-skip-problematic-test.patch |   17 +-
 ...1-test_cmd-skip-bang-completion-test.patch |   31 +
 ...-test_unix_console.test_cursor_back_.patch |   46 +
 ...kip-test_sysconfig.test_sysconfigdat.patch |   32 +
 .../python/python3/python3-manifest.json      |    5 +-
 .../{python3_3.13.9.bb => python3_3.14.2.bb}  |   20 +-
 12 files changed, 187 insertions(+), 1487 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
 rename meta/recipes-devtools/python/{python3_3.13.9.bb => python3_3.14.2.bb} (95%)

-- 
2.52.0


