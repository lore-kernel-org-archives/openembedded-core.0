Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 491A4C79F9E
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:36 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2602.1788641133431196767
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fEtDsmb2;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4858c1c4b4eso1169232f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641132; x=1789245932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qiyMUp7aE57l+IaeoyKuHD5rAQkPgP9PzNaiSU4hMfs=;
        b=fEtDsmb2k7+nYiGMKwCGQU49qVavhIA8v14T2AMmeh//LPYg2+10fGPX+lpEwDm/nh
         /0mgAwRp5OIBxrSsq6EKfh0W0UfF7Sz14w6yd9FgaH4gU8NI7PN2P9EcbPrOpQm9v5LX
         IbUiTTyWVHNDJqwjKMLR/Pu8uhzd+aXhfoz3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641132; x=1789245932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qiyMUp7aE57l+IaeoyKuHD5rAQkPgP9PzNaiSU4hMfs=;
        b=ofFu8h0deD6MMcsUYYF+vRXbvOCVFSmU41RAFItGMGDTH1gXAoHkXxNTCMhB7NpZ0C
         49cGYB8m3jOE5nr+eEylP8uLUCYpdgNTjOUM6c/T2XVDtCjX0ojW/u6X2BPF7UoMn2gM
         XdVKiFb3r7l53RiDlvarR843vwJUyDw0fW9Wgq8Ja538Cu2hVeblah3dgea8QYsQpzNL
         BMC3fawXrtRvnwguCFMfVA3okARm7hvruTRouDlCqhZMPXrSpt5ngYfKCwLavYIaVsde
         aASE2gXNIa/2ncV/manadTiO+N12GODfJd1sLt9Ls+CM7pG+DJpY3qdVCjeIaVj8NkSC
         rATw==
X-Gm-Message-State: AFuF++lDpId4R7E+5dt2yM6Ni/4Gfip8dofvygvI1a3nPV2kiJ4Bf4Lq
	ky9aYsRne89DPkPBt6aMrWdBbUppL24JhipznFB/e0e01lg0xy22emWls7ctmiJc9EH1wYu2VQS
	8k0hdItc=
X-Gm-Gg: AYBFou2/t2QSRP5cnHcnq/8DCFxx2UmnqLa+h83HKpVmcfoAw0S4FpsFXNtXSTzEfFC
	/FRN+fHXW4EbrR3ASKQXzJpcUqpMkG/aGSUjqCD/I2WJ2UExVhNeBMdZA6yH+a5CQCaEAzzEn34
	DPJiHSLHysrUIEIs7E5emgItgePhmprEPiTQVPxVTTYzzQEJVGMAHjSSI2UkmpVZpHj7/UD8r5k
	4ycveL/lK3kHVtxOUWSrUhn6pnc8jpM1csgXlvVPXt2ueyPLY3TZEp1vE3Q2hL7NxJQZWd+jGj5
	AuIJHHnpMccmh69YEt77wYdwJdDkFe6H/iutj1w/Hn6GNtTSH8I1x1ohw3s01zsmZteGSJHImoH
	XNk5+nQH7Ok6nY1r3YwYS+sVUTi//k9Oq46DrjjQyU7OGN4jbQCjb4FQNRXxVNuRrw6ZRo2NQYc
	oMIIxvnoRqFXZ8yBK8DZJk3EYveK3Xc2ZXW1ca0mUHXFkVj7zm5xc4ZtCu5h7HovAirjycP+yXI
	McvW1OmRcZoIe12pTnoImQ+YOjEhLINYjDiw6GKMEcXyqpjW8yn+c5vm64Xr1X8fv7JH+o23j4P
X-Received: by 2002:a05:6000:26d3:b0:482:fe64:1717 with SMTP id ffacd0b85a97d-48587097606mr14874577f8f.7.1788641131691;
        Sat, 05 Sep 2026 13:45:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 37/40] qemu: guard RESOLVE_CACHED strace flag
Date: Sat,  5 Sep 2026 22:44:38 +0200
Message-ID: <ae23689b8ef3611156948e8188f80605d2084859.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245189

From: Deepak Rathore <deeratho@cisco.com>

qemu-native build can fail on build hosts which have an older
linux/openat2.h header. The header is new enough to enable
HAVE_OPENAT2_H, but it does not have RESOLVE_CACHED because that flag
was added later in kernel 5.12.

In that case linux-user/strace.c tries to use RESOLVE_CACHED and build
fails with:

    error: 'RESOLVE_CACHED' undeclared here

This is mainly seen with qemu-native because it is built for the host
and can pick the host kernel UAPI header. The buildtools header may have
RESOLVE_CACHED, but native build still has to be safe with older host
headers also.

Add the upstream QEMU fix which checks RESOLVE_CACHED before using it.
This does not change anything on newer hosts. On older hosts QEMU just
does not print this one strace flag because the local header does not
know about it.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...-if-RESOLVE_CACHED-flag-is-defined-b.patch | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 60a5c62fe9f..cc8f2ecdfad 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -41,6 +41,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2026-0665.patch \
            file://CVE-2025-14876_p1.patch \
            file://CVE-2025-14876_p2.patch \
+           file://0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch b/meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch
new file mode 100644
index 00000000000..f23557dc9b9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch
@@ -0,0 +1,38 @@
+From 09e077b87eed754cc0aac0f54d193d49f978c93f Mon Sep 17 00:00:00 2001
+From: Frank Chang <frank.chang@sifive.com>
+Date: Thu, 12 Feb 2026 17:54:49 +0800
+Subject: [PATCH] linux-user: Check if RESOLVE_CACHED flag is defined before
+ using it
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/7ac4bded6af90a15a9562515743a789236b062d1]
+
+openat2.h was introduced in Linux kernel 5.6. However, RESOLVE_CACHED
+flag was only added in kernel 5.12 and later. Therefore, we need to check
+if RESOLVE_CACHED flag is defined before using it.
+
+Signed-off-by: Frank Chang <frank.chang@sifive.com>
+Reviewed-by: Helge Deller <deller@gmx.de>
+Signed-off-by: Helge Deller <deller@gmx.de>
+(cherry picked from commit 7ac4bded6af90a15a9562515743a789236b062d1)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ linux-user/strace.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/linux-user/strace.c b/linux-user/strace.c
+index 758c5d32b6..a903b414fd 100644
+--- a/linux-user/strace.c
++++ b/linux-user/strace.c
+@@ -1125,7 +1125,9 @@ UNUSED static const struct flags openat2_resolve_flags[] = {
+     FLAG_GENERIC(RESOLVE_NO_SYMLINKS),
+     FLAG_GENERIC(RESOLVE_BENEATH),
+     FLAG_GENERIC(RESOLVE_IN_ROOT),
++#ifdef RESOLVE_CACHED
+     FLAG_GENERIC(RESOLVE_CACHED),
++#endif
+ #endif
+     FLAG_END,
+ };
+-- 
+2.35.6
+

