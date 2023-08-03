Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFA7C04A94
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 14:04:38 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.15485.1691071469484917296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 07:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ywd55ZfI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-686d8c8fc65so707302b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691071468; x=1691676268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3q2TvlqBL5E9WSf2WSvGE6v6Xd/MliipGbQrMkq6ZY=;
        b=ywd55ZfIaTTH5hJq9PKpW7r1PXOl0DhaL26XyObISb+BNKdZqa7VwgybkpYDQoOMzm
         baxlOjH/lIgCE+nNJP8W21u8gCI4YxMRpuGIO7che0hjurqD7Q+cDLA2f3EZDiI1AiBT
         K6O0ObCPd1UQSq1xt08jZeqS6mXKH4NPpyR4HeQf31Vji9T4/exBjFIjpZk5yVWlp2BT
         wgK6odXGjOoPM7gG4QGSTI7++4Wum6u3THVWtu0jJoIaYVvqBmE9tO94ydTXy1IfEFww
         JuYEzcl6/XYPkzGGqxkyUjCEv/12HsSFE2EqPqwYVmpHZcQiDoxEVTFfON5L0Oh150vf
         TMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071468; x=1691676268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3q2TvlqBL5E9WSf2WSvGE6v6Xd/MliipGbQrMkq6ZY=;
        b=lC5QSDG2VhcQnju6iOYw/50VDTrl+hmK+UUicee+dmryDlFx7SLXbt2qNPd/YRH4eV
         qFiGkF8t1WrEgsqR9WiDot2TG2FY2cbkH/Zvx9iom/9R6HdykYVJUrfV0EyQ6UH33fUz
         5stsu5o4O1ITlp809Dt35mIwqohjpdSNlWPpce/WNShhODq4FHLFpd/aK9r5YEJr/yu4
         T4xsrs59PnicMp0J/IpvBr0ZsKeaL0sChZCwdlN/CWPQvtkxNnqoyIqUy91UX3nTdOAe
         LSHiG3j7q3WmAVA1RPQxIOM23mLFwjWENH8eNxrRmJAdgbME4L3ul1kdLh3ZoMRDEE2x
         Cp7w==
X-Gm-Message-State: ABy/qLaU1naLW8zytMKRVG5rbY7EE0ZJewYX2Kh0Qkwd9A89GPYC4u6F
	+hcPgGpGPC+5zBE8os0rP4qMACjSl/NzUz78xLw=
X-Google-Smtp-Source: APBJJlFRsVSwNMkjKZ/cplzWiNisX0d4wqw7P6WtpoXM7BrgaGYrLsZCRWiWp7C7/IGJQPzCnaTjBw==
X-Received: by 2002:a05:6a21:498e:b0:12f:dc60:2b9e with SMTP id ax14-20020a056a21498e00b0012fdc602b9emr17813802pzc.48.1691071468503;
        Thu, 03 Aug 2023 07:04:28 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm12866242pfe.75.2023.08.03.07.04.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:04:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/10] qemu: fix CVE-2023-3255
Date: Thu,  3 Aug 2023 04:04:08 -1000
Message-Id: <52711b1392ed0c5cbe4ddf70a94b21be2f4e6e58.1691071255.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691071255.git.steve@sakoman.com>
References: <cover.1691071255.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 14:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185483

From: Archana Polampalli <archana.polampalli@windriver.com>

VNC: infinite loop in inflate_buffer() leads to denial of service

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-3255

Upstream patches:
https://gitlab.com/qemu-project/qemu/-/commit/d921fea338c1059a27ce7b75309d7a2e485f710b

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3255.patch             | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d5d210194b..83959f3c68 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -95,6 +95,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch \
            file://CVE-2023-0330.patch \
            file://CVE-2023-3301.patch \
+           file://CVE-2023-3255.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch
new file mode 100644
index 0000000000..f030df111f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch
@@ -0,0 +1,64 @@
+From d921fea338c1059a27ce7b75309d7a2e485f710b Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Tue, 4 Jul 2023 10:41:22 +0200
+Subject: [PATCH] ui/vnc-clipboard: fix infinite loop in inflate_buffer
+ (CVE-2023-3255)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+A wrong exit condition may lead to an infinite loop when inflating a
+valid zlib buffer containing some extra bytes in the `inflate_buffer`
+function. The bug only occurs post-authentication. Return the buffer
+immediately if the end of the compressed data has been reached
+(Z_STREAM_END).
+
+Fixes: CVE-2023-3255
+Fixes: 0bf41cab ("ui/vnc: clipboard support")
+Reported-by: Kevin Denis <kevin.denis@synacktiv.com>
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Tested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Message-ID: <20230704084210.101822-1-mcascell@redhat.com>
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/d921fea338c1059a27ce7b75309d7a2e485f710b]
+
+CVE: CVE-2023-3255
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+
+---
+ ui/vnc-clipboard.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/ui/vnc-clipboard.c b/ui/vnc-clipboard.c
+index 8aeadfaa21..c759be3438 100644
+--- a/ui/vnc-clipboard.c
++++ b/ui/vnc-clipboard.c
+@@ -50,8 +50,11 @@ static uint8_t *inflate_buffer(uint8_t *in, uint32_t in_len, uint32_t *size)
+         ret = inflate(&stream, Z_FINISH);
+         switch (ret) {
+         case Z_OK:
+-        case Z_STREAM_END:
+             break;
++        case Z_STREAM_END:
++            *size = stream.total_out;
++            inflateEnd(&stream);
++            return out;
+         case Z_BUF_ERROR:
+             out_len <<= 1;
+             if (out_len > (1 << 20)) {
+@@ -66,11 +69,6 @@ static uint8_t *inflate_buffer(uint8_t *in, uint32_t in_len, uint32_t *size)
+         }
+     }
+
+-    *size = stream.total_out;
+-    inflateEnd(&stream);
+-
+-    return out;
+-
+ err_end:
+     inflateEnd(&stream);
+ err:
+--
+2.40.0
-- 
2.34.1


