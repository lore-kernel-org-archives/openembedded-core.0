Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1B34560069
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 15:48:15 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 15so1947282wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 08:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=afcdcqkfKWR4AAbiEK+8UGx6rxK/7wrUO4K62I2ipF4=;
	b=BJhXSnNyVWJyqXZ4ujaHIhYsD5squghxRJjKrs1lK76cKw/LuGRZeQO9nvG79X4vcO
	AF3SdhZ7hsMsnaKLZM0yft0fzYqXWZIhBVdIv3/hmWuC3VvTBdYzFiOTtyb12GOwCqnY
	ZaQGNPw575LgU48+ww1CGSbWuxZJaeQTAuyns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=afcdcqkfKWR4AAbiEK+8UGx6rxK/7wrUO4K62I2ipF4=;
	b=J+iUKJeRoQJgCw0+PlWdZJfXMNcGD4OsBF7xl/owj1mDPMCQLx+fEToTvx1gpu2Mqd
	SWL7rCn8/wWC7QANA7MIh/bTmMyzupoY/hsCjvWbwQ9jfwy/8ulhj3ii2HUYkmEn3Cxw
	np5EeIqPjSBUSLzuvByXN2tE5+dBwoQlpOe8wVI855WI6q7m8/AuIMETDbDtqjOzodX1
	rlPJMHNah9dk0WC0+erZrsu/WJxt1+gfH30PLqzKvfsR+gG9boyIPZ42E69bLcaSZn4R
	rvDmQ7wbY4JfJDjCVzju/8Oh36WLGlgI7m95yYISHJZ56D4SM3wUdHYfNVkO/mwC8Ap3
	pbPA==
X-Gm-Message-State: APjAAAUmEFZMsAc1thDvOk302rysYeSlUTgCLvDlneWAjaVpOiJ89+ob
	ILLBz7J7i+/KFb6D9IJ8V83PMEWcFUk=
X-Google-Smtp-Source: APXvYqw9CZJ6WCjkP2Lpdfo89l4envA9Aj50sKA+iDwPI+FkoPCiTktYaQkLMiMjOAiDIkCXwk+15Q==
X-Received: by 2002:a05:600c:489:: with SMTP id
	d9mr6895229wme.173.1559144896426; 
	Wed, 29 May 2019 08:48:16 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i9sm5593322wmf.43.2019.05.29.08.48.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 08:48:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 16:48:11 +0100
Message-Id: <20190529154814.2996-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/4] strace: Tweak ptest disk space management
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
X-List-Received-Date: Wed, 29 May 2019 15:48:16 -0000
Content-Transfer-Encoding: 8bit

If the test is successful, remove the log and exp files. This stops strace
using around 600MB of disk space and running our ptest images out of space.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../strace/strace/ptest-spacesave.patch       | 19 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.26.bb   |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/ptest-spacesave.patch

diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
new file mode 100644
index 00000000000..3e32cc388ca
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
index 24f92c99e58..3b61fc3eef1 100644
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
2.20.1


