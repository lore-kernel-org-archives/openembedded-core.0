Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDB2C7EE25
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 08:48:37 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.14762.1682671712367112532
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 01:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=E3OZJPbt;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f178da21b2so97338065e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 01:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682671711; x=1685263711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAaEakgByQHmw37qBEQ3tnq4IqBhYWYd1Uaao59wt0k=;
        b=E3OZJPbtNcUm3Z7jrBwTbqjoK/1gnG0YKnswIrCpUKZ93oWb8zMV75Vl1YS2mpA6pb
         1pouv2ZyB/gUCm4GbCkZO+4xO/SRUiC7we/bLCUrj9J1QOENBpA+S2yWMHbqNVm7S3uD
         vVz2/MS/bCQxc+X3yd/Xh4OWgxwgePBjRBujbLZ1vgK7ixHh8cBLD7hXd9KPISRXjZnr
         ZUhmvIfSsHs2I7xei5BrguxFhkxROuUC/3to/KvsFz2YEGbU2icxR8E55u4gbcRNcCB4
         WGHvXVZVv01bV14C0tUxO9GEH1dBqzUXKsruHJy7wUtO/bxgRhMZVyjANhFGdxlvfipX
         BIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682671711; x=1685263711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAaEakgByQHmw37qBEQ3tnq4IqBhYWYd1Uaao59wt0k=;
        b=fhNcTLQ2S9ho68WlEbO+Gn0HfW9UCrO8tjfwr4V6X5oEc/tefd/5Iqyi/y7wAiONa/
         FBBILj//C3t9uOz6c6gXcL1Mi48Cr5nkUizRF75Cq/rHqph2zRMshedjJcYgR9qSRBMn
         y8rsNH6JgIfz4TU/z6s5JK0xsRzswoxPBm1NWfrh952u46LBnAE42UZ+GR6XcuweMo7T
         UIbkdDnMYISAwPNSyu9fBvBovK8AxK7ktzTz/iw6F+VEoD+VP1WAXrP90oitDVVLzzdH
         VFY/cI4VUedRhxiTTGNg6WD8DvikhrFqeJrHDxz3U1pVJz49P95bQ/7sCho+ijUzjvrW
         VBLw==
X-Gm-Message-State: AC+VfDzs3w9bwRuSLQHjhOodW+B5fJi/EPv4ubFWANNvSTINHMfNC1sU
	p4erNhh3haWdczNPaipKD46wY/ucVjE=
X-Google-Smtp-Source: ACHHUZ5D1Fk8nSL4WvXppIL3MaMm9iSdTlfne3rZgPGpbwjOQY20HBPU+wcmAu+xs+JNC2U4Fugvlw==
X-Received: by 2002:a5d:4585:0:b0:2c7:1b4c:da75 with SMTP id p5-20020a5d4585000000b002c71b4cda75mr2852798wrq.69.1682671710770;
        Fri, 28 Apr 2023 01:48:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j8-20020adff008000000b002f6176cc6desm20563375wro.110.2023.04.28.01.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 01:48:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 07/11] time64.inc: add a comment about how to simulate Y2038 in qemu
Date: Fri, 28 Apr 2023 10:43:48 +0200
Message-Id: <20230428084352.836515-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230428084352.836515-1-alex@linutronix.de>
References: <20230428084352.836515-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 08:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180518

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
index 73adebd39db..7474f0fd7a0 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -1,3 +1,13 @@
+# To simulate Y2038 occurring in qemu, add to your build configuration:
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


