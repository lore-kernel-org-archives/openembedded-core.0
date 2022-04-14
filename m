Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2B0C43217
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 20:57:04 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.159.1649969529830712402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 13:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LrM1EPVO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id g18so8458897wrb.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 13:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5V2caaxEFqVw8WzVreOvGSr6u1Jg11U5vGb1s12o/Gg=;
        b=LrM1EPVOiJ7JJG4AqVB0D91MX4Z2ItF0Uqn1E3HzGrli/7WwGc8RenkgPF+6mjLGTZ
         ubY3tJFeJw7V6yHBZabxBkwuF8zaky7ETqhjM1Xz2uajhAZ+wJZ4Ahdf6m4Ma8caRL/d
         scPP+sNxkmrOJ3jllehDuzWwPhqTGx/+IlxXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5V2caaxEFqVw8WzVreOvGSr6u1Jg11U5vGb1s12o/Gg=;
        b=2XQJYYK8iemXK3iONMy6Ur0QKHlGMgYWs3riv3uC60+e6/FLE4CuezqXOeQ4GTbNBD
         WqPQc/bL70zaEXMSFN1SRiekYIAUsiuHoSGqbPGprYFfPnwcfNZwlnNwcKX7BVR5kiT+
         iD5SyRxIWvVq8FrR9CAqHMLvv0rvCuFkWgTF67LKNCVAHKmFh4cWD6YZYKgB+zAcxXhJ
         nq6THuHrfL2p84GLms06rzedIisncbox405E4n6fZlVXKRGJeheBzpmVcs3aYDwduZdM
         Q0boULuAHZOpNI4DGoBsfBtofHHwtNVuB8kmKsnWhFbS2NUIWBiYQZ8tYDsPDWoZCd0k
         6eHw==
X-Gm-Message-State: AOAM530NL62IesvKANzEKGQ18Bx9VqmHtCV4TCBqeDnD7mP8aClYw9FH
	XC1r3VrpOY6HsbahPS9RSYc3ymBPU5aLUQ==
X-Google-Smtp-Source: 
 ABdhPJwabaoITpoyvGZ5yPZmiGs57i3q8UYS63AT+/yogBwVSIATtw1D7NcOiIF0/GJeaU45xpoxBA==
X-Received: by 2002:adf:f943:0:b0:203:e832:129 with SMTP id
 q3-20020adff943000000b00203e8320129mr3304338wrr.626.1649969527334;
        Thu, 14 Apr 2022 13:52:07 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:11b3:ac79:b941:ad48])
        by smtp.gmail.com with ESMTPSA id
 k11-20020a5d6d4b000000b0020599079f68sm2549322wri.106.2022.04.14.13.52.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 13:52:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] bluez5: Add fix for startup issues under systemd
Date: Thu, 14 Apr 2022 21:52:05 +0100
Message-Id: <20220414205205.2264840-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 20:57:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164413

The systemd bluetooth service failed to start. Add a workaround for this whilst the
final fix is discussed upstream, https://github.com/bluez/bluez/issues/329.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

v2: Add ProtectSystem=strict
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/fix_service.patch           | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
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
index 00000000000..96fdf6b299c
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/fix_service.patch
@@ -0,0 +1,30 @@
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
+@@ -15,12 +15,12 @@ LimitNPROC=1
+ 
+ # Filesystem lockdown
+ ProtectHome=true
+-ProtectSystem=full
++ProtectSystem=strict
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


