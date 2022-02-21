Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F909C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 08:51:54 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.8716.1645433512940268849
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 00:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QXIT3JKP;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d3so10078983wrf.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 00:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M89MP8VBi3Cu6d4nkldikr9+x37Fj5pMY6jcop9QWGY=;
        b=QXIT3JKPB3xekKS9ElZnYL1+jvI8S/gAQ3vpNrwPIsV4WagMpu15hA63x0WYnIQRyL
         xfYTLxURGl4KFlZYO80YT8SDIGdPsU8j4M01yYTHRD4sP2GworJ9yfnV0j6TFpTkIg8h
         +d5haqQL0yhttxt+o+NXaVdvBx5N5JhsqIeXbGm7KTAPimI55K6sOzkgXuqNpH7pA1Et
         06HL/SzSWBB4+V6c40FyTosd135pGSFXyT3rGaPtQ6CtuULYEnicpoKGvmHPgT20sTSD
         /7LIfC6vt/WU0MXgZZ2LygJrSSt9Q1egpjL3iZpAagVdiF7njKyW8jl6pjtnyjmxx6wx
         iJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M89MP8VBi3Cu6d4nkldikr9+x37Fj5pMY6jcop9QWGY=;
        b=5P3W70U4rTXZmBCPeRSMWtICk2s+i2rC/4AXZmw2nn4LYcYwxVwMWMsItHIt/9Vdam
         xuepZjNpQjFH/vYx1193tLVXhHpcDA50CguP9krrqDAKKU0MX6kXf7V8cOPcvtQsH91j
         Ef4FZ2gLffFBFrXxMMlBOuDaxdd95IyxZcTIvyB2lXBbkRgnyo21qGqFVatFEUqdowB5
         GeCquNn9efqZmbd40fM1Ty/80/Oan04ZcXi1vpEyg3Vi0LzKfLP/5/w3HquargzGpmi2
         XfPsl7/gGeEm7Tulnie1WtQh6SP8ykKBU5VPgBbO/tw8dgJQGvqPia8tYsN2oHAyFsXe
         f/Jg==
X-Gm-Message-State: AOAM530knCDJmKD7M/qSzgATF2+/23788vsQqUjqeyS3PrG6R6VbK86E
	P71FYZXlqGtcePgqS78XrqtGlpHuHF8=
X-Google-Smtp-Source: 
 ABdhPJy+yH7MucIdFsycIg5N1/c1GCKsDxFB5poVUbY/Scq5pDsoh3B5EjKpU5K+7GQhmyVxrpu6/w==
X-Received: by 2002:adf:e904:0:b0:1d6:64b3:fdd with SMTP id
 f4-20020adfe904000000b001d664b30fddmr14817267wrm.200.1645433510919;
        Mon, 21 Feb 2022 00:51:50 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 x11sm6843110wmi.37.2022.02.21.00.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 00:51:50 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 1/2] meson.bbclass: add support for running the meson tests
 at build time
Date: Mon, 21 Feb 2022 08:51:17 +0000
Message-Id: <20220221085118.2267900-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 08:51:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162019

The generic exe_wrapper introcuced in 40349dc5 can be used to run the
meson tests when build the receipe. This patch add the meson_test task
on the meson bbclass that adds this possibility.

The exe_wrapper will run using the qemu usermode and because of that it
has some limitations, so don't expect the same results when it runs
natively on target.

Running the tests at build time is upstream way for testing but is not
possible in OE as we always croos-compile. This can be useful in some
integration processes and for debuging and it adds the possibility to
run the test in an interactive way using the devtool build for example.

There are two variable for that:
 MESON_QEMU_WRAPPER_TEST_ENABLED: this enables the test when it's "1"
 EXTRA_OEMESON_TEST: this is used to add extra args

Some results when using this patch in the bigest meson project
on OE-core are the folloing:

cat <<'EOF' >>conf/local.conf
MESON_QEMU_WRAPPER_TEST_ENABLED:pn-systemd-boot = "1"
EOF

bitbake -c do_meson_test -v systemd-boot

Ok:                 821
Expected Fail:      0
Fail:               95
Unexpected Pass:    0
Skipped:            33
Timeout:            0

cat <<'EOF' >>conf/local.conf
MESON_QEMU_WRAPPER_TEST_ENABLED:pn-glib-2.0 = "1"
EOF

bitbake -c do_meson_test -v glib-2.0

Ok:                 197
Expected Fail:      0
Fail:               76
Unexpected Pass:    0
Skipped:            0
Timeout:            2

cat <<'EOF' >>conf/local.conf
MESON_QEMU_WRAPPER_TEST_ENABLED:pn-gstreamer1.0 = "1"
EOF

bitbake -c do_meson_test -v gstreamer1.0

Ok:                 95
Expected Fail:      0
Fail:               10
Unexpected Pass:    0
Skipped:            1
Timeout:            0

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/meson.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 0bfe945811..020a59a3c0 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -179,3 +179,19 @@ meson_do_install() {
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install
+
+EXTRA_OEMESON_TEST ?= ""
+
+do_meson_test() {
+    bbwarn "don't expect the same results when it runs natively as it will run in qemu usermode (that has its own limitations)"
+    meson test -C ${B} ${EXTRA_OEMESON_TEST}
+}
+do_meson_test[vardeps] += "EXTRA_OEMESON_TEST"
+
+MESON_QEMU_WRAPPER_RUNTEST = ""
+MESON_QEMU_WRAPPER_RUNTEST:class-target = "${@d.getVar('MESON_QEMU_WRAPPER_TEST_ENABLED') == '1' and d.getVar('EXEWRAPPER_ENABLED') == 'True'}"
+
+python() {
+    if d.getVar('MESON_QEMU_WRAPPER_RUNTEST') == 'True':
+       bb.build.addtask('meson_test', 'do_install', 'do_compile', d)
+}
-- 
2.35.1


