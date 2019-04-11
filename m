Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id DEFA07DB5A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 22:11:58 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id i2so4142776pgj.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 15:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vuuV8Ld7esGyx7eIO7hZKecFa5Li48exk+UaVJj1Unc=;
	b=oGz9Dw7dckFCcjemX/rMS1EDhXzLZUOoNqrmY0xMIVq7tMfG7WmZlzsfaYTkc+S19w
	9riXdHP4O9VAucJV+MM9xMemd9mQUWg8Nlo2OiAI4yXzYxfPoJAcBfrIpYfsKZMZz7Qn
	t0a9LTlm9RH5btK1ko+fFIzv/lVLE6+ZyOtPc1BEnX7182NO3Ai7L5pofqNSuxLqwiCD
	3VZxCj1A3ruZ8WvEMh/bXsPwtew2fwYSihTUQhQJfxWmWCuxYmOZeJrQG72GUSGAKCaq
	iRnx4T10DkBwENCllj36J3n6/qDD3h3GyXU9Yw01g0OEcmNZ/vE8UOLWDOy5Ztyog+Pu
	NjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vuuV8Ld7esGyx7eIO7hZKecFa5Li48exk+UaVJj1Unc=;
	b=iGlXrVVo7Bt3t0ruUTHEQubhVXxD7TiHgKrLRE3JB1v/FD0LD2C7dXDFFqnRGgKpzo
	fl6aB5xLHvGflrNlv+6T6KYlaKpXaji5aO5FsEdrqBNivLr9HNjxiTBDwT7+LR9JRB0N
	DaHAGcd9Zn6lQ0GKSG1c3xz0nEzGoMyKJKw8tswCGMVMstIaNAy4OdHWYxVbO+WMV+GT
	3UCMxEMeeW5EZCLDktBtT8Cn76NmFRDTC+QuiNVWo56iBvLOelCEHUPr3rlepkzaoWj3
	r/soJQ59DjWHZharH7p4MpTXzQQtsy9lqrdRNt7u0qtl7/s4f6m47vUxuDYzparl8fMY
	EYRQ==
X-Gm-Message-State: APjAAAUDo7z+y2GNP/+CDJhVNQl0ENfOtPLiv/bcr0DnR2ii5kh4tRIT
	TzdsvBrOjdEq0NABj0HzMWsTpLIJb+M=
X-Google-Smtp-Source: APXvYqwJ4yCaVhfWolOyHwmdT94Vi19yTBn3cwoRgIyOQktLepTiZYbO0aqOZHe0FYUzH2DztHUsPQ==
X-Received: by 2002:aa7:8518:: with SMTP id v24mr52756912pfn.219.1555020719419;
	Thu, 11 Apr 2019 15:11:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::739a])
	by smtp.gmail.com with ESMTPSA id
	h20sm53080314pfj.40.2019.04.11.15.11.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Apr 2019 15:11:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 15:11:50 -0700
Message-Id: <20190411221150.16825-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH V2] gcc-cross-canadian: Make baremetal specific code generic
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
X-List-Received-Date: Thu, 11 Apr 2019 22:11:59 -0000
Content-Transfer-Encoding: 8bit

baremetal override is not valid for cross-canadian anymore
therefore use the TARGET_OS overrides

Fixes
e.g. https://github.com/riscv/meta-riscv/issues/117

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index e7c08d3a61..807e47e0ee 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -159,10 +159,9 @@ SYSTEMLIBS = "${target_base_libdir}/"
 SYSTEMLIBS1 = "${target_libdir}/"
 
 EXTRA_OECONF += "--enable-poison-system-directories"
-
-EXTRA_OECONF_append_libc-baremetal = " --without-headers"
-EXTRA_OECONF_remove_libc-baremetal = "--with-sysroot=/not/exist"
-EXTRA_OECONF_remove_libc-baremetal = "--with-build-sysroot=${STAGING_DIR_TARGET}"
-
+EXTRA_OECONF_remove_elf = "--with-sysroot=/not/exist"
+EXTRA_OECONF_remove_eabi = "--with-sysroot=/not/exist"
+EXTRA_OECONF_append_elf = "--without-headers --with-newlib"
+EXTRA_OECONF_append_eabi = "--without-headers --with-newlib"
 # gcc 4.7 needs -isystem
 export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET} -isystem=${target_includedir}"
-- 
2.21.0


