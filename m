Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D941CD3441
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:59:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1081.1778000336787878819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uzj0pe5c;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ad135063so52339775e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000335; x=1778605135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUtqmHoiNc5u3AuXMJU1kcXhmiVlLqdib8W/868V6qw=;
        b=uzj0pe5cDEMOP51nKVB+Q1MwuKK98LVJFfnBFIEp6g4jO5h9pPP7syv3ExlF7EajBN
         h15aYSKqRfFMkaTcH/9RXNwZqtxBEH5GSNeb3wvnGZFsaID7uV+vFAmueZquqLbwMkry
         z39OXZRiQUZ0/eXwsiUC0/7ulSkdTDN/f8kto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000335; x=1778605135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UUtqmHoiNc5u3AuXMJU1kcXhmiVlLqdib8W/868V6qw=;
        b=pgBF1toXUhmmDHp+DOSNn36vwLmYMSLSzA26Z0WfaRmc6rcgN79/qnVhsW1EDYTaca
         5pJ8QU+0Y3+aXRne/U3HaMYnNYx1h9sNJi9usCFlAFzYgmWe5jcBDsQ53UcDsbI9Jm/e
         J1p9Sw0c24Vo9zVuQncmyD1BHFMwWtPqYt7wh8bWuozRiCKDqj8bGsjGGH+KuTG1BOJG
         zxWDQy52M8YoGpub302aZWbWJYfrLoWKNStypWVOYvlRoU+f+KaCH2XKXCgatQDrUEE0
         oNc/VbhFIFT7Cei158Vf6g0KkEqM57/8FlY5/WP343qY3nHGpvehKj8h1nVnlm/u5w+o
         emhA==
X-Gm-Message-State: AOJu0YzbfO1cqQL+ydyMfQWiv2DbKvhckCm7w6xNdcquStLPyH9F8nG1
	GeLhJJnAcNpIapA2pG0/fPW8Gp6TTcm+owQSM6xfyApQTe4BxuXuZFJ03fgTYQ/utynR6PrPC0f
	gyTyBhTU=
X-Gm-Gg: AeBDievaKWPKwMLenRUVE/ZU3bWeyAKnFibMz9gF4G5NzgVTAqn+i3HnG77cyNDZtQO
	8I1rdBDh3Z4haBbG63jff+yvW9i0rvMrRbpsWS9a8pirDsgwdBFdPnWV4ut/bAe+FV5T4eIajUM
	q/EKgqtAwHxzc9Aswjh9nBziCW95Xwd+be31WslYT1YNl4G5zqjAde+bQBCd0kTyeZS9pYrUqog
	W7PmRXiFsT392mRqkATVIjFsQUSJxe0UNqlYWGsfuayhOzg4jLxaks3QbjYPEKe85xc94eL1YUV
	TrIrzlhag1tE2Jx1deaAfYAUHPa9PpNzafhBye33X2i6I0TOxwDeF4YF2N3qh8uA+gwILbCr5qJ
	Ct9d0es0vqUFX2PsVc7ZdpyVDb3DLsX9OZv7sIgencs58jEQiz3muIOpiJsh3yo2t9Dtzrs2FGw
	vqhW8o/y6AQcpHRR3OgxJyLXNiy9hODPbbabAU3o8+qAHtnSJtrzP4lhLc1iU9QaZBGtur5uGoy
	UzA1zPqYvkYIzR7A/t2xb44bw==
X-Received: by 2002:a05:600c:1d18:b0:48a:8cb6:88b9 with SMTP id 5b1f17b1804b1-48e51f44621mr454045e9.22.1778000334868;
        Tue, 05 May 2026 09:58:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.58.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:58:54 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/23] rsync: fix for CVE-2026-41035
Date: Tue,  5 May 2026 18:57:28 +0200
Message-ID: <b2b51c4f8521ac4fa490e96257142826f2dfda25.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236502

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://github.com/RsyncProject/rsync/commit/bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c
[2] https://security-tracker.debian.org/tracker/CVE-2026-41035
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-41035

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../rsync/files/CVE-2026-41035.patch          | 39 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-41035.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch b/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
new file mode 100644
index 0000000000..66b1b93672
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
@@ -0,0 +1,39 @@
+From bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 22 Apr 2026 09:57:45 +1000
+Subject: [PATCH] xattrs: fixed count in qsort
+
+this fixes the count passed to the sort of the xattr list. This issue
+was reported here:
+
+https://www.openwall.com/lists/oss-security/2026/04/16/2
+
+the bug is not exploitable due to the fork-per-connection design of
+rsync, the attack is the equivalent of the user closing the socket
+themselves.
+
+CVE: CVE-2026-41035
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ xattrs.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xattrs.c b/xattrs.c
+index 26e50a6..65166ee 100644
+--- a/xattrs.c
++++ b/xattrs.c
+@@ -860,8 +860,8 @@ void receive_xattr(int f, struct file_struct *file)
+ 		rxa->num = num;
+ 	}
+ 
+-	if (need_sort && count > 1)
+-		qsort(temp_xattr.items, count, sizeof (rsync_xa), rsync_xal_compare_names);
++	if (need_sort && temp_xattr.count > 1)
++		qsort(temp_xattr.items, temp_xattr.count, sizeof (rsync_xa), rsync_xal_compare_names);
+ 
+ 	ndx = rsync_xal_store(&temp_xattr); /* adds item to rsync_xal_l */
+ 
+-- 
+2.50.1
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index 14beafb681..2a1c3d9d56 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2024-12088.patch \
            file://CVE-2024-12747.patch \
            file://CVE-2025-10158.patch \
+           file://CVE-2026-41035.patch \
            "
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 

