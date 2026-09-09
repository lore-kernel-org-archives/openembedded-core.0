Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98480C79FBF
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:01 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6317.1788939000659409920
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IZRNi8yS;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48441fa5c37so4023534f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788938999; x=1789543799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e/FCc0zq7r4B2sljo1mwdNuTiVb4up034azd4meUN8U=;
        b=IZRNi8ySYs0ZEfR8P1tdu+X1ubGbr8KpiEi0HAk1TLVNKGLxyEEX+jfaWUaon4OHJe
         7qbLxul+OTUah/ZUSvZwAjVpdxWQpPbP4R1zJkg1oloJQTdTQCsrjvaOuhN8hXMMk4n4
         nOST+OzdFjnifBQD7vIS/IDh8s752itvpdERo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938999; x=1789543799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e/FCc0zq7r4B2sljo1mwdNuTiVb4up034azd4meUN8U=;
        b=XwjZW+uU/iAc+QwF2S9R341pRqDF906fpuwZpMs87ARftebj8MtaK3Pmjo9AqEvh8L
         szlTV9wcD61sXQazapsovEK16CyIgAvlj8M1DTHyAjSao7kx8OAKCJa+Q3oSKFKmh0j/
         zQwKGxay4fhwaqQzcPbQFIjg9WIdeUF0lQWLcGT1KeL9BDAkdUqgKI9S9fVRUmnBuS/3
         bkhD17EVcUF/1Qkl/ctoEZrxXbNGsCpsdGDapHpx1GUxG08bF6bkbZkTwFEGjaPnMqmE
         2fCQ8TjVz04unj7y7mw3W98E+rvTIPVCqdNqVYm6pCpsugTcAPsDXmPM32UNcNyT/FbU
         7row==
X-Gm-Message-State: AFuF++nfh1qwGO0kpkS1zlfcXpdNO5ZzFlE3jmj5AFlL2BfoU/aqPtwF
	EuHHvczGm1j/GQUKj84ifrJjZTK3jiu/nghVUTtqbzdgcjzxIh6u+uo8C2ETR2pZEpbGexOqD7i
	Ntsf8RPI=
X-Gm-Gg: AYBFou08wFxDiYizXf+QRPyzN1Ak7EpP546wfAFGN6JglN4uCV5ZVeYK65K+fCq22W7
	tIBdrErGJLOHH/J/Rmcygr2kzRzR7zPSIX15OqHhJ1TR6t9yherFy6eEedbdfuGEU31Rv1GpOpq
	XvSOiILG8/zEuYmx2k1CZ9BE3WdjyfzZkLRQx+mZ5PSQVxZFl2NbDejgWsPFG4BZM0ghiOH6q3b
	H4uyp5Njy+g0WL87EZB3DRWotJaMzz3GU+wdU6Z3pT4HH464kwqRH2rWNznWx09g73QBl42Ga6R
	C4fcbCyPMSvuEADa0URA/8n7+C2LDW9k+ZYs4w5TjCNMaq/vJ9B4qOdwrnSBHtoTQruN5wpgfca
	tXcsKyAwljf0v+rkQwKsN72rhDevSbKhcnMw/moe744hHch0kMgOc8HSQVB1Ub3TUCt0K+w9jhM
	pYM76CRjlY5HqdL0EdXqkHlfCs1ZxTjhZSx7KMkcG4X4WaOpbH0p2ZP8Prl2yMrzUYGEXr9FBpC
	bqk3ykGi67LQfLVjytJKO66aOpLiNew1nyQ9J+yiOZvE2pxp3KF58jJDhXrKx08NKwRmFKg0Tk=
X-Received: by 2002:a05:6000:2084:b0:485:8a46:b3d0 with SMTP id ffacd0b85a97d-4858a46b5a1mr33586620f8f.56.1788938998848;
        Wed, 09 Sep 2026 00:29:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.29.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:29:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/38] time64: enable 64-bit time/file-offset flags for 32-bit nativesdk
Date: Wed,  9 Sep 2026 09:29:08 +0200
Message-ID: <2bbf244ddb677ab6799cfdc9686f5e516412692d.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245418

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

When SDKMACHINE is set to i686 or i586, nativesdk binaries are compiled
as 32-bit. Without -D_TIME_BITS=64 and -D_FILE_OFFSET_BITS=64, stat()
and time-related syscalls use 32-bit types, causing EOVERFLOW on
filesystems with large inode numbers (e.g. container overlay filesystems)
and Y2038 issues.

Add SDK_CC_ARCH appends for class-nativesdk:i686 and class-nativesdk:i586
using GLIBC_64BIT_TIME_FLAGS, mirroring how target architectures are
handled.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>"
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9f62a45555673842021d5746437e66c40d3f3cc)
Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/time64.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 19177b1f3cc..a2fe03354d5 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -38,6 +38,16 @@ TARGET_CC_ARCH:append:x86 = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLI
 GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
 GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite = ""
 
+# Apply the same flags to nativesdk packages when building for a 32-bit SDK
+# host (i686, i586).
+SDK_CC_ARCH:append:class-nativesdk:i686 = "${GLIBC_64BIT_TIME_FLAGS}"
+SDK_CC_ARCH:append:class-nativesdk:i586 = "${GLIBC_64BIT_TIME_FLAGS}"
+
+# nativesdk-pseudo wraps both 32-bit and 64-bit libc calls; enabling LFS flags
+# causes duplicate symbol errors (e.g. creat64, fopen64) on i686 because glibc
+# aliases the non-LFS names to their 64-bit counterparts via macros.
+GLIBC_64BIT_TIME_FLAGS:pn-nativesdk-pseudo = ""
+
 # Caused by the flags exceptions above
 INSANE_SKIP:append:pn-glibc = " 32bit-time"
 

