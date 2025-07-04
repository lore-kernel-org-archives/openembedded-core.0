Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E50C83F0B
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:29:18 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.14869.1751642956678621283
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NNHGc6B7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-747c2cc3419so951869b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751642956; x=1752247756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoHdctT3Ap/OSJOFMYsfuIJZfCT/56gzGVbZnBgCmTY=;
        b=NNHGc6B7y8rT3A/6BhmCeowMYPLb4prFHMeTo4OhgwgxIVRuy3qKj04c+0TCgmT6Z8
         KblWfDiQq34krpmTRDngS8r3DYSrUn0YGtayn7rtsvexWNkHny6OduOjbkbu++A1TNwr
         h3CimO8QMYkeqB9xlSli5xMvCAz8f7FFIHu/YPg5kW/XdixGNKLiFtfl8HiCE3UnCgYQ
         f3FzSfw6K5oUobqp4bxo1jlq0Ch1n+7hhnSRUICrfVrj5/LkD7TuHJK8y33gxI4uIae9
         0CqDrFsmTpDEXxmWGNUIn1hWEVp0TkkyQLSRoq+ShzJFa54MDMWq42A2oQoc6Sosa4iB
         8cMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642956; x=1752247756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoHdctT3Ap/OSJOFMYsfuIJZfCT/56gzGVbZnBgCmTY=;
        b=B+d4CVnj9Ymlqs1Sd+Y6EXeEgut4JW++U18vXCvfzpLIoI+5BRPFzoUgJ15gSGx8zz
         aDT4LkyxkUyqV5yKO01cX3z15i+CsyEJWSUS3urNgYSjDengwSAw8H1Vs0v/pkZPTQEm
         3sAJ6+TjYL5wI4rqhy577iC/XJUxD+2Vy4JRhXUSm6d9C4nvbDuKvN2TqPjzc+JKxIXn
         YdXeKCQNnVpnYpYYEPv8NfUGzeN0qr2D8FuuCxbxpiukRiEW7rZVG5TvBD+fb402fRp4
         wjMt8SCuzgsnza783ljNWyzglWoih+kHoYy1YIDOIhZqTRLSf48h4RPYP3UmLSEr4Xj8
         Rlvw==
X-Gm-Message-State: AOJu0YzTCQ0KKlJGvkF+kn4ahBMK14K/8qBxseZnJQ0UhzYcEj21xlIy
	dZ+ODFN4oYTK+UpXFa27I+HqnsWvuv5hudz8hMarP6zC1Qvg7vwDD3Dn7TIjev+qJDbyiZ6OmHx
	CQFrA
X-Gm-Gg: ASbGncsvfEfh8+6+8f6i7XZy8SDfKgsqCLTguuNtWCCNR+ulD2tKKtTFMeBJGJVnTiU
	AG/4/fxUT1GRFU68L1pcRQ4+OoORVKoy3AnIqU3txhTbAjZLbIIzKe7TD8yPOwJeHFqKEdxXZ2s
	vCfiFaYSqLCdqLy6Of4ZI5dwnvdEFPznUwtkanfBHIuBrhBs/zDLEzPZGUExO2T0oH9FEjgQkTp
	8lW6MextZRzvfvYHbbD45ji1jeszTjqOO+LB0ZTNOJgoP1SmPMGvTpaqKvD3kP/zqutqXNr0DLz
	ad+S/vXm1CfVfJcoZA2tEcgRMkv5fv2E5asU/1FgGjHb4f+12bE6fA==
X-Google-Smtp-Source: AGHT+IEmI4dpOGOa6rxjBeDJpoVGVYCiXBXJPAAdvPW2naGRANeAqSjZ18CcwyoB/TQ7nHsuEcH38g==
X-Received: by 2002:a05:6a00:bd04:b0:748:fb2c:6b95 with SMTP id d2e1a72fcca58-74ce6d4689amr4413708b3a.18.1751642955772;
        Fri, 04 Jul 2025 08:29:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a1ca0sm2424232b3a.138.2025.07.04.08.29.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:29:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 9/9] xwayland: fix CVE-2025-49180
Date: Fri,  4 Jul 2025 08:28:55 -0700
Message-ID: <928df4bd523cda32e1d9e6d24ef668581e8bbc31.1751641924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641924.git.steve@sakoman.com>
References: <cover.1751641924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219948

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the RandR extension, where the RRChangeProviderProperty function
does not properly validate input. This issue leads to an integer overflow when
computing the total size to allocate.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-49180.patch    | 45 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49180.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49180.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49180.patch
new file mode 100644
index 0000000000..51939acf63
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49180.patch
@@ -0,0 +1,45 @@
+From 3c3a4b767b16174d3213055947ea7f4f88e10ec6 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Tue, 20 May 2025 15:18:19 +0200
+Subject: [PATCH] randr: Check for overflow in RRChangeProviderProperty()
+
+A client might send a request causing an integer overflow when computing
+the total size to allocate in RRChangeProviderProperty().
+
+To avoid the issue, check that total length in bytes won't exceed the
+maximum integer value.
+
+CVE-2025-49180
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+CVE: CVE-2025-49180
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/3c3a4b767b16174d3213055947ea7f4f88e10ec6]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ randr/rrproviderproperty.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/randr/rrproviderproperty.c b/randr/rrproviderproperty.c
+index 90c5a9a..0aa35ad 100644
+--- a/randr/rrproviderproperty.c
++++ b/randr/rrproviderproperty.c
+@@ -179,7 +179,8 @@ RRChangeProviderProperty(RRProviderPtr provider, Atom property, Atom type,
+
+     if (mode == PropModeReplace || len > 0) {
+         void *new_data = NULL, *old_data = NULL;
+-
++        if (total_len > MAXINT / size_in_bytes)
++            return BadValue;
+         total_size = total_len * size_in_bytes;
+         new_value.data = (void *) malloc(total_size);
+         if (!new_value.data && total_size) {
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 691b017662..73f5a05ce7 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49177.patch \
            file://CVE-2025-49178.patch \
            file://CVE-2025-49179.patch \
+           file://CVE-2025-49180.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


