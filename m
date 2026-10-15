Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1855FCC6B3C
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:14 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32845.1792040648685496584
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jO6dNatW;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so42865645e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040647; x=1792645447; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBM56g3cjBRPOd3iTU5k8JsVu932aoPpfS8OmJRVH/o=;
        b=jO6dNatWFkpHzf3s4tLCstDdY6PBxzbNdAfbFTYF9VEbgQQZlcQqdKLhjtfGvJFyNt
         9ybt12p3mjsS3fqtliy9u5cLsXCBmS3HD7yW7/dgZteAJ/QU61HxTtgBx+U6f0T7GN1i
         Oxd3M/C709FC6hpRxnUuhUHdBB7OxVUydUv7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040647; x=1792645447;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBM56g3cjBRPOd3iTU5k8JsVu932aoPpfS8OmJRVH/o=;
        b=YiaUIhnsdsPxrfK/Naf0s2K/mZZ+D6eDVJP6WTOiA9GI9Syh2aiYpfqXy/hREbxMuP
         MDb8F7HI45wPrlobUtrzYiYhHD3I3PILwswzwxyXr2PAgGGG8dibX1jHJRKNsXC2fZC5
         fmqv0d1Ns1AJqNNKfAD5WOtFtraJp9BfH9dgHdhrQ+DZYYsoaqzl14jFW43QS9g9eq77
         fWtGUx4vBkYJHVyX+75cQWZQV3FMmK8PELvS3yWxiYkpkdD6bG9yzFtOYsE74j8s9uaQ
         6KoJTmKD/83Bku7su6oARydL7fpJyNlKfsKcibJmtCz5uXlEK5F6f8II7wiYJQkp6uUR
         YF9Q==
X-Gm-Message-State: AFq9FYKByU3qB8KBl1uhEs+3aJ+VyUo0U7J+Ai90bkVzLT/rRS+RmBNd
	btzsHcA8BYf+mvFhvZNLn/lkma7Lgs8+W6tNAiJ1CeOxLxC5IMQCXv7LmqkZfpb3EnGhiDoSsxB
	fn4sgmDM=
X-Gm-Gg: AYBFou0FmNAJgf46W3KG2TxvXveX/XaXr6x2w6JUDhuEIT4UEllHRSGRy9xROWx90ZW
	kvmgnK1/8UTivkW7QDBQmAHdXAGDILVWBG7l3nRCSx+dA6fYElawrcC9wpMF42on6Mwkb1rkLCW
	qtSTuvFpkAip6StV1a7QEoj76KwOXbhaVONM8gwVmudCWIAuQeyb4YZ7HVD5l4IkCTZVRShmWmW
	Y96s2YrG/eDc5FPGz76rMwyNECRGj7QaBfanK0vJR64pyiNPqtl2Dsv2/NbvVREIg/bvNN2KaHy
	w14Dl24J9WjR215Nt2yMnfWuvtW9mQBhfqFK0AEJF7bziN/hKKWpTdV3kSX4memMnjMaaSRofGG
	w4BByiny0w2bWHXdmibabgqUU38zngCXTZ/jS8gy9ynRMnK5sJO5szV4y4tKhKmU1rFs29AVbWD
	WjauIcB/QExzW5bUZmW+i/7vO1x0n1xniziDYqifJacXncBaIdG0wvz3a6HMRXaUp0RCBszkESQ
	K1XTeru1B/9dlNesYYloLNY2BUeAy8jJfZ+XltgO9TNeX+iOQvPBwQoA80ntI2bfEBBpgvPfw==
X-Received: by 2002:a05:600c:820c:b0:49c:fa21:1c81 with SMTP id 5b1f17b1804b1-4a18e4d5563mr338446345e9.22.1792040646994;
        Wed, 14 Oct 2026 22:04:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 43/55] connman: fix syslog identity with glibc
Date: Thu, 15 Oct 2026 07:03:06 +0200
Message-ID: <507c75cb27bdd59cb0f372f7cd4d22abba9861b0.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247841

From: Gaël PORTAY <gael.portay+rtone@gmail.com>

The patch 0001-src-log.c-Include-libgen.h-for-basename-API.patch changes
how the syslog's ident string is handled to fix a build issue with musl.

It passes a locally allocated string to openlog(), which introduces a
regression with glibc, as glibc does not make an internal copy of the
ident string[1], unlike musl[2].

As documented in the syslog(3) man page[3], the ident string passed to
openlog() may be stored as-is. Modifying the string or allowing it to
cease to exist can therefore lead to unexpected behavior or undefined
results.

This removes 0001-src-log.c-Include-libgen.h-for-basename-API.patch from
SRC_URI for glibc by moving it to the libc-musl override, ensuring that
it is applied only when building with musl.

Note: The patch was submitted upstream to connman but was never
merged[4]. It was also removed from oe-core when connman was upgraded to
version 1.43[5].

Fixes:

	Sep  7 06:10:36 qemux86-64 daemon.info ^A[776]: Connection Manager version 1.42

This fixes commit d0139bcbe0 (connman: Fix build with musl).

[1]: https://sourceware.org/git/?p=glibc.git;a=blob;f=misc/syslog.c;h=b7414e7b43a510342273bece335b4258e8754905;hb=47dd7e0dacf50c740b04c78d3f85fbf983d53aba#l338
[2]: https://git.musl-libc.org/cgit/musl/tree/src/misc/syslog.c?h=v1.2.4#n64
[3]: https://linux.die.net/man/3/syslog
[4]: https://lore.kernel.org/connman/0caf957f-e046-4453-a8ae-fd6c994ac95d@gmail.com/
[5]: https://github.com/openembedded/openembedded-core/commit/467d28f5d243d821722cf8dcdbb9675a2820cd4f

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/connman/connman_1.42.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_1.42.bb b/meta/recipes-connectivity/connman/connman_1.42.bb
index 9b3abbe2583..4fb7bf6a350 100644
--- a/meta/recipes-connectivity/connman/connman_1.42.bb
+++ b/meta/recipes-connectivity/connman/connman_1.42.bb
@@ -6,12 +6,13 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://connman \
            file://no-version-scripts.patch \
            file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch \
-           file://0001-src-log.c-Include-libgen.h-for-basename-API.patch \
            file://CVE-2025-32743.patch \
            file://CVE-2025-32366.patch \
            "
 
-SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
+SRC_URI:append:libc-musl = " file://0001-src-log.c-Include-libgen.h-for-basename-API.patch \
+                             file://0002-resolve-musl-does-not-implement-res_ninit.patch \
+                           "
 
 SRC_URI[sha256sum] = "a3e6bae46fc081ef2e9dae3caa4f7649de892c3de622c20283ac0ca81423c2aa"
 

