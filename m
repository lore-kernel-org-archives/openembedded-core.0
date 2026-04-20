Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD9DF36C3F
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 16:40:50 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23947.1776703187606104937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 09:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oZG+iT+a;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: zizuzacker@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so29016955ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 09:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776703187; x=1777307987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnRgLP3erUwy0o+p96LB15Z7V3pObcK2h1N+/zJrdEo=;
        b=oZG+iT+aEWb7ShUyWU5ouvRmO20YDWy9E7l5/kNABGiz4kpwo6mPjOhXzuB0aEXGi7
         3XC+nLH/x19tpyZU6mVjgyGZOi1krowHf1aYvh+r/cs4xjYWGBTX5W1fDMTOKanNtslp
         jMRah3QkGTkAoW0FHwUeaRgL8UmE1ATWGI21ZQ9YSzVOe4+wP7/0bOvTjHKUsoq0Cyov
         K4DXtvRDpWhIhAEUKFAGF1nV9eEFEZtxuXie5/gIxdc3OWp35eOA1JLXdH8eORb5MgZJ
         4VAOY97QnOlclZ8cgExoRFXJG9HuxiKHmFNwLbwWS1cbqaVQODTkSXiBDrg1Yz14F7Fh
         fkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776703187; x=1777307987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QnRgLP3erUwy0o+p96LB15Z7V3pObcK2h1N+/zJrdEo=;
        b=d6vR7nv6zE0OJvp3qkU9/fxiOm8y3m5h4WHXFY7lOqQn+lnVmGY2n6TmxK7kOId3ZN
         2BrLlF9i2JKs74Wgl7AgD4wTZqZVjgDkElK0iTzSzA5aOOge+ISknQvO6MJv97j7UAGJ
         I8HXsjUqy+nJiaS2tE6F3vuRNgNoNs7nptGBhnffKOxOFKUY1PyN6h0M2BGyyhtE/fRA
         MzOk0Lf8tNptxLRwXUKp7zdAzuWR+lBzcaYDdDlX8D7lz+HX9lnu3/MyMrugG8JJfvpj
         8z2Nt9NC7ovZu7eiSL3kdEo4sxW1LCoBXbQZIUvE7zmM391tP3GO0H5xe0z0y3qrtpg9
         Ixsw==
X-Gm-Message-State: AOJu0YzOrAjQTmVdSmTHpmRqcBxgQN0iyCGZanxd1gfEau18q1hDNB2y
	ENgjLRyYe1YqfRb188zeGPBAWh0w0GQaSYVRn/k72rmU4sPjbet0XHW1pTSzmA==
X-Gm-Gg: AeBDies2q1G7npfsInAdW4U6/aTTFNHD2P07ODskCGzJW0PofH8aWkImDEgwb6LceB1
	zY5ZwDQMUrVvTK57MqqzyREJ3lxjveI3o4stSqHwvTYo5iXuYPeB8Z88ecDwnsFxDW+pg4syz4s
	7KppoIpFsJ1C2c06OBd9L10SY7DuBL6KdTsWlpMZoF0iAEvs8+wRGa1K+syiBKHQY8g7KxC7aCp
	o6EVpVSfSJYy12pTfbOQc4UmkRSFfRxE/oJksg/sJpcahnB1hFMiq+k3HW1bDNYfvKpP7ZQ/oNG
	2wmnpFYKUKxU9R0+wHwVE+9uboTueBfrnm55djOm9b5v0wjnXuYKeM8/jgmtZq04pSwPqm4ALQH
	RhL0a0Ux2WlOpGFKNRwisyvRDZ6hRBkElq6MtJYTDNHAEPfXEIpnkwUKEVeFJ+j5PUYpRTC/HWM
	NSp7VYzxRoOKKdaoy0xCdRY+cPflPnEedxj6wfxL7g6IwMTw==
X-Received: by 2002:a17:902:9696:b0:2b0:4fb6:85ce with SMTP id d9443c01a7336-2b5f9f7cec4mr101558845ad.21.1776703186724;
        Mon, 20 Apr 2026 09:39:46 -0700 (PDT)
Received: from localhost.localdomain ([42.118.25.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9fedf0sm129221105ad.6.2026.04.20.09.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:39:46 -0700 (PDT)
From: "Zk47T" <zizuzacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com
Subject: [PATCH v2 2/3] meta-selftest: add usegroup-deponly recipe to test USERADD_DEPENDS only
Date: Mon, 20 Apr 2026 23:39:39 +0700
Message-Id: <20260420163940.182918-3-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420163940.182918-1-zizuzacker@gmail.com>
References: <20260420163940.182918-1-zizuzacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 16:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235578

Add a test recipe that inherits useradd and only sets USERADD_DEPENDS
without USERADD_PACKAGES to validate the fix for [YOCTO #15863].

The root bug is that useradd.bbclass unconditionally requires
USERADD_PACKAGES to be set, even when a recipe only needs to depend on
users/groups created by another recipe via USERADD_DEPENDS. This recipe
depends on creategroup1 for user gt1 and group grouptest, but does not
create any users/groups itself, exercising the code path fixed in the
previous commit.

Signed-off-by: Nguyen Minh Tien <zizuzacker@gmail.com>
---
 .../selftest-users/usegroup-deponly.bb        | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb

diff --git a/meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb b/meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb
new file mode 100644
index 0000000000..e5db7a47ea
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Test recipe that only uses USERADD_DEPENDS without USERADD_PARAM"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+# This recipe depends on the user/group created by creategroup1
+# but does NOT create users or groups itself.
+USERADD_DEPENDS = "creategroup1"
+
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
+EXCLUDE_FROM_WORLD = "1"
+
+inherit useradd allarch
+
+TESTDIR = "${D}${sysconfdir}/deponly"
+
+do_install() {
+	install -d   ${TESTDIR}
+	touch        ${TESTDIR}/file
+	chown gt1:grouptest ${TESTDIR}/file
+}
+
+FILES:${PN} = "${sysconfdir}/deponly/*"
-- 
2.34.1


