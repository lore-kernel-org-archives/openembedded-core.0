Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09D8F46119
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:51:05 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17885.1774273861321649057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i99GJvqK;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50917e02472so34684121cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273860; x=1774878660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9pBM3fXXbQUEt3xV5RGWVqnlIf1pd4H5pBSQPtFc5E=;
        b=i99GJvqKK0d1fb+BCUu8Xu/ts4G87Zp4uQO5e+BcL4q5iaOZbukMF5MUB6UekDDA4K
         olx+UHW919ctzm5teDo5JSMgn0Bpv7IUh87Lr1OfwVLc83QMzrEip2bdNZ87qEWZAM6y
         ET9zh65z2gTPzWk55i11kEF+dlgzaatloorWl+YLdgtzYnhYZABHg7YaQQrPFuhKl/dG
         sjWEEVonbz4+JRMgqt9gvSRtoFxiXN0bUy3GmVnLiTZyeyJuwRM9C/Ysdj+z3Z1E4Ejx
         Y2isEmdFYj1UuzhnqRxU8Drv3T3QZKhyUCUffrUucs7CIPyjgh7Wo1TeBMBHA3g2jW2x
         0rTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273860; x=1774878660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N9pBM3fXXbQUEt3xV5RGWVqnlIf1pd4H5pBSQPtFc5E=;
        b=KX71xiO9R+DEW1PwW6tUgN9R8soX4FZvWZRXRwhPVYtrdW6b4g3ktNFyiH/BFO7o7m
         bm+ti1x8z8IPCR+CQmMCS9sxz1b47PWb1owZ/vrC3CPDRiDdi2yApwojQiHgrD5+920F
         eBoph9xHk6uUqxUbHW5e7FHKH9069Y44FQsMuhUVmyrQB1yBFAqhWB2PQbiDZAcCsBz7
         denyudUtcerp/fsil6D5RHRh1eCXfZPbhFhEZexZuF0lMSuN/n8ZTTcSuIOXN7cSTQYz
         apJeFjKMCgXxXI7ibKVrXph5orRWcVm0KaLwqRbEdgUlsXr27q8EUfxfuS8AuO6icew4
         Td1g==
X-Gm-Message-State: AOJu0YwPosCX64ezhqcQUj1Ew5jXu5dY9uIS/BqX4n1o5GgHE2xiJmr/
	nyg4+oHSQUTg/kCJ9y6/g8Z+F8BJalvruDkQzs9R0kvGroRlIVsJax0Omm9nC26M
X-Gm-Gg: ATEYQzy8PjTErpc2wX9qN8DlYDVWxQWCMy8uZjJjRsjcST+SiVpQuI2e0Ohf2YPbuJM
	vKP9nTpQON1OS5ItpdvCPjURyXjretvGUADd+xdFR/mzTBhJDtoOsXw7eXcuhMZ3P+FKP98RjMc
	j506WG8M2lBDZwDmKJj0tZd/SMu57KI6N0GZ+AAQxIOOOhrGZD0Ieflz0XbiEm+h4d5N6TCVnSm
	NGSsUfAmYurs3bd0H+2zr92CEEevYmeHz8k2VhmR8SfUbfb1w1JcN77BfjS/vkqF4Jq3YVQJ8vl
	RNoYwHqQCIGht5TZTI4ekiDzCcIC8rYXIMfGpPL1K64lr+popqTt1FxfS/h+MBD1ox1kgjP0S7J
	QjJZkOjE2QFJIGP7fsjebOg+LkcGJxW4vuMm55tQPhSxzVYrMp8U8fWezIhN9Ls9nysSB4deSun
	1+z5PYoukSPGnXixj3r2Vs4SCCOXwzJDzpfPRPQlqyHrdiDueXe66o1aUVwaGMWj+Qk2cXwnRpt
	/hiEGUCFY3b4J+g3j0AjBj0TA5drDJZqQtmQiyeWAeaymRpm/IjbRnUgqA=
X-Received: by 2002:a05:622a:1801:b0:50b:51ff:9d1a with SMTP id d75a77b69052e-50b51ff9f60mr92789701cf.70.1774273860171;
        Mon, 23 Mar 2026 06:51:00 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b664cddc3sm17232041cf.5.2026.03.23.06.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:50:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 01/11] linux-yocto/6.18: genericarm64: enable additional qcom drivers
Date: Mon, 23 Mar 2026 09:50:47 -0400
Message-ID: <20260323135057.1605923-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
References: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233720

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/2 [
    Author: Srinivas Naik Banavathu
    Email: snb@qti.qualcomm.com
    Subject: genericarm64-pinctrl.cfg: enable CONFIG_PINCTRL_QCS8300
    Date: Fri, 20 Feb 2026 15:53:42 +0530

    Enable QCS8300 pin controller driver

    Signed-off-by: Srinivas Naik Banavathu <snb@qti.qualcomm.com>
    Cc: Bruce Ashfield bruce.ashfield@gmail.com
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Srinivas Naik Banavathu
    Email: snb@qti.qualcomm.com
    Subject: genericarm64.cfg: enable CONFIG_INTERCONNECT_QCOM_QCS8300
    Date: Fri, 20 Feb 2026 15:53:43 +0530

    Enable QCS8300 interconnect driver

    Signed-off-by: Srinivas Naik Banavathu <snb@qti.qualcomm.com>
    Cc: Bruce Ashfield bruce.ashfield@gmail.com
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index ae06d6ed0d..1b0eb015fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -16,7 +16,7 @@ python () {
 }
 
 SRCREV_machine ?= "9bd60c36af4be5a5905bb5408325961475e66880"
-SRCREV_meta ?= "9b173d3a50825b8bffbb62ac6e504a7a56312e2e"
+SRCREV_meta ?= "0b1ea0e509501b1bd4ba5ea8ccb2f3daf525ddec"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 619fc8a59c..6782de4950 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -19,7 +19,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
-SRCREV_meta ?= "9b173d3a50825b8bffbb62ac6e504a7a56312e2e"
+SRCREV_meta ?= "0b1ea0e509501b1bd4ba5ea8ccb2f3daf525ddec"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index f5ad28780e..a74520fcaa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
 SRCREV_machine:qemux86-64 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
 SRCREV_machine ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
-SRCREV_meta ?= "9b173d3a50825b8bffbb62ac6e504a7a56312e2e"
+SRCREV_meta ?= "0b1ea0e509501b1bd4ba5ea8ccb2f3daf525ddec"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


