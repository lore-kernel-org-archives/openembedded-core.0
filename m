Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4BBC76D52B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 01:28:58 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id g9so2515078plo.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 17:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3RRQDwmpiVNwza8yYCZUcVpg1+D9WK7QpX/CravmEBw=;
	b=F5+P2OUoy9rGvYQyZbJCnF9bVZBJPGcXQbQa78hpv351S0MQTtWLnUq/asHWKAoV5I
	hwuIrK3gdzKxtxOvryot5hoj7OKpaKFsK/txtuEKQccMOWB5Ts30PqWVuh5wYF6g8jjn
	BxXgoFA0eE9Y6jBpdxmnndXNhCwomJDdtw0k/0ezdK7JdJU8KDI2T7+btyHX0+mrioxG
	Zn9ZMa+wPGcwTDB8VG1259WnhB7ZCI6aawjOcjfCkMWb4NfxYN+CsMk8Zuz5PFi28FX+
	NFYsZoBd9P5kh2C0HB5IOyqFRnL3ssATbHWVXr7eAqkvq2PRndex5igLHXsmOa3zhLse
	Vx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3RRQDwmpiVNwza8yYCZUcVpg1+D9WK7QpX/CravmEBw=;
	b=dJX4A0cPBA/rTIdl0RLXzl5nf1AdIrHmdTYnZ8hYrwOSEmQKjaZEExHQOopbTJ2scz
	rFFr2Mfv8R2R+C/zMNzWj98olQajHn/Mkxn1BDyCE+aKiKFoIzxDqL1bXAAuYDPvpidc
	CUE4U7GB8oZ6//IS7PeYf2jrXfNoJoYRPn2mvRdONAfMEqSSlRNCUkm1qRJs9fNohFkJ
	Lm7bn+ZiFtKi8K4NnZa4oUOsj/vaw9APdHF85SLMVj+ChloJ2eWD2V6LOSkEGYSCWeYe
	PGtr0v5qxjDia92iQbEuUzDkOEV362R0+/Qu8+DnUk6XXPDzy2DF2OSzVjUAF5f7dhDh
	/Ngw==
X-Gm-Message-State: AHQUAuarCjOGj8nz4ZyhSoyfpyVDlNxJ5cRskVmZQB4MfxLcwlBC+p2g
	8oxeX1MzlBLus8gUwslkB4PCwZIv
X-Google-Smtp-Source: AHgI3IbaZQmOUvg17G8r3djPI1qyibc47Y+J26Zknm1mTLTLRfjXL7x1LHudP+Gy8/RYZ+7lOlEOCQ==
X-Received: by 2002:a17:902:7683:: with SMTP id
	m3mr13358377pll.191.1549675738951; 
	Fri, 08 Feb 2019 17:28:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id t3sm4652290pfa.50.2019.02.08.17.28.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 17:28:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 17:28:50 -0800
Message-Id: <20190209012850.17425-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] image_types.bbclass: Set 70% RAM memory usage limit for xz
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
X-List-Received-Date: Sat, 09 Feb 2019 01:28:58 -0000
Content-Transfer-Encoding: 8bit

when building with opkg backend and huge packages e.g. chromium/llvm all
going in parallel, memory pressure causes xz to catapult with

do_package_write_ipk: Failed to create package, opkg-build failed with: xz: (stdin): Cannot allocate memory

since there are many tasks going on in parallel, xz adds to memory pressure
and it wants it all, put an upper limit for memory xz can use

We add a variable XZ_MAXRAM with 70% of RAM limit and can be customized
if builders have more memory one can set it like

XZMAX_RAM = "-M 0"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/classes/image_types.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 70bd315306..9c8ea0643c 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -57,6 +57,7 @@ def imagetypes_getdepends(d):
 XZ_COMPRESSION_LEVEL ?= "-3"
 XZ_INTEGRITY_CHECK ?= "crc32"
 XZ_THREADS ?= "-T 0"
+XZ_MAXRAM ?= "-M 70%"
 
 ZIP_COMPRESSION_LEVEL ?= "-9"
 
@@ -284,7 +285,7 @@ CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha25
 CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_gz = "pigz -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
+CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} ${XZ_MAXRAM} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
 CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
 CONVERSION_CMD_lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-- 
2.20.1


