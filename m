Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27024C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 15:17:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23604.1782832665509053789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 08:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZhP0WmR3;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so12296605e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 08:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782832664; x=1783437464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pj5o9/7C5tcKwsV95a+YSeF6UE6vKpBwG7bLUcoyKCc=;
        b=ZhP0WmR3rUNbFT+kaOtvocc1vKSfMFhW/iLsuJKRQDHG2tjtfklrvpMTcBqJ+Dzl8S
         Uz9GKNTDcim48qR/JG5YgCTc4QrOxuiJHMtynJSfF9GGHe/VIzxpB0dwb2JUTxVQ8JXb
         C3AKgp/MxHgE41DPXSlnIgf0QKOpd8dNq1zq/czib6SUcieBvRdVT0mDeXGPW3ORSVEJ
         T0UMWlZQ+Kt593AYwztdTRxkZFXTWbHWVnePNPtJnbmvLkWpMuSfv7rxiTK0WjLnNHFo
         BkBbX08Z5Fo0G4dIYm28CvuZrGIWOw4vuTEH3VS3DQrDZjhYTB59PxFlYU6GZSfDqECa
         ytyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782832664; x=1783437464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pj5o9/7C5tcKwsV95a+YSeF6UE6vKpBwG7bLUcoyKCc=;
        b=Acw/QMFJn3g47Rcohh85nEizEz//DQq0IPM9WCST8FqrLznUvsqt/64CM1e+OjPokz
         TFIHq+QqJrEVvVVAEfFZ5fhXGhgNkY6sD1jE1BBjRJzxYIxin+jWgJLar0kp9khCfOXu
         S4ezIX2AEHkKdDklRmwiQjJONKkN+G1LNPR7G4VslmBrh+Kr6P67fx+PnsBGTpmYNYs8
         77qU7RAnbq/gatvsNUvev/D3AN/zz3azh0HI4oY/mEjfpPD4Lszhzf7mtIzcib/xSXsW
         NT2YXNuVWCkLp02Ic5t4uVSKUWqBhxjgkMwHAxuX4JTtTA94Afybvqt+wo4odBPzFUxo
         pADg==
X-Gm-Message-State: AOJu0Yxl27Eo5sRyqpXdckL+XE4PlqojYMSTlu2y7vqVE/LY1P6qSNLn
	PSCKOC1HgUDjRdvJmrSANGmi/YuAWkCv30PDcXk5THTSkPhbsFSLhwaDWZSDzA==
X-Gm-Gg: AfdE7cm9hvTUqNLPtVlGZWMZ0gFaUMtvLXC6YrBEObQ+uSj3XRpnMPEAv39Xb5lmPfH
	CuvUgymxi+Ag51wgGeyL03+8hgrEJvmJYC0DQ/OOCIZQ+3z8VEMp7yFRuSD7OsuVLgn+Ql7S10N
	wlCBMRmGEG6cV77brJ/k0FLaT7Ovdr1iXpSXX45BZj+Wp5VGN4hxnEwDtYADuH/9McNg/5EK6h5
	RLFUYqDPKbRaTEF4V192dhvTtGvQYMyaG/iXpc6acbdpQBQIkYQm0ZCsEmDzuvj5PGBY4r9+JEr
	kqdVXFZpWdC5GLfRhzmlZ4OWseUwKNR8Rv4A7m5/zm1uARIihQwxuQsE4kKxjSMcLLwrHqbgKYc
	Ln+uhjMYq2owliGjYZmIj29HuFq62ximhxQQV2iIau9cnW20TCPpIyz96e9Ua4SaDS1d3kpLnJ5
	eH+VRwO6MnJpcVMyd5a7Jn0UbikfQflNJfWkA9BMraZDX/w9UcA+A3Z1OWDHrWpyihG2n3yKpX
X-Received: by 2002:a05:600c:4ecb:b0:492:3754:15f2 with SMTP id 5b1f17b1804b1-493b82bcf9emr57083505e9.32.1782832663420;
        Tue, 30 Jun 2026 08:17:43 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4da1c1sm2181415e9.8.2026.06.30.08.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:17:42 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH] dhcpcd: Add PACKAGECONFIG for seccomp
Date: Tue, 30 Jun 2026 16:17:05 +0100
Message-ID: <20260630151704.2896341-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 15:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239905

Pass --enable/disable-seccomp to the build based on DISTRO_FEATURES.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
index 6ebfc195323d..58865e108d24 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
@@ -24,10 +24,11 @@ inherit pkgconfig autotools-brokensep systemd useradd
 
 SYSTEMD_SERVICE:${PN} = "dhcpcd.service"
 
-PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 seccomp', d)}"
 
 PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
+PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp"
 # ntp conflicts with chrony
 PACKAGECONFIG[ntp] = "--with-hook=ntp, , ,ntp"
 PACKAGECONFIG[chrony] = "--with-hook=ntp, , ,chrony"

