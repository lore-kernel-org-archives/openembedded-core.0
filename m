Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3574DC04E69
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:32 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.16729.1690487068414672289
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=BkQa+2Eq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-55adfa61199so921318a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487067; x=1691091867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haPJcas4S/Y4sEpJZoFTx4b/a9igKvBgfuTEM2BGUzI=;
        b=BkQa+2EqorrK1CQNGKTA/x+ZFUaimQv+fgPyDTo1NCA/9c9B9TEa0UuBqY6V/gvSRC
         0rrXiBX2CjV2FjX7A3Jb3A2Z7alx6W+N/c/3I3JuMyXTLWEexOooCiS+pL8z/ilE1W3/
         MYTw3JhcKfwOYJaoWu5wbHs/Tx9jgNL9mMWcMipBhpasLzMQLJWQC72+QCo4fEfqbtpk
         Kso8zijifgcj6OI+L+1voCrXbCj/lpMntv6OV6AM2XaOlaXBpYg32t+bKnGa3v8Az7cQ
         uyOruz+UDeCEE0CYZj4G6FklkI1l7GP3pY8Z166KJVIg8Jt1Yi2Bqr11IxrhJVz2p6u0
         G+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487067; x=1691091867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=haPJcas4S/Y4sEpJZoFTx4b/a9igKvBgfuTEM2BGUzI=;
        b=FXVxICTpzaEFXQZYzD7R2uvxkHahol2WJkhsLnGZ+qIrtruk9cjA/cOZpLWSPhkCs8
         +AbC4rqnVJkvC1k9hfbQA1fKc6mNJeVAAWpPEJPYosp/f24eYYlL47+ua0nMrj+wDknZ
         xy+8uQBTXFcKUrD0dcG1gzaOR4yUDzOQZq4mm0Ub+Ari077AvAmiaTRNlLZ/uuqCyOwx
         WOGWwxGl57v7zMAyXanciTpW6Ie//PXyJGwjXeJLf3MH9NsKXRYjRkENUKJ/ygmfsW92
         cZAcO7nyPtmtOh+pDwsxT/PUMzDprOtuSzt1ZkmCpS2TvZrqVSHuAiGVyCg7GsSi9XLt
         B0DQ==
X-Gm-Message-State: ABy/qLY/QJ4kTYqnRkHmORQrMo1Tk9tedTrCEadVNVOJ+Po5NPtNSkHm
	/g2FL6500DJW+FKIV/1HFNJFclAyiDPN8wEVLGI=
X-Google-Smtp-Source: APBJJlH+L/+MDw+rWtJzdZ+EIu+BUXpNV0QANy/q5BINyDnmbEu+yZ6cbtStVCthah6MjTbKEL6lIA==
X-Received: by 2002:a17:90b:190f:b0:268:8a3:6010 with SMTP id mp15-20020a17090b190f00b0026808a36010mr233474pjb.49.1690487067479;
        Thu, 27 Jul 2023 12:44:27 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/27] mdadm: re-add mdadm-ptest to PTESTS_SLOW
Date: Thu, 27 Jul 2023 09:43:36 -1000
Message-Id: <174ef92965acd605e5aa5ed26afb3f8d556e98b2.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184993

From: Ovidiu Panait <ovidiu.panait@windriver.com>

The ptest problems reported in e21021dc00ec ("mdadm: drop from PTESTS_SLOW")
should now be fixed, so mdadm can be added back to PTESTS_SLOW (a qemux86-64
test run takes about ~12 minutes to execute with kvm).

root@qemux86-64:~# ptest-runner mdadm
START: ptest-runner
2023-06-30T08:25
BEGIN: /usr/lib/mdadm/ptest
PASS: /usr/lib/mdadm/ptest/tests/00linear
PASS: /usr/lib/mdadm/ptest/tests/00multipath
...
PASS: /usr/lib/mdadm/ptest/tests/19repair-does-not-destroy
PASS: /usr/lib/mdadm/ptest/tests/20raid5journal
PASS: /usr/lib/mdadm/ptest/tests/21raid5cache
DURATION: 723
END: /usr/lib/mdadm/ptest
2023-06-30T09:16
STOP: ptest-runner
TOTAL: 1 FAIL: 0

For the testcases to run correctly, there must be enough rootfs space to create
13 loop devices. Similar to strace and lttng-tools, add a new
IMAGE_ROOTFS_EXTRA_SPACE entry for mdadm-ptest.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dfefff63c547adb1add0c8e3a308b2d0bd6cfc8c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 3 +--
 meta/recipes-core/images/core-image-ptest.bb    | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 003348906a..674801d8b8 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -96,6 +96,7 @@ PTESTS_SLOW = "\
     libgcrypt \
     libmodule-build-perl \
     lttng-tools \
+    mdadm \
     openssh \
     openssl \
     parted \
@@ -119,7 +120,6 @@ PTESTS_PROBLEMS:append:x86 = " valgrind"
 #    rt-tests \ # Needs to be checked whether it runs at all
 #    bash \ # Test outcomes are non-deterministic by design
 #    ifupdown \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
-#    mdadm \ # Tests rely on non-deterministic sleep() amounts
 #    libinput \ # Tests need an unloaded system to be reliable
 #    libpam \ # Needs pam DISTRO_FEATURE
 #    numactl \ # qemu not (yet) configured for numa; all tests are skipped
@@ -132,7 +132,6 @@ PTESTS_PROBLEMS = "\
     rt-tests \
     bash \
     ifupdown \
-    mdadm \
     libinput \
     libpam \
     libseccomp \
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 90c26641ba..ddc56c8f9f 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -19,6 +19,7 @@ BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS').split()]
 # strace-ptest in particular needs more than 500MB
 IMAGE_OVERHEAD_FACTOR = "1.0"
 IMAGE_ROOTFS_EXTRA_SPACE = "324288"
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-mdadm = "1524288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1024288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
 
-- 
2.34.1


