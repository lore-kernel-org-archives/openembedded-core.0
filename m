Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BDFD3C529
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 11:03:52 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13162.1765364625081091707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 03:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=baDrtHFb;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.47, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b735c1fe67aso74512466b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 03:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765364623; x=1765969423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dweruoFS2hSzD89842ZkHTQ+jWI4ilFOHwDM6py/yME=;
        b=baDrtHFbmgpapUDVLKtDOC5x/6Eb6T0epUykT/Gigkj+p0UQ+7sArFHDuo6AFOOBoI
         sh7Of6WHaScyabm2f+ppnH9cVVib0I4dwX4TIwzJhz8Q8DgkcEZo/+oPLe+jbZbh5zoM
         0FAHJI4B2r8Pv7AzMlefkSjvV+VT0rW/r7trw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765364623; x=1765969423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dweruoFS2hSzD89842ZkHTQ+jWI4ilFOHwDM6py/yME=;
        b=aQz0IeUAdN821paP6gEjxt2LiEkJZNjnBSCWfA1ausQ4Kqzjqx7gD96CjY7Sv67jtd
         xZH1QbDhJK82aSq2t7N7Ib59gwlskQtVuscoGnd7wYlxAYvV4aee/Na+D4Fs82RPstQh
         BpFqj9S2+fbWcc4BQHO3rRJOd7seEW7MDBC8v9Z5T34LpxBRc+WxP75K6h/vYxlMypoA
         eBsFGsU4j0rjHdg51U0r2+sgTpnMHHHOnIT7/XqEZkZ3yBNzRAIzywFtmtXqLN+gjpad
         TmxoXWBzlwBbCUomKBvpryQwD7uxdFu1x6u4vBeYKytUyJ7dwgf318heMEsMZWbC5kOJ
         X+TA==
X-Gm-Message-State: AOJu0YwuZ8dBLgyMvLV4zCVTAew5QZY/fVDbxNql94A65IQSium7brVK
	eN3j/aqP40uxevSxHrloVQaURl5opDC6hdfKSbMB/eEzlh8enemUupzQOwnaEJBSDZVuA0VMVn0
	/hF4K
X-Gm-Gg: AY/fxX73lFptsiCSChFuJR/B2gPt7UAk20SasaoAN6LKdaDx7ynG8jpYkEhC9Z777xM
	IO9a19BHwPx6C1IIU+/anJx1ck8Sq/+WzU0Nx3imXovJz4Afj3ARlCXk4LMASkK8s0rxkMBmAxe
	7EfW9hiH+qKta2BRzLNn95TvNXeqFfFlYmug5hk1mdJtNGx6uxhKdEiY3+l5IV9bvLh6d+bXma6
	8/zYpdg/nSUeM4kKnYVPNutpOsnQpqklc4IeGxtJrGFvpDHuiom/Ck9blUArbdi7atAIugxcztX
	jVFNgzDlMRYsP2hey7Z7iMEuxwO8C4obXC0/P7GRDLDvsJJw7d6c4UBHE1OXYQ0ck3AV9GRX7gK
	eHbFcivVaSj0JqiUw2twZXfaYZg93RBeWoMkDYE2OmSoFyZ32+mPjUsI6pconN/Kaa9f+0YRQMX
	3blW6an329R5rtAFpplJyMZSkZdXdXg12MfayhWV5CsgvXT3M6MA4yQ6bxFN9veOSLAMUnuzhkS
	2xS86+VIxWPasLUiDY9ecHjPud2teTG1gv71QYgIg3AMF3TBOyw
X-Google-Smtp-Source: AGHT+IErE8yNXscqauDl49zxd98pI95NqwWYfI5q2BOEfColmDyr+G2Vz2v60WfwN/jv/DgPNxHkag==
X-Received: by 2002:a05:6402:40d6:b0:645:4607:ab94 with SMTP id 4fb4d7f45d1cf-6496cbdb4e6mr1083510a12.2.1765364623341;
        Wed, 10 Dec 2025 03:03:43 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec31a7sm16227636a12.2.2025.12.10.03.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 03:03:42 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/5] signing-keys.bb: Fix DISTRO_CODENAME truncation
Date: Wed, 10 Dec 2025 12:03:36 +0100
Message-ID: <20251210110340.3631065-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 11:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227466

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


