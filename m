Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC1BC433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.4635.1642588890863803429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cMI748l+;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so4941914wms.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7/fBT1vgnN1KmXACLnW/54oEymoEP/t3Acr0bRwczzs=;
        b=cMI748l+2yJHBwGjRfLBDZ63D/EBknVTQBy7fHuCjbz8h61zbKMrw6+cQvRuuSoTV0
         iVUnvrrHA4PHhSpkZhXDwypEL/vFUZGqQc8+1w4kSWVdcP+Qmi5qNDLkD/ybuTaTDljB
         zEbsjyyANnuSH2yRfRlZS/MMXI/Q2VIhsCAM9br2dn6KEIpOdFBQK6wPu/ZgvxqHqtDH
         WBWWES2nfV4sDdBmc8d5xolWteXYAuIvzMrXAKu3XrtlG1EqSX4ssXSHF3eJqyxf/ghD
         dRBtHWuQlM03XZqwmoLwxnyL0CtKoUo0A6L5i0NqoLD5DA0Z85n26glk3UhSex3IlsLT
         s4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7/fBT1vgnN1KmXACLnW/54oEymoEP/t3Acr0bRwczzs=;
        b=OUaojuC/kdt2qN3mf97J1lDpgW1cyf9/4PlcFzA4AUDvnVny2QA0VLnG1iy0d7lJUn
         pDITHYn6uuxZ9GPMZsyZgCmxGUDBCY4nELTEfYuuWyX6Zqq8B/AnzAI21my4JkYGlLYF
         ItzJDO29BL72zng5g5kmFkug1+uSQN3d+9SVPsJ3m9j/6LEXncSdXQT2G7aTNfAR6453
         suV3HuCB19LjWg5sslolRIj4epd7pHpl0SCnYWCxpqqzus7yp8yfkZQoLbwyxO9A8UO4
         HvsKLNEzucU+GND9jpw1TZRsiGRfFGPC8t1jiqwjO+/29VTltC7PAMhE+s9Hxk6Rgiji
         CVTg==
X-Gm-Message-State: AOAM532tC9//IfXvc2Cuhhwb28cpLhwyJ5+6nNQ+0dg6J3FAd6DuKRXf
	bsZQbsQHvE6AaXATubmshG88apVF9jE=
X-Google-Smtp-Source: 
 ABdhPJxZ3oDMO+JXmNWlpC14trwfTVe88K11ELQro3Jw5i02BLDi9MDPg35VlY0xLEakgpSPuyCWcQ==
X-Received: by 2002:a5d:6e8b:: with SMTP id
 k11mr27600416wrz.102.1642588889224;
        Wed, 19 Jan 2022 02:41:29 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 06/39] resolvconf: update 1.87 -> 1.91
Date: Wed, 19 Jan 2022 11:40:44 +0100
Message-Id: <20220119104117.2120127-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160697

Drop patch as issue resolved upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../resolvconf/fix-path-for-busybox.patch     | 20 -------------------
 ...{resolvconf_1.87.bb => resolvconf_1.91.bb} |  3 +--
 2 files changed, 1 insertion(+), 22 deletions(-)
 delete mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.87.bb => resolvconf_1.91.bb} (96%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch b/meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
deleted file mode 100644
index 1aead07869..0000000000
--- a/meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-
-busybox installs readlink into /usr/bin, so ensure /usr/bin
-is in the path.
-
-Upstream-Status: Submitted
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: resolvconf-1.76/etc/resolvconf/update.d/libc
-===================================================================
---- resolvconf-1.76.orig/etc/resolvconf/update.d/libc
-+++ resolvconf-1.76/etc/resolvconf/update.d/libc
-@@ -16,7 +16,7 @@
- #
- 
- set -e
--PATH=/sbin:/bin
-+PATH=/sbin:/bin:/usr/bin
- 
- [ -x /lib/resolvconf/list-records ] || exit 1
- 
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
similarity index 96%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
index f57abe3619..cb25238eba 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
@@ -12,11 +12,10 @@ HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS:${PN} = "bash"
 
 SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
-           file://fix-path-for-busybox.patch \
            file://99_resolvconf \
            "
 
-SRCREV = "1dda36d8465e335c60190c41e7185d782da1bd7b"
+SRCREV = "859209d573e7aec0e95d812c6b52444591a628d1"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


