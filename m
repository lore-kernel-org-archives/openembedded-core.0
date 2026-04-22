Return-Path: <Jhonata.poma@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F055DFA1FEA
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 19:30:54 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.90970.1776886251011082436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 12:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jZJ5wMAW;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: jhonata.poma@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ba36357195bso703504666b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 12:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776886249; x=1777491049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=POsRoNKcX3El6pnQ5j1guV8Iq6Qc5ANtHCMf8xyTKwM=;
        b=jZJ5wMAWMgmP5aKJF7m9c8axDOFueHXzD7IixuMApWUtD0cwXd0r90cAW4ooIAfL1S
         LODKBBaR2+nFhXrRWCl73u1/XrnsvM+GdTyvM9nXf0hx1fvbgrpwqxVQlDUKVRSq8AZ/
         R4IbfTwt0HzuOyg4j63udU9nFXLloaxDnhghTgoqjvyvC9GaRK/Z07sg+EbB2pId0F4x
         c2OKswwPcExKDWmR771tnaWfXl0jUyku79BofvKJSi+zU7+kWJzIx3Fl0YkDCdHaG+l7
         Kl67hikjvaDKzQD46gVDxI4A5soTC0+A0Y2AwMHhAwmGpFNWuhvaKYMX/QLAEcAS4buO
         ug2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776886249; x=1777491049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POsRoNKcX3El6pnQ5j1guV8Iq6Qc5ANtHCMf8xyTKwM=;
        b=lHIZ7ZKPw14bUrKMzOINA/lwqumUqqSHDW/uDX5xKf/J1bOJOtFfvYJ9Shlk2G+5PC
         JCQiADtbvpmmc6TgbIl5TaWG8HQAbKOKmjIko9NVrYc1StEjni/h4/O2/ChZii7XaBmp
         ALd12LpbmxXc5dIgE013rqZC1PRiiseQbZLXFtJxdXRH1nISn18L01D5XKbepySKykYV
         amQRKlpn/SxO1R1Vys/iAgBQiz8QBCHAu/7Afs66N2D8Migey4aCN9G4V0F4q20Um8uB
         vv1VTdT2hhwdv1jbZjb+A2UZKhL+UyvUI/Z4f4h1ebZI+PLV3QIGPX4Qp56abw99PrTZ
         epbw==
X-Gm-Message-State: AOJu0YybCG+v/j8vSeFfa7U4lmIUepiC39sHXgtGv1wv1vPGqoXkT5wN
	toAishicPT5riAK7L2OF6W4MXumBm8nRg1PHJBG02fXwpl1dZBy+n+rW3kgAjHmV
X-Gm-Gg: AeBDievUyp0HsXATi4eetPSCH2KO0y2iMBdrCrp/mD5y/+o6eAxpzGPnW60pqkjppqZ
	RfdtCFKPglv97M1YdfhE4R/BuyvnqSXVTqOyS8nVbIuARAxKJOZQKgCx7FziKo07F8YTcHdUo9l
	aHvbrroYDRRGivC7cGTSk6ODPtuFfzeXiCtJicXpg6kpg60rdxFj+dKYQdUrofMcvXW+KhQMtTI
	lrtMeQx1IMLiEdoKdvOtTFi1bQxO2AGXRawfH1g0qjqn2ZVPJZPXRHknp3+7A3kY5wjvhlmpRz3
	li6LOzqIWIWJgRYYvut9urvd9OlMRyYp0XL1m1iESSuWRpV9c2XMdqWpKAh4jMlXqnTraaBt8gu
	0dJ+Y+/TNrf3BThyM9y06gb4oAaqqF5hqKeLhFcX85ks/zSS0MQ9Tbg8H1KJlyVJEUjZqdjlVbZ
	fCNrgSXVPsuWeZaFap3uWi8n0F7kX+ndbdwvWIM8c5aaLz7U7MtYL2dnTx+8ec+vh2rBynyzu88
	vFxfyFEfOHqw77a2dWhZUU=
