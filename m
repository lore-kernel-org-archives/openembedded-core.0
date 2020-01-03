Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id B6B197E08B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 18:04:37 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l24so23757594pgk.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jan 2020 10:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hFVriihO1fn4ztYigjP1Ix/df6BEezx7ZUtyoS/Z8hg=;
	b=bwtwN/uCAzQUFM691RanOihXgno0gKqcQj/LMFQ0P0JSNzkB/9xBiPcdvd950GEOtQ
	/KyCZLHokg/kOicHM2ydqEkGEe4hi/t9h89/6vogbeGLTxD+/FA0LCBjJ/9yG6Xhtqnb
	GdJsodJ7gpjAXctnZODhXyZcxVPAQKxZoovEJDlCojBYEd1J6NUb4YS8U7geLc+6hfrJ
	02hQH0ePAEukQKvHeA6adCg2YEH4ul2+xfJWHqPRJ6AaMOvUVPe/uuVg17pPbvt6x2qQ
	PnyKKU60quSIV1yhag8IlrfS7YJ6cCyyNvLT2ALIIoeR94JmofnwYDLInlmFaHa8ZyTW
	nfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hFVriihO1fn4ztYigjP1Ix/df6BEezx7ZUtyoS/Z8hg=;
	b=Wt+0L5V4BfSWwWOJBvLGgTrSRmXdRHXAoKfNF2jZCGYvPNpttIH1/I68lNdlIEhprT
	ZM/6VS1UPX1HOtYDYerx5Od8ydXSg70AqCTKIphmcJn//q7r29pOCOxF2qOMcG9x7gyO
	8kdt2ZtRJlWy92TZ7ZuMkjv63jYDHZ/sOP/mgSDqgeD3TUWQej7xDivtorx1auZZP7DW
	S64rvL3bG/l4j7x1QeI7bDSgHFk8GppqFXzAU4iD/m23Y3s2JiDb8Sjf/7ajqkx4nLGW
	dbNXQKV1hDjECIU6DCKmzwf8Dkl6NnQnX/uo1GJrMTMJ5yZy0aIQmHGsYrvRR2OS3WPr
	o81A==
X-Gm-Message-State: APjAAAUp9i7lln2r/K+C6bCYO+HiwM/PT4cfoyYK4FzeA8CtsCv75xT9
	2Eh46PWkB8BsYie7BeQdF+Z/+ZzZmNQ=
X-Google-Smtp-Source: APXvYqwP3crPxkB0XfHU87U5XFU7/g6qs2fBWNJZfR3k9tLfKtoFRzDhZzyMiCeYpa77pFpQr4sNjA==
X-Received: by 2002:a63:1953:: with SMTP id 19mr95963833pgz.157.1578074678263; 
	Fri, 03 Jan 2020 10:04:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	y203sm48790881pfb.65.2020.01.03.10.04.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 03 Jan 2020 10:04:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2020 10:04:34 -0800
Message-Id: <20200103180434.3248837-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH v2] musl: Build outside of source tree
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
X-List-Received-Date: Fri, 03 Jan 2020 18:04:37 -0000
Content-Transfer-Encoding: 8bit

musl does not use cmake/autotools etc. but plane old makefile basded
build system, which means it does not get B defined to be outside S
therefore define B explicitly to be outside S

Ensure that B is clean before configure task is run

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add B to cleandirs

 meta/recipes-core/musl/musl.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 9aea2c39c8..bdce412162 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -25,3 +25,7 @@ MIPS_INSTRUCTION_SET = "mips"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 ARM_INSTRUCTION_SET_armv4 = "arm"
 
+# Enable out of tree build
+B = "${WORKDIR}/build"
+
+do_configure[cleandirs] = "${B}"
-- 
2.24.1


