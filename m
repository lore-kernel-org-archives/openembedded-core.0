Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.13987.1603295941810153517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 08:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JuXNW2mH;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id s9so3669005wro.8
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2020 08:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GQMEAEW2Jn8lnU1BnJretsaFdeGdBcd2jHzSAeLSDb4=;
        b=JuXNW2mHfJna2AQmojsiyJGaijR7SyVCifOatlpzbuq98jciIy+GN+48r6pN7kVXFp
         3AaZuR+nOFFvua/NGkHAA3BD3Tdx3oAUhGrchQfYjnnzJ6aD0cNKW+1vKj4kmCuEO2qB
         F+PQgUMpYGR6BhqDcaf2sIrw3W14C1nJTHJadGd4reeuptWLfK78bx77SCOK0MwY7IYV
         9n2EzkEDTRD1KtAKLGRUaX5k+IMEfzhZQ/fVp3/jHM0cf/V7UkH6vHOjN13UUx/Tf8CL
         rer1qEP/bWaqGKImOYOtYTD9839xCLQXQNHx7uEShhTw6nil/xJfxNAu1v+hf7Pl80G+
         62NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GQMEAEW2Jn8lnU1BnJretsaFdeGdBcd2jHzSAeLSDb4=;
        b=q7r2i+CbWhBZUBvQ55CrtHkYsVCiSr8zvV9aU6+HuY8W8u5yO0TEQpcMiMTLSicKCu
         Pnl88yJ5oOYK4Whni9TfqOrS0TDW8oeamTKiBbr+8HAvdpOkcvcQgKKDjpxUGMq0CLsW
         kGImg96SE8IWpTRJVNPXBpswYIvUfq9QpKIyxMrTE3BEuuIi+G/3FLW77gyDUK0NyL2n
         z10/Dzg8JBn+UDokbPAEOqFnJ8czzAIC/CrzwUyOauGYQegBL+hFDDUFVkVmM8raSr46
         HWIzqeDZ+R0DRwSoCpN0eyS4Kf+0HGhxLQ2UQHP6lFy68d0rv5OGLDtDqEM+c8qBTy/C
         52ww==
X-Gm-Message-State: AOAM531PnWWnEXZFVfVE3bOysZWLPGMCmPgWPxsVRVC2ia/lGIN44M+A
	CX51YbL+IoJhzzAEKixQfzKUJjqVX60ouA==
X-Google-Smtp-Source: ABdhPJxnPH682f8ZM7FcsTEmRFe/AvOcnVkpdZeX+bTmzGINDyhYt1AMKaMHWXP2szqCmDTug4XgLg==
X-Received: by 2002:adf:f643:: with SMTP id x3mr5835685wrp.180.1603295940146;
        Wed, 21 Oct 2020 08:59:00 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
        by smtp.gmail.com with ESMTPSA id i126sm4491595wmi.0.2020.10.21.08.58.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 08:58:59 -0700 (PDT)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Add new recipe for squashfs-tools-ng
Date: Wed, 21 Oct 2020 16:58:57 +0100
Message-Id: <20201021155857.2841570-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

The main difference with squashfs-tools is the availability
of a shared library and a programmatic interface, rather
than just command-line tools.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 .../squashfs-tools-ng_git.bb                  | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb

diff --git a/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb
new file mode 100644
index 0000000000..bbc5f86ae9
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb
@@ -0,0 +1,37 @@
+SUMMARY = "New set of tools for working with SquashFS images"
+SECTION = "base"
+LICENSE = "GPLv3+ & LGPL-3.0+"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=c0de2c0aca56349dab98e97992316f7e \
+                    file://licenses/GPLv2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://licenses/GPLv3.txt;md5=1ebbd3e34237af26da5dc08a4e440464 \
+                    file://licenses/hash_table.txt;md5=874823605326caeaabaa95bfbd0f9fb0 \
+                    file://licenses/LGPLv3.txt;md5=3000208d539ec061b899bce1d9ce9404 \
+                    file://licenses/LZ4.txt;md5=ebc2ea4814a64de7708f1571904b32cc \
+                    file://licenses/xxhash.txt;md5=f042a9be092bd6d7fe6f217d8d00f4ca \
+                    file://licenses/xz.txt;md5=1c389b9610ccfdb25f7abaea6a0bb5a4 \
+                    file://licenses/zlib.txt;md5=ae27c72096606131f760e5f59cf98b06 \
+                    file://licenses/zstd.txt;md5=8df8137b630239cbdd4c0674124cb0c8"
+
+PV = "1.0.2"
+SRCREV = "b96f0fc154feef531be76034bf6e38925636146f"
+SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https \
+"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= "gzip xz lzo lz4 zstd ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+PACKAGECONFIG[gzip] = "--with-gzip,--without-gzip,zlib"
+PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz"
+PACKAGECONFIG[lzo] = "--with-lzo,--without-lzo,lzo"
+PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4"
+PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+
+PACKAGES =+ "libsquashfs"
+FILES_libsquashfs = "${libdir}/libsquashfs*${SOLIBS}"
+
+BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "squashfs"
-- 
2.20.1

