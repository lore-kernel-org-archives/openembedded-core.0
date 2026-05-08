Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6582CD37B7
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:40 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8244.1778224359644975156
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kHK4eI5R;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-444826c16ffso1480719f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224358; x=1778829158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoGbV2KrM0sj6e+pfcEyUMy0Bs9exLsM+I8XkFj35h4=;
        b=kHK4eI5Rb0BrGWET//xzUy+GMpeCKX7FZR9clBfVd6cB1HKX3n3p6O5JNx/tIZSlpS
         +jPTDMf60DJvGN7jsseTnhZBG5u56e9QglCk/wLfjRK7nqwg2IsuHi+YxU7MdCweh7N+
         7PauJtpN9iezfJjSAR5ROJnEWGkt8/L5iYGW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224358; x=1778829158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IoGbV2KrM0sj6e+pfcEyUMy0Bs9exLsM+I8XkFj35h4=;
        b=jU9AU546CeZcPFXUDZIiNYvYGiKVcaaCVSa8cViLVxf4YliVlq/HNkwggpM2Hl04KM
         FSEng0LPUARbHn8XqgCntMVXzgndOdykwaJ4ph0QFM450PJydEQj+xepBRPMnsSo2cJv
         pnoV/XQoFejPW5Yq1sT1FINsu8xngHC1N0Z8rpYnRvSdF0l0FumuZxt/lVMQHZpvhJUL
         H+zH+wNtkqE4kwFvvvTBDoB+i/qvGILYoeTa99gsz3DcgQzyb40/h+zqzrKnvAA2jpCN
         y9i1IerbcDbM6cjw3maptsbe1qUUN7obwuFC0KPlM+W4hIdS/kj3cKjpK90lmn3gJArX
         +O6g==
X-Gm-Message-State: AOJu0Yyx6CE30P9WnMSfxdbH7BU9+wwZqgTiekqbAcaBl25Ra7Q4F5kz
	VQCgmuMmx2AmbPDqJmZTd9JpxpTIUI71D3FnuJBw2wjsnlECZtbUwUDhlw+ndlZXNZXGADKZSJd
	Z2f1dvTM=
X-Gm-Gg: Acq92OEyg07+TPgL1uoJnjGTgO1q9JPIDFjpMwmjFtx1Dz0vHaoWo7M7U/imfEySSYH
	RCCwl5U1PFdYAsR+NsgHSu+jA/HkOsv0qevPknGT4zASTqhCoqhwSWCNj+dWUq2ADNVXDYHYYGS
	keugJmK61Hd+EisiaeS519nwCS+oz12UX/gOfE7FACkgJnUDlgE2X5VI005ZGaozDKJ8C7nrrpe
	ZTBRkW08z9ZY5wNH4Wr4721+b3vYYnCid27xGptbSbx3lYThLV07/7FUBNOzR6cuABuq2AKiDUg
	AxPrY5Iz5DVu6OdX6Vtdy7tG4uBkmIAa4kdrB3fxEJkNGKe0HN4DQ3avp/S+7l+cUiNS2Yz0+y7
	A7dGH0LZDxGWYbCR4Eo1uVOswezsqc+KyTlzjYtsuzHduh0gT61k5QsTDnP/WexdlCrXqp4agS6
	0ulrydXOPQ45h86TCoCYImlLNBFBjb6YsS9gJNHp05jWmRyyW1WWiIMhZVFplqB341jbjO/xhXu
	2JmLa2rzYtnC9wUVmEXo39cNwk=
X-Received: by 2002:a05:6000:2c01:b0:43e:a73e:cc98 with SMTP id ffacd0b85a97d-4515cf11bb8mr16650920f8f.23.1778224357508;
        Fri, 08 May 2026 00:12:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 37/52] wpa-supplicant: remove obsolete explicit debug packaging
Date: Fri,  8 May 2026 09:11:30 +0200
Message-ID: <b647ea9fb4096f0b9ef09f328249300662ef739d.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236679

From: Ross Burton <ross.burton@arm.com>

The .debug directories are packaged automatically by default, so this is
redundant.

This recipe packages the plugin debug symbols into their own packages,
there's no real advantage to doing this so remove that logic.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5ff03b951ffb00b66a7812a9762315a99155d0c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../wpa-supplicant/wpa-supplicant_2.11.bb                  | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 7c7a8bd9c13..71bfb090a0a 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -113,13 +113,11 @@ PACKAGES += "${PN}-plugins"
 ALLOW_EMPTY:${PN}-plugins = "1"
 
 PACKAGES_DYNAMIC += "^${PN}-plugin-.*$"
-NOAUTOPACKAGEDEBUG = "1"
 
 FILES:${PN}-passphrase = "${sbindir}/wpa_passphrase"
 FILES:${PN}-cli = "${sbindir}/wpa_cli"
 FILES:${PN}-lib = "${libdir}/libwpa_client*${SOLIBSDEV}"
 FILES:${PN} += "${datadir}/dbus-1/system-services/* ${systemd_system_unitdir}/*"
-FILES:${PN}-dbg += "${sbindir}/.debug ${libdir}/.debug"
 
 CONFFILES:${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
@@ -130,14 +128,9 @@ SYSTEMD_AUTO_ENABLE = "disable"
 
 python split_wpa_supplicant_libs () {
     libdir = d.expand('${libdir}/wpa_supplicant')
-    dbglibdir = os.path.join(libdir, '.debug')
-
     split_packages = do_split_packages(d, libdir, r'^(.*)\.so', '${PN}-plugin-%s', 'wpa_supplicant %s plugin', prepend=True)
-    split_dbg_packages = do_split_packages(d, dbglibdir, r'^(.*)\.so', '${PN}-plugin-%s-dbg', 'wpa_supplicant %s plugin - Debugging files', prepend=True, extra_depends='${PN}-dbg')
-
     if split_packages:
         pn = d.getVar('PN')
         d.setVar('RRECOMMENDS:' + pn + '-plugins', ' '.join(split_packages))
-        d.appendVar('RRECOMMENDS:' + pn + '-dbg', ' ' + ' '.join(split_dbg_packages))
 }
 PACKAGESPLITFUNCS += "split_wpa_supplicant_libs"

