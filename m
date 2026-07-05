Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A1FC44506
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:19 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139235.1783291394613748637
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s6xdUjEF;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b77b150aso22247285e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291393; x=1783896193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bOuOOoAGKk0vBEWi1vx8bdQ2KXIOQykAgQtRvlYbGpg=;
        b=s6xdUjEFk/PDOio6Altiyds2L92gUUj9VzeJ9iSHCJ45h4pLBiYh7lr2JHe8j1qonK
         unD9/ENK3TVDiiapZnSyYzJvzPiAUs1LS8OTt7WGbgZlIzv8dZjIQHIugGwKMQ/mhOGf
         4/Q1SZYYQD20b5JSZ1smfPth+fsWc23G9e73g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291393; x=1783896193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bOuOOoAGKk0vBEWi1vx8bdQ2KXIOQykAgQtRvlYbGpg=;
        b=H80LQAsfnchqYKyam6aKJrUk8QVzicrpMJyMZGbJSwH08Dp92L9dxZ3XYORBZp/Rit
         /FQyumCvw+LpJ7zhd/r50DLwoK/p0x38Qz2Lx/iO/bAYhBk9AISPIF9j8tHGY7xWeXXA
         /noWvy6ixcTCmtjsnKVUQ4NScMBzphLrq6CSJqrQwYpkTzEeV3CYL6cmEOfIm6/G+S5N
         RGeuuwDs6zNsroHkN7aOUdrep0CeZpXpTYIp/wlj4HCel901pJp1Aukh/acSvLGLbPiN
         cU5RCtzr9cp03yyq8+scbwWy7v+3pZQl45hcuUuJ9dhsIhHgCjWi4CKk+JMa+rmt/NYQ
         N//w==
X-Gm-Message-State: AOJu0YzGxEyMUsc62tGmfLGJz9deOQRC7ZlzTfjs/sdqgUDtdXzOx31d
	g/F9jpOgcbVZknHtIX+JZFKbPdNs4wmf88GhzKoemyfkJvpljzinZEBHH2tPU2uXOhDHPW2PPbA
	EinpT3ns=
X-Gm-Gg: AfdE7cloFdrENwILpzX2cUH9I+CYi5a7q8C0YJDlSZPo4uN+kEgqnF5HNGR49ZYdrwd
	a7bdk96pPRNpCyK5l1xezvBj+L4wKqOaOUOnfbs8BIB4y0Jb83O/nWiq50o+faGfALgXBvsMl9E
	o5ICDgSxd67IdrmtEYUfln2oxk3NT2ZnaA2CMpIw0rc4dnX0+2lGKIJj5l8hDCRom3AK4wZSMrP
	Tibst27QYFK/Mq/zrLIksYbO1C7hNwsfPcNQCIkeXj+FYiOqJSp/GH2tmxtOmL8pmt2SS/DQFU2
	KlLFBsIIyRtEE3SW2b9J2Y0NAIAJpJXMoX9WQqblDZEKOsyFYkI5Lpt6kkBfXSFk3GQh/nymuV/
	BjTWQbLdVJcfBiP4BDfQ1txjbd3Ev9q55LqOJ+TSsrwkcSbGo7ekwlgAmS/YbRaM74JivstRv96
	So0zM9h0p5p2jTLhGX1e76HmaTWA==
X-Received: by 2002:a05:600c:4e16:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-493d11cf42cmr88012325e9.4.1783291392800;
        Sun, 05 Jul 2026 15:43:12 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 49/55] dmidecode: fix x86-only tools being installed on ARM targets
Date: Mon,  6 Jul 2026 00:41:39 +0200
Message-ID: <83a9c96c6fa8f8d73f741af318c983dbf2edb444.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240203

From: Wei Gao <wei.gao@windriver.com>

The dmidecode Makefile uses $(shell uname -m) to detect architecture, which
returns the build host's arch (x86_64) during cross-compilation. This causes
x86-only utilities (biosdecode, vpddecode, ownership) to be incorrectly built
and installed on ARM targets.

On NVIDIA Tegra234, running biosdecode triggers a flood of CBB fabric
DECODE_ERR interrupts (23,568+ printk messages dropped) by scanning
non-existent x86 BIOS memory at 0xF0000-0xFFFFF.

Fix by passing TARGET_ARCH to the Makefile's MACHINE variable, so it correctly
detects the target architecture and skips x86-only tools on ARM builds.

Signed-off-by: Wei Gao <wei.gao@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 06a28d3a0a83551e0a75441ad2477ad7d2be98f1)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/dmidecode/dmidecode_3.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb
index 93c3678d9a1..5c70765051d 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz"
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm|powerpc|powerpc64).*-linux"
+EXTRA_OEMAKE += "MACHINE=${TARGET_ARCH}"
 
 do_install() {
     oe_runmake \

