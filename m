Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5822C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 19:18:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26735.1786648681880836464
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 12:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F/4LW6Ey;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so8268275e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 12:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786648680; x=1787253480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c0LLGsN/FmBuCPge7182l0wwwAH9rGAkKL0jRMR+qd8=;
        b=F/4LW6EyEKFmJZRopJdyB6k0qZKVwZAONWZE+IKIqedBUC5nDlqntaqgbwDmKb02bv
         rV+iy3DxZv8cJaiB/z/eaoNY/WFGbTpi0YT9YTcJuDICE08xWoAwzNeRBPbxrLxg6eTz
         0OVvydx/UNMAB1DPrligVA4hf1PPY/kBMmCINOnXvmPrdRtI5pVhMlXwwduWHpUp7AKU
         OzszDqVxjsqiRIC88kt+CHnSVqC7iO+nlYVGe9up+nZoFEhQD0eqcrXm0dBNCjrvjts7
         4F0z//9ZAQKw1yutkBp3f5fBoKXXTqyqo7xMj7v2165iA9BJ93nmScAzy03W4drY0cb/
         4ejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786648680; x=1787253480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0LLGsN/FmBuCPge7182l0wwwAH9rGAkKL0jRMR+qd8=;
        b=EqbIZ7bLtYs2q/yMMCJT53Nj0EXaaoTwvmSPadu3rc5oKEP9I6z4tu8lPTBcDxWH00
         WV+x9evfQG14V+YOxUc3006Bt6+6Kf3rwjjXsndzfQgAJKEFcwPqRyJ/Z5QCaVcrV1rL
         oV+/vYnlg7VCiTqj2lFfBg11+aeFk4y/dO2jLR1Gf2Hc9p6F2ZoSI2j/63HcB0vbAi4e
         ec8dgNiiZFKKziptkY5dIU2oiXiR3yOjO3tiVJgKeroJbWhk0tZ2xu7Qu9+RkJnrTmPj
         Fafkpgu4hMSJTaiIvccQ5c/z5GBXHOuMBHBtKH59X3BpIpBZHJIy7/y7zBekoCChb/HL
         q0OQ==
X-Gm-Message-State: AOJu0Yz5kdvwud35saV8v1wRFZrI8sFe6WGOdjg/Pldanh+6wiJfH2Ms
	MwTuJGqX/J33Bo2+rZtMnC2JSovaM8UcRfJW76W0149wVLMe+Yzu3ekaRo5nwjwjDBs=
X-Gm-Gg: AR+sD11RbBNOx+oNdW3qRtXBXHUU42yqt8TvDJa4VyUv8aYRrKCDNLWGDGesCEDb0ai
	wUmIuVWLHs+j7lC7RkB2ZwQdTqeWzOVv4C7QnNin/PwtHpWi/hgNLn4P7OhlPyAQRnvnEhSXdpm
	M98wmNAPQH5hxyv6tFogSNzX3qB2a4VEwoN5QHLV2uYqK0ZkJ5zA8AK5wX2HNzpGw6wp2S9LHlL
	1bH/0yA5hBjV/EdYftuE1HCg0ea4+G5H+k/kqusMYkXbTMLGtNJaiF9Svzm1bYrn4JvkwwCKnN5
	6BRBTB8kSUAMbD6B9Q8te1o0KMWQmc9/q1zjHIEn3SHL3MGDFnO8iX7c89H63PmiHglP3fKOu/G
	+9XtFRWZmMDDodMkBLQs9hiRqFGVaepjVg2rfwBwmDEnf2vokyaHZ1kwPgHsNUQsogtAVtgD5Gl
	koIx1uI8qi0nFQpnA3fMwu7eP/yfCgnmjD1cHXY7AnGR3MY9Un1WjXtzDlNIxFVU9yEc6usiDaw
	+fCyewdo5eucLq7o0faqXQSVbt/z+bTX8sAX36FiU4G44w0mOYYyLkCa7ZGp2jKMPSsa0H8HJem
	t9qPnQMna72WgOoQuKZ6TQ==
X-Received: by 2002:a05:600c:ce:b0:499:7f37:cb74 with SMTP id 5b1f17b1804b1-499821546afmr99061185e9.1.1786648680142;
        Thu, 13 Aug 2026 12:18:00 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:75b8:c973:c30e:1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2c07c6sm1494807f8f.28.2026.08.13.12.17.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 13 Aug 2026 12:17:59 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anis Bougrine <anis.bougrine10@gmail.com>,
	ross.burton@arm.com,
	Antonin Godard <antonin.godard@bootlin.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [OE-core][PATCH v3] kernel.bbclass: add strip process for signed kernel modules
Date: Thu, 13 Aug 2026 21:17:49 +0200
Message-ID: <20260813191749.48691-1-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 19:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243387

Currently, signed kernel modules skip the stripping process in order
to preserve the file contents after signing. See commit:
4c47e5f171fa2603355e2f9183065ce8137a18c7

However, the kernel install Makefile supports stripping modules before
signing them. This allows signed modules to be stripped while preserving
a valid signature.

Make non-signed kernel modules follow the standard Yocto stripping flow,
while signed kernel modules use the kernel Makefile stripping flow.

Fixes [YOCTO #12927]

Reported-by: ross.burton@arm.com
Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
changes in v3:

- Fixing rebase issue.

changes in v2:

- Use the conditional INSTALL_MOD_STRIP environment variable to avoid
  duplicating the oe_runmake call.
- Use `scripts/config` script instead of grepping .config file.
---
 meta/classes-recipe/kernel.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index a82bdf7ecb..0998de1548 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -451,8 +451,12 @@ kernel_do_install() {
 	#
 	# First install the modules
 	#
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+	unset CFLAGS CPPFLAGS CXXFLAGS INSTALL_MOD_STRIP LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+		# If the module will be auto-signed, perform stripping before signing.
+		if [ "$(${S}/scripts/config --state MODULE_SIG)" = "y" ] && [ "$(${S}/scripts/config --state MODULE_SIG_ALL)" = "y" ]; then
+			export INSTALL_MOD_STRIP="--strip-debug --remove-section=.comment --remove-section=.note --preserve-dates"
+		fi
 		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${firmwaredir} modules_install
 		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
-- 
2.50.1 (Apple Git-155)


