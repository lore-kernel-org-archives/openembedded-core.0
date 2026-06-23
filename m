Return-Path: <antoine.gouby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AECACD98F2
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 11:21:23 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18468.1782213677367080686
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 04:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pFyMEzvT;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: antoine.gouby@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b9318997so37850045e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 04:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782213675; x=1782818475; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MAhDobDo2JpWWQGn32DbKDatwVXLSmlFYSNWCBpA0DU=;
        b=pFyMEzvTJPGO+YQYJVC7+e0S0RAHG1PGCsqBou8w4LCvwLQ7Hce3SiBqUnQCtEzkxy
         fQ0B/vOswGjMqyjb6xYB3Wn5RUOB8qw1AB8nmcD3LnaL3xvcVEupKRxbpNx+D0yyAIZ1
         VWCxazTsf32yCFA8Sh/kiJ38HArzuzNG5IKnJZhTAx2e4R9KESmSZPYt9Z6hM7sntNEb
         PC/3ZklggugzAXVXikElUd/OcLlGGjQ9MCgbQjkFNR2YmHucNt/Dv3BCalfd3VfZVatB
         yz57g5cY9Rn2DwjL3PxX0PPGJSAzZNRcy5/fonRd7IIpChR6ZrRKLoCuzsAAzo6zZXa+
         HNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782213675; x=1782818475;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAhDobDo2JpWWQGn32DbKDatwVXLSmlFYSNWCBpA0DU=;
        b=C32EzVtY/lwf9AKzJI/pUyc/k6BRzb1i077RPBVic45EBc/V1KM1pewCfzUCL//ZUk
         D+/h4K0v2PpzPtg48v3ZIU9pTi8zyeLOpzkQxPz1clRQJ1jPPLy4eK2jmsiNpPZz32gG
         oYopwZ3pXbd8Res+ThSdtC7v8zQh8w+2wJfjL0vIJFwD67iT2jdSqdSiwUQFVF7S0TLG
         z/RBXLYNdTTAA+1jbVleOwJBRvVRyALFq8i6YNrfdQgiwh1UhvrNYyOY6P6hZYDwWOKn
         OApwKIP2f9pTA1Lrc7nBWVAnSOT3KEBR0yp7H8XvWtyOqsoZN7/672ppet0nOuRKXGux
         fbvw==
X-Gm-Message-State: AOJu0Yws+Tq7zKfeWSz3u/O3/MqhvgSre7uwBZqTndBIV6zgqxy+/5oL
	PINhS5QwiS7ifMk6WfZcymYQOfyOBDP0Z4dQqZieaMxGqClqjtcYPWNxlXTwHw==
X-Gm-Gg: AfdE7ckU5rejggAU0BicHNFZjlW8lBZhqd8bKYa6Ec3qB7q5Jwax4tazwwxoCHtdMwe
	yuYQP6TQ0ps5bIM4yjDufA8mye79EYhbfLiIpWitwzL03SMxWxvzGzm9wSWc3PWTv3Z2bj8luK3
	xQ5aj6yXwVsPr9biOWv7Zf5bJbv8sbBn63FiZKKFb2pwiMs1TPkl5u7pyPGDAIIthcW+OK4KLuJ
	6GQwGiYasw9Mrsj1kJG9y+xVeMhkFen4md9cCxTVF4iWdThhm4iTBDm3GyGZbHWQbtxdpoSQNzl
	WGq9diSGOonClR22M4NWgknnn+AUFZBYtBNmG1cvYoDKhNJlWnsz1dlm8muFFOACJZXdoQn/K2u
	bNAnaJUlzn7oMI96Q2pVb8QGtblVK08G9BcqBdAgOPk37g3Yq3BjGVc/nE7c/bZ0qNk0AE+yLPn
	j9xkt44LI1spoDwDaQuDtl/Mr9zJEVgd8Z5XYn56Tnm9Lf1KRMtgpPN8IeUkvb2xzw2KVYRbuuN
	tYMt/g9B+Dzlim5phNin396aucvr/XgfEeDhgE=
X-Received: by 2002:a05:600c:c0d2:20b0:492:51aa:2d46 with SMTP id 5b1f17b1804b1-4925b38f13fmr27925565e9.13.1782213675317;
        Tue, 23 Jun 2026 04:21:15 -0700 (PDT)
Received: from [10.0.1.77] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c698dsm37447423f8f.16.2026.06.23.04.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:21:14 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 23 Jun 2026 13:21:00 +0200
Subject: [PATCH] mesa: fix INSANE_SKIP package name for mesa-gl builds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-mesa-fix-insane-skip-v1-1-97856536ea8b@toradex.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QpAQBAAf0X7bOuscvgVedjcYpOj25KSf3d5n
 JqZB0ySikFfPJDkUtMjZqjKAqaV4yKoITOQo8Y1VOMuxjjrjRqNo6BteiJ3RN5zG2aeIKdnkqz
 822F83w9oekayZgAAAA==
X-Change-ID: 20260623-mesa-fix-insane-skip-a92277a8dfac
To: openembedded-core@lists.openembedded.org
Cc: Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=9W4Rl29p2KehkQcQIKVZKiciweSzEMU/V7nxCPYN2Mk=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsiyytFqKVV+f2nHRI2N4vvSN59cl7P0u2L3ksyZRlsaW
 +4sWhNt2FHKwiDGxSArpsiS8URVkE8hRNaDozkZZg4rE8gQBi5OAZgIsxcjw4rJ/zXFTwvfCFWp
 7lFuZZ1/3euV6f3N65e/zAm8q775qz0jw6rvH6pez1+x6pxT3e/p0drblGz8r0z5eVdxnnxyys6
 FzxkB
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 11:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239348

From: Antoine Gouby <antoine.gouby@toradex.com>

mesa.inc is shared by both mesa.bb and mesa-gl.bb. The variable
INSANE_SKIP:${PN}-megadriver expands to mesa-gl-megadriver when
included by mesa-gl.bb, but the package is always named mesa-megadriver
(hardcoded via PACKAGES =+). The skip therefore had no effect for
mesa-gl builds.

This was hidden until mesa 26.1.0 removed the with_gbm condition from
the dril subdir build, causing mesa-gl to now install DRI driver
symlinks into mesa-megadriver for the first time.

Use the hardcoded package name, consistent with the three RREPLACES/
RCONFLICTS/RPROVIDES lines right below.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 67b740f9e9fb..a3ab4a5f0996 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -347,7 +347,7 @@ FILES:${PN}-tools = "${bindir} ${datadir}"
 ALLOW_EMPTY:${PN}-tools = "1"
 
 # All DRI drivers are symlinks to libdril_dri.so
-INSANE_SKIP:${PN}-megadriver += "dev-so"
+INSANE_SKIP:mesa-megadriver += "dev-so"
 
 # OpenCL ICDs package also ship correspondig .so files, there is no -dev package
 INSANE_SKIP:libopencl-mesa += "dev-so"

---
base-commit: d595615c6a027b80d6f7ea80ab25e85e97b2436f
change-id: 20260623-mesa-fix-insane-skip-a92277a8dfac

Best regards,
-- 
Antoine Gouby <antoine.gouby@toradex.com>


