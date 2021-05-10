Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.32895.1620658560242762358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QII0X2oi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id p14-20020a05600c358eb029015c01f207d7so3339923wmq.5
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=diuNHKzQZDWXOmJOcncY/mS3dKoBTOiRh6MaOCiJzDQ=;
        b=QII0X2oiXmrOatkU35QVGULIhwHVcNb3Jc7+pF8Klphz/FsG2XojkHrr92hkuut0vU
         DpNtg7qrDnyeitCF5dG+yJBQ9aKQsEfmByg4lNqyCo6JFQxbZBvXrlkWOEWkBuHdAqbo
         YSdaf/u9hiEctMun2a1yHzU7rXEWh3q/wdZHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=diuNHKzQZDWXOmJOcncY/mS3dKoBTOiRh6MaOCiJzDQ=;
        b=ni2yuk/kavXjegcHzu2ZQ3y0w9V4GEQoERS33pURzl5YU8GtUA8oKCf8QH+9SiGZH3
         hf9htfz2bWZPSZh/Qa+CMaeZtjiKALvBCaOm4MNGVF96fKnIgvDETJNF7rWlkghGHavl
         c4o9duLeMFubjO6C/hiRgHUodl7HhYOi3KPWIGFnxV7/RS5MPgqtv63wRR/RQc41xWzG
         /q+zJq/s6bAKoB/YHS+SjH128LFtTPf/R+KsxdzPZ6QPQJbtBs3CIMqNjq0L/7Leiybv
         LT4A/Wp6qjAU3/x9Yy++TDr/Sf2FDNYIyfLq9zusHUrEhUgIqq/3+HSSzjJQ1j4Xb1yH
         ljiw==
X-Gm-Message-State: AOAM533jOaG1A6gAD5dEgHfnj3nqXe3UpigS8WB4d8+gEBejp5/GGH3o
	RDSakOcTmIoR1O8OYs2sKye2hCu6rKspNQ==
X-Google-Smtp-Source: ABdhPJyeru5etMrMmY4GtQMMx/SORETY/Wmk3AI/kyb2XDUuIe19RfOIyxdra1+7S+R7zKVs0v/wgQ==
X-Received: by 2002:a1c:b406:: with SMTP id d6mr25608642wmf.105.1620658558393;
        Mon, 10 May 2021 07:55:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id q10sm22504058wre.92.2021.05.10.07.55.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:55:58 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-extra-exclusions.inc: Document 2 x qemu and exclude a glibc CVE
Date: Mon, 10 May 2021 15:55:57 +0100
Message-Id: <20210510145557.2164339-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One qemu CVE has a pending CPE change, the other is still being pondered
by upstream qemu, document the status.

Exclude a glibc CVE entry since it is for a specific corner case in
ftp servers which are unlikely to apply for us and upstream have no
plans to change it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../conf/distro/include/cve-extra-exclusions.inc | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index f81b24b5284..cdaa8daa4d3 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -25,6 +25,13 @@ CVE_CHECK_WHITELIST += "CVE-2000-0006"
 # we can seem to take.
 CVE_CHECK_WHITELIST += "CVE-2005-0238"
 
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4756
+# Issue is memory exhaustion via glob() calls, e.g. from within an ftp server
+# Best discussion in https://bugzilla.redhat.com/show_bug.cgi?id=681681
+# Upstream don't see it as a security issue, ftp servers shouldn't be passing
+# this to libc glob. Exclude as upstream have no plans to add BSD's GLOB_LIMIT or similar
+CVE_CHECK_WHITELIST += "CVE-2010-4756"
+
 # grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865
 # Looks like grub-set-bootflag is patched in by Fedora/RHEL:
 # https://src.fedoraproject.org/rpms/grub2/blob/498ea7003b4dd8079fc075fad7e19e0b190d0f97/f/0133-Add-grub-set-bootflag-utility.patch
@@ -33,8 +40,17 @@ CVE_CHECK_WHITELIST += "CVE-2005-0238"
 # Reported to the database for update by RP 2021/5/9
 #CVE_CHECK_WHITELIST += "CVE-2019-14865"
 
+#qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4539 *
+# Fixed in https://git.qemu.org/?p=qemu.git;a=commit;h=65d35a09979e63541afc5bfc595b9f1b1b4ae069
+# which was in 0.10.0. Reported to the database for update by RP 2021/5/10
+#CVE_CHECK_WHITELIST += "CVE-2008-4539"
+
 # qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255
 # There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06098.html
 # however qemu maintainers are sure the patch is incorrect and should not be applied.
 #CVE_CHECK_WHITELIST += "CVE-2021-20255"
 
+# qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438
+# There were proposed patches: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02396.html
+# but nothing seems to have merged. Not sure if there was a different fix?
+#CVE_CHECK_WHITELIST += "CVE-2018-18438"
-- 
2.30.2

