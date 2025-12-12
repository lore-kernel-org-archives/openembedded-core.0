Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298E0D4417D
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:33:24 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9992.1765535595698036744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 02:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=BBeZKap7;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.43, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6415bc0cab2so115369a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 02:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765535594; x=1766140394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dweruoFS2hSzD89842ZkHTQ+jWI4ilFOHwDM6py/yME=;
        b=BBeZKap7I5REDFePx5D1jafOtre9xorH2N2KHfzqssUoEO9WkxP6rpZXRbra6UytZ1
         oVxxVmrCrG7fhMPXMNqxz/fQgMpNH6niYTeTRoKQuwKTWTSLjrsl6kJEjXzaLUUf9FdG
         9CBeo8Brz76kmWbnwFODmqPTnu2Kyp6wfT3Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765535594; x=1766140394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dweruoFS2hSzD89842ZkHTQ+jWI4ilFOHwDM6py/yME=;
        b=uHpXtoRs7aFvCvuSPotdT8NcmlLe2gqaUoZRCLjgHI68pIlGClHXl/DmAikglsJbkd
         1SX0rp3wFgVIModvso+WofUd2pNSgUirfcFdIv8aVboPrYnbzSDb/u32VUNRNcK/LD6K
         f1VfOPpObyZac+dOKORew4j9aY/z/VE/mHPCStlEdC04Z9r2I+AIyp2boV+DBatYrbjC
         gnQDmnWtABFoLs1i9hnNZQBzRFE4aszU4Mh3JkRmRg/cgofuwKqznR0tD+zZeWhGMxcb
         zWu7eHM/MVdm4dO4rNMbFFOw6LVqq9BZT0lXXZm+CztB9dOof6+/hijmQe9eZIDGFU/N
         Mgwg==
X-Gm-Message-State: AOJu0YzuhbDchOxk9mN78i1k7rZ7Bsv+p3655XcztXeLb2quouN1exV/
	65fVlVriDCl6DghV2ewuBDPRG/Bj6Ypc7R7j+HE+szctljDx+u87Ayv2wmRJwHSuaKEZPQzvbAm
	7vJWt
X-Gm-Gg: AY/fxX71NQBu7VBf1I0RsMwWa0PMKPJ22CGgkCp+QEsw4Ua7YXz6U/eo04EEeijXHwa
	2bcGo4565UgdBXOGjU/4sP08ZBBwvJKNJs/+qfloVSJsDBeCV4mBgZ8ggfrG941v77KymFBN9aO
	ppTOUeCX6BH5Ncrvu6p9QUU2H2YVQ9HxfPffp5HDTpSYmU9la8J0SYBMoDAlkqlnVqMcg9RrBBf
	mOWRCuAtMjXVv+DdzUVrWVoq5AJX1kzH5ZDMFwqeBPxXbf8qtKt9baTZEEKeJIEKCDR+Ik8cWtd
	DHS91GYR6Aj2tU7TD0G8bj/gwjEKTjm9Nlyqk8YekGUhkkERCblQKOoRElhwW2Za4pPkqQMk30A
	4FR/CGGcRU2KwtkJG7MVgNC8gj32S5mI5ATjdvSCP/7tC4lTSoFyQpZVe+SXmMKWiBkt3jLHstO
	CiBoNgCQlqoQC8eiTUxmLtXHGiuWstbiXleT/IgmkLVS/Cc6LZVa681/Yyjbpfycbp8W6B2XWNP
	jqjW9iIjCKnDIdmGaTvCIfjF2fQ2v8nHIQQwpO+KC8DdkF00LgceZ9onA==
X-Google-Smtp-Source: AGHT+IGf8XQCh90krxOfUcEDELmgBx1OKioBnIv5JRCCZFa9GGUxLnpecove7Ln1kEoFSNzrsO80ag==
X-Received: by 2002:a05:6402:34c6:b0:643:4e9c:d17c with SMTP id 4fb4d7f45d1cf-6499b03ddb5mr862938a12.0.1765535594004;
        Fri, 12 Dec 2025 02:33:14 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-649820516desm4935216a12.14.2025.12.12.02.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 02:33:13 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 1/6] signing-keys.bb: Fix DISTRO_CODENAME truncation
Date: Fri, 12 Dec 2025 11:33:07 +0100
Message-ID: <20251212103312.2077322-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 10:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227580

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


