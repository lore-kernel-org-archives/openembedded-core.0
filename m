Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C40FC19F2D
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 05:54:47 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.3218.1660197282636970080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 22:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m24UGlCW;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id m2so16139608pls.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 22:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=FmzXnVk2BmngrkL8vhI84KUhx1WbGvxrVDppfg6KaPI=;
        b=m24UGlCWxgVmy3brGH1WOkKU6Tak5nLBavKnF5qG3V24MLjBcyhtr/8qpc8qa7wTtr
         V9L5njFbpS9Qfxl6IN6Vww/KXDIGY2vgI7Aud5XcutJbWLhzh1wmXOHlcbIVPUOqxeWn
         PrCd4CCEEnxkPZEjSGDOzAFCINEpczrfS8snnLLtYzWnzZ0L3We+ltn/1XwHFIpiLJb4
         sRpHq4Xk73olyIJsFXRLq5NapbIllUe95WXli7lO8k7PSkOuNo59fEo9YXgMzrYCpuj6
         2If9mXbDQKPiQE41oOP4hAXol8/R39ZBJcAs3xFDG5k4cGRoxIGTQ8JHA0+vzDf8g0gk
         1q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=FmzXnVk2BmngrkL8vhI84KUhx1WbGvxrVDppfg6KaPI=;
        b=3tBNWzHkMObIOkCxx9V61I44SHamVQUCOy8f08l+qrV+hPy3XlPX2UF21+Osbx6hA/
         gAVeCdfE6TGrSLUyYIT8dfMp1RlxtP3eO2mfVpxu5/L/beuCsqyim6LgP1nwkDwUocEy
         kHyLUErEhJq1Tg07dZtEi7mS6590P49/fyaZ3/bXzefcs7DLy3tCxXlYHOOHuAkiKbGC
         sp47eBOLJlM+i0xv3Es+aVpLdTmXBylEkqRO40QbazcQbSQ2VVBREqt4mTZ4fgp9w3S2
         5z5xt2JxHmhpaiBxAMPD9Atikv5fDbik5o6+Ez3C8yI358J8vhBvaZ5uY3SQUvpztGK5
         JbnA==
X-Gm-Message-State: ACgBeo0Dk/awAXKOxjswMcPfBqFSWwOU1dlX1NymK2vbEMyUql9Yv+ak
	ANrFzHn6ighLPCMusU1hZ3ds7jt8NME=
X-Google-Smtp-Source: 
 AA6agR4O0LmrtsHfUYEBFn+8LQlw5PJ2es154lYODyduEqw3frG1zWAkslf7E75aFBXz8SzDbIbEYw==
X-Received: by 2002:a17:903:40c4:b0:16d:d2a9:43ae with SMTP id
 t4-20020a17090340c400b0016dd2a943aemr30556069pld.57.1660197281571;
        Wed, 10 Aug 2022 22:54:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 e11-20020a17090301cb00b0016db6bd77f4sm14290483plh.117.2022.08.10.22.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 22:54:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/5] iproute2: Fix netns check during configure
Date: Wed, 10 Aug 2022 22:54:33 -0700
Message-Id: <20220811055433.819522-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811055433.819522-1-raj.khem@gmail.com>
References: <20220811055433.819522-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 05:54:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169231

Check would fail with compilers using -Werror since _GNU_SOURCE is
needed for this function.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-_GNU_SOURCE-when-checking-for-setns.patch | 28 +++++++++++++++++++
 .../iproute2/iproute2_5.19.0.bb               |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch
new file mode 100644
index 00000000000..04d44ef4442
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch
@@ -0,0 +1,28 @@
+From dc837a6b4c2cad7f31cddfe56cd652e26baadc02 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Aug 2022 22:31:03 -0700
+Subject: [PATCH] configure: Define _GNU_SOURCE when checking for setns
+
+glibc defines this function only as gnu extention
+
+Upstream-Status: Submitted [https://lore.kernel.org/netdev/20220811053440.778649-1-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure b/configure
+index 440facb..c02753b 100755
+--- a/configure
++++ b/configure
+@@ -191,6 +191,7 @@ check_ipt_lib_dir()
+ check_setns()
+ {
+     cat >$TMPDIR/setnstest.c <<EOF
++#define _GNU_SOURCE
+ #include <sched.h>
+ int main(int argc, char **argv)
+ {
+-- 
+2.37.1
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb
index c45920b0158..6a007797c95 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb
@@ -3,6 +3,7 @@ require iproute2.inc
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            file://0001-ip-ipstats.c-add-an-include-where-MIN-is-defined.patch \
+           file://0001-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch \
            "
 
 SRC_URI[sha256sum] = "26b7a34d6a7fd2f7a42e2b39c5a90cb61bac522d1096067ffeb195e5693d7791"
-- 
2.37.1


