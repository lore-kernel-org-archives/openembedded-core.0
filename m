Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23A3C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 09:49:45 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.82740.1749548979860015437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 02:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d/GObt5u;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad89ee255easo943903466b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 02:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548978; x=1750153778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8T0VbiXCJVFIgRT/E4cFdC55J0womA2zFYYAqz/422Q=;
        b=d/GObt5uyMlzWdPV4coYy7xeRm+A8SqLUy7KOpWPDFgdL+IJNYbd1xLAyF7n5wszDa
         BMxwQR6skKG8oJvlBv0SGJreDsAEFVuNVCADcCqxfwSylp8ZiD7gsxVBFOeQ7iSVWD6h
         RjsKSz+B80l88ubkht3MFafoWO/C1XDIhy4xui8uwr5vAV92UOsllkYjmCH6OpBxmz8t
         JXqmn0Dhjphdsme0LXDksBToQ9rcDD4HLdrkArz538h7u9ZMO5w/JtZ0i4DxoCxsrKpS
         1Ynldr4zZgyN6A23bw8Baz5l/m2OyS1jcH+Xd9c3iEYeNMuZ7TMyQj4gm4fDMy9RtP1G
         L+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548978; x=1750153778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8T0VbiXCJVFIgRT/E4cFdC55J0womA2zFYYAqz/422Q=;
        b=QYY9AI9wxRA4PZ45el694uqIHjrIfu7ctZaK9/8x/APwo8cpon9zM09swxKUHswK3T
         QV1z4UBFTGX/FyoI7V0lEtNuvpPd432X/kDWndrbp/q8Y/p4JrLPWWZLmjv3X93l270N
         1t9brUIrZsha73MqnPNV1TnYSdqdW8HlB1zQMUEXePOTgWLSqD0d1tN+ZqnbkhCanW8E
         X2/rx4AKBZzqYphN7vjuucI5I7lqlA06SxBVs4QZ2JOxl4DGjmF4c8W3boyrOIGbOOhN
         bvawYLVEXKihYe4Cn/i3hjpmTXeQgt2bgI3uhow9wWE/Fg5VgpukYLJ4K7wPwE1MQnpb
         KsnA==
X-Gm-Message-State: AOJu0Yw2Ak81L9H5+2xUoEsKNvAjJe0hwWoLxpVJxUrocwbZLAvF7EAk
	SoaqzqyqN+CmaY3yl6J7xVux1i0U9JZVCMd2pffEL7SIYH5P1MNlN4/suCvZ1ceB
X-Gm-Gg: ASbGncu51aC/a4G7LY9YDCmMnTO//g4cAx2BjkpkLkq27eNNDFHilIfeeBC7kAK6M2Q
	iN9LhD1PPh/Yltd4hwS23BLAlMAUI3RsPBnvP/OGqaIMucMHKTjfJZBLd8xCAkb/xQmGDuSFjqq
	pHtVKQX3CiNOaCBHv9/BBQ9myo6cUFgkmzDRy4X5S1GPXrydVSd/1EgQI9tmN91sqGmupGV7eSZ
	6WHSSUYCwtM6tfEgk752MXpGiPRmOip8HpWIYugNN0Nw1JGfOP9HqMmaEhKkXuE7MqZgWo0PKa4
	s11uPA31YaZzeXxR/HL5XrGJsnyok8OeL3LxxZO1+WOtXKbuT9BPWB9SfgAS6U7afT4xhqQAs5s
	1Aw==
X-Google-Smtp-Source: AGHT+IHM+X9w5JuIZdMrW7+nmBbMr4awHUCNU+BJVZxynh6kl6RP652qzLtzqQfIA4b7TesQ2mdUHQ==
X-Received: by 2002:a17:906:6a19:b0:add:fa4e:8a5e with SMTP id a640c23a62f3a-ade1a922844mr1599302266b.32.1749548978019;
        Tue, 10 Jun 2025 02:49:38 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d7541f2sm692920166b.7.2025.06.10.02.49.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:49:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] seatd: fix packaging error with systemd DISTRO_FEATURES
Date: Tue, 10 Jun 2025 11:49:37 +0200
Message-ID: <20250610094937.2812880-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218336

The systemd unit file for this recipe is only installed in case
the target system's init system is systemd. It is achieved by
inspecting the VIRTUAL-RUNTIME_init_manager variable.

However the systemd class was inherited unconditionally. This caused
a failure in do_package task, in case systemd is present in the
DISTRO_FEATURES but the system's init manager is sysvinit: in this case
the systemd unit file is not installed, however systemd.bbclass is
still trying to register is as a startup service. At this point
it failed:

ERROR: seatd-0.9.1-r0 do_package: Didn't find service unit 'seatd.service', specified in SYSTEMD_SERVICE:seatd.

To avoid this, install the systemd unit file unconditionally, regardless
of the used init system.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-core/seatd/seatd_0.9.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/recipes-core/seatd/seatd_0.9.1.bb
index 87e1c3b67d..3b4b3bae4c 100644
--- a/meta/recipes-core/seatd/seatd_0.9.1.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.1.bb
@@ -35,9 +35,8 @@ PACKAGECONFIG[systemd] = "-Dlibseat-logind=systemd,,systemd"
 do_install:append() {
         if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
                 install -Dm755 ${UNPACKDIR}/init ${D}/${sysconfdir}/init.d/seatd
-        else
-                install -Dm644 ${S}/contrib/systemd/seatd.service ${D}${systemd_unitdir}/system/seatd.service
         fi
+        install -Dm644 ${S}/contrib/systemd/seatd.service ${D}${systemd_unitdir}/system/seatd.service
 }
 
 USERADD_PACKAGES = "${PN}"

