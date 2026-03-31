Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76890FF60FA
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 09:57:19 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16606.1774951038262019735
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 02:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=D3ivu2hX;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.67, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-66bb4de745bso373089a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 02:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774951037; x=1775555837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88i2vswGLCwDgX7a0DwZxyHIiq+AG31CjA2c2S6sE0Y=;
        b=D3ivu2hXu4lxRBjAJwSHL+gRKTt71jnw3tyV5HPznnQ1OQWxE9ygCPiG1ziliPB8tp
         k6EGZaPzQ7PQ/qD2k9FbvfO991Dlr8pqGcBaJQP/wIjfdMmLKgg/En/cneEAUZbMCTD+
         Q040CHV62rtXqzDOVHWBYozgwkc/EBxof6pYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951037; x=1775555837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88i2vswGLCwDgX7a0DwZxyHIiq+AG31CjA2c2S6sE0Y=;
        b=rUKYobQiGy15QmggjsEp78unR9DBH5XcgjIaO8uZ3GCOz1uOJojZfeJI0017UKRQ42
         UG3pA565rHt/dpjJME3aEdUAvEXO0tYVCeh3XGk/MPxju0erbzvL7ehsp/+1HbqPk0/7
         KG6XKDMKn2V7BK53YYsbbrqtF1kpjeW8Lhju4ud1eyjSyU5HT5jZIBitbcECwVFIKJZz
         hYP4pzmjX/T+mEBUyGYL0LSfq3pnpCmtKyysA+lx7gyfo8lswsgIJ24AXeq3W8IO7d5f
         1iRIBpvgHqmt+t850Z0lIFccCzYn0o7YtMxlO93gOPXHhkPf2g76nX//bgFmo9IjvnAi
         /PNA==
X-Gm-Message-State: AOJu0YzDQFdzLAffqd4XPdIy6RHdSzTZGQNYS2iUlzw8BZV1ElGFpDQx
	BwZ1fueZH+Blk9SxxKQjCYWnTnQbfI0h9bPuVBwAif08j+qPaTR3QxvFLAANd1tCEU8+YxBkR/i
	y6Pom88Os1w==
X-Gm-Gg: ATEYQzw/TUcVRaFpihWhYL24/lRTn4B5+q6NxyefxYTpktpKG1l9nC+24Na3qq0gl0H
	PT8VxvPx05SDrZv5hNjowdUiN2AQ8ACdmDnWIywgXX3zxFGFCElCAfYn4TIgOJAHq9+fzmWu+R+
	96VjHIBHQPPvPKiqc5/OdqcMDYZpnK+nMbsHHX0FClBN42ypWynNFbWNedfJRYhsFZ1p5bh1rXm
	fTXl5evg/cUm3f5ZbLpfBAEr6WtVMLB+9dTpeAuazr0p7TC9r1GOFW6x3nFA9d4ms04UTyGZ9GB
	cDFoKDFy1vi2RhNs6YpmUUblU+pcVn8p+qVgdIp9sjE9URp/e8pzNPVYpN3jOSejn1HYxZWCpRb
	nr6en706PflLELGyZxjw9IhAltVCwzwBpCrUtjErUhHOqP9tNwHa+0Np6JVP6fpRtO9myVlVqT7
	AMDZGgy5h1y6GwGiGjHO/s3XFIwMVsxc2DagXZZANRzwAWRazL7pMW36LBepkPW+zEiHDTnLgD9
	Bdf3xf/KZQ=
X-Received: by 2002:a05:6402:1ec9:b0:66b:aeb1:d979 with SMTP id 4fb4d7f45d1cf-66baeb1dbbdmr2569429a12.2.1774951036603;
        Tue, 31 Mar 2026 02:57:16 -0700 (PDT)
Received: from adam.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl. [212.57.59.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7607a653sm3413599a12.24.2026.03.31.02.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:57:16 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v8 1/7] signing-keys.bb: Fix DISTRO_CODENAME truncation
Date: Tue, 31 Mar 2026 11:57:07 +0200
Message-ID: <20260331095714.1285106-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 09:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234273

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
2.53.0


