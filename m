Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4CAC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 13:18:38 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.20951.1714396708698580320
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 06:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=eODS6ODk;
 spf=pass (domain: baylibre.com, ip: 209.85.222.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78edc49861aso335430685a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 06:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714396707; x=1715001507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PhjUlmTz5qcTUqrcqNC6hyWz/ke/Ixs/pPH1qIkqMRo=;
        b=eODS6ODkHg80/0QfiBvE/C237l5lYMxGNzO5+2CrHOPdF/Ceh4PbU5/O/YpYYuId+t
         TFCaGqtmaq9viHdCNw2h84B60R7i5vFqC7yZlDIv4x32gj8C6zNSyLXyLke6BDGVn2uE
         Vmfos2pJP57VpLWDnOPwPw7mL7vHmoUEIM8aPTwlaQMUlIZoHNETVpcZZlcok9b8uCSK
         LMrM1eqx2Re1QJISWTixfaY7gVXewIiZWbD7Vpe98lbxdKehuAlGNB8/L8ePkociWNX7
         Fm33NQC6IJ3brMs82KNLookWJKdHh+J733chBQ6kVYVdGfbuTGVnAOD3x3+x0OpIznLC
         3ItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714396707; x=1715001507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhjUlmTz5qcTUqrcqNC6hyWz/ke/Ixs/pPH1qIkqMRo=;
        b=RdOq3o4I3sn+36TYIUVIwwGh5fZN17t38ewx7wjxQ+Zih6VF0vHxzBCGqOpXYgJ7kR
         4cc1QzN9+QNmuJsLfsy74hANMzgxhlHr2a9fEyoQuEuX7Cqq3n/wzelj3dITCktO0sf6
         4C+IcQ1JjjrJ4no6kiF2nN7Hp5a41bPsFVq/NputAlPfHGNYeRMVymelncg6aHJ+LYGV
         VtcoxtsIE/zZsRWAzRqSLbGj/66obzQglwWvFqrk14koY78IILLmzoQdItvC2l0/kg5m
         fwsDVe0tuuokQknjXJ5TTd0TRJMoPsjfKSJgBS3wHtvzmXOmZIWO51X9pRrlIRDGp4/P
         6mSg==
X-Gm-Message-State: AOJu0YxqgX3/JEOh9vbiZvtyeLNsfMD1KEqQzGBx7XaNQH1KW73aXXU2
	ZRBLbLI4BmtAbR7Jux6WBB4RYEiwVl/f+rwl+xzVTSUjS3Wi5xNG1hzXkXGuV0NqJvTgV0GZXcg
	nApw=
X-Google-Smtp-Source: AGHT+IHBZBSCZEduzFBuZZPBNn01slpP18zSHFTJBzt9GrQJRGk2TCN0B+F9tLSJfA8z9rApkXYWLQ==
X-Received: by 2002:a05:6214:20a5:b0:6a0:d465:6088 with SMTP id 5-20020a05621420a500b006a0d4656088mr1917848qvd.34.1714396707415;
        Mon, 29 Apr 2024 06:18:27 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id k4-20020a056214024400b006a0d057073bsm772821qvt.58.2024.04.29.06.18.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 06:18:27 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-pytest: upgrade 8.1.1 -> 8.2.0
Date: Mon, 29 Apr 2024 09:18:25 -0400
Message-ID: <20240429131825.76396-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 13:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198743

Changelog: https://docs.pytest.org/en/8.2.x/changelog.html

pytest 8.2.0 (2024-04-27)
    Deprecations
    - #12069: A deprecation warning is now raised when implementations of one of the following hooks request a deprecated py.path.local parameter instead of the pathlib.Path parameter which replaced it:
        - pytest_ignore_collect - the path parameter - use collection_path instead.
        - pytest_collect_file - the path parameter - use file_path instead.
        - pytest_pycollect_makemodule - the path parameter - use module_path instead.
        - pytest_report_header - the startdir parameter - use start_path instead.
        - pytest_report_collectionfinish - the startdir parameter - use start_path instead.
      The replacement parameters are available since pytest 7.0.0. The old parameters will be removed in pytest 9.0.0.
      See py.path.local arguments for hooks replaced with pathlib.Path for more details.

    Features
    - #11871: Added support for reading command line arguments from a file using the prefix character @, like e.g.: pytest @tests.txt. The file must have one argument per line.
      See Read arguments from file for details.

    Improvements
    - #11523: pytest.importorskip() will now issue a warning if the module could be found, but raised ImportError instead of ModuleNotFoundError.
      The warning can be suppressed by passing exc_type=ImportError to pytest.importorskip().
      See pytest.importorskip default behavior regarding ImportError for details.
    - #11728: For unittest-based tests, exceptions during class cleanup (as raised by functions registered with TestCase.addClassCleanup) are now reported instead of silently failing.
    - #11777: Text is no longer truncated in the short test summary info section when -vv is given.
    - #12112: Improved namespace packages detection when consider_namespace_packages is enabled, covering more situations (like editable installs).
    - #9502: Added PYTEST_VERSION environment variable which is defined at the start of the pytest session and undefined afterwards. It contains the value of pytest.__version__, and among other things can be used to easily check if code is running from within a pytest run.

    Bug Fixes
    - #12065: Fixed a regression in pytest 8.0.0 where test classes containing setup_method and tests using @staticmethod or @classmethod would crash with AttributeError: 'NoneType' object has no attribute 'setup_method'.
      Now the request.instance attribute of tests using @staticmethod and @classmethod is no longer None, but a fresh instance of the class, like in non-static methods. Previously it was None, and all fixtures of such tests would share a single self.
    - #12135: Fixed issue where fixtures adding their finalizer multiple times to fixtures they request would cause unreliable and non-intuitive teardown ordering in some instances.
    - #12194: Fixed a bug with --importmode=importlib and --doctest-modules where child modules did not appear as attributes in parent modules.
    - #1489: Fixed some instances where teardown of higher-scoped fixtures was not happening in the reverse order they were initialized in.

    Trivial/Internal Changes
    - #12069: pluggy>=1.5.0 is now required.
    - #12167: cache: create supporting files (CACHEDIR.TAG, .gitignore, etc.) in a temporary directory to provide atomic semantics.

pytest 8.1.2 (2024-04-26)
    Bug Fixes
    - #12114: Fixed error in pytest.approx() when used with numpy arrays and comparing with other types.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-pytest_8.1.1.bb => python3-pytest_8.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.1.1.bb => python3-pytest_8.2.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.1.1.bb b/meta/recipes-devtools/python/python3-pytest_8.2.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-pytest_8.1.1.bb
rename to meta/recipes-devtools/python/python3-pytest_8.2.0.bb
index b1cf23fbc4e..1e6674079ff 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.2.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "ac978141a75948948817d360297b7aae0fcb9d6ff6bc9ec6d514b85d5a65c044"
+SRC_URI[sha256sum] = "d507d4482197eac0ba2bae2e9babf0672eb333017bcedaa5fb1a3d42c1174b3f"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.44.0


