Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782F7C83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 16:36:42 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.327.1752597399671885482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 09:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ITPEOxx6;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso25436645e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 09:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752597398; x=1753202198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/TWbHpfylLvi6I70npz7y7eUSOl5CEcyYyZs24n0e2A=;
        b=ITPEOxx63SybUXERH9zct5tG99BOycabu3RkWnjaqJgvV9QaFcSJblnuE4csUV1Rwl
         hdDB/LDjE4ZsueU9JCtDwV7n53jsWh+UepBhcy6EDFuVfCtmUluuM9kwFMpxD4dTT2uQ
         rgH3ShfAJUjmCAQAM6Vs18hTkEOekqh43yPQ+bKF5oEBpVmkdwMy0zwh+ngqiBq03Zu8
         EVDwcVC9JshqyMdP6+HBOa23Ur7sDsq/eVS1BsfuMleDc7byQOiXix/TtP3xyDLEQRfz
         tvTN9bSLR+HWaDHhvnfSZZubjkrjUy2/hIMe5CFvDc6e8Vhig/wayNVrbTSGnwKvILiE
         3MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752597398; x=1753202198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TWbHpfylLvi6I70npz7y7eUSOl5CEcyYyZs24n0e2A=;
        b=mWGtWGuKAOfVB9bLECTA3ikbAc7WU/vDkzCq0GaJWN/4UYtc3Y3/mwJdVeb/wkCetL
         i4W3rO1YV5R2TCuD1nDB2k5sMDjr/XRPkpuCNttNBo4wCwP8JnPWSLn4wCMOPFkEq7G2
         2NbmT3tEW9kOg4B2jOcShvQEASFakYi2ft0V7w2asWdlaAuy44eFbWYwGdTFfeeZs32z
         f7AMTfyhOyAoSwomdwXCSd9kxJ59c7UmS20jLN+FCKxb/Eb5amKy3WMhxw6HjwVFMKbv
         OvBTo5XnJ1Y3dahGHwD7t5TeGtUN4yIcOeOr+hoB9k7Kf0g2Ig6N+DSxlUbWXBYHnk2A
         rCBQ==
X-Gm-Message-State: AOJu0YxLQesWAMMO83DptG8IL3MI5RZGn7xcIVZsqKld+kUdgfa5dRy/
	CyIf2Gh5sgBio1/wXCE2ejD9bodUeZfCJFlkcZNVxkMizhl3cHue157NJs10sg==
X-Gm-Gg: ASbGncsyZT3BgEirEGHJfsgYnV1GBrV5BiS6t4h9u7y1czHHkdROIMMDghf+UyO7rUS
	q7lp+cJMzSCkGFrlWUtTAqvXnO50rq2H1UxMQMVCyMvuOSHGIpd1BeCzvSnmMLNfxg7+F8wSLd2
	ccWrnFh31WwugcX2rkJzKUseW8MLK6jal9HqfY71w93EuK5NtTeLk/VcvMUyk0JFgzl1rK7df3z
	twzXB9pBotzlHl+njSOGst38sNzOyaUj12TvlgntdiCKDHLEtqIehwMHMI/ss5kEga8AZJBvjJe
	hUEZIXDoEqrxt8fYYGhb1OAOdakO3tDkmpcE1W4ZnRh2saDA9sOgpFqzXoWRVwUuZl2kBZASHuo
	RVo8IKEGzFeNBZL2PNIsBdgEiKLYQHqP2H31R1agG4RWD7FmlgmH+89SyEA==
X-Google-Smtp-Source: AGHT+IG39YYWWHAnFWU7prdQPfah96vPMWwjOwPwl3hS9YGcmOuNnrNhApm5Dy0y9cRU9kSsKa52Ew==
X-Received: by 2002:a05:600c:1d28:b0:442:f4d4:522 with SMTP id 5b1f17b1804b1-455f7ed2974mr123856285e9.5.1752597397429;
        Tue, 15 Jul 2025 09:36:37 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd537c6fsm168393405e9.21.2025.07.15.09.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 09:36:36 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] bluez5: remove bluez4 from RCONFLICTS
Date: Tue, 15 Jul 2025 16:36:29 +0000
Message-ID: <20250715163629.3533-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 16:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220407

There is currently no recipe for bluez4 in openembedded-core.

BlueZ 4 hasn't had any updates/support since it's last point release 4.101 back
in 2012.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 287ebf658e..3b414433cf 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -10,8 +10,6 @@ DEPENDS = "dbus glib-2.0"
 PROVIDES += "bluez-hcidump"
 RPROVIDES:${PN} += "bluez-hcidump"
 
-RCONFLICTS:${PN} = "bluez4"
-
 PACKAGECONFIG ??= "obex-profiles \
     readline \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-- 
2.43.0


