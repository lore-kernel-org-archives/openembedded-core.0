Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0EAC6FD18
	for <webhook@archiver.kernel.org>; Sun, 23 Apr 2023 18:04:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.32693.1682273093844968780
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Apr 2023 11:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@smile-fr.20221208.gappssmtp.com header.s=20221208 header.b=x3BaC4OL;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3023a56048bso2985213f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Apr 2023 11:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1682273092; x=1684865092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17ZqSOFifHA3s0wRN8/dzqObHtaUbArJ3xrwy7rGZNI=;
        b=x3BaC4OLIxHG+dy0DwVLoCuobmOQF/awVu44KPcxPUNzOKa/vYBZzK2qUn/twuS4XR
         zMtl1owGJBIuphA8HVlNH/t4Qeye4wNKkLk9usBYesoLL3C/7EBTqokQEPbbexSDA3pp
         66pIV3XKAgMbllxJGlXgs4wtVIe3a72XhtSbUIK61mgbzlDmJL4sLtMXh6uK1AmSIHvc
         G8HX11daFnIB5AuwUK6D6h3Q4WnqoegavtVBW3gBePvSne/OZVQ0UXQceMcRkFZ0W+HD
         q4EwuDpxcMkhafBB1zhvKG3+T88vVYlLemdHmy/vkx9VtbQxZT1ApFsY9DTA24t7brAf
         vf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682273092; x=1684865092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17ZqSOFifHA3s0wRN8/dzqObHtaUbArJ3xrwy7rGZNI=;
        b=YAZvDHRuUrCnrsHtv2H0Lvas3FM4QmnaYvEk12HvqkCl1ABH8y27OT7A8wElj5R9W6
         52UFxpHfO72bFXX7lUtQGeuIUEWfxwvp1hgjjvYZf1QLWat3ILSmhmyVNeikcPqud5FH
         s4YXsoT6jsZkJD9w5OvtT+WJHITaUBMiS1y4vHJQXUSXMeLvAG8xNLnpmwYySxWHW8re
         Owi4lX4pQxnn0lDHwEUN9SrCFK+oja/waywS2NAlGKLoIZ9mA4KT3iRVE9xsnPy6UzDn
         A9J9LpJFxHIIFxtoYMSCZyf0UhFUSsO6rccX7Lh1lY0dQmX2YxH1D86nvK+0kv/j6QlY
         RFKA==
X-Gm-Message-State: AAQBX9fUnzvu9Jtas0y67AGts+ukmHPwjOL7vyIJZAxfPYTd2yvizLji
	iQt4D4xKSNW6K4aeg3uXyoTKE+0V6MFe32t8xm27cA==
X-Google-Smtp-Source: AKy350Yy3Ap4U9qZV+Hamopg3LxZqVSIIUcD5pSxUsGDlr1Y0CvDnUqA2RXKPpocUXOxufLDsMMkSw==
X-Received: by 2002:adf:e5c5:0:b0:2f4:e96e:3c86 with SMTP id a5-20020adfe5c5000000b002f4e96e3c86mr8000251wrn.14.1682273091850;
        Sun, 23 Apr 2023 11:04:51 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id k6-20020a5d5246000000b002fe87e0706bsm9057809wrc.97.2023.04.23.11.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Apr 2023 11:04:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] cve-extra-exclusions: linux-yocto: ignore fixed CVE-2023-1652 & CVE-2023-1829
Date: Sun, 23 Apr 2023 20:04:18 +0200
Message-Id: <20230423180417.2102470-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Apr 2023 18:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180335

CVE-2023-1652 & CVE-2023-1829 are fixed by all version used by
linux-yocto.

Fixing commits are not referenced by NVD but are referenced by:
* https://www.linuxkernelcves.com
* Debian kernel-sec team
... this should be trust worthy enough.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../distro/include/cve-extra-exclusions.inc   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 8965a15b37..0ca75bae3e 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -494,6 +494,25 @@ CVE_CHECK_IGNORE += "CVE-2023-1281"
 # Backported in version v6.1.13 747ca7c8a0c7bce004709143d1cd6596b79b1deb
 CVE_CHECK_IGNORE += "CVE-2023-1513"
 
+# https://nvd.nist.gov/vuln/detail/CVE-2023-1652
+# Patched in kernel since v6.2 e6cf91b7b47ff82b624bdfe2fdcde32bb52e71dd
+# Backported in version v5.15.91 0a27dcd5343026ac0cb168ee63304255372b7a36
+# Backported in version v6.1.9 32d5eb95f8f0e362e37c393310b13b9e95404560
+# Ref: https://www.linuxkernelcves.com/cves/CVE-2023-1652
+# Ref: Debian kernel-sec team: https://salsa.debian.org/kernel-team/kernel-sec/-/blob/1fa77554d4721da54e2df06fa1908a83ba6b1045/retired/CVE-2023-1652
+CVE_CHECK_IGNORE += "CVE-2023-1652"
+
+# https://nvd.nist.gov/vuln/detail/CVE-2023-1829
+# Patched in kernel since v6.3-rc1 8c710f75256bb3cf05ac7b1672c82b92c43f3d28
+# Backported in version v5.4.235 7a6fb69bbcb21e9ce13bdf18c008c268874f0480
+# Backported in version v5.10.173 18c3fa7a7fdbb4d21dafc8a7710ae2c1680930f6
+# Backported in version v5.15.100 7c183dc0af472dec33d2c0786a5e356baa8cad19
+# Backported in version v6.1.18 3abebc503a5148072052c229c6b04b329a420ecd
+# Backported in version v6.2.5 372ae77cf11d11fb118cbe2d37def9dd5f826abd
+# Ref: https://www.linuxkernelcves.com/cves/CVE-2023-1829
+# Ref: Debian kernel-sec team : https://salsa.debian.org/kernel-team/kernel-sec/-/blob/1fa77554d4721da54e2df06fa1908a83ba6b1045/active/CVE-2023-1829
+CVE_CHECK_IGNORE += "CVE-2023-1829"
+
 # https://nvd.nist.gov/vuln/detail/CVE-2023-23005
 # Introduced in version v6.1 7b88bda3761b95856cf97822efe8281c8100067b
 # Patched in kernel since v6.2 4a625ceee8a0ab0273534cb6b432ce6b331db5ee
-- 
2.30.2


