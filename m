Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CDBD2445F
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:08:48 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50318.1764871722099721494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 10:08:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=L/NCiLyc;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b2ea5a44a9so120245385a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 10:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764871720; x=1765476520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b1+TPQd2+15jZwtBaY024mGfQB0Ve/05THShw8NH9oE=;
        b=L/NCiLyc8ndTQYkMT8Kufqmu6dJkXR3hdG1E52yBwLvftNo1dAzV37v2Lw3oINs8fG
         JDKBgahFnRuB2v8X7K0aRfVJHGwD4bMkCE3v7VrfFq+HW2UwbgzAQpeQo8YESU3h0FpV
         gY3wJE8nDDMnvulcIOXoH+77QniTryqFK4bQLWr4ZNjaosc8DR0KZuVL9vwoWS2YFtxJ
         5Yk6EOfCMPMOLBTpfBHhmt1jTONuiT+EGa/PQafBT4oUCJuyuW0GAM2QlZ0AscMD09Ne
         TdZ6rD81TBVcs70MB1oyl75aeLCXSOpu8FbonNqPE4X1wc+9M8es2Rec5IGrNvBEzFDV
         Pb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764871720; x=1765476520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1+TPQd2+15jZwtBaY024mGfQB0Ve/05THShw8NH9oE=;
        b=TF0WhDFVVE6SmnFSrMprxUJhXkKXXevaJschKX5SqeWN5v4fcMXggNyhhHlhia/Cn1
         kA0+IS3o4Q39+//6nZ/YNr4P3xqz+DIbbLtAt7Jk36cwVZb2kflbYHQaMGyzDeivMRm6
         i81+F2la/XGZGnc1FhfOUiVynfGqmpf8jOnRXyPBYZ96qg0mFUlDTOHu8Xt+48oC8Ceg
         pYBwnUsonWYvxXlSlQ2GE28HN2uI3qpR/xwuY/OY0jMgf67bNaxkNP8LnJw01a3J3hfL
         8ZU8ehI/fFu7tR460ZmeCN5SvuvQ4CQcQsxLqrNUTZWEuzn//l2ND5u/J5nDYzUd9+c2
         Dt9A==
X-Gm-Message-State: AOJu0YzbmKnLBskGkzB9IkOlHdEVQFRDAZ+GBX/47AzY60eYKWpNkmwS
	HFifkvFApr05imkk1IUGayZnsps8Y0OmXYs3+nz+xoGvzTlrMWFmqeAzX6HaL8LlWW4XXl4Rm+u
	+eFLYrl0=
X-Gm-Gg: ASbGncv1HEfaC+UmOO5Mpm7NxiAWC6OGsKJ1Y+C0GrxUK9VYqfHgbPuNOTWBGmsQ7NQ
	tA5gCzCBXdpUcIhriwqb8bk2swI1QlBcFtCKPQYwSqzNWjAYWB9zASS/1+K7jMDNe03k6TQXtma
	VwXaot3ZMzVliL+iEtwUesp2n/MZj2nk/VW65ZUXfVG+OS4oinq8npqsVhP1ux7BAF1DLffA1ad
	xFt1PN7iJeWKtQPDZnx0CexBNB2wUxgC1VET+uD/utQz6OV3XCTT8fuxnhtQIYQdJ5DvYRF/JFW
	dabERhQVnoJGruuIsdK+uVz5eAmyTxZwwHw0DgL0WZssINO82AmsAQhV8fhovSF6tyahgy8XHiV
	G0SnvL3YaGY36SQV8fy+2uUwgE/h2BbMZBcNBJcYDJ586hqrgi5cKPmGSuCZoYk953TttSOXCe6
	1ttfD0kSkGIUvv6nA=
X-Google-Smtp-Source: AGHT+IEq7M8O2dLoFz535kJnYemeyBka+n0T0caRJ+yEZyGrENUWRMhfrk0NgXDHwd8sSgcrFbcBDA==
X-Received: by 2002:a05:620a:28cf:b0:8b1:5f62:a5d5 with SMTP id af79cd13be357-8b6181d6951mr571344585a.62.1764871719973;
        Thu, 04 Dec 2025 10:08:39 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b627aa38aasm181456085a.52.2025.12.04.10.08.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:08:39 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/6] python3: upgrade to 3.14.0
Date: Thu,  4 Dec 2025 13:08:31 -0500
Message-ID: <20251204180837.3112045-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 18:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227310

Here goes the first attempt at upgrading the python3 recipe to 3.14.0. This will
likely break some stuff, so it'd be good to start testing it early before
Wrynose begins the build phase. You can see the specific commits for more
details, but I will note that in addition to the buildall-qemu, reproducibility,
and ptest checks I've reported in the python3 upgrade patch itself, I've also
done the following on my build machine (F43):

- bitbake core-image-ptest-all (which is how I found the problems fixed by the
  bcrypt, jsonpointer, and pytest changes);
- bitbake -k world (which IIRC is where I found the rpm issue).

Trevor Gamblin (6):
  python3: upgrade 3.13.9 -> 3.14.0
  python_pep517: add --prefix to nativepython3 call
  python3-bcrypt: upgrade 4.3.0 -> 5.0.0
  rpm: handle CMake Python paths in do_configure
  python3-pytest: add python3-misc to RDEPENDS
  python3-jsonpointer: add python3-misc to RDEPENDS

 meta/classes-recipe/python3-dir.bbclass       |    2 +-
 meta/classes-recipe/python_pep517.bbclass     |    2 +-
 .../python/python3-bcrypt-crates.inc          |   90 +-
 ...crypt_4.3.0.bb => python3-bcrypt_5.0.0.bb} |    2 +-
 .../python/python3-jsonpointer_3.0.0.bb       |    1 +
 .../python/python3-pytest_8.4.2.bb            |    1 +
 ...r-OpenSSL-3.4-and-add-it-to-multissl.patch | 1452 -----------------
 ...-use-prefix-value-from-build-configu.patch |   35 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |   37 +-
 ...ctive_children-skip-problematic-test.patch |   17 +-
 ...1-test_cmd-skip-bang-completion-test.patch |   31 +
 ...-test_unix_console.test_cursor_back_.patch |   46 +
 ...kip-test_sysconfig.test_sysconfigdat.patch |   32 +
 .../python/python3/python3-manifest.json      |    3 +-
 .../{python3_3.13.9.bb => python3_3.14.0.bb}  |   20 +-
 meta/recipes-devtools/rpm/rpm_4.20.1.bb       |    5 +
 16 files changed, 248 insertions(+), 1528 deletions(-)
 rename meta/recipes-devtools/python/{python3-bcrypt_4.3.0.bb => python3-bcrypt_5.0.0.bb} (86%)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
 rename meta/recipes-devtools/python/{python3_3.13.9.bb => python3_3.14.0.bb} (95%)

-- 
2.52.0


