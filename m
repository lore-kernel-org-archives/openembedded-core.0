Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A0BC021AD
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 04:05:49 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.42259.1740024341900525166
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 20:05:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KDuha8R+;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2211cd4463cso8041155ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 20:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740024341; x=1740629141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qAuEk6WBqblXs4SOBFyYpPxnjxRTRpXnmiIAGPQdEzg=;
        b=KDuha8R+/CmPFmOs5fb19EPQGtrw66xDvwHtIeX7dYPag6K98vNs1b+9Q7doz5etg/
         T4AcZCmqpl/1LCwqp+s6GEY5s1Y6J5GO2pLL7AIY4dK3IEr4Eodtz2lkIkItCBIXNrok
         NbALho8WXkd9Xx46uRg39ziqXcJlPrBeaY4wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740024341; x=1740629141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qAuEk6WBqblXs4SOBFyYpPxnjxRTRpXnmiIAGPQdEzg=;
        b=i4pKh2tzqpoh92KSH18/U3DF3Oks6XpYYdyfZghc39cRBNM4BBs7axWkAgeV2/eHvr
         HYkuUYFAl81VghbGdTurg/XrmGrz/DkhRiJlqX36bQs8EFBLKy8Kgoobz6qdu/3wMfnQ
         +VQFVOcprBEEKK5GNZK4y8bBUNH95VvcbVY+hVYZTKM94+uM0KWSQ80sJUZl/+ueD979
         uKQUgZvz5NNT4BnY1sdaP/tF11Q8Uep4U5+7VUsUVHk42/kptzZHx7HX8ScekTm4Z2tV
         RNeHn1gmMyvym/T3S1BRArnnljgb3MD4dTOnoXiAdfUP6b0r37lwbaTSV7gXtzILTFFQ
         eDHQ==
X-Gm-Message-State: AOJu0Yy/ESde/jBGdUsXzYYq5kC2dGPNgOq2Ek98UBDPiATa9xOEqmSd
	TFokI8hy6r5u1DOr28HqyFkQ4Dh4MXx5IGUjW7NOb8x9wnAZQ+MaCIHivw4U1MW+o/Cf7q+oOWf
	j
X-Gm-Gg: ASbGncuHJ90l5/jTuV5qJJqbvpJl6lFQLjVbV7j0Dj5ez6nwmmmon0Fo/j39C7gPg+s
	6S9u02fSokbI7PV7rMdXOMPnhY1uQi6r/asWCGbztX85GOQz/g87TBotWuR7Ww7cmSMPUO7Lbgf
	3LuTRcofRrqYRgrhc+ZErJYfaMw6+M0ombEBbFLRUVMqMQ55kH8bt67XpmdfetIjcqM5wVh3A6U
	FDCLqIX/jdx1mpqoq/hNcZXdVrkKb9Oqg0qmRzbKk9wq1yGGikZQV7wNn9mRVQpOpwjGeYpExb4
	3RZb3zzqW/oBnQyC3tpkujkTjwPUHw==
X-Google-Smtp-Source: AGHT+IGrUtu6PXSFZ2Gnb/Tz72bktKMj/PHUNd7o6Rv8rdKsun77dMWQ5/boeJUrpzWl8wfXRDNrpQ==
X-Received: by 2002:a05:6300:8081:b0:1ee:ab62:c37 with SMTP id adf61e73a8af0-1eeab620eb2mr21220659637.11.1740024341162;
        Wed, 19 Feb 2025 20:05:41 -0800 (PST)
Received: from MVIN00016.mvista.com ([150.129.170.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732814ebb76sm6485224b3a.141.2025.02.19.20.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 20:05:40 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libcap: fix CVE-2025-1390
Date: Thu, 20 Feb 2025 09:35:16 +0530
Message-Id: <20250220040516.24786-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 04:05:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211737

Upstream-Status: Backport from https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=1ad42b66c3567481cc5fa22fc1ba1556a316d878

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libcap/files/CVE-2025-1390.patch          | 36 +++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.69.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2025-1390.patch

diff --git a/meta/recipes-support/libcap/files/CVE-2025-1390.patch b/meta/recipes-support/libcap/files/CVE-2025-1390.patch
new file mode 100644
index 0000000000..a0f7dda503
--- /dev/null
+++ b/meta/recipes-support/libcap/files/CVE-2025-1390.patch
@@ -0,0 +1,36 @@
+From 1ad42b66c3567481cc5fa22fc1ba1556a316d878 Mon Sep 17 00:00:00 2001
+From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
+Date: Mon, 17 Feb 2025 10:31:55 +0800
+Subject: pam_cap: Fix potential configuration parsing error
+
+The current configuration parsing does not actually skip user names
+that do not start with @, but instead treats the name as a group
+name for further parsing, which can result in matching unexpected
+capability sets and may trigger potential security issues.  Only
+names starting with @ should be parsed as group names.
+
+Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=1ad42b66c3567481cc5fa22fc1ba1556a316d878]
+CVE: CVE-2025-1390
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ pam_cap/pam_cap.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/pam_cap/pam_cap.c b/pam_cap/pam_cap.c
+index b9419cb..18647a1 100644
+--- a/pam_cap/pam_cap.c
++++ b/pam_cap/pam_cap.c
+@@ -166,6 +166,7 @@ static char *read_capabilities_for_user(const char *user, const char *source)
+ 
+ 	    if (line[0] != '@') {
+ 		D(("user [%s] is not [%s] - skipping", user, line));
++		continue;
+ 	    }
+ 
+ 	    int i;
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libcap/libcap_2.69.bb b/meta/recipes-support/libcap/libcap_2.69.bb
index 92fa766d37..03975b44a0 100644
--- a/meta/recipes-support/libcap/libcap_2.69.bb
+++ b/meta/recipes-support/libcap/libcap_2.69.bb
@@ -15,6 +15,7 @@ DEPENDS = "hostperl-runtime-native gperf-native"
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
            file://0002-tests-do-not-run-target-executables.patch \
+           file://CVE-2025-1390.patch \
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
-- 
2.25.1


