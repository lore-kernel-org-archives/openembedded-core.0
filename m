Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 21745600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 04:51:45 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id g62so7560895pfd.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 20:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b1+T4agqtjysBqTNDQqLUPo+x/W4AdrJzSISsnUcxfA=;
	b=tpUXX4rOPJt4PuZazi+gMx87mwsTXMLxmedWghbyTi596UJ+zCwszaRGoe8NTgYqw2
	PhqlZ4zQdjMqZk38QfgZzWVt5oaTTYZratacpARtu2ZnBqsu3T0gYiohCvWHc23YSZgJ
	qPXFoufBTBbzc0mP1gq0inGXVK93qH0ueFcPIz3SbHHwqSYbtBJxVGBc+V2tz2ZaRcrX
	ZHrh8+2DWj9m80eYweJOwvAA7Pj0QDxI9vdpV/HBburdlqbSzp5zORpibC85IDxuImKQ
	0i293jX1tdtMBNj5GrfDWpSYCL8HfC+/9cOD+2OkwWOp6VjTkJBkWNK9RuxYwpTT2XOu
	7MbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b1+T4agqtjysBqTNDQqLUPo+x/W4AdrJzSISsnUcxfA=;
	b=PdUkz5qtGLvzBCvsTyreWmfT2rN5WjO216xJLRUgNdM688bFBFAiwQkMqEdrnnBlVT
	YSygYVIomsHFY82zl828jDDzGZ4hx7Cpvo3pKgKmFUJ5XmxlyneKgt9HRYW1uP73hrm3
	oszXt7UJroG1sU5dHfSuV5mjYDdyc5UJh49NwnYjWdJel9+3I59WLnUXkfcPbNmwl74d
	qmKEBLRJ+VXlM5ZiAOrUVEpRIsHbFwSjlPHWf0NAt9AR74yJjTbKNWvrQELINR+zoZxm
	mdv4Lyb18QAvJ/W9zB+ZOh5E4sptIR7FIDfjQHBu9RdxxJqAmmCA7qTybDWuoZIaWpzN
	OyDg==
X-Gm-Message-State: AA+aEWa+HhWmmD2/ZUyggbKQp8lG3LTDHKTOvWArLST1Mps9Ll8+R7Ed
	w/AFw3+Zym2/jsiK5/EYbC8e1MsoE6k=
X-Google-Smtp-Source: AFSGD/WOapYQd3UlEdx2TpmUSTs9nPR2tXvOqw+SCddnwN/qMDeQUwtxCXkZlmn5I61AUczSZFLFfw==
X-Received: by 2002:a62:7796:: with SMTP id s144mr18596650pfc.26.1543899106372;
	Mon, 03 Dec 2018 20:51:46 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5f84])
	by smtp.gmail.com with ESMTPSA id v2sm16058914pgs.0.2018.12.03.20.51.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 20:51:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2018 20:51:35 -0800
Message-Id: <20181204045135.24221-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH] valgrind: Skip vgpreload_memcheck shared object from stripping
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
X-List-Received-Date: Tue, 04 Dec 2018 04:51:46 -0000
Content-Transfer-Encoding: 8bit

This is a special library for memcheck tool, where it needs to have the
symbols intact for the stack traces to work on target, current option is
to install valgrind-dbg ( 151 MB uncompressed ) is quite big for some
systems which may not have space to install it all. Leaving it
unstripped adds about 200KB to image which is much better, this alone
gets memcheck working, as an aside we might need same solution for other
tools e.g. helgrind etc. when needed, they also have leading libraries
installed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.14.0.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
index 97e58a446a..50f8221ebb 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
@@ -96,6 +96,19 @@ do_install_append () {
 
 TUNE = "${@strip_mcpu(d)}"
 
+VALGRINDARCH ?= "${TARGET_ARCH}"
+VALGRINDARCH_aarch64 = "arm64"
+VALGRINDARCH_x86-64 = "amd64"
+VALGRINDARCH_x86 = "x86"
+VALGRINDARCH_mips = "mips32"
+VALGRINDARCH_mipsel = "mips32"
+VALGRINDARCH_mips64el = "mips64"
+VALGRINDARCH_powerpc = "ppc"
+VALGRINDARCH_powerpc64 = "ppc64"
+VALGRINDARCH_powerpc64el = "ppc64le"
+
+INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/valgrind/vgpreload_memcheck-${VALGRINDARCH}-linux.so"
+
 RDEPENDS_${PN} += "perl"
 
 # valgrind needs debug information for ld.so at runtime in order to
-- 
2.19.2


