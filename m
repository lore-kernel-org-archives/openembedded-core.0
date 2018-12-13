Return-Path: <anders.roxell@linaro.org>
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by mail.openembedded.org (Postfix) with ESMTP id CEE6C6C479
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 10:48:20 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id c16so1185772lfj.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 02:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NfnsM/u0uizacV+4S21cWDNAZZipQhbh+G+aW7SCOy4=;
	b=N4f+evGIS3mtfxgHnCmpym1GGfp1IhqF4qkWPx7ARjdO2yBncTgFzw1Fk+EaL4PMin
	E7QQmRtNqsdqTIYPEsCDZpoPt//0W/vmOBLsiesdRC4z61i7v9kRj/ce4yXu+dgxm4z6
	Bgc3l4C5cpLOQW6i/GmT5/DUuPJPJZA+tv0iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NfnsM/u0uizacV+4S21cWDNAZZipQhbh+G+aW7SCOy4=;
	b=Ox1aSETvhhiDf2/zOwJr/1RXIlOuY/BwV122/AZY6yfV0RHfGLcKXMFqc1Cuv3sztW
	Abeim7crhUbUOJQSX3JI3w6QlLBvXlB00FZWIaa7lNRJOMMAe6IpBbriwj7bvX0puoVs
	eahPUeShPo8u9lHHkvubzYwCDKzxILkJsvYpJRdcx/0lUoyUYuXgmaSnaEbzcXVE3g79
	0NYbCE1mlwqNcdYFkiKUbDUNFvC/k8U/vK2M4SSdhvjmCwSBqJwpI7TCRJ8BncEMBl5e
	x0BwXyUHAZ9LTNeWNCEjSRCxk6sPiMm2kGP364dfNtpM2SAFnhgp7Wcvc6n7EZYDqYIQ
	H4Uw==
X-Gm-Message-State: AA+aEWbmr5aD9NOUD4c31qok7XZdr+hhKSyfUaO0lNQ+8+SHs0zJQXIh
	Jm00ED/W0PZCf4q3rlLeNrhDt7HlAM8kQQ==
X-Google-Smtp-Source: AFSGD/XyVTiY2AsqLM2vJWwVpDAoLU6FtdCfbveLA7ss5IP0ljYLwgdoeK1lAWXMwKNGdVO50eqKDg==
X-Received: by 2002:ac2:41cb:: with SMTP id d11mr14590425lfi.3.1544698100842; 
	Thu, 13 Dec 2018 02:48:20 -0800 (PST)
Received: from localhost (c-573670d5.07-21-73746f28.bbcust.telenor.se.
	[213.112.54.87]) by smtp.gmail.com with ESMTPSA id
	c133sm299375lfc.45.2018.12.13.02.48.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Dec 2018 02:48:20 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2018 11:48:15 +0100
Message-Id: <20181213104815.18689-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH] bitbake.conf: add coreutils to the HOSTTOOLS list
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
X-List-Received-Date: Thu, 13 Dec 2018 10:48:21 -0000
Content-Transfer-Encoding: 8bit

In newer kernels fold gets used, see output from a build:

.../kernel-source/scripts/atomic/atomic-tbl.sh:
   line 183: fold: command not found

Rework so that coreutils-native is in the DEPENDS list.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 meta/conf/bitbake.conf | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 64800623545e..a825be4628b0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -478,14 +478,14 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
 # Tools needed to run builds with OE-Core
 # python is special cased to point at python2
 HOSTTOOLS += " \
-    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
-    cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
-    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
-    head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
-    mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python2 \
-    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
-    sleep sort split stat strings strip tail tar tee test touch tr true uname \
-    uniq wc wget which xargs \
+    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm
+    coreutils cp cpio cpp cut date dd diff diffstat dirname du echo egrep env
+    expand expr false fgrep file find flock g++ gawk gcc getconf getopt git
+    grep gunzip gzip head hostname id install ld ldd ln ls make makeinfo md5sum
+    mkdir mknod mktemp mv nm objcopy objdump od patch perl pod2man pr printf
+    pwd python2 python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed
+    sh sha256sum sleep sort split stat strings strip tail tar tee test touch tr
+    true uname uniq wc wget which xargs \
 "
 
 # Tools needed to run testimage runtime image testing
-- 
2.19.2


