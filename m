Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F7DCCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 20:23:01 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.13639.1761769376166076689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 13:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Cw3UEst4;
 spf=pass (domain: baylibre.com, ip: 209.85.222.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8a3eac7ca30so17932085a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 13:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761769374; x=1762374174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TzyhsIqdiIpVH1WvPGQqTFnAoF7039gAFN5037vIKTU=;
        b=Cw3UEst4mGbLwqcjV+w6888LAOMx/odqg6QlUtRXkb54DUdLFoiFy6gTa3Ze+lMQVz
         AeV42Ml9+Ct8YK2uqP53ipibicVDygOgFvGEGEjaS0FZlVsYZOyqwUz/MV7lIaTxXPgF
         1n0eiCmdSSSsrtN3ugufhMpOC6WYpHQ/TXZsjZXg4Ez8E9OA29PnlU0g0HDgaq2e8VF0
         jX8XpX1/5HMW8hnVR9KfK4w5SZJziw3QFyjtS5UgeYI2Y6f+kaY4uSiAFo1GYlRqwhkG
         J6Ap17ot13+Z5aubG5POBNyeyp9IOLr86A0GkR9DnmYJWQDbYs+huyezn6TCDvI3xaqK
         POeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761769374; x=1762374174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TzyhsIqdiIpVH1WvPGQqTFnAoF7039gAFN5037vIKTU=;
        b=vJP6gQqRLNGqzJSjXXDNmgY0LDYb+IJqqB/5HvqHyMZrGeOMExAXs4tJ/Bdd+Tm3fi
         YLs4qWH/xgc4TZ99lv7SzAEa/qu+bHuLaYpiN+tP44P3XJtlfnzGwABKsJ6+Y/pJBxiG
         rYIjd17acuXGIwAiFRxFhW7Kk5xt6Ackr6Oxlx2uBUKOakIlqAoWsDvLRl7dJTynu0/m
         BIjfA+91Cp6DQh8XgEeBw8StuTN7hXf+izBdUIGn73+vJPfn8356g7UoDE7dOweoSnzM
         QrTj+UOaeDe272gUGdfzdrEmNgGQBpLf4yexMoCYgm3ZamZOoV8KOuvD/auOQSLAtNLN
         Igdw==
X-Gm-Message-State: AOJu0YwBf03Mf53IPWDQJ9DoMvKRY4KFs3s2MZvpkgY9sddEjLEG1H54
	/VpEoUxBi+oilRqi6S0KPUwrgn2kc99/SHQ5KNiRVP8lP6PbdmPhDYiOjYu5NkkW6oaijmdHOdX
	/hgjsJNE=
X-Gm-Gg: ASbGnctfIu+KvOxIeo7zVfx+7uG3ghZYL7p9/SnO1ZmKl8vfk4pDmhPt2Q7yIF5PP83
	ArTfxljObzT4kqkjDmC0oHlpBiHmDGDrHVooZ5p+4ri2sEAkW9c0hjPaO1o///FEk5q1sa/cXqs
	n8QKRvJVbwJ9dkAZGsXdAdZulnNx7E/SHvVjuc6iCs3CLzXSxnEZAx+mBDOWtUPJMKMRZjFrIY/
	UWMyENOzcOurPpGlHWK8CBXhRKrJWTfbEZEV4TgGv1BTemCKHFx6ZyoDkVlhGdYajLSQpXFffsr
	OGeiLKmEhIFL9T4R4FkOYL4scyP05hyq5tb4MofzaM81JsHdwHlkhtVOgAWnGI5H/i+RtPwP9OP
	JFHpTwb3EXrVA3Hg0Hnzh6wqQOh5+in2g4F7qtwjEs3B6tvmK17beQYBZ48+M5xl0LBP9VIb9jC
	T+Ef59
X-Google-Smtp-Source: AGHT+IGNjsWFIw56CE9qL7E6luxiHTvFChPwy3W/wWTmQsHfEUsNAO/AHrqAn4Dqn1b0+4TNnjxx3g==
X-Received: by 2002:a05:620a:4712:b0:89e:af67:e8af with SMTP id af79cd13be357-8aa2cb2db18mr157809685a.40.1761769374334;
        Wed, 29 Oct 2025 13:22:54 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f25e8685fsm1120441785a.50.2025.10.29.13.22.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 13:22:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC][PATCH 0/1] python3: upgrade 3.13.9 -> 3.14.0
Date: Wed, 29 Oct 2025 16:22:49 -0400
Message-ID: <20251029202250.270947-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 20:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225471

This is a fairly significant upgrade, so I'd like to request some feedback from
others in the community, especially on the new test skips and _sysconfig_vars
reproducibility solutions to see if anyone has better ideas. I've included some
justification in each patch based on what I found during my investigation.

