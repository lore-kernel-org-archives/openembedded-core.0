Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EBCC433FE
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 17:17:28 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.270.1649953361825450951
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 09:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F7ZjnRWi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id i20so7605044wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 09:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dJTTeyrU87KrJ4tnTK2pxFHSvt1nWtoHXGB1x72zeqs=;
        b=F7ZjnRWi8WE+p6WPH0KmNgKzEqpUwjnACRDxAlF3/TP4XADkN41qacWW2q9yFs6EvR
         a3ARorerfnfJCWuWFtY3Ejy84tRNO/KFWDnU1rr0So3fUPCXiFkrwrklHLMyWUYOZ9ai
         m0jd09jb/tkuc/hcsk2P4ObRghn6glA2J2I/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dJTTeyrU87KrJ4tnTK2pxFHSvt1nWtoHXGB1x72zeqs=;
        b=fiPvqg3d+h2gQ7rIEGM8GCSoQn5YakS5tcQrpYvZwXutJ6dYa3m4/gZZUUhHlXdtAX
         6uOf1IYkGoo4X08a+zXUP4gtaMSz8/bCGmiDC6hNH6pPB5O4YEsfNkXLD522FdnED8E2
         d5mE5F2g2tgNXFr0AtH+Q/jVRJiFEYjNogovsThWnwAFBKWwmRh1b7v8HciX0li2J9kx
         xAvL0gwTMQtVU394dDwTfJWdNOXZae9EIuR5+dpasJZpuo+s0VbCANddbbLKvEPmRzK1
         kKOT2Y9yD+gYvryioMJKfVWwKKVwQMvbMOtDMjqPqIrraU7KATJPNPETj+M8Mfx2aM8+
         sV4Q==
X-Gm-Message-State: AOAM530V5eyBaHag5miry53B5tlJks2a3MydiDUKygXvpXvxqrvxsEeE
	Fq4Kt/s5De3gi7sQDiX51/7P+8AIu7Qb7g==
X-Google-Smtp-Source: 
 ABdhPJyqejQiYPRl3Wx/DKFedPxUp1Nip2Y/2Svq6ETCSgb9HjCJ285Ja2wsEMEMROYPRrNYizGApQ==
X-Received: by 2002:a5d:5848:0:b0:203:fef3:888b with SMTP id
 i8-20020a5d5848000000b00203fef3888bmr2626658wrf.611.1649953359890;
        Thu, 14 Apr 2022 09:22:39 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:353f:5203:2a56:f190])
        by smtp.gmail.com with ESMTPSA id
 u12-20020a5d6dac000000b00204119d37d0sm2085914wrs.26.2022.04.14.09.22.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 09:22:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bluez5: Add fix for startup issues under systemd
Date: Thu, 14 Apr 2022 17:22:38 +0100
Message-Id: <20220414162238.2260000-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 17:17:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164410

The systemd bluetooth service failed to start. Add a workaround for this whilst the
final fix is discussed upstream, https://github.com/bluez/bluez/issues/329.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/fix_service.patch           | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/fix_service.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 79d4645ca89..22dd07b3480 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -53,6 +53,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
+           file://fix_service.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/fix_service.patch b/meta/recipes-connectivity/bluez5/bluez5/fix_service.patch
new file mode 100644
index 00000000000..f4e44ef6281
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/fix_service.patch
@@ -0,0 +1,25 @@
+The systemd bluetooth service failed to start because the /var/lib/bluetooth
+path of ReadWritePaths= is created by the bluetooth daemon itself.
+
+The commit systemd: Add more filesystem lockdown (442d211) add ReadWritePaths=/etc/bluetooth
+and ReadOnlyPaths=/var/lib/bluetooth options to the bluetooth systemd service.
+The existing ProtectSystem=full option mounts the /usr, the boot loader
+directories and /etc read-only. This means the two option are useless and could be removed.
+
+Upstream-Status: Submitted [https://github.com/bluez/bluez/issues/329]
+
+Index: bluez-5.64/src/bluetooth.service.in
+===================================================================
+--- bluez-5.64.orig/src/bluetooth.service.in
++++ bluez-5.64/src/bluetooth.service.in
+@@ -19,8 +19,8 @@ ProtectSystem=full
+ PrivateTmp=true
+ ProtectKernelTunables=true
+ ProtectControlGroups=true
+-ReadWritePaths=@statedir@
+-ReadOnlyPaths=@confdir@
++ConfigurationDirectory=bluetooth
++StateDirectory=bluetooth
+ 
+ # Execute Mappings
+ MemoryDenyWriteExecute=true
-- 
2.32.0


