Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE6BCD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 12:04:36 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18671.1781093075770556572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 05:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cO2FKCyN;
 spf=pass (domain: mvista.com, ip: 209.85.215.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c858b392697so3228239a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 05:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1781093075; x=1781697875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aFlPNz6ckkm6mD+9rtUfIZ0UO7kQlx9ATWgQ7sVZdHg=;
        b=cO2FKCyNEQQMutitxzsYzrIzfXc7gUWQ8Ms3yzLzK3aiA4Om1zitUFPPpPhwXnwCcS
         osuPIExBEg4KzQPK0cUHBtpjb5jlPdWAD6D7uhahxAe3i3woyh6PmfwOqiVwgHuG/Lq6
         whQhiqFAR0sZyO2kci55NPzVUgFjFsVNv8ebY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093075; x=1781697875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFlPNz6ckkm6mD+9rtUfIZ0UO7kQlx9ATWgQ7sVZdHg=;
        b=loLloipK8hGFptBA5IQBYp8FAvtIlzFUUDrrRmz/dgkrxSYU8bj5Ef7Jb/NiJtwVx1
         4gjZx6myXsPemnQMbJUMB8gcj8f8ulRrDsiIyIi9mvNBb4ueOxvkjvwhq3KGX+ItSkKt
         vHaZ7lU54ypECwZEIkuuEL3vrlnXEdDeVeid8mqzyK09bW3Xe+LRkOpPrf3m1huOGiQB
         0Qg0od70iDsdhVM0S02NrE8UG4WPdCoHo3TxUE5D/VYfStrnDYcM6wWgVUuWfVqdJwc6
         ZsSM7Y6Z+C2bYiYVkS1bAKjvRWNP98Kvp9Oa/5mNfHz0yYlHfAWQsXBWaOFnvBLAnaPN
         9LUg==
X-Gm-Message-State: AOJu0Yy9v/mNaE3yv2quCmqAgx50g1o2aNVSZR7iHOzvzp+JZ0ZjSdjz
	vZ1rO5NFNaEyKUzNMg1m99MKImKfs/RtXoLNvz2zz6F7ViTWFBud2gLnewAZKzTdCj1q5iOKOTR
	ROxSHRyo=
X-Gm-Gg: Acq92OHTuzenl2UwksfZn8wzYsigm23niu/ZfBq0PLnjxAAu7OkNY3gEOVX2GCkpSHu
	vfGO0rSdkr1d2IKVV2Dr/penC608PJaNL2DvgPrYnNhyLB0e+5UaWMh2Bo6Nd+239MX/QWCXZi+
	Jyb3/0FjoeEH77r2XLJYpfLANnyeFoHIyBgwP7jqJEcM0CuiTciRTIu4IZjGkx4rjUgx5hZYHc4
	naz5SnhAG46VLC1QEtXefMExCYoRoyiNclCiTGo5oEwXw83xFFQuf31euhd+BuokeDXztjpWWNE
	WYm51JjH3IhOrg2umYP+IpNnthElTe2y5yE69lDDlita4n4uxKoeLHjOg2F+UnHJ0p5kTvtUAvn
	Sd30XuMQycMZREwmzJMAvXOqtIkNuwybA9UubxWE+0jwnuzTcwESmNEROEohbC6GZcfjGcEiFNv
	ZPMEYC7pHkAHRzXR8MEtZxnktzkHheHnmQ
X-Received: by 2002:a05:6300:67c7:b0:3b3:f46:1eea with SMTP id adf61e73a8af0-3b4ccd774c0mr33068836637.7.1781093075035;
        Wed, 10 Jun 2026 05:04:35 -0700 (PDT)
Received: from MVIN00013 ([150.129.170.186])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c864874da11sm2110560a12.20.2026.06.10.05.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:04:34 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libsoup: fix for CVE-2026-2369
Date: Wed, 10 Jun 2026 17:34:26 +0530
Message-ID: <20260610120427.112377-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 12:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238354

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://gitlab.gnome.org/GNOME/libsoup/-/commit/af4bde990270b825b7d110a495cc65de9e2ec32f
[2] https://security-tracker.debian.org/tracker/CVE-2026-2369

Note: Issue introduced by the fix for CVE-2025-32052.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libsoup/libsoup-3.4.4/CVE-2026-2369.patch | 32 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-2369.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-2369.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-2369.patch
new file mode 100644
index 0000000000..bee8a35323
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-2369.patch
@@ -0,0 +1,32 @@
+From af4bde990270b825b7d110a495cc65de9e2ec32f Mon Sep 17 00:00:00 2001
+From: Samuel Dainard <>
+Date: Wed, 11 Feb 2026 10:19:04 -0600
+Subject: [PATCH] sniffer: Handle potential underflow
+
+Closes #498
+
+CVE: CVE-2026-2369
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/af4bde990270b825b7d110a495cc65de9e2ec32f]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index a5e18d5..594d0bb 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -524,6 +524,10 @@ sniff_unknown (SoupContentSniffer *sniffer, GBytes *buffer,
+ 		if (!sniff_scriptable && type_row->scriptable)
+ 			continue;
+ 
++		/* Ensure we have data to sniff - prevents underflow in resource_length - 1 */
++		if (resource_length == 0)
++			continue;
++
+ 		if (type_row->has_ws) {
+ 			guint index_stream = 0;
+ 			guint index_pattern = 0;
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 8fe3775e1e..15164d940c 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -52,6 +52,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32049-3.patch \
            file://CVE-2025-32049-4.patch \
            file://CVE-2025-11021.patch \
+           file://CVE-2026-2369.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.50.1


