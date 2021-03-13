Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web09.2579.1615661547200733555
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DH0TdVGM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.45, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f45.google.com with SMTP id h6-20020a0568300346b02901b71a850ab4so3135104ote.6
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9+wtndPU2TIhOnS82ZGJNTrXo7nt8HDAF15trMd3u0Q=;
        b=DH0TdVGM6i4Xlabm3lFOcpGMjTtXKfCoRvCL3IY6FUJKceMZhHE0uEHlPET0wd481v
         21BHUYn77g7SOkFdgBgJD/q3RWPoxF0bX9Vjz1hW/wGtC7vVJJ3ERlx6vQPSBMSKP++Q
         M0qb7sHL1RAIJx7e+nMe6Tv+mB5JumCYXPfgVzWYxEZDx4dx+BgQqvt+zLWzA2JHEmW8
         X5n7UfpXtJwh70Toj1+FUQOP8I/MMfRyStaiaifaIvmeh23EUj0VKdQif8gmQisst0ze
         3HCJmJggAU5i3t/yxuMkC5/JbM0gmEMUYD7n3eaaBNij17RT31YKeaCbHkxlHxe9PWXI
         Qc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9+wtndPU2TIhOnS82ZGJNTrXo7nt8HDAF15trMd3u0Q=;
        b=jaADieZrTzS+aYy+FrHnbqyNcTp6DILtmZcRngLuXFhhU0SoEuGmOFJRCI6lpumcAg
         5wEglEG3Ry1EOCOFkeZBwC8Nr+GFEOQIQujipvn2hI5FogsjVAdorWvet0irfHprrr3S
         9J9YEWn9kGQcTW4YdTWuhPjogba9Wcrgc1OghsocTliseTaTj4LipCCjF2mOunkNnkhO
         lvoRvdZekJukP48x8kj29Ao0tGUtx13kggKiyODUkue9Aazkn2LYrFd7wiUJJUXLlqkC
         cWIUAEBZp2I1GWLf2TlQe3dYRCObrCgUzNyFVRjksxO7FIjFJ+hb+2MVTBRnEIrnpWm2
         EQNw==
X-Gm-Message-State: AOAM530CF2j5hMOJzMK5czyc0qGuf0xwXoSQh6GVFBR1UOsX/gLryFIf
	s0TptHMjvRWqSDxgzU71mmk9CYzZJ3gF+KHA
X-Google-Smtp-Source: ABdhPJx4h/RoOBVHoGu4uifAsgUFrNIyiUEqbCzDoVVWpqIw+r39TBIOtJeY9dY7fNv2Wx2pB5FUjA==
X-Received: by 2002:a9d:3f37:: with SMTP id m52mr7942110otc.92.1615661546070;
        Sat, 13 Mar 2021 10:52:26 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.52.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:52:25 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 31/38] dtc: Fix array-bounds error
Date: Sat, 13 Mar 2021 08:49:20 -1000
Message-Id: <7f1968a096301aade2afc4b7eceb7a69e4ab364c.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Fixes
| libfdt/libfdt.h:251:28: error: array subscript 'struct fdt_header[0]' is partly outside array bounds of 'unsigned char[4]' [-Werror=array-bounds]
|   251 |                 fdth->name = cpu_to_fdt32(val); \
|       |                 ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd4fe4ec658ce4861fc970149f78b0ca7fda8fe0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dtc/0001-fdtdump-Fix-gcc11-warning.patch  | 35 +++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_1.6.0.bb          |  2 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-fdtdump-Fix-gcc11-warning.patch

diff --git a/meta/recipes-kernel/dtc/dtc/0001-fdtdump-Fix-gcc11-warning.patch b/meta/recipes-kernel/dtc/dtc/0001-fdtdump-Fix-gcc11-warning.patch
new file mode 100644
index 0000000000..ec825cbf7b
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-fdtdump-Fix-gcc11-warning.patch
@@ -0,0 +1,35 @@
+From 4827e0db6c4f7dea7f4094f49d3bb48ef6dfdc2d Mon Sep 17 00:00:00 2001
+From: David Gibson <david@gibson.dropbear.id.au>
+Date: Wed, 6 Jan 2021 14:52:26 +1100
+Subject: [PATCH] fdtdump: Fix gcc11 warning
+
+In one place, fdtdump abuses fdt_set_magic(), passing it just a small char
+array instead of the full fdt header it expects.  That's relying on the
+fact that in fact fdt_set_magic() will only actually access the first 4
+bytes of the buffer.
+
+This trips a new warning in GCC 11 - and it's entirely possible it was
+always UB.  So, don't do that.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dtc.git/patch/?id=ca16a723fa9dde9c5da80dba567f48715000e77c]
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+---
+ fdtdump.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fdtdump.c b/fdtdump.c
+index 9613bef..d9fb374 100644
+--- a/fdtdump.c
++++ b/fdtdump.c
+@@ -217,7 +217,7 @@ int main(int argc, char *argv[])
+ 		char *p = buf;
+ 		char *endp = buf + len;
+ 
+-		fdt_set_magic(smagic, FDT_MAGIC);
++		fdt32_st(smagic, FDT_MAGIC);
+ 
+ 		/* poor man's memmem */
+ 		while ((endp - p) >= FDT_MAGIC_SIZE) {
+-- 
+2.30.1
+
diff --git a/meta/recipes-kernel/dtc/dtc_1.6.0.bb b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
index 92df70d9fc..a407137859 100644
--- a/meta/recipes-kernel/dtc/dtc_1.6.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRCREV = "2525da3dba9beceb96651dc2986581871dbeca30"
 
+SRC_URI += "file://0001-fdtdump-Fix-gcc11-warning.patch"
+
 S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

