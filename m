Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B104AD41D74
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:05:13 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45038.1765793104229334598
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:05:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=NT6nepJX;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.49, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b735e96872eso64723266b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 02:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765793102; x=1766397902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dweruoFS2hSzD89842ZkHTQ+jWI4ilFOHwDM6py/yME=;
        b=NT6nepJXElIKhZR4m5a1DlH0PxAcdo084HddRTlEDhfILgH0IN8Nl+G2Scmb9zzWQW
         sUnpFtzssLzjtFOgfHu76WNtRa4IM8q+eYASQcECB3WlQgU2qgMivvLspcnUFM+1kxVW
         qbIVRQCCpHtdfPcZ6E50JGg3FbVguK8bnKx8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765793102; x=1766397902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dweruoFS2hSzD89842ZkHTQ+jWI4ilFOHwDM6py/yME=;
        b=BBLy3VdDxJ+AiPgh42EN6MBWaeWG3Wq/5MwiU1eHaxPt37Ib39NpUjghQLlURv4bem
         oybix3h+3X9QfDmQBiGSQ8TUEpj0IZ56DqtKicTaW/ondLOIrvPopv+gRVRb0HW9cH3I
         OupzKJvLWQAPb6TXkxAnvZ9dpdDRDRcBzOkiC0/DgAhGk8klItZ/RkvT2XiOwYSSLLgo
         NqGfw6BqiAKNfBPaTfkEpN4zW76Oi6fWaR0nOb0CnfWIEgJ6XenDfa2Jhu3e9sbfwc2o
         SkJht9ziYsDXwpoRBjSorf1YXCZ6cAwP6hxxa2rXb7buTO3QuG2bOSsYnFNy5RqgzmOL
         8XnA==
X-Gm-Message-State: AOJu0Yy3cRoDT1U6O+okq+bXWohwAWfA0KjHR3nhijE58mpbnG66ogmK
	/ufUNHIc16zOYR17t4JuI+ZjFAqZpsRmMVaVtBjAsoK+jqfhO3kWkhiiN2WnDCF5gE/G47ahyJZ
	1923E
X-Gm-Gg: AY/fxX5rfW7yPbElUIHTtzLo1DVJbyiuW8vFN7Z0PgbzBSli1/buMLk0kzAHMokrUhc
	/F8zvK0690RL+O4stx/hLcxaMRbvFv+FschczzZ609kDDsnRxT0iThWln+/IjQO4Pz6WkTisWEW
	2+MJOePnEwXLVPQK9zZKzr/D8t7GEvfXRQmML0+juhGds7ZnIByWO/8khDKFWOqlXrxUYe2F+IO
	I59yycIymzLAUJ3304aVLSRxPGjGMJAUmjG4EuDMVQUWAOaa19kM7iKRr5m6evOZtC1pwciE+fi
	KUNWLChpYz5oUCQXr/RYu8UOROWyeoV0aerfCws5do3+iFcbcSbKYiQyxcrJ8QBOqe4at20NZXY
	QKc9HXY+8y1sInv6vhV4dmfugrk+khtYlQgGtoqzBCAbt2GQ1FGv+TpqX1wyiIFI8n0h8yq2Nqe
	BYy+u7yilNDRcs6R2CyZj9MjDdMEX1AJK3yJoY8a/yUDt2kbQXLki6oYrHXGxxW3fC3BF7wlsnC
	niN5OjG4U1bSqOLluQ37+lEq32e61V8wZ+nqujFbkqLFfD+sRDKM0tJbmSVWRsGtCX/
X-Google-Smtp-Source: AGHT+IH/91gaT0QBEPbCIWEF23nV9nEN7Y8og4XIcAa1Scvx/0/RLR0kLG6rp9iIjz7vPGWGj2c+DQ==
X-Received: by 2002:a17:907:9689:b0:b77:18a3:cd2d with SMTP id a640c23a62f3a-b7d232e1e97mr557937466b.0.1765793102500;
        Mon, 15 Dec 2025 02:05:02 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa57192bsm1336898366b.53.2025.12.15.02.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:05:01 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v3 1/6] signing-keys.bb: Fix DISTRO_CODENAME truncation
Date: Mon, 15 Dec 2025 11:04:55 +0100
Message-ID: <20251215100500.1626964-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227706

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


