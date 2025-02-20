Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76BBC021AD
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 04:23:49 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.42465.1740025424080691705
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 20:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PTyJspyd;
 spf=pass (domain: mvista.com, ip: 209.85.216.49, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso761124a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 20:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740025423; x=1740630223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ldy6HDebRZ/JwND3axkwjEO4KDmEO7O8bYNKigHVUI=;
        b=PTyJspydCF/aUlnqEnvZ2oJCmOlNt95EE11fN2XpxdkVYwTvWqqZjs3qNqyI9qYK19
         mrjsw+2kkj9moAGMn4Fm4xBjoL4DWoIaWoqwzvxjoJN5QHgt6lbav/gfA9723+Q+UjCN
         6RRXm8gexZN6ILyBKjq6s/j+86Eiz8EsW9uec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740025423; x=1740630223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ldy6HDebRZ/JwND3axkwjEO4KDmEO7O8bYNKigHVUI=;
        b=VBv+D5R0xuK9jAfa8P5XzbBnnuJb+EH/TVGsmD5oabkkyd/4jHe3eKilCcYAAacvad
         MVs54R5IEZ8CsnWLsQH7BnrCQ24g5hs5f+zruYJeKVrFW005Ru6vys0HjAmUCqiCPnAS
         3oLOE4nqd8+0DCvFFkodcZgVLsBEyHQeiDHlkJROsH+lG79FKNlO+wkP53mOgRQQS0va
         Hf5+BB06/ZP+LdqNCOcAA7mvRKYFZrP3EPh2p6PcpvByK907MshE9BEkMJ6nEdc8BB94
         ga23CUBytJR9FhyZS47IfS9gxlIXtR0+mFZRQLSKwBje4phaeqkr0PQ1YLi70qXbyBHu
         5gsw==
X-Gm-Message-State: AOJu0YyFBu1e7Xyv2OMLW+KP7jQVmlC/agXihbcib1mb+ajtkEv1JG0p
	SnABoaAa1gQdhRDlp6GpKOqGQkmpXsmqbcJv9U1epgI+U1IcFYhnRg0xgImkzbPcMQa0I1r9oCR
	4
X-Gm-Gg: ASbGncuA3JwnyhBjVR2fuOrxNhErwzzKTjfzCTFwI76TcOzaBrrn2NA1Exn94IgPa6A
	l6Gwkkc/3eCrL8LQeXWgzBPhRv6lhw0+IWToTYL6NhsHAuV2ahI4YYAzz3plksuVEDIo0H1lwn2
	NaBgeHu9Tx6Gj4lDy3vkbDb6OyHa9vDRoZ92aVj7Dhb066ovSRyZnbIvdzta4AuiG5zdRl/ZqJd
	S2a8vw6wx7wPwgwXFix6fUNIwtlpT0DT2CscZjnXJSdXWg5HHxjeh833Jv3RpiLisSeyOYGp2ur
	oR4549Jmlmt+ukHe5KrHUYVrW33XRA==
X-Google-Smtp-Source: AGHT+IEtYYHei9QJUkF+93x+txs9lgSGtpz61WM4pkx7zuAHfn7Q6da33kZiHhe2vciJVzhjpqyNsg==
X-Received: by 2002:a17:90a:d2cb:b0:2ee:5691:774e with SMTP id 98e67ed59e1d1-2fcb59ec563mr9967554a91.2.1740025423291;
        Wed, 19 Feb 2025 20:23:43 -0800 (PST)
Received: from MVIN00016.mvista.com ([150.129.170.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b32fasm14698476a91.10.2025.02.19.20.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 20:23:42 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] libcap: fix CVE-2025-1390
Date: Thu, 20 Feb 2025 09:53:33 +0530
Message-Id: <20250220042333.68100-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 04:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211738

Upstream-Status: Backport from https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=1ad42b66c3567481cc5fa22fc1ba1556a316d878

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libcap/files/CVE-2025-1390.patch          | 36 +++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.66.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2025-1390.patch

diff --git a/meta/recipes-support/libcap/files/CVE-2025-1390.patch b/meta/recipes-support/libcap/files/CVE-2025-1390.patch
new file mode 100644
index 0000000000..339feaba92
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
+index 7e8cade..7b3d2d1 100644
+--- a/pam_cap/pam_cap.c
++++ b/pam_cap/pam_cap.c
+@@ -143,6 +143,7 @@ static char *read_capabilities_for_user(const char *user, const char *source)
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
diff --git a/meta/recipes-support/libcap/libcap_2.66.bb b/meta/recipes-support/libcap/libcap_2.66.bb
index 7534063b7d..42dacb301e 100644
--- a/meta/recipes-support/libcap/libcap_2.66.bb
+++ b/meta/recipes-support/libcap/libcap_2.66.bb
@@ -18,6 +18,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://CVE-2023-2602.patch \
            file://CVE-2023-2603.patch \
+           file://CVE-2025-1390.patch \
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
-- 
2.25.1


