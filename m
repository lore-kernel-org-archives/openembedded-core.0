Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id D2C45916B6
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:15 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id q13so2870261pls.1
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=unLORPSnEU4AA4BDyxmjQgX3OINI8CbUm3h97pPoynw=;
	b=ZhAhWyP2V5Bl41YydwLIIRwsa61vOgzvhM3sUuM/1PjQgNc1Gy2aafwo1H3tBc0SVk
	Axv/Tzy/sXObXjQCHeLf/RYVRswD0V/lpFBvRKfGoGxnJybg9ExRD0cDvBv4txJ7nras
	DtmIqsQngkuyiQBdO2XdlHf7NCZOZCiSj+QZSHqdvwF+WJn9uyq0NVNhkKFzzA6RDiYH
	C80gHvcEvbRGsOTx0dn1QOIgulupRB5TOHEBZ8I29YPna/CvN4f5Qfxe9zALOsrR/hE0
	7QvCR8eXAwAVAqs8Eaw8IsySE1OqEGp7gE7u8EIGHuX4hf/jR3sP/qmFEIOZIcTqcm4V
	P+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=unLORPSnEU4AA4BDyxmjQgX3OINI8CbUm3h97pPoynw=;
	b=AxkVJA8+p7J22gZPhP7czroNbwv6Mfq1XWRCSxJECdHG/O0yzsEAxDxi7/9Ldr9akk
	6/tyBVJiBpzeou0nHv/oZY1yYlzgP/AJzqOMgErFwIKfKWGkyeWxtElxY/84sEC6DJv4
	BjV02cZ81QrJ2XaKL1j9keHSILQmAij81HQpa1ERxzZwrpG22s+yrodJs7SGrNX7Raah
	XrEQDmjdzYdeaarIUp5PLPZlESDVR/HJt/fUmVq15Sl/mjTAxaGWRp8Iy5BTJ/KdVQfG
	8LwsEgZFmaYAtD3OCryjpELiYpYYei3hpQZCcoXOvKfRYHLigE4WxlMxEBmtLL1jMrGm
	bsLw==
X-Gm-Message-State: APjAAAXYBPq8pfCUBBxnhfuAVDVUujKqGwr8eu+tirxEC4wAvAxGyL1T
	6XkPVUAmpGAlRSdT1KrTL3P+2W4p
X-Google-Smtp-Source: APXvYqxXPlrHR+WbrL/ZUaRT21P8KZjC062U6iY3bhNGp/weogL7z0UZ2KhZAgHTvOY+dX9+NG1fGg==
X-Received: by 2002:a17:902:8c94:: with SMTP id
	t20mr13597116plo.170.1580055916725; 
	Sun, 26 Jan 2020 08:25:16 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.16
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:50 -0800
Message-Id: <b9fb2913c72ec771e4da2931528f6f5425c14913.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 25/29] openssl: Enable os option for with-rand-seed as well
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Jan 2020 16:25:16 -0000

From: Khem Raj <raj.khem@gmail.com>

with openSSL 1.1.1d we start seeing errors like

Error Generating Key
139979727451584:error:2406C06E:random number generator:RAND_DRBG_instantiate:error retrieving entropy:../openssl-1.1.1d/crypto/rand/drbg_lib.c:342:

when using openssl from openssl-native on build hosts, this is due to
limiting the random seed to devrandom, to support older hosts, since the
option allows to have a comma separated list of methods to try, we can
try the default first and if that fails then fallback to devrandom, this
will ensure that it keeps working with build systems which dont support
getrandom()

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index b00624650a..0e65f333e2 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -42,10 +42,10 @@ do_configure[cleandirs] = "${B}"
 EXTRA_OECONF_append_libc-musl = " no-async"
 EXTRA_OECONF_append_libc-musl_powerpc64 = " no-asm"
 
-# This prevents openssl from using getrandom() which is not available on older glibc versions
+# adding devrandom prevents openssl from using getrandom() which is not available on older glibc versions
 # (native versions can be built with newer glibc, but then relocated onto a system with older glibc)
-EXTRA_OECONF_class-native = "--with-rand-seed=devrandom"
-EXTRA_OECONF_class-nativesdk = "--with-rand-seed=devrandom"
+EXTRA_OECONF_class-native = "--with-rand-seed=os,devrandom"
+EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
 
 # Relying on hardcoded built-in paths causes openssl-native to not be relocateable from sstate.
 CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
-- 
2.17.1


