Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 815EB7E3C0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:24 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id c5so7091204pll.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9uR3r+A+LOTR/0b80NXzJsU8OYuJ3QLokGQmvJtzMko=;
	b=G3ugYzhSbhbTnewcSUvA/KpmI/KP8L69koqbg4Fm3We+LvL1z3+xb0Vq8c1ZZCBGK/
	0z/J2a8SolYy3Lz9nE8PPTj5Fx0sdB5nQ406sTna7Qla0xSiftpw3UaqlgmuU5Qa+/KK
	Z3caiOT8ikBHkn4WVy1RtXorUGYnM6N5ilsMY0tMwRpCwr/M5H3OD5upr4vLfEEJFFSO
	t1sh1lWFgXb91CSlWAzZ15Ls/J1qfNNc/eBKRMfIhoHhXQql56DR33i79cSy4xr8xBql
	ueqSs8dbrHKbcUC8hxWxKeDefDNKS7/HSnDoVNZyge50zbi190q+d16yR0NTQ1fzLIEG
	TY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9uR3r+A+LOTR/0b80NXzJsU8OYuJ3QLokGQmvJtzMko=;
	b=ZszAQsk9p/vJxJDWHi/+eO5SPee1j1gkHSO5rr1AnCmnBx1ZCbUmJfn4JKeveoJwTe
	kvPpajH7uz4eCsmc9OmNzT+JMi/iXI60Osg2bzZYVRofQ5pqUk/qrKJBnBIBBsY6+e6r
	CSf6oUzu2egc1N/mM6JMfwtaHOA+wV/6j8n1B71og9A3YazJuU/PFJr+BD0hp3jaoJJx
	TIwzZkiKIJxAPSHchulFJfr//I0RgJIVWEGbBLI1JwbvfoQW8KKl0kCkFHSvqqz+D/2R
	CwgtHaEh55zO1r7RhTsI9Ei4obGPs06QtJN6OLnZRjvdcIeZr60L4asUH4kymjsG7bVJ
	y/7g==
X-Gm-Message-State: APjAAAV6LuHNfR4pp+60Z1kf5Bvjqa7dm5FtwzATOzP0vUy/fUx+OFZn
	ZhwXL1h2yMhYndTNkH2p9xsaz1uM
X-Google-Smtp-Source: APXvYqzUja/fX1xwiXsoFnIBUMbC6f52YnxvAQ/F7ZoXjRQMbDYP82b9b25+P5pkIIzTCFdeaPGpsw==
X-Received: by 2002:a17:902:8c83:: with SMTP id
	t3mr5066734plo.93.1559574445489; 
	Mon, 03 Jun 2019 08:07:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:07:03 -0700
Message-Id: <4b1e917ed4e9921d9f165722c6cd33c9b1c08e20.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 20/21] strace: Tweak ptest disk space management
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:24 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If the test is successful, remove the log and exp files. This stops strace
using around 600MB of disk space and running our ptest images out of space.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../strace/strace/ptest-spacesave.patch               | 19 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.26.bb           |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/ptest-spacesave.patch

diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
new file mode 100644
index 0000000..3e32cc3
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -0,0 +1,19 @@
+If the test is successful, remove the log and exp files. This stops strace
+using around 600MB of disk space and running our ptest images out of space.
+
+RP 2019/5/29
+
+Upstream-Status: Inappropriate [specific to OE image space issues]
+
+Index: strace-4.26/tests/gen_tests.sh
+===================================================================
+--- strace-4.26.orig/tests/gen_tests.sh
++++ strace-4.26/tests/gen_tests.sh
+@@ -62,6 +62,7 @@ while read -r name arg0 args; do {
+ 		$hdr
+ 		. "\${srcdir=.}/init.sh"
+ 		run_strace_match_diff $arg0 $args
++		rm -rf log exp
+ 		EOF
+ 		;;
+ 
diff --git a/meta/recipes-devtools/strace/strace_4.26.bb b/meta/recipes-devtools/strace/strace_4.26.bb
index 24f92c9..3b61fc3 100644
--- a/meta/recipes-devtools/strace/strace_4.26.bb
+++ b/meta/recipes-devtools/strace/strace_4.26.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
            file://0001-mips-o32-fix-build.patch \
+           file://ptest-spacesave.patch \
            "
 SRC_URI[md5sum] = "daa51acc0c7c696221ec03cf0b30a7af"
 SRC_URI[sha256sum] = "7c4d2ffeef4f7d1cdc71062ca78d1130eb52f947c2fca82f59f6a1183bfa1e1c"
-- 
2.7.4


