Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.46637.1609166173324162165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 06:36:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hO5PXGAG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id v1so6023648pjr.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 06:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1Za2ht7QGQA2l+K31hIBjcBuSkEKVkHXqncmgiIhgGQ=;
        b=hO5PXGAGK26oHp4quxjHbbufYAVuzbxUmhGz6fWmkRZsEl5Umo0SsyQhkkxODgdk9l
         9xw8n/crWHTlj530Z2NGXpgMCfZcfPewuPfTJfoTGm2dkNZTRbhUt6Zt6Io40c7NZLCj
         l67KBJzMyY3tvOK1k6XnBa8znbA4dcyu4nNSJGOPfSKPQBVbvWKgCoFaXMRg17V1PPCJ
         rVA5gqoT7xrjdeUoPIBMF0FW2HyB1Oz6owl2zX0Zc7Z9/23+/KIQY+zl20gQt/qoBhGq
         jsPHvinInK1yExQuGJvgewHCMzdpH4bMZxRZPQtSEUJmj09dpD8h1A2Vpn1+u8e1jQ7Y
         Jiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1Za2ht7QGQA2l+K31hIBjcBuSkEKVkHXqncmgiIhgGQ=;
        b=quJkxKaTQTaDabVm9jQPgnemVPTHXvKkdCxK4jmuCPPnERn4iaRKhbIj4EUB2oM7xF
         pGPYtbgdvapjFPvdCI9EcynGuXwOEYAyrjQP/Lc9odnckaa+X0bvc7tkCY0t382V5zMT
         p6y12wOfEkjQVtgRA5Aed4HHxmRNzlDiopkxauLn+HV8ACF5+zU8C4qza2YtjMhg8poY
         TY2MSuQQ3bRYeMvt+D5N70jf5VDd9ZpCAl+4Qg8wk1XDbezDFxKOoXe8C4FRbHWhBEru
         R+uFicP9+sKy/G95lVl3zAXLuxL1ZFOtWeFWNxcWsgTho8FFaSKrmzTH0lYJHfGiWvO5
         /BPg==
X-Gm-Message-State: AOAM531fu6Ka3DEgspcXsee54LcvdgliI/IEiu5MyWwjlg7y82OrbmAM
	FPjnmnEX1cnC4WNY+SlNsdwlHOxN4OA+T+tcXcI=
X-Google-Smtp-Source: ABdhPJwPS/js5w1/cIHvh6P+QSInmhYGmYUawzFQ4n04G9dqBCSNiEJz/QijF4SIR7TVkyrs2BLXsw==
X-Received: by 2002:a17:90b:b0f:: with SMTP id bf15mr20938712pjb.202.1609166172531;
        Mon, 28 Dec 2020 06:36:12 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b22sm36422469pfo.163.2020.12.28.06.36.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 06:36:11 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/8] grub: Add second fix for determinism issue
Date: Mon, 28 Dec 2020 04:35:42 -1000
Message-Id: <fcb5fbb2e326e48236e03cc0d0540b6b0e7a287e.1609165912.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609165912.git.steve@sakoman.com>
References: <cover.1609165912.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There is a second list sorting problem in a generator script within grub,
add a sort() of a list to resolve this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cb5e96e05930eaff4d679166416d6c84d6e3236b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/files/determinism.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-bsp/grub/files/determinism.patch b/meta/recipes-bsp/grub/files/determinism.patch
index c4b1d3a2a8..fac80e7b54 100644
--- a/meta/recipes-bsp/grub/files/determinism.patch
+++ b/meta/recipes-bsp/grub/files/determinism.patch
@@ -4,6 +4,10 @@ depending on how awk sorts the values in the array.
 
 Be deterministic in the output by sorting the dependencies on each line.
 
+Also, the output of the SOURCES lines in grub-core/Makefile.core.am, generated
+from grub-core/Makefile.core.def with gentpl.py is not deterministic due to
+missing sorting of the list used to generate it. Add such a sort.
+
 Upstream-Status: Pending
 Richard Purdie <richard.purdie@linuxfoundation.org>
 
@@ -22,3 +26,15 @@ Index: grub-2.04/grub-core/genmoddep.awk
        modlist = modlist " " depmod;
        inverse_dependencies[depmod] = inverse_dependencies[depmod] " " mod
        depcount[mod]++
+Index: grub-2.04/gentpl.py
+===================================================================
+--- grub-2.04.orig/gentpl.py
++++ grub-2.04/gentpl.py
+@@ -568,6 +568,7 @@ def foreach_platform_value(defn, platfor
+     for group in RMAP[platform]:
+         for value in defn.find_all(group + suffix):
+             r.append(closure(value))
++    r.sort()
+     return ''.join(r)
+ 
+ def platform_conditional(platform, closure):
-- 
2.17.1

