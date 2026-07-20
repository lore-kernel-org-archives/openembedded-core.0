Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92724C4452E
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:47 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2873.1784568220517457057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GrRzazM0;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so21268755e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568219; x=1785173019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9o08X+G13e3CPQ3dhVCRbaI29HN8mR7+803YGLWAKHU=;
        b=GrRzazM0wKRV/en0i3xy+q+hBrFfKRt3fT3OOyneL795SPbwYxHPdPZq+ICqzvFW0h
         AaSKx5o3wULy8EOd5XOXL5n4P97RI3AeOIDkMsDk8QHlPE3XMMrKV/lOPkw6q/qofoXK
         pyBc3aCQjFwkfWkaRY5dN5aI5FtNtonZ8m8uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568219; x=1785173019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9o08X+G13e3CPQ3dhVCRbaI29HN8mR7+803YGLWAKHU=;
        b=c99MbwCf2kEKuPjdJq5ZhDltPta5kqpm+GGl0TxtXfrQIQ0ldWyoSYl66leiotRSlM
         YkSacZ+R3EKrYA+E7OOoIMQIjP0RfmhDCK7J+ySmvWUupkeJRTAFot/fTPJP7jzt2YDt
         o0DoDkVVFxNTulge8Y9nWIunhBFClV3Xo/ikJ4vDfPJzY2lhNSenJW+KvIJIgN6qLqPF
         FtE9XoHhbVdnyiCJ7OO04dz5+/0/I0/cRzcqTO89aBJR0GZowfrl0L+bwodp2EY/debD
         JUjp0F3Vf2RTu6P+7B4QMjthDK178R3ds5RZG1Hrgf0k7Cpq3g9j2R/U2BDNI8JktkPJ
         WxWw==
X-Gm-Message-State: AOJu0YzKDlLaVRceTyEQwuYn6fdhubQDzRcCUGKXoXhzWFZvP3HTn3RQ
	AnhwkP/zJ4fDuF5xamTPp7zzxA+yRK/Y/PFowDF8gM8DYJdUsmR8zIVOlVvEYOT58UyawmPMmDD
	3430yECo=
X-Gm-Gg: AfdE7cmgB3HwSeVzKfquFrNxO4KC4KuVIo7D9yWmXZh5Wv/DzEJ1qtIzerV2raWj6e+
	BNd8hqsysasOpoWW2cHVzOjJKZnwGF1/naUUYKZF9vAN1BlVIdZRl7awZRDYUFoK1FQCemhtKFs
	XzCm4niI23A4Dt7QiitH7QMztL+19vdK+2a9pglGMtGbcU7tXY8ItkR0N7wPyJNTt2KMlVZIo9c
	K38zKuu+DdobivX719dainBGlKrBgeHHzBM8VbIEG7y42goz4zQJP0kHRMrcCh84ojOyC9bKxnH
	u3pr+KA8MAmEomA6OnrJE0hRsGd3x844c3OJZQIQr8XbAb/8sS70R37rY8fInnCnG5FJEshoAK+
	jzp8s/uDZvfSBvWaZWZJIUoItAUJJ1nIKGnjbi/4lBJtWaKExb3Bj+qHtDk05cC6NWrIoQFDtcV
	wiL0eJ+c+C4a/+7iyVaziVAaNUopXQ0RKNWVNSgSyW2hYxGi9TjGQvtFMYTKbcFAFj7Twm+qTmN
	vwKGT/p
X-Received: by 2002:a05:600c:a010:b0:495:5365:c0d9 with SMTP id 5b1f17b1804b1-4955365c1e7mr114382795e9.16.1784568218534;
        Mon, 20 Jul 2026 10:23:38 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/33] rootfs: move tasks using image_list_installed_packages to postuninstall
Date: Mon, 20 Jul 2026 19:22:49 +0200
Message-ID: <907a507bd0b1874b03222dd3ef1d98b30e088c34.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241450

From: Peter Marko <peter.marko@siemens.com>

Since some packages can be uninstalled, any task querying installed
packages should be run only after both installation and uninstallation
is completed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: c3097962ac925538e99b17b771c541950a8b8c26)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/license_image.bbclass | 2 +-
 meta/classes/vex.bbclass                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index b18a64d2bc3..e934c74d246 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -294,7 +294,7 @@ def get_deployed_files(man_file):
             dep_files.append(os.path.basename(f))
     return dep_files
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "write_package_manifest license_create_manifest "
+ROOTFS_POSTUNINSTALL_COMMAND:prepend = "write_package_manifest license_create_manifest "
 do_rootfs[recrdeptask] += "do_populate_lic"
 
 python do_populate_lic_deploy() {
diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index eac68ca6289..97213ea3497 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -229,7 +229,7 @@ python vex_write_rootfs_manifest () {
     bb.plain("Image VEX JSON report stored in: %s" % manifest_name)
 }
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "vex_write_rootfs_manifest "
+ROOTFS_POSTUNINSTALL_COMMAND:prepend = "vex_write_rootfs_manifest "
 do_rootfs[recrdeptask] += "do_generate_vex "
 do_populate_sdk[recrdeptask] += "do_generate_vex "
 

