Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B67C83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:11:08 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.14472.1751641859825299862
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eJBS1KCa;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-747fba9f962so869080b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751641859; x=1752246659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XSCy+hAvJjc6SCVliRjDQ2tSi73cbg9+ujB4RYGHi9E=;
        b=eJBS1KCan4zDr9DZozjg40mkKqUKNufPB2bSfiKPdeVvBDsdGjDX6dGR34aY/3bjUl
         1bbS7a7xY6gZmUZvUICU45f3sdujDeNH2zEd/JzXr2pUA3n/j9LZQlnXwYPOO/YNX0fX
         kioAdVmiQZ+gNUef/tEJymZDHMK+3aErDeC/iRbcm9mN2BVh5R9kJLfFyM+vaG5p/I60
         mvzjxE/jEhoF49WvidSk62y+/6+7gWsRZN2x7Mqh2NB9kRlEvbshwGDzFIl7HcU0TLnl
         6jdmG1pTLM7714iWwBc0wJFgM5zwCWIaWQWUIphoTBXieIz0VMN+/ry4cHUO+13MKx7m
         2K+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641859; x=1752246659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSCy+hAvJjc6SCVliRjDQ2tSi73cbg9+ujB4RYGHi9E=;
        b=QyHEnJdV7XuKZ2XdMG7xb1Nj/dJYTgE3pt5Rftex1I+9R8y8GggZAr/N+Xs7POV58k
         zZKpnmVmUspdl0qMYK2V15zEGadb9lfvHVnhVmFFrop7ncjGsbNWHPcRJrlPKZQndVXy
         LeY/VMF0uY2PmDiVw6EACOQCJJ850NuBdtE0iO5jiqlnUGU+ZBMx8msNNJdGM5WQ5qaQ
         qUAOB0IlLw2xC8pI6T/I5A8vitXLfL2cm6Du8h657VbYSYTQA6fQREMp56wJ2I9F4OwR
         F1Ega4dMvSnajGtculV27TOe/zwMD8qF8W3WMdOQoBW7e5uaPrOtKk4lrH67mCG668u1
         KEOg==
X-Gm-Message-State: AOJu0YxcWTXhtRDYM14azmCqYEtq8HOoscpx+SUJHgh1ruMCPqyc0fzX
	s8pw2DO/7ljX+z5bvjBeR6iZ0a3VIl95oOJDVyZV5oX9Dfob75Vl6cxyQEPkgc/7I4JAFRLBK6c
	drmXX
X-Gm-Gg: ASbGncvB6V61NPZ3U2AI924em0aoyeXw8mlCYLKfVs3klyZkmrJxpseo6kYMM97Qxu3
	4du1i9bNdMzLyuR7x0fQNiU/RJJl7bsnnLoI2K5RnEYNx6LqoKfxzn0/YxsJu4TL28ybXartAO5
	7LDgqtXPlt5EcmWcAskTTDCgGIYBA+IOOLLJ2YMRuUBsGRw66VVNl5eaCi3maCzWAESdrFTVY3Y
	dloBM/ySb7Xbgky6TYoTKl/7JntDX3/UlJ5KsZdoKmUJD4ezgi65659AZaUlYwsWN97tFMbivaQ
	ZdxEylNC59vBUQQyjyXaoEBSYJwC47otlbFD65Zua3UTI6w0+GHbTw==
X-Google-Smtp-Source: AGHT+IHE/OUyT8XkHa25ogMkz2orW+FnutiCz2nYVzO9//vul6HB9M8dVNbO0gI/DlSzybJM5KoQOQ==
X-Received: by 2002:a05:6a00:8a03:b0:74a:d2a3:80dd with SMTP id d2e1a72fcca58-74ce4fe8d4cmr3505394b3a.3.1751641858938;
        Fri, 04 Jul 2025 08:10:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e869sm2159592b3a.82.2025.07.04.08.10.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:10:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/11] xwayland: fix CVE-2025-49180
Date: Fri,  4 Jul 2025 08:10:34 -0700
Message-ID: <15881f41f8c00c5f0a68628c2d49ca1aa1999c2e.1751641631.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641631.git.steve@sakoman.com>
References: <cover.1751641631.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219937

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the RandR extension, where the RRChangeProviderProperty function
does not properly validate input. This issue leads to an integer overflow when
computing the total size to allocate.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-49180.patch    | 45 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 490e1ca05f..49e35ca442 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49177.patch \
            file://CVE-2025-49178.patch \
            file://CVE-2025-49179.patch \
+           file://CVE-2025-49180.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


