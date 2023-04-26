Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58DCC77B78
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:50:57 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.4087.1682502647888946156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=heRi7H0/;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f19b9d5358so46006345e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 02:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682502646; x=1685094646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAXbg3MVnG6H9wvPvWvHabwB/Rg6I3XYIT6SwZY6+7w=;
        b=heRi7H0/gpo/w3sf+9Igf9WRth8Qr8b/mXEHxBzQsjM6DPUZmtyObtykIz4RIBh7a9
         Wu8ZBzIe7kQ/Y4ymF00dnU6YzZGwds7XUH5W36dQOQUbcSNf33c8BnIC8BevQaqDm6BV
         hCisUH4UIIeuYSWOMRHbee4tr9fdWeAvVS63EylBVHMLOExMdIPpesrnnO1HvSUhfJpl
         l9Qx29BV87fI5mDjoIrn5bl8yp45yo3wL4e0WtP0cf5CJTAcT0jjfCzq+K+4gvPjCcsD
         Pf654BO3574nCG/uAAMC++Q1xWfyhkcUmhFlld7qt1oJR27i/uMRSoml7Lbo3B7Sxn90
         YUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682502646; x=1685094646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAXbg3MVnG6H9wvPvWvHabwB/Rg6I3XYIT6SwZY6+7w=;
        b=UjV3dsnDFQ+LNS3li504FA4SEZAG2r5ITDNaT/n3u/GrOa1iiui2EiXNkwLJJYLpGv
         Xf6FxnL68AGJTJhiueZOxObLMRVhyQqYmj2SMfy3NK/Ezj3mWLQ15r+nfnUpMw62fDLz
         cnkrRgP9MfOFaz4mApxoGT6BclZGa+nbaP+mP0/YGdze8NvlrNycjZ+ivqzuLbFuHcNX
         PNv2jBTIMGs16a1CUgEknevcnSEe/roGe5ivnqF0rVWhzRitecORc+03GV4sDVM5yEi1
         iSuh0Ph9pIqU14NdJBmArPvWRa3SRhXbfpvNdt5pP6T+27PKwDXXzWE78vqFfbwknAY8
         s8Sw==
X-Gm-Message-State: AAQBX9dnNWOjbKN6cTCdqQlgsUujNmD1weJ0nPPmlND3hRXN8wgm6ISd
	MaWwzRQiA7xTbXuxMcsSKlJPyDD19xg=
X-Google-Smtp-Source: AKy350Y4vSFOZLdUN3NUvdHuRnzJQ3W6Agjpg4tlcTeDqA4BAPQWpkAcCLGrUjf35bSAgfysTm9QDA==
X-Received: by 2002:a7b:ce01:0:b0:3f1:91ba:feb2 with SMTP id m1-20020a7bce01000000b003f191bafeb2mr12318361wmc.2.1682502646251;
        Wed, 26 Apr 2023 02:50:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o22-20020a1c7516000000b003f18372d540sm17242867wmc.14.2023.04.26.02.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:50:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/11] time64.inc: add a comment about how to simulate Y2038
Date: Wed, 26 Apr 2023 11:50:32 +0200
Message-Id: <20230426095036.2632847-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230426095036.2632847-1-alex@linutronix.de>
References: <20230426095036.2632847-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180425

Setting clock to 2040 causes the following ptest failures on qemux86:

{'perl': ['t/op/magic', 'lib/File/stat', 'ext/POSIX/t/time']}
{'python3': ['test_create_server_ssl_verified',
             'test_create_unix_server_ssl_verified',
             'test_local_good_hostname']}
{'dbus': ['dbus/test-relay_with_config.test',
          'dbus/test-misc-internals.test',
          'dbus/test-corrupt.test',
          'dbus/test-loopback_with_config.test',
          'dbus/test-relay.test',
          'dbus/test-misc-internals_with_config.test',
          'dbus/test-loopback.test',
          'dbus/test-fdpass_with_config.test',
          'dbus/test-corrupt_with_config.test',
          'dbus/test-fdpass.test']}
{'openssl': ['Dubious,_test_returned_5', 'Dubious,_test_returned_1']}
{'glibc-tests': ['/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-utimes',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-utimensat',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-utime',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-timespec_get',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-timer4',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-stat',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-sigtimedwait',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-settimeofday',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-sem5',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-select',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-scm_rights',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-rwlock14',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-ppoll',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-ntp_gettimex',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-ntp_gettime',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-ntp_adjtime',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-mtx-timedlock',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-mqueue8',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-mqueue2',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-mqueue10',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-mqueue1',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-lutimes',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-lchmod',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-futimesat',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-futimes',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-futimens',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-fts',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-fcntl',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-cond11',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-cnd-timedwait',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-clock_settime',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-clock_adjtime',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-clock',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-aio6',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-adjtimex',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/ftwtest',
                 '/usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-lchmod-time64']}
{'openssh': ['key_options']}
{'curl': ['test_0031',
          'test_0046',
          'test_0053',
          'test_0061',
          'test_0062',
          'test_0172',
          'test_0179',
          'test_0327',
          'test_0329',
          'test_0420',
          'test_1104',
          'test_1216',
          'test_1415']}
{'glib-2.0': ['glib/asyncqueue.test',
              'glib/module-test-plugin.test',
              'glib/file.test',
              'glib/fileutils.test',
              'glib/module-test-library.test']}
{'gstreamer1.0': ['gstreamer/elements_multiqueue.test']} (may be flaky)
{'tcl': ['cmdAH.test', 'interp.test']}
{'libmodule-build-perl': ['t/compat']}

