Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16340D5B170
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:20:54 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45237.1765794045383166035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:20:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=H8HhSSc5;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.53, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b735c1fe67aso56433066b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 02:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765794044; x=1766398844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dweruoFS2hSzD89842ZkHTQ+jWI4ilFOHwDM6py/yME=;
        b=H8HhSSc5Vo0P+zzyf3BCiV/srjt7RuBBG7Em3nUEqlGMD/MjTReKUllkGaWQhkUzc2
         NyE3PDkDmNsj2c0cwHnbIe2oksRFLDIxMOlOsD1H21+NQOpfBTKpv+mWM5qzPsXv3ZOM
         Xvfs9I8fPjXe5xyqa6wAC/akufn2oUxY52OxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765794044; x=1766398844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dweruoFS2hSzD89842ZkHTQ+jWI4ilFOHwDM6py/yME=;
        b=LEYM2Sy8hZOkn3ZpVMf9J+8SmqamaQPojqHlhGYK0tvlVS6Dj3f8jtDGw0fg7xiQkN
         5wlu+7l8TVvuEdatOW1RKaHlJ2lZrX3LgzLmMT2JnRRqQdCBXD4Wr54zKVZVzU14ozqG
         oTdkbQKFI3MdtSdGUUVZ1XRhQt1KThNEYV6v1VQ7YR3lyPxlycHlx146oL4vVmJrn5D4
         bQun+aOVfTCs3rKXTe4sXDzR3SRdyTqt6pvzrm73zEK5s5IWeIahSL7gzYyC81hyZeEr
         4yxwRkk5La2Ljup8hyPKM9EaaeO/y47XRU4phzp9UJxGfdMd2FVw1oYLHSdufdKTvkdp
         mmrw==
X-Gm-Message-State: AOJu0YxfHlM56JtGPjcojFnzeWGIFHjiLAOvgXDa+EghXsgforXbQwCL
	HF7RQ0ZM3EkLNdsdUfVwOgdatt1v3XcLZaQbU2wzLNjtl04eS2gcGa1p3uw3QqxOulZ4nRHegCi
	INQMR
X-Gm-Gg: AY/fxX5R+omiPTXfQ61WYnqnzCa5ExO9c7IR3kb0QqHtvsWqqu0Kyn7N+XzoX9RQrvk
	jDYUVfxX9Vp/LhrH053fZZmFgxkj3NRVjz/90O9Rj8WLinCDAtyQLzMMHO2AAfQt7eQm7cA5+iT
	ZZz48wRMiuRCOPj8JfweAtWFtwM2/aK0P3k+HpC6UPh2dX4kXzb3hjtEgZJ33OsK63l/E5nzrQu
	W1ox6IQmkVDGlTm17kvtexPzuxdeQbVYKzLdYZwrDj4FM5wUAb1FLSokBzr6wRzVcU0CJco/ZsX
	z6P/IQxz3MxjXzj6nX7pHvN3gL0s6E6AZqkY/2wrdBwEHyZJ5NsVAYcb/nche0MtxfgLF+7AFrl
	pvReE4LX24T8KLKMEuK5CWo171hTT29HObkD8ikvdIwBfl8gwUdpYKSXQBVv/d9v3lHD+j52fV7
	+sMpylC0aB3EMdhjyoxpTOsT8XZ+ujmVMEmSUWHxMziUayuL/aNST2WpkeXF4AvEx3RyAGUuTLg
	b2bedjF+Suhe3BYJjGt/GzSnf7tmCypYGROF/Bs4mk7eD8rNbMds4zntQ==
X-Google-Smtp-Source: AGHT+IEqJ3V8XMOYZvHBYGMyzolGYiqMGI2sEeRyHQDZ/g4220eIQe5TqVMCrZVjP5Qphcy8uusLnQ==
X-Received: by 2002:a17:907:3f20:b0:b73:51f6:e070 with SMTP id a640c23a62f3a-b7d23aa416emr605064566b.7.1765794043664;
        Mon, 15 Dec 2025 02:20:43 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa51757asm1357193566b.45.2025.12.15.02.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:20:43 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v4 1/7] signing-keys.bb: Fix DISTRO_CODENAME truncation
Date: Mon, 15 Dec 2025 11:20:35 +0100
Message-ID: <20251215102041.1630567-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227717

If DISTRO_CODENAME is not set in the environment, bash quietly
drops the string resulting in a key such as PACKAGEFEED-GPG-KEY-defaultsetup-

However, when python calls self.d.getVar('DISTRO_CODENAME'), the resulting
string is 'None', leading to a configuration file pointing to a key such
as PACKAGEFEED-GPG-KEY-defaultsetup-None

Add a default value in signing-keys.bb to set DISTRO_CODENAME to None if
DISTRO_CODENAME is not set.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-core/meta/signing-keys.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index 94f4032911..c7713ed4a6 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -45,6 +45,10 @@ addtask get_public_keys before do_install
 do_get_public_keys[depends] += "gnupg-native:do_populate_sysroot"
 
 do_install () {
+    # Python evalutes an empty DISTRO_CODENAME to "None" which would cause mismatched files
+    # as the update config file would show GPG-KEY-${DISTRO}-None but the filename is
+    # installed as GPG-KEY-${DISTRO}-
+    DISTRO_CODENAME="${DISTRO_CODENAME:-None}"
     if [ -f "${B}/rpm-key" ]; then
         install -D -m 0644 "${B}/rpm-key" "${D}${sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
@@ -57,6 +61,7 @@ do_install () {
 }
 
 do_deploy () {
+    DISTRO_CODENAME="${DISTRO_CODENAME:-None}"
     if [ -f "${B}/rpm-key" ]; then
         install -D -m 0644 "${B}/rpm-key" "${DEPLOYDIR}/RPM-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
-- 
2.52.0


