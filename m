Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.8771.1632492971313061557
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=oAquZOJQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id mv7-20020a17090b198700b0019c843e7233so7629024pjb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=i3vkaP1Da8c+fb6Vrfkg+WPFmo1ZjLt9qJROSHJpgMU=;
        b=oAquZOJQsSb1ITgmJo/RA/f8mCBPwKYT1Py+CcRWNjbUYsqVvPwQc91C7ZRbrV3Oda
         QxUyeRMAkfndJJ+p7ur4qaEqNZoq/BRcXqQAMlX3cMadwiJ1vdGC9fH356t7nfSFaPJm
         1LKSH1qIx4072cMWTBVhEpJ7h4xM4Iu+RVAw5nDCbaPoh7d6zwdas3+fC80g/zPh/cct
         6mANiJHNa3y5Gxq24AFkSw7gxSU2w0C1LiMWlJNJ0fxmRggkbI2SbqKsXhySX40TFUDD
         acN2dnc0+Muo6G6A6m5m6SuIM3TM347+QILpg+FP29PrLOpKvZ1HWz1FYkg4eNyEyLfK
         eFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i3vkaP1Da8c+fb6Vrfkg+WPFmo1ZjLt9qJROSHJpgMU=;
        b=AnyIP9hRip1wqgvgdA56TQiBzHTiD/01wKiwcP3LDQaB6LYLtd7RM/r0dGE8vf+mCW
         sOUvIwwuq1vo1ufGnCm+jGtI/SceRCH1G/v2P2unmafKqH30Y2OOO8gYJK8UbL5ppWIk
         v2+TC14DTRiYXU6U6lMyzKrALlqBIdIPlL1EwQD7zPDMjLnjeByasCRKtVFRFH3iJTNq
         A1zrY3onp0A0VWRfWcxyTdxR2gOkk+6gK9ewwPztHh/PtWVtdItWyNxAixSk8M+Rt77R
         0+Xbe7fImiuzUqrgKthJpdIWswtXZezAZqSbWyDzHd13wTtSd3HVDmsWXInSRx4kW88M
         +NKw==
X-Gm-Message-State: AOAM532jg47qxq8S3YpACOR/GMyBomggv87ueH1VVofu8Z7Lxvvbbvk0
	0QYPNgbeMN8Bp5wgIyNyZvZuFQpVbqH3XAPHx3s=
X-Google-Smtp-Source: ABdhPJwf112fkL0ZlYz1M9n9kpvbj8Np0OnfdMa99/D72mWMFCUPwzSXhoOzdL1HD6yVOYlQbfSwtQ==
X-Received: by 2002:a17:90a:5b0d:: with SMTP id o13mr2526598pji.117.1632492970383;
        Fri, 24 Sep 2021 07:16:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/25] qemu: fix CVE-2021-3682
Date: Fri, 24 Sep 2021 04:15:11 -1000
Message-Id: <eab7eedb168f639cd4a6d4793135e660378296a9.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Source: https://git.yoctoproject.org/git/poky
MR: 112369
Type: Security Fix
Disposition: Backport from http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-devtools/qemu?id=48960ce56265e9ec7ec352c0d0fcde6ed44569be
ChangeID: 799afc7adf3f2c915751744b618e38cccb01d854
Description:

(From OE-Core rev: e16cd155c5ef7cfe8b4d3a94485cb7b13fd95036)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 48960ce56265e9ec7ec352c0d0fcde6ed44569be)
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3682.patch             | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 211c03e57b..ef9bc3f64a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -91,6 +91,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-12829_5.patch \
            file://CVE-2020-27617.patch \
            file://CVE-2020-28916.patch \
+           file://CVE-2021-3682.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch
new file mode 100644
index 0000000000..50a49233d3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch
@@ -0,0 +1,41 @@
+From 5e796671e6b8d5de4b0b423dce1b3eba144a92c9 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 22 Jul 2021 09:27:56 +0200
+Subject: [PATCH] usbredir: fix free call
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+data might point into the middle of a larger buffer, there is a separate
+free_on_destroy pointer passed into bufp_alloc() to handle that.  It is
+only used in the normal workflow though, not when dropping packets due
+to the queue being full.  Fix that.
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/491
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210722072756.647673-1-kraxel@redhat.com>
+
+CVE: CVE-2021-3682
+Upstream-Status: Backport [5e796671e6b8d5de4b0b423dce1b3eba144a92c9]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/usb/redirect.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
+index 4ec9326e05..1ec909a63a 100644
+--- a/hw/usb/redirect.c
++++ b/hw/usb/redirect.c
+@@ -476,7 +476,7 @@ static int bufp_alloc(USBRedirDevice *dev, uint8_t *data, uint16_t len,
+     if (dev->endpoint[EP2I(ep)].bufpq_dropping_packets) {
+         if (dev->endpoint[EP2I(ep)].bufpq_size >
+                 dev->endpoint[EP2I(ep)].bufpq_target_size) {
+-            free(data);
++            free(free_on_destroy);
+             return -1;
+         }
+         dev->endpoint[EP2I(ep)].bufpq_dropping_packets = 0;
+-- 
+2.25.1
+
-- 
2.25.1