X-Received: by 2002:a17:906:599c:b0:ba2:5354:95dd with SMTP id a640c23a62f3a-ba41828ccacmr870820766b.5.1776886248738;
        Wed, 22 Apr 2026 12:30:48 -0700 (PDT)
Received: from karaburan ([89.150.155.129])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45504441bsm574833966b.45.2026.04.22.12.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 12:30:48 -0700 (PDT)
From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jhonata Poma-Hansen <jhonata.poma@gmail.com>
Subject: [scarthgap][PATCH] dbus: gate user-session PACKAGECONFIG on systemd in DISTRO_FEATURES
Date: Wed, 22 Apr 2026 21:29:54 +0200
Message-ID: <20260422193025.1263535-1-jhonata.poma@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 19:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235735

On scarthgap images built without systemd in DISTRO_FEATURES, dbus
still shipped dbus.socket and dbus.service under
${systemd_user_unitdir} (/usr/lib/systemd/user), because the
'user-session' PACKAGECONFIG was always enabled and passed
--enable-user-session --with-systemduserunitdir=... to configure.

In dbus-1.14.10 the user-session autoconf option (configure.ac and
bus/Makefile.am 'if DBUS_ENABLE_USER_SESSION') only installs systemd
user units; it has no non-systemd effect. Enabling it on a sysvinit
image has no benefit and produces the stale unit files.

Make user-session a systemd-gated PACKAGECONFIG by using
bb.utils.contains in the default, so it is enabled when systemd is
in DISTRO_FEATURES and disabled otherwise. No changes to the
PACKAGECONFIG[user-session] or PACKAGECONFIG[systemd] entries are
needed: --disable-user-session is passed on sysvinit builds, which
prevents the configure/Makefile machinery from ever setting up the
user-unit install step.

This is the scarthgap equivalent of master commit a296b0623eb2
("dbus: use the systemd class to handle the unit files"), adapted
to the autotools 1.14.10 recipe. The master fix was broader because
the meson 1.16.2 build handles unit-file install differently, which
let that commit drop the manual do_install unit block, the
systemctl mask postinst, and PACKAGE_WRITE_DEPS. On 1.14.10 those
pieces are still needed; the minimal correct gate here is the
user-session default.

Fixes [YOCTO #15779]

Signed-off-by: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
---
Build-verified on scarthgap (crops/poky:ubuntu-22.04), qemux86-64
core-image-minimal with DISTRO_FEATURES:remove = "systemd" and
VIRTUAL-RUNTIME_init_manager = "sysvinit". After 'bitbake -c
cleansstate dbus && bitbake -c package dbus':

- packages-split for dbus/dbus-common/dbus-tools contains no files
  under /lib/systemd/system or /usr/lib/systemd/user.
- /etc/init.d/dbus-1 is installed (packages-split/dbus/etc/init.d/).
- The work tree contains only image/ (no imageno/ side-effect dir
  that would indicate --without-systemduserunitdir is silently
  redirecting installs outside ${D}).

systemd-enabled images are unchanged: bb.utils.contains returns
'user-session' whenever systemd is in DISTRO_FEATURES, so the
default PACKAGECONFIG matches the pre-patch value for that
configuration and autotools receives the same flag set.

 meta/recipes-core/dbus/dbus_1.14.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.14.10.bb b/meta/recipes-core/dbus/dbus_1.14.10.bb
index 4fe7af7512..1b6dd0dad0 100644
--- a/meta/recipes-core/dbus/dbus_1.14.10.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.10.bb
@@ -29,7 +29,7 @@ EXTRA_OECONF = "--disable-xml-docs \
 EXTRA_OECONF:append:class-target = " SYSTEMCTL=${base_bindir}/systemctl"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
-                   user-session \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'user-session', '', d)} \
                   "
 PACKAGECONFIG:class-native = ""
 PACKAGECONFIG:class-nativesdk = ""
-- 
2.51.2