Some ptests fail on qemux86-64 as well:
{'curl': ['test_0031',
          'test_0046',
          'test_0053',
          'test_0061',
          'test_0062',
          'test_0172',
          'test_0179',
          'test_0327',
          'test_0329',
          'test_0420',
          'test_1104',
          'test_1216',
          'test_1415']}
{'python3': ['test_create_server_ssl_verified',
             'test_create_unix_server_ssl_verified',
             'test_local_good_hostname']}
{'openssh': ['key_options']}
{'openssl': ['Dubious,_test_returned_5', 'Dubious,_test_returned_1']}
{'tcl': ['interp.test']}
{'python3-cryptography': ['tests/hazmat/primitives/test_pkcs7.py:TestPKCS7Builder.test_smime_sign_detached',
                          'tests/hazmat/primitives/test_pkcs7.py:TestPKCS7Builder.test_sign_pem',
                          'tests/hazmat/primitives/test_pkcs7.py:TestPKCS7Builder.test_sign_alternate_digests_der[hash_alg0-\\x06\\t`\\x86H\\x01e\\x03\\x04\\x02\\x01]',
                          'tests/hazmat/primitives/test_pkcs7.py:TestPKCS7Builder.test_sign_alternate_digests_der[hash_alg1-\\x06\\t`\\x86H\\x01e\\x03\\x04\\x02\\x02]',
                          'tests/hazmat/primitives/test_pkcs7.py:TestPKCS7Builder.test_sign_alternate_digests_der[hash_alg2-\\x06\\t`\\x86H\\x01e\\x03\\x04\\x02\\x03]',
                          'tests/hazmat/primitives/test_pkcs7.py:TestPKCS7Builder.test_sign_attached',
                          'tests/hazmat/primitives/test_pkcs7.py:TestPKCS7Builder.test_sign_binary',
                          'tests/hazmat/primitives/test_pkcs7.py:TestPKCS7Builder.test_sign_smime_canonicalization',
                          'tests/hazmat/primitives/test_pkcs7.py:TestPKCS7Builder.test_sign_text',
                          'tests/hazmat/primitives/test_pkcs7.py:TestPKCS7Builder.test_sign_no_capabilities',
                          'tests/hazmat/primitives/test_pkcs7.py:TestPKCS7Builder.test_sign_no_attributes',
                          'tests/hazmat/primitives/test_pkcs7.py:TestPKCS7Builder.test_multiple_signers',
                          'tests/hazmat/primitives/test_pkcs7.py:TestPKCS7Builder.test_multiple_signers_different_hash_algs']}

Note that setting the year to 2035 resolves almost all of the above,
as onl the following then fail:

qemux86:
{'python3': ['test_local_good_hostname']}
{'curl': ['test_0420']}

qemux86-64:
{'python3': ['test_local_good_hostname']}
{'curl': ['test_0420']}

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/time64.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 73adebd39db..f3bdfba4acf 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -1,3 +1,13 @@
+# To simulate Y2038 occurring, add to your build configuration:
+# QB_OPT_APPEND:append = " -rtc base=2040-02-02"
+#
+# Note that this does result in ptest failures on qemux86:
+# perl python3 dbus openssl glibc-tests openssh curl glib-2.0 tcl libmodule-build-perl
+# and a subset of those occurs in qemux86-64 as well:
+# curl python3 openssl openssl tcl python3-cryptography
+#
+# Working to address those (before Y2038 rolls in) will be appreciated.
+
 GLIBC_64BIT_TIME_FLAGS = " -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
 
 # Only needed for some 32-bit architectures, some relatively newer
-- 
2.30.2


