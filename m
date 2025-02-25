Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21983C021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 20:57:00 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.19975.1740517009998524841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 12:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lGTAx1IF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fcf3a69c3cso6467646a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740517009; x=1741121809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88Io/O0nFBkp6yvy6xlyU8BYx991rnq5h2lqj7Vlk0Q=;
        b=lGTAx1IFv/mwSwNmM5+x8xnEdOAd2QS6XMwjRfT1vrKxqAB8ny75OAoKmX5OiC74P+
         3K2TLy/M1/FZPh/w+5F0LekL+1ha6aLCeaTb9VthXaQRKPlCfiyXo/iAU6UVIvireVM2
         SfJrPtmYmcRyvWaalG9rbEBm1pQKBY1BjQoYZtFGqro+fC8Hpqxfw2BR68BvOfHRbofu
         qIH5UqB89DU6F0/dYP8fdXC7dxqZvTYov/yf/JZrKAjR1qTkASfoPvkrf6g75fWggJ7/
         3MWW1lRe1lQXq5m8edRyDAiTERlI60fUb+dgOI4DqXJFXX1zfcClMYgk0zvh2n42Bb2A
         J3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517009; x=1741121809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88Io/O0nFBkp6yvy6xlyU8BYx991rnq5h2lqj7Vlk0Q=;
        b=aFJySZ32VHE0IHVeZElSP14PSjMC5KO/+ncM0YcNksYWLFuYTMiFw+9DdfV0OjwmyC
         mO5Q8QDgnm3LA+uRjgXRwGSpAMllFALVJOVPnRab8EMEn0r8088gFQys6phj1AQK8V8U
         gsU5/O8SdWpCZsQlxl2FQ3ElbFjJ45FD4aR/vCy3GbZociwAewL0++/+HSQcK3zlpdVA
         MvSwYOaI/E2CtiV56m8J4GCnLuNeW93X7Kp6CB/JoekUO0G8aulW8AhwhmIEsJ5M/cy4
         mT7AUXx1XZDE3NgB2y6LN93m7cqm2Z8G6H0SJtKjtdEKPsRjipZohGVokGhEiCR7DVxJ
         1/6Q==
X-Gm-Message-State: AOJu0YwruF5XbgDSb03B5AG8JklaEesnDiCyzdluAKcksfex5JoyLmrj
	TNURmFLJRlJ6DqVHMSivhSU68yMPp7rqVY3Z2pprENkZa0lGQpOl6TO0AzSjgsMEBk/sLTNmgdG
	l
X-Gm-Gg: ASbGnctMwxw3hrwhRy8nhfKmKu5ZX7OhpXzhIeryJI+GC5l41jVRaEaBXL971v9T6aH
	hj6PM58q116Jww8HAOiQ3WJgv+x9wxcbOl31OorLfObHagtVSNqPXvZ8Hlw4avb+Diw/9ykzuVE
	+OD22fxKlsTcK4iUCkHfNZI5CCYpAWwDDSb8QeYahXhQWuWEYZMRRSwOxtmPPTVkHMs5Gd+ixXk
	dXB/KvYvlS/fb/QEU6o3YkuIGcP1D1KkWxzcZlweNzpcyARQzCWXiW3xpkcln4C1EB5XB/SEC0k
	A3OCa/f7t7ifSgt4Zg==
X-Google-Smtp-Source: AGHT+IEZ6/utb/owy1wUr52m5jwt/UdOYYKQv2ChuZ+0zr3RhNgFKZZgjGZo+TtO8e7UR97dTIPiRQ==
X-Received: by 2002:a17:90a:d00f:b0:2fa:f8d:65e7 with SMTP id 98e67ed59e1d1-2fe7e2e105emr1357298a91.2.1740517009285;
        Tue, 25 Feb 2025 12:56:49 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d9b4sm10083810a91.6.2025.02.25.12.56.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:56:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/10] libcap: fix CVE-2025-1390
Date: Tue, 25 Feb 2025 12:56:30 -0800
Message-ID: <b975db55f6e0d551e69c870620292b58425f9aab.1740516861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740516861.git.steve@sakoman.com>
References: <cover.1740516861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 20:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211931

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=1ad42b66c3567481cc5fa22fc1ba1556a316d878

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


