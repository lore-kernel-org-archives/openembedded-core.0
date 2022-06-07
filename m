Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00EDC43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 15:11:51 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.13500.1654614705467326818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 08:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WDOEIeoU;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id be31so28828392lfb.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 08:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uAMPa++ia1KnffFugYvd8o2vuvtd+oNHzbTD5UJLnpo=;
        b=WDOEIeoUAH4O0v6chDLp94tMmcG0OK9/6fGzRfagdqnPfzI4bt9/FJL6e1TmAmV50m
         qDoa81O94aB1gWzxfeuI4J9g+n0LQ+1sAJXGwHNbTl8S0aQeSoIg/n5y2dflcYvNBTw1
         vFQHfWwnEdvDEIvjSmaKvTnGDpe9TWxdp0IVVinlNZ73SlVchJyrOAklXTDttaIDetYu
         6z50Fn47I/BfueqvGj8XU4AlHgnKYgQosSBbUMiCkm49P+5d18KZaxYmH0myvVpfucx8
         w3JTBq8G4qp79qyJhdc+zIMg9jnTju/Lndp/bcLD+3eft2vkg4/lnHZbm40vlLf2HDwh
         O80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uAMPa++ia1KnffFugYvd8o2vuvtd+oNHzbTD5UJLnpo=;
        b=RUce+azxopVQTR0KHkXUJkiQdqy7ES7zIrv/FLSb8QvO9dqsK2aGCtenJ5e+7g7hfm
         B1o9Gd8BR2E/9/l8Ju8vLeOd8mrQcYKYuaoI07i9sRuU+20W01lHqXOv+46GTDZAK7Pi
         G0JkFZWomBChmDiTGPx7aq5ZSxd/N2tY4I0r6Af8asmEK2uZMW1PeSn8wWh8fjV+VZ7e
         o7gMNXEhfxTvKemvcNE0ve3HKAuRzWU+0mKJWisE5hYyKrpeVSHwLioypRarAm7NXQiB
         NNUENG4xdnhMH83aC9GmzaV2Cj+svfIGi4po+PUqa/W9cayqYWlvvIQvmAlnc+hq/4c5
         rayg==
X-Gm-Message-State: AOAM530j4K/yGEHI32KfAXwJoSDKYUh3xDcbQY9nMuLAz1yzymuLCwdH
	cvgM0uflZZyG1Lw/YVQVieWTjpF0bg==
X-Google-Smtp-Source: 
 ABdhPJyIRzKagE1OpExVNaWvIle3lhsuFjMrEwjXmtmuzIPfgRggv+bOk2ndj4NVq8ptK4FsyA6bVQ==
X-Received: by 2002:a05:6512:234f:b0:479:100e:1ce9 with SMTP id
 p15-20020a056512234f00b00479100e1ce9mr17215700lfu.192.1654614703725;
        Tue, 07 Jun 2022 08:11:43 -0700 (PDT)
Received: from pneves-XPS-15-9550.sigma.local
 (85-128-83-172.static.ip.netia.com.pl. [85.128.83.172])
        by smtp.gmail.com with ESMTPSA id
 i8-20020a05651c120800b002556e0248dbsm2831089lja.124.2022.06.07.08.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 08:11:43 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v2 4/5] oeqa/selftest: Add test for shebang overflow
Date: Tue,  7 Jun 2022 17:11:22 +0200
Message-Id: <20220607151123.3588947-4-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220607151123.3588947-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220607151123.3588947-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 15:11:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166673

Make sure we do not stage any executable with a bigger shebang
than 128. Fixes [1]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11053

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 .../sysroot-test/sysroot-shebang-test_1.0.bb         | 12 ++++++++++++
 meta/lib/oeqa/selftest/cases/sysroot.py              | 10 ++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb

diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb
new file mode 100644
index 0000000000..6c834be897
--- /dev/null
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Check that shebang does not exceed 128 characters"
+LICENSE = "CLOSED"
+INHIBIT_DEFAULT_DEPS = "1"
+
+EXCLUDE_FROM_WORLD = "1"
+do_install() {
+    install -d ${D}${bindir}
+    echo '#!BiM3cnVd1Amtv6PG+FynrQiVMbZnX5ELgF21q3EkuB+44JEGWtq8TvBJ7EGidfVs3eR3wVOUbLnjYDlKUWcm7YC/ute7f+KDHbwxziRUSUBZAUqgjiQdfQ0HnxajI0ozbM863E9JV9k13yZKYfh9/zR77Y6Dl4Dd3zOWS75LSpkAXV' > ${D}${bindir}/max-shebang
+    chmod 755 ${D}${bindir}/max-shebang
+}
+
+BBCLASSEXTEND = "native"
diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/selftest/cases/sysroot.py
index 315d1a61c2..9457f1e3ac 100644
--- a/meta/lib/oeqa/selftest/cases/sysroot.py
+++ b/meta/lib/oeqa/selftest/cases/sysroot.py
@@ -35,3 +35,13 @@ TESTSTRING:pn-sysroot-test-arch1 = "%s"
 TESTSTRING:pn-sysroot-test-arch2 = "%s"
 """ % (uuid1, uuid2))
         bitbake("sysroot-test")
+
+    def test_sysroot_max_shebang(self):
+        """
+        Summary:   Check max shebang triggers. To confirm [YOCTO #11053] is closed.
+        Expected:  Fail when a shebang bigger than the max shebang-size is reached.
+        Author:    Paulo Neves <ptsneves@gmail.com>
+        """
+        expected = "maximum shebang size exceeded, the maximum size is 128. [shebang-size]"
+        res = bitbake("sysroot-shebang-test-native -c populate_sysroot", ignore_status=True)
+        self.assertTrue(expected in res.output, msg=res.output)
-- 
2.25.1


