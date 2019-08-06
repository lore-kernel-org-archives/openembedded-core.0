Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBDA7F316
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 06:46:01 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id r1so40940045pfq.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 23:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Sc2/ksdBuoIblH+L2STAAhISsf7de73F9r0elY3icDc=;
	b=A+V5uE5qaoKU8cn4QqrteLU4vsj5d10G8KqK+g+UQwQgmvrqMtKl+e6ZjikO4wbv90
	gI88jz/cLuQ8BSrEGfQNaeuUpRAq+fPUQ3Jni6R5MCSgiowwAbIWnjFJ7wY/h49rmH/a
	de0dAehKGG0W7Wn7ulrJc5k47uOhUn5P/yJtqSjYlIHI5tlaTzZkWOb2L5e4hVetr8KU
	CTaObQkHZudT7JCZU+zl5xPqPy6eoUrDwdDY57k1GVW0Xp7AZ17jW4L3qua7ABQ1c8p7
	7Ij4dgu8ziVcyq2GYd4LzmOv1eaJ1KZsXw1u0gVa8F3I+6p/JtSDj3PwllCrMynyP/Ib
	QUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Sc2/ksdBuoIblH+L2STAAhISsf7de73F9r0elY3icDc=;
	b=bN0D7T83jl09GrYENPSbHTmL4t9gk8nQ7iIGWpwD3qV8vPMmWbxKnAWfaliZ6C8ct+
	kvUyB/uPbWK1PxZFcuAxDAs4RVMCHD3xYqT+pY9ZfSzKSOZLnZUn2en1Ym3x64lw+fE2
	+K03LcKp5wklVB1toOVMmReTyKxrr6S/holYnw1eaKBF3rum2JWHZV9Vmz8BsF7KCDHP
	ymK4kw/CVtqNDT+X9h+o9cxnYmUJl4j599TI8LjFLMujn4RIKeyAX75ZI392tZQQ3lFn
	40hNhX3hRZCqiQo7S4g4D2S5QjoR+cniCTQw/xM97Dwv6pHHQ9y6FCMLwq/BEaDCnkwk
	/yNQ==
X-Gm-Message-State: APjAAAUGp/coHHQGwn5JOZbxzAIVy9pa/yBfsbsXewOWL9ORMy6WcR6t
	X/Edch0xb9Wd4pQmdP07O6XcLpTLeII=
X-Google-Smtp-Source: APXvYqzxQjBSC9ZdUewWl96lwsXF3pyfEzbjBCp9Wj115MWRn72Zao9LFhXvgZWmBD+CEO2ijhGLpg==
X-Received: by 2002:a17:90a:3542:: with SMTP id
	q60mr2186452pjb.0.1565073962547; 
	Mon, 05 Aug 2019 23:46:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id x1sm17957104pjo.4.2019.08.05.23.46.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 23:46:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2019 23:45:46 -0700
Message-Id: <20190806064547.32044-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806064547.32044-1-raj.khem@gmail.com>
References: <20190806064547.32044-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] syslinux: Override hardcoded toolnames in Makefile
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
X-List-Received-Date: Tue, 06 Aug 2019 06:46:02 -0000
Content-Transfer-Encoding: 8bit

makefile assumes native toolnames e.g. ar, as, nm etc.
which causes build fails on non-x86 build hosts

objcopy: Unable to recognise the format of the input file `libcom32.elf'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../syslinux/syslinux_6.04-pre2.bb            | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 67e5d57d48..e9dbefb930 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -59,11 +59,26 @@ do_compile() {
 
 	# Rebuild only the installer; keep precompiled bootloaders
 	# as per author's request (doc/distrib.txt)
-	oe_runmake CC="${CC} ${CFLAGS}" LD="${LD}" LDFLAGS="${LDFLAGS}" firmware="bios" installer
+	oe_runmake CC="${CC} ${CFLAGS}" \
+                   LD="${LD}" LDFLAGS="${LDFLAGS}" \
+                   OBJDUMP="${OBJDUMP}" \
+                   OBJCOPY="${OBJCOPY}" \
+                   AR="${AR}" \
+                   STRIP="${STRIP}" \
+                   NM="${NM}" \
+                   RANLIB="${RANLIB}" \
+                   firmware="bios" installer
 }
 
 do_install() {
-	oe_runmake CC="${CC} ${CFLAGS}" LD="${LD}" firmware="bios" install INSTALLROOT="${D}"
+	oe_runmake CC="${CC} ${CFLAGS}" LD="${LD}" \
+                   OBJDUMP="${OBJDUMP}" \
+                   OBJCOPY="${OBJCOPY}" \
+                   AR="${AR}" \
+                   STRIP="${STRIP}" \
+                   NM="${NM}" \
+                   RANLIB="${RANLIB}" \
+                   firmware="bios" install INSTALLROOT="${D}"
 
 	install -d ${D}${datadir}/syslinux/
 	install -m 644 ${S}/bios/core/ldlinux.sys ${D}${datadir}/syslinux/
-- 
2.22.0


