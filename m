Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE26C54F3F
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:43 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.10406.1649768604600401038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fRL2GIyl;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 o20-20020a05600c511400b0038ebbbb2ad8so1599425wms.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fmrRPesO738G9xSVfM+TNem5adEWrDFT4OJQ5xdLJfE=;
        b=fRL2GIylvjoOo/7sc6ptxgJnjuwXKlSxHDh0QYlfWs8E0oKpyTeh6YefdSK7l+NGs7
         CvoM0222TdT9PHaKeHa/QG79nzgHH3xCpA38Z5acUgasKtt9eK0Y/t6kZwRDntNWAWx2
         9pi7kQvlV3b/hp3BgojCiENGFDqr705DtRDXd6AayqVdsCo8N2gQmIytLN7CEVXh3Jwj
         AyhqrW+JW+AocU5J7rnDNGUjeM72T6omXbHVV7kk3hl8eIy/F95hxtgjSiSGSdmtbBcP
         9hWHnKm6thrtNYHoJgkW5cimECd6mYVQ+HLB2qN921GxDnxTdo5+6ZB5JQwaCVMJrFkZ
         +HVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fmrRPesO738G9xSVfM+TNem5adEWrDFT4OJQ5xdLJfE=;
        b=zazaG0bfCjoiovjAmQC6/WeRHJ03bmoUcserQMbUAV0qpwPXaIE48lgc+aV/9eI74Q
         lbwvuqYmozDCfgXSuxiRK00EoNFtKtjORPMGnzSYiz+GnkZv+dDCPBrswIuYto2jRAPp
         ZMNEdgL37OqIKCcunv04Cd8aGQwjNgfDEdQk89mklNIR6TGKKsvakCeWsggJWGyiBYPe
         5svDF1XuBML/c53obzdneeHTzv0bqYwlwyBSvRic8tk1kLxDnjvkeZkx5kyw0fRhfX+e
         ozhf12+J6gM90rp46frCsmHJaxDOo/+HfRF5dE/L4EVX+Bhv1j8BZGyca02+8Xc/I1+E
         aIqw==
X-Gm-Message-State: AOAM532SZFUNUwq4EgLQjmD1b0iTWsZVOAhX+GGiGlbYYH6gPtzxewyG
	RWmENHPgrgkodFiLMnlNAaDmUsiXffM=
X-Google-Smtp-Source: 
 ABdhPJwLerPo053FMq6cdJY6nA81ctTgb87aYzo1uBOvCzfEOElTXLQe83ul16FPXooPPjQZHNvUbA==
X-Received: by 2002:a05:600c:214:b0:38e:bb60:1e90 with SMTP id
 20-20020a05600c021400b0038ebb601e90mr4068230wmi.55.1649768602446;
        Tue, 12 Apr 2022 06:03:22 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b0038cbd8c41e9sm2372953wmq.12.2022.04.12.06.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 06:03:21 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>
Subject: [meta-oe][PATCH 1/8] wpa-supplicant: Reorder/group following style
 guide
Date: Tue, 12 Apr 2022 14:03:08 +0100
Message-Id: <20220412130315.25917-1-alexk@zuma.ai>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164265

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 .../wpa-supplicant/wpa-supplicant_2.10.bb     | 41 ++++++++++---------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 6e80ac7de34d..da8f0843dc1e 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -1,23 +1,14 @@
 SUMMARY = "Client for Wi-Fi Protected Access (WPA)"
-HOMEPAGE = "http://w1.fi/wpa_supplicant/"
 DESCRIPTION = "wpa_supplicant is a WPA Supplicant for Linux, BSD, Mac OS X, and Windows with support for WPA and WPA2 (IEEE 802.11i / RSN). Supplicant is the IEEE 802.1X/WPA component that is used in the client stations. It implements key negotiation with a WPA Authenticator and it controls the roaming and IEEE 802.11 authentication/association of the wlan driver."
+HOMEPAGE = "http://w1.fi/wpa_supplicant/"
 BUGTRACKER = "http://w1.fi/security/"
 SECTION = "network"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5ebcb90236d1ad640558c3d3cd3035df \
                     file://README;beginline=1;endline=56;md5=e3d2f6c2948991e37c1ca4960de84747 \
                     file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=76306a95306fee9a976b0ac1be70f705"
-DEPENDS = "dbus libnl"
-RRECOMMENDS:${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
-PACKAGECONFIG ??= "openssl"
-PACKAGECONFIG[gnutls] = ",,gnutls libgcrypt"
-PACKAGECONFIG[openssl] = ",,openssl"
-
-inherit pkgconfig systemd
-
-SYSTEMD_SERVICE:${PN} = "wpa_supplicant.service"
-SYSTEMD_AUTO_ENABLE = "disable"
+DEPENDS = "dbus libnl"
 
 SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://defconfig \
@@ -28,15 +19,15 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            "
 SRC_URI[sha256sum] = "20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f"
 
-CVE_PRODUCT = "wpa_supplicant"
-
 S = "${WORKDIR}/wpa_supplicant-${PV}"
 
-PACKAGES:prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
-FILES:wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
-FILES:wpa-supplicant-cli = "${sbindir}/wpa_cli"
-FILES:${PN} += "${datadir}/dbus-1/system-services/* ${systemd_system_unitdir}/*"
-CONFFILES:${PN} += "${sysconfdir}/wpa_supplicant.conf"
+inherit pkgconfig systemd
+
+PACKAGECONFIG ??= "openssl"
+PACKAGECONFIG[gnutls] = ",,gnutls libgcrypt"
+PACKAGECONFIG[openssl] = ",,openssl"
+
+CVE_PRODUCT = "wpa_supplicant"
 
 do_configure () {
 	${MAKE} -C wpa_supplicant clean
@@ -104,5 +95,17 @@ pkg_postinst:${PN} () {
 	if [ "x$D" = "x" ]; then
 		killall -q -HUP dbus-daemon || true
 	fi
-
 }
+
+PACKAGES:prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
+
+FILES:wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
+FILES:wpa-supplicant-cli = "${sbindir}/wpa_cli"
+FILES:${PN} += "${datadir}/dbus-1/system-services/* ${systemd_system_unitdir}/*"
+
+CONFFILES:${PN} += "${sysconfdir}/wpa_supplicant.conf"
+
+RRECOMMENDS:${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
+
+SYSTEMD_SERVICE:${PN} = "wpa_supplicant.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.35.1