I'm also having a couple of issues with testing that maybe someone can identify
the problem with. In particular, the python3 ptests, reproducibility, and
buildall-qemu results seem OK when I test, but when I try to build ptest images
for recipes that depend on the python3-stringold package, such as
core-image-ptest-python3-license-expression, I see errors like:

|ERROR: python3-unittest-automake-output-0.3-r0 do_package: QA Issue: python3-unittest-automake-output: Files/directories were installed but not shipped in any package:
|  /home
|  /home/tgamblin
|  /home/tgamblin/workspace
|  /home/tgamblin/workspace/yocto
|  /home/tgamblin/workspace/yocto/openembedded-core
|  /home/tgamblin/workspace/yocto/openembedded-core/build
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao-0.3.dist-info
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/__init__.py
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/pytest.py
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/unittest
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/__pycache__
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/unittest/__init__.py
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/unittest/__main__.py
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/unittest/__pycache__
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/unittest/__pycache__/__init__.cpython-314.pyc
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/unittest/__pycache__/__main__.cpython-314.pyc
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/__pycache__/__init__.cpython-314.pyc
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/__pycache__/pytest.cpython-314.pyc
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao-0.3.dist-info/entry_points.txt
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao-0.3.dist-info/WHEEL
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao-0.3.dist-info/METADATA
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao-0.3.dist-info/licenses
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao-0.3.dist-info/licenses/LICENSE
|Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
|python3-unittest-automake-output: 34 installed and not shipped files. [installed-vs-shipped]

The full list of failures in this example is:

|Summary: 10 tasks failed:
|  /home/tgamblin/workspace/yocto/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package
|    log: /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/temp/log.do_package.264314
|  /home/tgamblin/workspace/yocto/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package
|    log: /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-pretend/1.0.9/temp/log.do_package.264321
|  /home/tgamblin/workspace/yocto/openembedded-core/meta/recipes-devtools/python/python3-booleanpy_5.0.bb:do_package
|    log: /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-booleanpy/5.0/temp/log.do_package.264320
|  /home/tgamblin/workspace/yocto/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_package
|    log: /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-iniconfig/2.1.0/temp/log.do_package.264322
|  /home/tgamblin/workspace/yocto/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_package
|    log: /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-pytest/8.4.2/temp/log.do_package.264315
|  /home/tgamblin/workspace/yocto/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package
|    log: /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-colorama/0.4.6/temp/log.do_package.264324
|  /home/tgamblin/workspace/yocto/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package
|    log: /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-pluggy/1.6.0/temp/log.do_package.264323
|  /home/tgamblin/workspace/yocto/openembedded-core/meta/recipes-devtools/python/python3-license-expression_30.4.4.bb:do_package
|    log: /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-license-expression/30.4.4/temp/log.do_package.264345
|  /home/tgamblin/workspace/yocto/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package
|    log: /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-packaging/25.0/temp/log.do_package.264326
|  /home/tgamblin/workspace/yocto/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package
|    log: /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-pygments/2.19.2/temp/log.do_package.264331
|Summary: There were 6 WARNING messages.
|Summary: There were 20 ERROR messages, returning a non-zero exit code.

The logs essentially mirror the QA error from above, though.

The last thing to highlight for discussion is the renaming of the
python3-stringold package split itself - in 3.13.9 (our current version) and
older, many string functions are contained in a string.py module (reflected in
the upstream source at Lib/string.py). As of 3.14.0, this has been changed to be
a directory Lib/string/ with an __init__.py and the new templatelib.py
submodule, where the latter contains the new t-string functionality. I think
this changeover marks a good time to migrate from using python3-stringold to
python3-string everywhere, but maybe there's a better naming convention. If
that's OK though, I will make the change and submit a corresponding patch for
meta-openembedded once the final patches for this go out.

Trevor Gamblin (1):
  python3: upgrade 3.13.9 -> 3.14.0

 meta/classes-recipe/python3-dir.bbclass       |    2 +-
 ...r-OpenSSL-3.4-and-add-it-to-multissl.patch | 1452 -----------------
 ...-use-prefix-value-from-build-configu.patch |   35 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |   37 +-
 ...ctive_children-skip-problematic-test.patch |   17 +-
 ...1-test_cmd-skip-bang-completion-test.patch |   31 +
 ...-test_unix_console.test_cursor_back_.patch |   46 +
 ...kip-test_sysconfig.test_sysconfigdat.patch |   32 +
 .../python/python3/python3-manifest.json      |    3 +-
 .../{python3_3.13.9.bb => python3_3.14.0.bb}  |   20 +-
 10 files changed, 191 insertions(+), 1484 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
 rename meta/recipes-devtools/python/{python3_3.13.9.bb => python3_3.14.0.bb} (95%)

-- 
2.51.0


