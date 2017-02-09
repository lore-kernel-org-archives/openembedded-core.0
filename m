Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id E144171AFC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 16:47:59 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id v186so86989627wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2017 08:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Xe3TI7ZAZfjpflNJrUIEDHh29pfXqSiabAIK4fK/CRk=;
	b=krqQF2XJGVtU8bzhRtAwbGQrgoeWXcDpPW0xAdL1aNswrqtTIvJaM96Ck82yJFgfy8
	PczdC2x9Nz3et2uSDLRIXEEBIoiY21dGtKfaGj4ye0jWwB6x3sOvoYgh2RZ454WPSP8y
	S8L9smDZu5t6/9IHSq1xjur52bV6WZt6LEBTYiilV7K1930far5e4USwwVtouEtNMxrz
	NnGzA6XRSp8jnFh3/HTS0lwZWonAk/0jdWDQ9XpM5RJghgn8jbpriMip+myATmkwGl6M
	IJNQQws33FmB+OcQvc+jECZ1gJRjt3uKrzc/tYg+iQffuJKD6faI12LfW2FuhoLOmkEk
	8+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Xe3TI7ZAZfjpflNJrUIEDHh29pfXqSiabAIK4fK/CRk=;
	b=bIpFcZoc+e3zetpBgfKduR2AByw7GBksWFIn0yBuGnCMK8IhNduUI7U4LdGzHBXcGK
	Uwpzj/ir7bug46Qoa4f5u5umX5MVcNgBbfqUa1K0DZAdUpl+IxUq4IOlBgNNjldCRaqT
	/QrMY/hvgVP2iihuGPpKCAfCJy0LoRLEg7DPS2Mt+ZETyrs9dlnRSp5aRY4ky8/UWbBU
	n00sXV44CsYivJR1WqSqTJQyOpfnpv4n1ytuPx+TjW3//66zHLKldkVujZiN1TnU2iz6
	YrkLoLM9gWLFQJRRQu+eXxDgdjwzcj0Z12G5Kj2X1LgoQsv7sE9yFGDWc839d3JHTDFI
	KmBw==
X-Gm-Message-State: AMke39noCt/wyPHEf/tZ+InaehwnCzy9wfxXq2e7VEBwD8+SStyPGLvZb0BcwU2tuKrTuftt
X-Received: by 10.28.14.65 with SMTP id 62mr23739785wmo.46.1486658879306;
	Thu, 09 Feb 2017 08:47:59 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o42sm19321768wrb.18.2017.02.09.08.47.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Feb 2017 08:47:58 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Feb 2017 16:47:56 +0000
Message-Id: <1486658876-31022-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] dbus: remove pointless cd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Feb 2017 16:48:02 -0000

There's no need to cd to the target directory when creating symlinks, so don't.

[ YOCTO #10985 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/dbus/dbus_1.10.14.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.10.14.bb b/meta/recipes-core/dbus/dbus_1.10.14.bb
index e4f54ec..f50aff8 100644
--- a/meta/recipes-core/dbus/dbus_1.10.14.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.14.bb
@@ -123,7 +123,6 @@ do_install() {
 		for i in dbus.target.wants sockets.target.wants multi-user.target.wants; do \
 			install -d ${D}${systemd_system_unitdir}/$i; done
 		install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socket ${D}${systemd_system_unitdir}/
-		cd ${D}${systemd_system_unitdir}/dbus.target.wants/
 		ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/dbus.target.wants/dbus.socket
 		ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/sockets.target.wants/dbus.socket
 		ln -fs ../dbus.service ${D}${systemd_system_unitdir}/multi-user.target.wants/dbus.service
-- 
2.8.1


