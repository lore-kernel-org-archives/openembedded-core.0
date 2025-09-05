Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4C4CA101F
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 13:03:39 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web11.569.1757095779410277973
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 11:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OZyexxIz;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: rmmuniz@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-53b174ca9bdso1659660e0c.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 11:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757095778; x=1757700578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJVH8FfOGDs33RjB3DS7ix+hLnsHytIBGkJYkMxXHAI=;
        b=OZyexxIzmcJd2K2WqMwtUxOt8F5PLn7gsmU9lySEhP6SzHpB7IAqB/jJsa5ysfDISa
         RNEnVjfAkETrjgYxus7C6LwgHosFxJaLV6Uk2pwONgD+AfL+xZJJBUlv04ho/REPGd/T
         A3WukIEs8GEq4+aPIIZUQDvJ9BVYvdY2SbtSjV1D74lS5b7flYZkTY7zPZN7dNQObF8r
         osVnhAiy6g37++Ow3FwHM1HnA1bJaOIJ19jqeGjlSr7ky5BCtglfZzsC6GKpB01+IhPV
         Tw6NFz9OGoHNkAu0+OsfCtKbUXnEg5XYGXMN0IZ2WiszfZYF4RHeRoJvrZsTkxzBfC93
         EPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757095778; x=1757700578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJVH8FfOGDs33RjB3DS7ix+hLnsHytIBGkJYkMxXHAI=;
        b=neQWX6IrpVnhHdgmwgHnf9HYMncOt2hiGRwm2yxx3l0YUk2niG9WPr7O1oLv/oJa4/
         Bvmz0u/n9eIRLzONYvqrta0/u4iOIzMOgNYouj78v9h5A9vfQFoJVQYC5hK8zsWxfhSB
         Cxj82QnIIVWH6lfZBroCaLswYQ2ONCQ1x/d7gyNRZKO6axlYbyRvMDYkpAK7NyBu4kIw
         raLkxElOhHe9JeHwdeNhMdenvZswIIM7K1kG1m81qK+X1ECqFD7vmnn61rzpfJpSRKWs
         VzCarFDZqQeoeM2+/AEf7e5EKnOI0cGazG6KiFvlucDJds/lQCeH20ZwKlsg9Jcgmubg
         GkzA==
X-Gm-Message-State: AOJu0YwFqMO3Vkrqxu2CvsA1Emw7LdU75Xjp13AYv/E76kdqUJKHSFc7
	HnOasTFx3bq4JrLKqk+VInRK5fmAZdrJ2PjrDMHXnn42vJ+qzbBn/M0y8hQ7Yg==
X-Gm-Gg: ASbGnct0qCm1y4p75ZwV23x1KN3lV9ENywYhbmJ5z+zHC8rJTKQMhQNLtDdPtra/FIf
	JaCxS1lLvPZZXVPbsNVOLHHq8Jz+iKOgZZOQFhxih5RutEmg/bnYBIV/cX9MdbrePhttHQ6ivYj
	Bo8XuTGhRcKzpiqtSNsyXMxY0GNZkwMrieGjbsq3DtD8G+Q1spjffaqvA5NaUp4aGqhEihLHT6v
	nWgMqr2hWCh8ibyTuAdH3wjilUJ/U7+Hls7BBQ4ZjZ3m42nWWyPEKG1pZ1pyBLNBg963WhQuqZa
	rQGAZvhZkWGrmiaOPmwGw83cKVhrzD7j2PARqfHBmiK4rFq0GhYq2fzBIxW7PdDzgXOYy9fiXKf
	rK6spy84DseBNY8iHQ7u90Vtio+cuAOkGGJNsu6zy1dU/bV5nBkbOeVrRiq14JVuNVtt7ijvy51
	MT5YChvpjK4v02zJPvXD/HGIShlgzRm/M=
X-Google-Smtp-Source: AGHT+IGCV7CN2+R51KgE9CGHPuP41a4RiKKC3Iy7om/LnC6RPS8qP5x1Zgu73IauiMfKcSK+st6msw==
X-Received: by 2002:a05:6214:2627:b0:734:fe8f:27b9 with SMTP id 6a1803df08f44-734feadafd4mr14612376d6.13.1757095312391;
        Fri, 05 Sep 2025 11:01:52 -0700 (PDT)
Received: from rmuniz-SER5.home (bras-base-qubcpq0974w-grc-17-64-228-161-9.dsl.bell.ca. [64.228.161.9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7243de51ad4sm50816226d6.53.2025.09.05.11.01.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 11:01:52 -0700 (PDT)
From: Rene Muniz <rmmuniz@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 3/3] python3-evdev: add ptest
Date: Fri,  5 Sep 2025 14:01:49 -0400
Message-Id: <20250905180149.2497823-3-rmmuniz@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905180149.2497823-1-rmmuniz@gmail.com>
References: <20250905180149.2497823-1-rmmuniz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Sep 2025 13:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223045

From: Yoann Congal <yoann.congal@smile.fr>

root@qemux86-64:~# ptest-runner python3-evdev
START: ptest-runner
2025-05-02T22:19
BEGIN: /usr/lib/python3-evdev/ptest
[   61.988046] input: test-py-evdev-uinput as /devices/virtual/input/input18
[   61.990878] input: test-py-evdev-uinput as /devices/virtual/input/input19
[   61.993060] input: test-py-evdev-uinput as /devices/virtual/input/input20
[   61.994497] input: py-evdev-uinput as /devices/virtual/input/input21
[   61.996659] input: test-py-evdev-uinput as /devices/virtual/input/input22
PASS: tests/test_ecodes.py:test_equality
PASS: tests/test_ecodes.py:test_access
PASS: tests/test_ecodes.py:test_overlap
PASS: tests/test_ecodes.py:test_generated
PASS: tests/test_events.py:test_categorize
PASS: tests/test_events.py:test_keyevent
PASS: tests/test_uinput.py:test_open
PASS: tests/test_uinput.py:test_open_context
PASS: tests/test_uinput.py:test_maxnamelen
PASS: tests/test_uinput.py:test_enable_events
PASS: tests/test_uinput.py:test_abs_values
PASS: tests/test_uinput.py:test_write
PASS: tests/test_uinput.py:test_not_a_character_device
PASS: tests/test_uinput.py:test_not_a_character_device_2
PASS: tests/test_uinput.py:test_not_a_character_device_3
PASS: tests/test_util.py:test_match_ecodes_a
============================================================================
Testsuite summary
DURATION: 0
END: /usr/lib/python3-evdev/ptest
2025-05-02T22:19
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 1 +
 meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index ca91065af0..8a82db0edc 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -21,6 +21,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-click \
     python3-dasbus \
     python3-dominate \
+    python3-evdev \
     python3-execnet \
     python3-flask \
     python3-flexcache \
diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
index dc777cb987..993dfca1e6 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d7bd1cc4c71b706c7e2d4053aef50f2a"
 
 SRC_URI[sha256sum] = "5d3278892ce1f92a74d6bf888cc8525d9f68af85dbe336c95d1c87fb8f423069"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 do_compile:prepend() {
     rm -rf ${S}/evdev/ecodes.c
-- 
2.34.1


