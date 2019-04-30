Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0EDBC7D9E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 13:51:14 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id w130so4715910itc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 06:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JOxk3ZRWa7JgkjoWpm0OJgR9ogLJtZRD9lkgxqXB2Ho=;
	b=YgOuuA+yIOrnV0rej33UT/OHvAs8E/LKJ5w6XXmfokNOTdbKV9q0Kv2aCRXM+dSlSW
	GG7g79WmnVePkbTY/+h5n9VQvteYALXGvA4UANmds+0zOiGT2whzugQTlW7I6WvJJ+3A
	toxhSOxcqBLs7oukGW6og0MlZK4WEbF7ISd1E+UEh3t5dyD83C5tEiWadm6gKpvx0oA0
	+4ufzkoot98RFBo4X9NgkBZGbwojiIKxURhkp8H45gs36Pl561JNNBtzvmfNrMOB0CH8
	x3Cv9R9DI6cCDFvw0MRiGDYFVzQ9oXemYjBCiPQ/Un2NJycQ1Rs3yhU8ybEFd1y06WAy
	PWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JOxk3ZRWa7JgkjoWpm0OJgR9ogLJtZRD9lkgxqXB2Ho=;
	b=h5kAql6QnpkH7nkz9RdBCvr+PdUt28F405DNFxLe+H2pU9smT1l3vt8H16KV7m3qFT
	vObYhdp2RZesN3kuSh+bS/UUAO3u0814Qwwe3zKlLpj+FOrV5UHqK2qEYlSxAcu+s8K5
	XXtHVQCMaxiGf5Z3bM7JkOc34Rgbb85pvV++f12o0fMpbfmwoIHZWzWJkIB6ymn+HCVB
	7pX1DxWnZpRaYverZHzZlwoFPHcUUgfaJFp1xBMhym2byPXUWr0uqmr5dj8f1F7LOEDd
	sOVtDRBwLQNy13bulfIR+iXgp/HENb4G9LoOFKTDBEKrzfEY9oKe4rqF2WlAv9P3+xEb
	oKLA==
X-Gm-Message-State: APjAAAW+Yv6z/+ICSEK3qcTWAnfZeCFkgQf2OBx2OSZ5RmCsoUuIy7Z5
	JcrhRBKU3MtpVMl0BD0OTCPBePImR5k=
X-Google-Smtp-Source: APXvYqxpuIrVfnrrWiU4zR5Cd8L5YwrIAhRfqWeHM0AvOvLai6bzdaPQfsErF7Cx9JRwsv3i+I6p2A==
X-Received: by 2002:a05:660c:18d:: with SMTP id
	v13mr206704itj.75.1556632275703; 
	Tue, 30 Apr 2019 06:51:15 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	j10sm5808753iop.39.2019.04.30.06.51.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 06:51:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 08:51:09 -0500
Message-Id: <20190430135109.21473-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] qemux86: Allow higher tunes
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
X-List-Received-Date: Tue, 30 Apr 2019 13:51:15 -0000
Content-Transfer-Encoding: 8bit

Allows the qemux86 machine to be tuned all the way up to an i7 if
desired by overriding DEFAULTTUNE. The default if unspecified is left at
i586.

This can be useful for enabling advanced processor features like SSE if
desired or required by various packages.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/machine/qemux86.conf | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index ae5187cbd5b..f2434a4b5f5 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -8,7 +8,9 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-i586.inc
+DEFAULTTUNE ?= "i586"
+X86ARCH32 ?= "i586"
+require conf/machine/include/tune-corei7.inc
 require conf/machine/include/qemuboot-x86.inc
 
 UBOOT_MACHINE ?= "qemu-x86_defconfig"
-- 
2.20.1


