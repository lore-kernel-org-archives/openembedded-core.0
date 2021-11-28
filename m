Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F0DC433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:55 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.53269.1638136795139591827
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=17h3LPD3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id b13so10510064plg.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VbDrwu3Y4gp5/+VN9kY7MlFdix6uIL+84QgvAa9dXSs=;
        b=17h3LPD307uhiOR417lqH3q6Gi69F4iqRSoB6o5SRqCaG17aiUw/7pjH9HdSub+TJl
         xcdSZIRWEFN7QsxRR8+lhkDoAkn7Sk7TVlO+WD5Z0zkRftEFGZLv1/7y9IevN2bnv0EQ
         KXzgAPTdAIQuc0y541wzYC+5wv/vdN6dsrq74xuIDFLn1O6YxVSYOiFLF1aEO2KseWvZ
         4ygqlCL94zmHupTdC4eTdayRZZc2ejKWjEV4fnVnnmNt68mSUmtZ6POfefrfg+VNhSWp
         jW8Tuve7XSub+Cu+KQGWMWPFtNVvdMk98ENMi1husq/Pco+XhBPXDQImWcH693hDfqty
         RihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VbDrwu3Y4gp5/+VN9kY7MlFdix6uIL+84QgvAa9dXSs=;
        b=qLgCaRWzXufMW/qe3gvnpjPFRX5Fs0c4LKIcR6MvImAl7xGgRGt3G+a2LBie+3XWDh
         Fv1rG7s0MHBCPwi3NKj6lOcykEHl5hyGxA1QTr8vIvKOX09wH10TZyqJoy23njcjSJrl
         QA+vjeVAv4ID7/XvBTSc20mMFvY36DMPWliMhbVUvBBM0flvdjWp+gv6P1oChSlAb3Zh
         0TksecBg4PvMh0MYtzfuGgRSnKOu266cTvANAqaNLZSeeR9azpqS6QNe8J4kIkVpIefU
         uF00rTCIL/Xvc+0XNscSKC3vG90POHSGZdj/x60jb29hOuISYvtlc+5us/s3beZqe+9F
         KEug==
X-Gm-Message-State: AOAM531XkCPwz+nAAu8QZI29scLogjIwVvqsUzwVkeUQXbNBEmFDXRC5
	Q3UfOckf/joafMS+2j3zlcL+yruUSFbYxpq37cI=
X-Google-Smtp-Source: 
 ABdhPJyQWAnDN0nGjcG5yJPRZHGcFYWV/zWiQXFmyXLbZ1wCis7AvHb3CWHwUhRn+LyR6Jv0zaaYww==
X-Received: by 2002:a17:902:f54e:b0:143:cc29:c058 with SMTP id
 h14-20020a170902f54e00b00143cc29c058mr54701068plf.57.1638136794025;
        Sun, 28 Nov 2021 13:59:54 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 38/42] reproducible_build/package_XXX: Ensure SDE
 task is in dependency chain
Date: Sun, 28 Nov 2021 11:57:50 -1000
Message-Id: 
 <c7a3de4ce4e455e610e6284e5cf667cc63f7ac7e.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158920

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 938e4dfb68a465f61cb754b2cd28d0728616b5a9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package_deb.bbclass        | 4 ++--
 meta/classes/package_ipk.bbclass        | 3 ++-
 meta/classes/package_rpm.bbclass        | 3 ++-
 meta/classes/reproducible_build.bbclass | 2 ++
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 790b26aef2..fa8c6c82ff 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -315,8 +315,8 @@ do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[cleandirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[umask] = "022"
 do_package_write_deb[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
-addtask package_write_deb after do_packagedata do_package
-
+EPOCHTASK ??= ""
+addtask package_write_deb after do_packagedata do_package ${EPOCHTASK}
 
 PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index c008559e4a..4927cfba00 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -274,7 +274,8 @@ do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[cleandirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[umask] = "022"
 do_package_write_ipk[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
-addtask package_write_ipk after do_packagedata do_package
+EPOCHTASK ??= ""
+addtask package_write_ipk after do_packagedata do_package ${EPOCHTASK}
 
 PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index fc9007922a..65587d228b 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -743,7 +743,8 @@ do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[cleandirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[umask] = "022"
 do_package_write_rpm[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
-addtask package_write_rpm after do_packagedata do_package
+EPOCHTASK ??= ""
+addtask package_write_rpm after do_packagedata do_package ${EPOCHTASK}
 
 PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "createrepo-c-native:do_populate_sysroot"
diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 2b402b9966..3c01dbd5b3 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -106,6 +106,8 @@ python create_source_date_epoch_stamp() {
     os.rename(tmp_file, epochfile)
 }
 
+EPOCHTASK = "do_deploy_source_date_epoch"
+
 # Generate the stamp after do_unpack runs
 do_unpack[postfuncs] += "create_source_date_epoch_stamp"
 
-- 
2.25.1


