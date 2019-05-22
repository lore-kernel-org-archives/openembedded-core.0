Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 87CCD7E3D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 23:40:28 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id r18so1790117pls.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 16:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kYtxvQI1QBKOV43ZzMiBxofodcmrxI0B8slEimqtXg0=;
	b=YXra2IvLCJq7j7KfcB8DQ1Z/Vn8anRZZl97l494eN/nAqAgOVP88LeNQOen9yBpkv9
	xIB/lLwoO35GadoJydWjbAPfzC+OqnoZEAZdPo8iejp73eO4C06p2F3pY3Xs66BFtuuj
	4qDkXg9M6h72hQjrLoB9X3bpBsm4YPvF01JV4QwZhuSEabbBb0SEAteDAuWYZVpsPL8x
	8taFYL07y7NX2gPuDPQPigzmBcIo2Z4cCLnyhkXVp8rhrbbrA6sEJtcANoYuID+Kgqmy
	E3jhn3OGu1IEoZCKhT1lzBv8lmBRuIHFR/EQykYfRFbuaav63RTAM0IMJR84a2+QwGN3
	Z84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kYtxvQI1QBKOV43ZzMiBxofodcmrxI0B8slEimqtXg0=;
	b=AZvBtyH+DKDtcl0TLIroIyMW9o6hPN/eYjz2g4xsYJGKfbLOikIm0oVLwJPZ/Lliks
	F37JzXsrX59NUsqOYpq+XIOhrsIdXm8ixFa+Dzs8v0uvMq4aSs+skX0/iZDhWnqj9r1K
	OrbvzD4oP1QiYYnNmRpw42aAoOg65/KgxnOdndmj//1a9gp/xwlS9fy8hvdq2psFW2qy
	m1RYBkP7fsYU3YMrPD57fPo5qtQP95e3NmJygnz4WiG4fSTZqtti7s43m+OH+nfbi1aD
	bXSBhDOFl30plgX8zt7JSc4NoygRbGpu1lOaogspSC376bU3TXuYL8uID5HEzc5NO5JM
	4xrA==
X-Gm-Message-State: APjAAAW1uv4cDD4xtzPreJ7x9+asPYDFmiYqcoviBCzLo9cIY+qbx8X6
	QkiocJOFMqdtzKKPKa63PDSfoqgioIg=
X-Google-Smtp-Source: APXvYqwVc+LsD+4+RUV08qZWrmBPuVBooBVxekqegfb1lPTJA9cjqYxZrurnuYf6AYDKQIBhSyq66w==
X-Received: by 2002:a17:902:b10b:: with SMTP id
	q11mr48381066plr.58.1558568429287; 
	Wed, 22 May 2019 16:40:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id
	h6sm39453465pfk.188.2019.05.22.16.40.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 16:40:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 16:40:16 -0700
Message-Id: <20190522234018.30565-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522234018.30565-1-raj.khem@gmail.com>
References: <20190522234018.30565-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3 2/4] musl-obstack: Add recipe
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
X-List-Received-Date: Wed, 22 May 2019 23:40:28 -0000
Content-Transfer-Encoding: 8bit

obstacks from GNUlib is used in some OE-Core packages e.g. elfutils
and other packages outside OE-Core, this recipe helps provide this
functionality standalone on musl systems, and helps in getting full
versions of dependent packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Rebased

 meta/recipes-core/musl/musl-obstack.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl-obstack.bb

diff --git a/meta/recipes-core/musl/musl-obstack.bb b/meta/recipes-core/musl/musl-obstack.bb
new file mode 100644
index 0000000000..3003935fe5
--- /dev/null
+++ b/meta/recipes-core/musl/musl-obstack.bb
@@ -0,0 +1,22 @@
+# Copyright (C) 2019 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "A standalone library to implement GNU libc's obstack"
+DESCRIPTION = "copy + paste of the obstack functions and macros found in GNU gcc libiberty library for use with musl libc"
+HOMEPAGE = "https://github.com/pullmoll/musl-obstack"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3d23e4eef8243efcaab6f0a438078932"
+SECTION = "libs"
+
+PV = "1.1"
+SRCREV = "d2ad66b0df44a4b784956f7f7f2717131ddc05f4"
+SRC_URI = "git://github.com/pullmoll/musl-obstack"
+
+UPSTREAM_CHECK_COMMITS = "1"
+
+inherit autotools pkgconfig
+
+S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST = ".*-musl.*"
+
-- 
2.21.0


