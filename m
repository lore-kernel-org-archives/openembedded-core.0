Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96B9C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:00:22 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.23112.1750176021059855018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=o+2/7Vq1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235ea292956so54415135ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176020; x=1750780820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MtXEg1UdNJIMk4RnmEBAE5kO5viPf2g7JpTxP0URhg=;
        b=o+2/7Vq1L3UpONIpWmz6MrvhbKjXNN4Z9/+p7p/sZMwURYL0u2V7J04k+bFs57lSo4
         BY6QJL5upugVCfZUSXZIGdqXIECHTyGL8oqM1MwElcUNfi3ZmgCd+9XfOEqySsAd+q5S
         5bG0gvatCMmxDPQffIwvumikrEdbFtv7OaGGa9/HgSxCPzSPEk502RopXjfVtIe258O8
         FUeut+7mMJue6ZZpGRZpQAaxMwTJx+Uu0pA0g0bhHPGzhID7tuJWnQctaUovx07dpz0/
         +rdrhNUlwyWrimDaDyQrc314D/LHlcS3nXMazfnJ1BTpneHl3MlMAoLtOwaRJmbbsWS4
         OI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176020; x=1750780820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MtXEg1UdNJIMk4RnmEBAE5kO5viPf2g7JpTxP0URhg=;
        b=wH3H4PkGd2f6TKzvNgZq/VNoDYUX/qydqKwGSH20jyTcButKKT1kIYMDlPMtKT7R/z
         gOWe1+WVBDAtb4/PEs7CZgiNLYxOFJ0tf5jiqFC52uKuiNIEDV6uOu54eyvCB6YU2DI5
         6gmr8mGW0lenS4PvCKYu1XZNBqAjjUc617Q3oaD6FrTpmBHp8itSDbonGrcFWBOumu8E
         XdLqtPXIsUhWXdD0dGdUly46jnB31SrKiqccdA+aLj+eqpyo9HJ4lOg6+G/RO1dQJQZ1
         IziIpOWYINrqzfKvzMbgs8wMfazDH7ba9wnskrJqsacgFKE1UZNorfiz4NheUAwOJFoZ
         RtiQ==
X-Gm-Message-State: AOJu0YwIQ9D0k3/U4Evjokx2BcerctO+GAZLCnNXCANiEfh/37s6i2uw
	+7tiBq7Iu2LMDa/UvudC4pujUghTDm1bE1FQD8tJy/1e2VlYddyZpYHaqHHHIMiza43OAx+/5yb
	SDhbr
X-Gm-Gg: ASbGncuEfDOfSpscDu39wH0fZZG/PNXWwPBUqLO1Qq3ayhpfmpVV7GSpCjiBGKjevu0
	1uZLXkSQVnKNgswr/73570OSMXbz/lDJxHlSQPe6EF+qam/FiR4kyUCTC6gGgnTNvngSrvL5JpN
	ZCgufKgG0gHTPH5Ydg7wYp5+dUnah4w3PoC/vq7LDZpJzmXQaVAuGN1C8HtK4G6FnL7MVuSvcEx
	3dl0lA141HyCoIcxdHAOSzkd8xoYIehHYxjyvLlaAdvHmnaLBW06vwHbxC01nVoWAftTXJ1dBib
	icetbghkCC3ar592hZhp8yL51GBuHXep7/R/DVgHyGoXx5t/5yC60g==
X-Google-Smtp-Source: AGHT+IHiKO428YosNxV3B/FQTvDUJ/jDRzyQos+2Rs4tB0ZF4M+TyfvkFbCZbJqHeGww+vU/V6FuXQ==
X-Received: by 2002:a17:903:120f:b0:234:8eeb:d834 with SMTP id d9443c01a7336-2366b006032mr203302885ad.16.1750176018938;
        Tue, 17 Jun 2025 09:00:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm81475515ad.146.2025.06.17.09.00.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:00:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 10/12] util-linux: fix agetty segfault issue
Date: Tue, 17 Jun 2025 08:59:50 -0700
Message-ID: <e9cfc549091b77d08817eb7235076c7a0c20e4fa.1750175857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750175857.git.steve@sakoman.com>
References: <cover.1750175857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218897

From: Yongxin Liu <yongxin.liu@windriver.com>

Backport a commit from util-linux upstream to fix the following error.

agetty: segfault at 0 ip 00007fc65600295c sp 00007fffa8dd67e8 error 4 in libc.so.6

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...tty-fix-stdin-conversion-to-tty-name.patch | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0003-agetty-fix-stdin-conversion-to-tty-name.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4e8701ffdf..cbf148073b 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -40,6 +40,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://fcntl-lock.c \
            file://0001-cfdisk-add-sector-size-commanand-line-option.patch \
            file://0002-sfdisk-add-sector-size-commanand-line-option.patch \
+           file://0003-agetty-fix-stdin-conversion-to-tty-name.patch \
            "
 
 SRC_URI[sha256sum] = "5c1daf733b04e9859afdc3bd87cc481180ee0f88b5c0946b16fdec931975fb79"
diff --git a/meta/recipes-core/util-linux/util-linux/0003-agetty-fix-stdin-conversion-to-tty-name.patch b/meta/recipes-core/util-linux/util-linux/0003-agetty-fix-stdin-conversion-to-tty-name.patch
new file mode 100644
index 0000000000..2766ee2c0d
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0003-agetty-fix-stdin-conversion-to-tty-name.patch
@@ -0,0 +1,40 @@
+From bd6c104f931329ce6fbc5a1250c8c80a1d8223ee Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 24 Feb 2025 13:37:04 +0100
+Subject: [PATCH] agetty: fix stdin conversion to tty name
+
+Addresses: https://github.com/util-linux/util-linux/issues/3304
+
+Upstream-Status: Backport
+[https://github.com/util-linux/util-linux/commit/bd6c104f931329ce6fbc5a1250c8c80a1d8223ee]
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ term-utils/agetty.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/term-utils/agetty.c b/term-utils/agetty.c
+index aa859c27b..0dfe52c90 100644
+--- a/term-utils/agetty.c
++++ b/term-utils/agetty.c
+@@ -928,11 +928,15 @@ static void parse_args(int argc, char **argv, struct options *op)
+ 
+ 	/* resolve the tty path in case it was provided as stdin */
+ 	if (strcmp(op->tty, "-") == 0) {
++		int fd;
++		const char *name = op->tty;
++
+ 		op->tty_is_stdin = 1;
+-		int fd = get_terminal_name(NULL, &op->tty, NULL);
+-		if (fd < 0) {
++		fd = get_terminal_name(NULL, &name, NULL);
++		if (fd >= 0)
++			op->tty = name;	/* set real device name */
++		else
+ 			log_warn(_("could not get terminal name: %d"), fd);
+-		}
+ 	}
+ 
+ 	/* On virtual console remember the line which is used for */
+-- 
+2.46.2
+
-- 
2.43.0


