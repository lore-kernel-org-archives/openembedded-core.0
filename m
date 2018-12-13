Return-Path: <anders.roxell@linaro.org>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 638166C0C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 10:50:18 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id t9-v6so1354393ljh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 02:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ldFIg2b91FJgHetGfnxmjnQ/u3hBwEF7qUMxr4rdxak=;
	b=Ppghxw1Htr0x/ovK2Fa3mKEh4fPNtwTt8XzQ+Om844lTotxuBZl/LqFivV388jDZ8W
	7Qc0DeM+5ai5dUSkWnLtDw+TojtFCZIAAnsnW1M9kXgM5MjuUuPQ0jceRMc/xpu+S6yH
	xFixiqjnzBMrXZzm32y7ay1PahoQEgMPo7yyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ldFIg2b91FJgHetGfnxmjnQ/u3hBwEF7qUMxr4rdxak=;
	b=iL3M7PTTTQBMDOpUc+6auHZqk/7CuqrouX9nCG/iCfY0NQ6XMUQgtoD2fniJscNjq4
	FXIK6ecYbiHC1dfOMZ3eNAzgdNL0hC+4PNLmaN6iSAAjrKGQEjc/y8n+JUvIC+JS1DiC
	BgYZzUV5GUJ1VE9fEsWQ8T4fIz4+SWiTgd4qvwuOUhv490X+bxZOFAIRn4Dr7aK6HIGS
	lhQJtgysMgPbik2apIFI8cbLFX8i5wZPlibZWfX05v/xWD6WvuQfiKlDBJ/vc3e285MP
	DK5lY2JXof5NOiHCif+LiBO+G6s/WG9ON3rBW5N9h6SeeRGQd7ac73Mn+se+FjyxSrHK
	haGg==
X-Gm-Message-State: AA+aEWZam81vIzvvzDO7Tp2tmxMBlf3v/4M7l4jb+pzErJEKGkv8xT5O
	u8o9es0h7uSbXQmSzrPOQAIfJvxO3L6oYw==
X-Google-Smtp-Source: AFSGD/X1v+EHDuLSLid2KDsqZ2JFhLRwUoTNxgn9hiINu7Ps8G9KfNTBWF+kbZWVVEk8p1GrgHTZ2g==
X-Received: by 2002:a2e:9d86:: with SMTP id
	c6-v6mr14152997ljj.146.1544698215144; 
	Thu, 13 Dec 2018 02:50:15 -0800 (PST)
Received: from localhost (c-573670d5.07-21-73746f28.bbcust.telenor.se.
	[213.112.54.87]) by smtp.gmail.com with ESMTPSA id
	w202sm274877lff.31.2018.12.13.02.50.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Dec 2018 02:50:14 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2018 11:50:06 +0100
Message-Id: <20181213105006.19131-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH v2] bitbake.conf: add coreutils to the HOSTTOOLS list
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
X-List-Received-Date: Thu, 13 Dec 2018 10:50:18 -0000
Content-Transfer-Encoding: 8bit

In newer kernels fold gets used, see output from a build:

.../kernel-source/scripts/atomic/atomic-tbl.sh:
   line 183: fold: command not found

Rework so that coreutils is in the HOSTTOOLS list.

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


