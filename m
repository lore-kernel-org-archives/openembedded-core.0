Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE70C46CA7
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 18:34:09 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.423.1701455643561466566
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 10:34:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I3Wf9SJs;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6ce11fa89ffso76616b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 10:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701455643; x=1702060443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jw6TGruBCd62tgwtDG+r16cChFeaucFDAXrwr+cDJlg=;
        b=I3Wf9SJssqlQMgHeEHW7gluP5/LPRL7og3ylEd1wf0AVyKCUhY+pImyx5GFChEBMZx
         MCebldnOmgy3OO2IGbsoAFBf04dU6eG0nAT1aM8pouvlJKqD91HTNaqKGJ3PmbmGUL21
         8BN2B312R38oZ8c0I6hxMChliLm9YodI9O/k7nV+8YkMXe+eqqwg1V/E+fPOJL53nx2h
         mGI2g3PZj2+Sti3ECs5a76KiIxKk+SztvadC0VZArdvYo8+oMS6G07quNcIvbTBr6Xa9
         JYGat1aAPIquKrBX/3Xw2rc0tBzVTnK3z6ZahNEyGcvl7YcRnd0gNSAmxayrKdvfTRFD
         qAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701455643; x=1702060443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jw6TGruBCd62tgwtDG+r16cChFeaucFDAXrwr+cDJlg=;
        b=w5zJ5AZvxqGHAt7t1m0Ioc5oO3SfHo/RNC78bPG+v5JLW7uBYhrsx0uE3g6REWI+Vz
         PJjuTr4jP6mAZfBU997v8SkyxhxI70B8AaGxYB5QB/t3yZ5lWu1g2ji79UFq85735CS6
         b/0E5Vx63570dSJIm1BimMqx0R9qZaPjrO+jWRGsGkuKsy7Iads2x6HKXZUIF42qv8kF
         su42NeyV4nrJYamyJTJg545goTbtnsTNpXEXN4TaW0iPTLK5yBrh7FtjL3u9wkxD3zM4
         9rMvrC084Y8b0O2neOsoy1T+Wsa4mHiv68EycwjNyV3apVTKrT2G25prTxR6Qf5Nbf0V
         fvXw==
X-Gm-Message-State: AOJu0YzytnUlmK2f9dzzLdU+gL7Zs40BPSc33vrdxZ3q/5aLtrn2xJPY
	IJeKawvPY8GjhJ5lWWqoyfd+lmFfBc4=
X-Google-Smtp-Source: AGHT+IFT08Ujad/6zvilwc22+tu2I6eHQNyV/qBXIlo2It6sfN8+amIokR4q1wW3Sqhf560yYiinEQ==
X-Received: by 2002:a05:6a00:35c7:b0:6cb:cc67:90c2 with SMTP id dc7-20020a056a0035c700b006cbcc6790c2mr26994283pfb.17.1701455642776;
        Fri, 01 Dec 2023 10:34:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id g24-20020a056a00079800b006cde7dd80cbsm3297126pfu.191.2023.12.01.10.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 10:34:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v12 3/6] vte: Separate out gtk4 pieces of vte into individual packages
Date: Fri,  1 Dec 2023 10:33:51 -0800
Message-ID: <20231201183356.311137-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201183356.311137-1-raj.khem@gmail.com>
References: <20231201183356.311137-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 18:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191679

This avoids adding gtk4 dependencies when image may only desire the gtk3
pieces of vte.

(From OE-Core rev: 9d3f236092ff7c95267d7bc6c3a05cfdce198037)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/recipes-support/vte/vte_0.74.1.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte_0.74.1.bb b/meta/recipes-support/vte/vte_0.74.1.bb
index 8a7054a13cd..071f6684644 100644
--- a/meta/recipes-support/vte/vte_0.74.1.bb
+++ b/meta/recipes-support/vte/vte_0.74.1.bb
@@ -36,7 +36,16 @@ PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
 PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
 PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
 
-PACKAGES =+ "libvte ${PN}-prompt"
+PACKAGES =+ "libvte-gtk4 ${PN}-gtk4 ${PN}-gtk4-dev libvte ${PN}-prompt"
+FILES:libvte-gtk4 = "${libdir}/lib*gtk4.so.* ${libdir}/girepository-1.0/Vte-3.91.typelib"
+FILES:${PN}-gtk4 ="${bindir}/vte-2.91-gtk4"
+FILES:${PN}-gtk4-dev = "${libdir}/lib*gtk4.so \
+                        ${libdir}/pkgconfig/vte-2.91-gtk4.pc \
+                        ${datadir}/gir-1.0/Vte-3.91.gir \
+                        ${datadir}/vala/vapi/vte-2.91-gtk4.deps \
+                        ${datadir}/vala/vapi/vte-2.91-gtk4.vapi \
+                        ${includedir}/vte-2.91-gtk4 \
+                        "
 FILES:${PN} +="${systemd_user_unitdir}"
 FILES:libvte = "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
 FILES:${PN}-prompt = " \
-- 
2.43.0


