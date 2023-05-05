Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB46C7EE26
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:14 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.30227.1683300008779828475
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vdVBqkrU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-64115eef620so20367487b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300008; x=1685892008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjzV8ALtJ5MM9NndhCvwBIlduQ+ZeksE7ZU6L9jeBEg=;
        b=vdVBqkrU9UK8+VvXYBzHQ3MQNejRWELr0kwInqhDYuBob8bEAblMQ8oEZpwmndQJVy
         8LBWKxp6yq4lXK0VxVbaiWaYqAiPrCHWlkP+vPvDugMA5WXOxu/EF/TBX6UsT+ubI44f
         +VLcVSZtOeTD4VTkH3h/uIf4UufBgoOKRcBPpZsbBBWKJvvy+IvJWEGOKppZH5/MuLlk
         XM3knmeL981BBEoLI/yYaMNNI8DYNWeTrXfMeMXseFWOqdirgdZcauVDf8whItk+oD1a
         +EBWVNeWrTEV2IkJIrFAafRF+AH4GxV64ur4vk1n/4uDyALokdhA4jAs5lXSoggGliCJ
         Lt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300008; x=1685892008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjzV8ALtJ5MM9NndhCvwBIlduQ+ZeksE7ZU6L9jeBEg=;
        b=UjckygZYz8r5tyyyPXlG9hovruex3e+/CHJx/2LhoUmysbhVNGYxWOA6CMfjcBs1Lx
         KLxYqEvkPxuy/vWqD20VCSrzH5hKOXsZeCQsP8bffwWqjnhEKYj/1E7zDRXdS7obbwsb
         INBaXurubCTTKqds1C51BV41+TTyk3MIv8jTBVxuwyx7yBo4NyppReG1xGw8qSUWd93t
         7PEGsyUCEALpiEimblzkV3HzbS/PurnVMUoZ5ryIpawufEbmjFy5a7OaQc/dsKQSlQwi
         M0PpbCUShfT7KHT8doXecJOyR6vvFKR6Dk2T29XFwbVWpngcyXH10JLx4Lr9lpXkhn5V
         39Sg==
X-Gm-Message-State: AC+VfDz6kFPDNUV59Cu/HgbGMZmKQ0YQzX99PXkIyBYbeuKVtasil8RU
	PnuNfdEKUbgslwhnwWQ1JY+WWV5uopdMu4WuhJI=
X-Google-Smtp-Source: ACHHUZ76QwEcMiBm8tVaVZXlu9n07HHIGvZm+t1/ktrRMHRBDK6kOPVIMZ+LOAxk3f4+9aKnbxXpcQ==
X-Received: by 2002:a05:6a00:1d14:b0:643:90ee:56f with SMTP id a20-20020a056a001d1400b0064390ee056fmr5914722pfx.1.1683300007748;
        Fri, 05 May 2023 08:20:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/35] cve-extra-exclusions: linux-yocto: ignore fixed CVE-2023-1652 & CVE-2023-1829
Date: Fri,  5 May 2023 05:19:14 -1000
Message-Id: <4c395cfd5edd42e81ef7aa89df8be7e9291ea89c.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180923

From: Yoann Congal <yoann.congal@smile.fr>

CVE-2023-1652 & CVE-2023-1829 are fixed by all version used by
linux-yocto.

Fixing commits are not referenced by NVD but are referenced by:
* https://www.linuxkernelcves.com
* Debian kernel-sec team
... this should be trust worthy enough.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
(cherry picked from commit 8f9d6c5b0238641313387c139442566752a1d25d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


