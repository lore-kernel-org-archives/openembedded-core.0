Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.32976.1585212874326825513
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EKcn43Xd;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id d1so6038455wmb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hiYm8R34HwIDeuYEMtgkmcSuKJiAuzm9LWYR3QCwbJo=;
        b=EKcn43XdzTzmpD8sCTo5Sp7geWiRAbMptNTVJfpYAmQijj6gyAskvv0IVZeoqoCl11
         w/4MJpZ34a4RsPOCT/J1Vqh4SrE0cavF8ISXkq6CIosfTx3qCBezYwId8kLuAkFUCRpq
         SdRn9hkGeBmHXYCc9iLzfpu+B+ejTTTW7ylOQ+ZAHNzFjg4XjF41/nNQovdxdLE3f5RK
         nqXCkKobnn6v2GcWJmlchnpUNbFkCf0Ctf20fFiAxZH5JcckBQ+Vfyx74+X/XzEqOqrl
         KtETjG77ECjUNs0kpydS+eDHnROg/8P5ejKnsuwneXQdu+WALy+Vn4/HhlpNPLkNNpNc
         OxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hiYm8R34HwIDeuYEMtgkmcSuKJiAuzm9LWYR3QCwbJo=;
        b=OC+CA3w4WqNuiuBmL0Aw6sQzXCgjchDe8cdGmnxxxmaxFLOWnQ565zyTBEs1tIF8wR
         c5zYlOnSxgA5syZlDuRVdt0PaZlKeIbSJntKuGZM6wN+ndPZbXJjyJr0M/aRpsXvsDdA
         AIaqkL8axz69r2Sqsp99SsAgBDiN0fiL/HvrZkqkMkUeAyg5xNdsDTkIV/li2MJTEczC
         zKJtadjsNemzru40Z/Zeh0Uhv8haVmQo15bZMWBNG1jmbgN/BokiPByB/h3IblVqahmp
         KiL26Ih7sYOM/kXjs1F2uDTJJHsX21wQcg+rAzfATBtRDhA24coolDuq3eNSZIiQAQk9
         6v7A==
X-Gm-Message-State: ANhLgQ3fsc3Ts9utkv4USOei0Md7URgn6IW0WFfio7oibSWgK0+BE1HL
	pI8yBbmAtQlo44nLRNDNyucJ6ile
X-Google-Smtp-Source: ADFU+vvsXOJQ7+UziOjKe5zLmww3pXOoShiITlJRo9dtXdhNzYGpsNYlKjn/Zj/kj4d+gghWSG1KQQ==
X-Received: by 2002:a1c:f401:: with SMTP id z1mr1985574wma.18.1585212872665;
        Thu, 26 Mar 2020 01:54:32 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id h26sm2484107wmb.19.2020.03.26.01.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:54:32 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH 03/13] systemd: Replace nonarch_base_libdir with rootlibexecdir
Date: Thu, 26 Mar 2020 08:54:16 +0000
Message-Id: <20200326085426.117209-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326085426.117209-1-alex.kiernan@gmail.com>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>

Use rootlibexecdir consistently rather than nonarch_base_libdir for udev
rules.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- new (s/nonarch_base_libdir/rootlibexecdir/)

 meta/recipes-core/systemd/systemd_244.3.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 809dbcb9a69b..214eee316b63 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -546,11 +546,11 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/sysusers.d \
                 ${exec_prefix}/lib/environment.d \
                 ${localstatedir} \
-                ${nonarch_base_libdir}/udev/rules.d/70-uaccess.rules \
-                ${nonarch_base_libdir}/udev/rules.d/71-seat.rules \
-                ${nonarch_base_libdir}/udev/rules.d/73-seat-late.rules \
-                ${nonarch_base_libdir}/udev/rules.d/99-systemd.rules \
-                ${nonarch_base_libdir}/modprobe.d/systemd.conf \
+                ${rootlibexecdir}/udev/rules.d/70-uaccess.rules \
+                ${rootlibexecdir}/udev/rules.d/71-seat.rules \
+                ${rootlibexecdir}/udev/rules.d/73-seat-late.rules \
+                ${rootlibexecdir}/udev/rules.d/99-systemd.rules \
+                ${rootlibexecdir}/modprobe.d/systemd.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.timedate1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.locale1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
-- 
2.17.1

