Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCBFC4332F
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 13:50:45 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.8303.1633096243650002882
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gDI3fz00;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id j27so7319145wms.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UVIXZWnFRU4CCeIIeXAa/q3KH6cTmqxw9Whp84K2apc=;
        b=gDI3fz00j3mn1ZuNLryirkkKVOxG36FuXFis93SBroOkxSQnWq7PRbSg3EksbOaoxX
         FStJW2/Or2Bw8/d4bPXQxWw2MHbFY3zdYdJS76hLg1dRcFbnzA3yes+6/rLk+tqKUU1u
         yS2OQ09OjO8gck+XgeNq/tEuXukKUjkXx0478=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UVIXZWnFRU4CCeIIeXAa/q3KH6cTmqxw9Whp84K2apc=;
        b=kkB9X6z0GLkg9FF23mj/G/mX4Py4WTSSUuKOs/T7+gxNdxJBD5zQGjSjeKU1/IY5oH
         WKb6NJ3VkXWNa4XQtKmfkkm9tDLct1a/lq//afORH0xEwApdP8ipOl58zcoe7SAmTy74
         kl7PmAECng9Jm/ibASYTx39JF3oPk2GwGli7TiDcu4cj7YJ18LWhz5d0bgSjIQ3i4lbP
         2xCWCiJh7qcwawSQlgqN5maZqOAPOzJU2w1rN10Gm3DMDAY4hC8FHNKjEB+KNMO9/RAW
         Bkz+SS4yBH0pKLMW3F2smojQt93WtnEs5dJ7M7OfHexRnbikjfpG8ZqUgQ4AC2DcWl38
         eJzw==
X-Gm-Message-State: AOAM531V3OiLvDOOjDH3xRM1N/c5Z8Nw8++s+P2jpqpiq6hZrU+H1HdA
	2xJRlu6rHO/YuAc9HqGP1LwA7Jp+OT6x+cas
X-Google-Smtp-Source: 
 ABdhPJyQw429k9zHbdv2j50C6Akc7MJQEZKBM2eS3FWairNAwakTUbfthg2m1/2gM2wFFV9TaKgjNQ==
X-Received: by 2002:a1c:9dcc:: with SMTP id g195mr4649179wme.70.1633096241764;
        Fri, 01 Oct 2021 06:50:41 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:415a:6029:9a90:9863])
        by smtp.gmail.com with ESMTPSA id
 o19sm6193155wrg.60.2021.10.01.06.50.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 06:50:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] rpm: Ensure compression parallelism isn't coded into rpms
Date: Fri,  1 Oct 2021 14:50:32 +0100
Message-Id: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 13:50:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156517

We don't want the compression thread numbers to be encoded into the rpm
since this results in the rpm not being deterministic. Add a patch
from Alex Kanavin which addresses this issue (was queued for rpm 4.17
but we need to fix this with 4.16 too).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...not-insert-payloadflags-into-.rpm-me.patch | 28 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb     |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
new file mode 100644
index 00000000000..79b168257ee
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
@@ -0,0 +1,28 @@
+From 2d351c666f09cc1b9e368422653fb42ac8b86249 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 31 Aug 2021 10:37:05 +0200
+Subject: [PATCH] build/pack.c: do not insert payloadflags into .rpm metadata
+
+The flags look like '19T56' where 19 is the compression level
+(deterministic), and 56 is the amount of threads (varies from one
+host to the next and breaks reproducibility for .rpm).
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ build/pack.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/pack.c b/build/pack.c
+index 932cb213e..b45d0726f 100644
+--- a/build/pack.c
++++ b/build/pack.c
+@@ -328,7 +328,7 @@ static char *getIOFlags(Package pkg)
+ 	    headerPutString(pkg->header, RPMTAG_PAYLOADCOMPRESSOR, compr);
+ 	buf = xstrdup(rpmio_flags);
+ 	buf[s - rpmio_flags] = '\0';
+-	headerPutString(pkg->header, RPMTAG_PAYLOADFLAGS, buf+1);
++	headerPutString(pkg->header, RPMTAG_PAYLOADFLAGS, "");
+ 	free(buf);
+     }
+ exit:
diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
index 189da924366..60181f26c70 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.16.x \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
            file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
            file://0001-tools-Add-error.h-for-non-glibc-case.patch \
+           file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            "
 
 PE = "1"
-- 
2.32.0


