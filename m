Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8F1C44507
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:08 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140028.1783291382991322730
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=esw0S/y/;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so10713785e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291381; x=1783896181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RX78lIkcesPZ35uuX7Tlqzzs6O32tP0knXfn1EvdI6A=;
        b=esw0S/y/GoZcZtH4eUtb1E37LgawGLoDULN5szAU48s11pN22s7kceiUuDLnweDSAX
         vb1q5m9zwGAf1ffHEgVwp3rIp+zWSE5p631DW+r7tVbjJdj9/An2sRp2mQwghMIb42uf
         207Ar5db79o0HBmVoGojKKRG3XbIkSaXoec6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291381; x=1783896181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RX78lIkcesPZ35uuX7Tlqzzs6O32tP0knXfn1EvdI6A=;
        b=BznGidzQDQ2/86zqce1ZKJL2HE8fIEbQYG8OjewvjjlDBjD4dPzoHas+iZZdeIHBBy
         /J/lQHuqw/KhhhJoWbmN37CLKG80KRa3RMpNcopS7/idaQvALXAEVewHvTt51RhxB1Ye
         iwBDE9uMOAJ9H7wduTrtY4hoQ4k3erBmRoh/fowsOWZZAOZKM2RJ+8LkqChm2nXBQwsO
         Fn+fEwSShNURgfTr8rj9T4x9XuW/amrDVHjdg7gW0GkkEyjyRvskCE+4WG/tJ0c7+64i
         HkijvORECQMv6wOIiiskRe0Jr/OcZkKBkttY0PxwFvpRo9yFdg36FoTOH9/23EJjBLdI
         cNxg==
X-Gm-Message-State: AOJu0YxIATwIUa4wuy6ltf9TZj3X9j090zgEOxBRolzJEKMdm2a2/WCk
	xmZ+7nDxJowPvyR8nSdBu7THARWZZJEsrG8HC8JtUfCyaossXsrKVR64Ktdom1zgIqGlFXo3kmZ
	A24wMAYE=
X-Gm-Gg: AfdE7cl74OTD7d0zXmMDJwCvxOz5pmGrnHBxHc9eAK3ffWtRTHmJSVTZf2mm6CMUgKz
	g9TcbREeaEF/HjgEsRSsHMWgCqqxEfswRu/DFZYP9XohPl9vhWSnhVtoOQvuRgOrfx8izyiZLQV
	qtZuE/SDEox1VQSsDFtAqG0/HlET4AuJFX2s045gtIhoBXt/mhc7ymQyr809O2XJxpybHbVvB/I
	tJa9tfcmvFNS/J2U0bkj2BrI0o1fCvFVbavL7DOj6ssXr3gUwDRC7apPp8RwjIfIU417m9AIVIM
	dSCnVN3pTm1EfF3dD0IEYFN2juUK5gD84/oIzW0NjHwuRPgqrp0Zf6carfNWaDGIhqIkSZDj+rV
	9RVzen58M28z/Mj2d7UaGf4Ztsr2UxfDXlcGXIodqvaoYCFANcN1MbTcmYvpAkxhIQarFAQnRfy
	gto8TGH61NWL0vNSNIrx4+AGqBfw==
X-Received: by 2002:adf:e012:0:10b0:475:f0d1:eb5f with SMTP id ffacd0b85a97d-47aad73ab2dmr6489907f8f.58.1783291381203;
        Sun, 05 Jul 2026 15:43:01 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 31/55] dhcpcd: patch CVE-2026-56114
Date: Mon,  6 Jul 2026 00:41:21 +0200
Message-ID: <243715bf7c611d1358f83e67cd9bb6ee76f4084f.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240184

From: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/2f00c7bfc408b6582d331932dfa47829c4819029

[2] https://security-tracker.debian.org/tracker/CVE-2026-56114

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../dhcpcd/dhcpcd_10.3.1.bb                   |  1 +
 .../dhcpcd/files/CVE-2026-56114.patch         | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
index b348c895e8b..8195cea029f 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            file://CVE-2026-56113.patch \
+           file://CVE-2026-56114.patch \
            "
 
 SRCREV = "42ff6d2548209af3185473e6cb6f9d235c48bbf4"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
new file mode 100644
index 00000000000..0c2be7edfc3
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
@@ -0,0 +1,34 @@
+From 94766be134a053d88670377c70d3bdfc68b5db4a Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Tue, 23 Jun 2026 02:06:55 +0100
+Subject: [PATCH] DHCPv6: Prefix exclude option can be 17 octets (#671)
+
+Well that's a simple off by one error
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 2f00c7bfc408b6582d331932dfa47829c4819029)
+
+CVE: CVE-2026-56114
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/2f00c7bfc408b6582d331932dfa47829c4819029]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/dhcp6.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dhcp6.c b/src/dhcp6.c
+index 8a8a20a0..5e497cfd 100644
+--- a/src/dhcp6.c
++++ b/src/dhcp6.c
+@@ -1093,7 +1093,7 @@ dhcp6_makemessage(struct interface *ifp)
+ 
+ 				/* RFC6603 Section 4.2 */
+ 				if (ap->prefix_exclude_len) {
+-					uint8_t exb[16], *ep, u8;
++					uint8_t exb[17], *ep, u8;
+ 					const uint8_t *pp;
+ 
+ 					n = (size_t)((ap->prefix_exclude_len -
+-- 
+2.43.0
+

