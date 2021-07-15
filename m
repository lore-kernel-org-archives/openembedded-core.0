Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.8322.1626358115792716933
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 07:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FGqgGkRX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id my10so3922627pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 07:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vsnc2I1RVIwxH4IbQ3fCzKSGh8wrv+GaoS0/HNOQN0E=;
        b=FGqgGkRXDLD/eRGq/UEitXbfxkhIfCf7uIjBQMcgSmBUTr/m+BbmXCzJ4mrKQTiJlQ
         HvW/NRcCo8x5N9rhmgfyWlSL4qL/CH6bRWpBR12V8IjDXHMzLcLAX4vRQiku3NlVbrME
         chox6NArrlz42JmEhg6IPGClNxWeu9xBSvgH1LlbaMgwv0zzB7LRlk3zKePf2nEQhQXJ
         YeCzuTdGw7iA1Ac9KKVcqoFVfeAC2l8IjiekeA+8TbI3W4NMA1miZ4docPhp2owvruO8
         n2sSKp6PZKVzUMeLxiHXZ90m0CDW68iLpwRwwjoPyMlyUnqhNmsTkPIetmAgLeHpxZeL
         s0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vsnc2I1RVIwxH4IbQ3fCzKSGh8wrv+GaoS0/HNOQN0E=;
        b=uIfy3OQZP+XLfAO07WnfWUWe4334RmSmjIxiwrlWavdi6zG8/WBeHmrya8kJt5DQVx
         vJG+e6HbnUBSLbjq2MbKxE8v/RxVzpJBPq9RwU8jnhfm5PhmjsgidtN5ouAckH6WE6FM
         GstxCDJwdWLQxCEEF4NK5C9nr+SNOqrqgdxjS1Q+k/zNtKARnTywVinX3ru73veKXmjP
         6qmsmKd+awqv4GFpOzQ7DMah4IRD9a6X7E4IEdLYgnkG5L1SPiCh3+IutiC5ezBW3cFX
         B+z62y735lpgRsSvteW5pv8DkdogTxeRqmuSqeNZX94IDpyCUTPvLPZ60lwDXtyUsVgt
         b4hQ==
X-Gm-Message-State: AOAM5326CHYkEePt+5ZEVPXD5XvKe61HuoXPOb3vi8e7dvzRkbgryY+B
	0FTDIqNJDlEAQwOpCFsrHuV+F6hJBYVLBTYY
X-Google-Smtp-Source: ABdhPJy2sXYXp22bwxRXolvq0xlBoGYnPWHNcUC/ZqLQX02HAxKMJWrtBGsiaUedAST6/vluzjQOHA==
X-Received: by 2002:a17:902:b111:b029:129:5cd0:110e with SMTP id q17-20020a170902b111b02901295cd0110emr3693991plr.51.1626358114845;
        Thu, 15 Jul 2021 07:08:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u185sm6915353pfu.49.2021.07.15.07.08.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 07:08:34 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/7] bluez: fix CVE-2021-3588
Date: Thu, 15 Jul 2021 04:07:19 -1000
Message-Id: <569362f338736a1c85f090909a9893d019bfce5d.1626357703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626357703.git.steve@sakoman.com>
References: <cover.1626357703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cli_feat_read_cb() function in src/gatt-database.c does not perform
bounds checks on the 'offset' variable before using it as an index into
an array for reading

https://nvd.nist.gov/vuln/detail/CVE-2021-3588

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/CVE-2021-3588.patch         | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2021-3588.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index f34ba0dce5..202a14dee0 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -52,6 +52,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
+           file://CVE-2021-3588.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2021-3588.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2021-3588.patch
new file mode 100644
index 0000000000..f52ff47a06
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2021-3588.patch
@@ -0,0 +1,34 @@
+From 3a40bef49305f8327635b81ac8be52a3ca063d5a Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Mon, 4 Jan 2021 10:38:31 -0800
+Subject: [PATCH] gatt: Fix potential buffer out-of-bound
+
+When client features is read check if the offset is within the cli_feat
+bounds.
+
+Fixes: https://github.com/bluez/bluez/issues/70
+
++Upstream-Status: Backport [https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=3a40bef49305f8327635b81ac8be52a3ca063d5a]
++Signed-off-by: Steve Sakoman <steve@sakoman.com>
++CVE: CVE-2021-3588
+
+---
+ src/gatt-database.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/gatt-database.c b/src/gatt-database.c
+index 90cc4bade..f2d7b5821 100644
+--- a/src/gatt-database.c
++++ b/src/gatt-database.c
+@@ -1075,6 +1075,11 @@ static void cli_feat_read_cb(struct gatt_db_attribute *attrib,
+ 		goto done;
+ 	}
+ 
++	if (offset >= sizeof(state->cli_feat)) {
++		ecode = BT_ATT_ERROR_INVALID_OFFSET;
++		goto done;
++	}
++
+ 	len = sizeof(state->cli_feat) - offset;
+ 	value = len ? &state->cli_feat[offset] : NULL;
+ 
-- 
2.25.1

