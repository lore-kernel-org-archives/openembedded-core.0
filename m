Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B92DA7E4F1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 21:28:12 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z23so3148856wma.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 14:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BJ+Hg/aQ16q7DIpb0I9gq3O+eoA5hdyhVKH9XlPWKHM=;
	b=Ki8QWZBIA98DpEgIcQ5Vugcwuw5yeykzq99UZU3BuRVOx8X2Eu042FcW1MPPoYrROe
	YzaD4iLwv9zzlrMo+8vIwQvcUoxe5/MFj+vSXMmPyGhzSEogoCD7F8auqXR4a89d+U+G
	ki9sNoIHb8IKI5iXrfA3pRgLKZ7G5mjY2n6Ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BJ+Hg/aQ16q7DIpb0I9gq3O+eoA5hdyhVKH9XlPWKHM=;
	b=n7O+WcK0souKkE+8ZGNiKcX4SYUmqTSVSrsDS4E1z4xtX4JAqiQs8Hl288EvrRg/mb
	7FN2qD4qZA8vNHlkxUG83OKgbAbF3NVwkHt3wjj4pUF7yLeX24zmmFtlGkXyBSVs60jO
	QKMMYkblRaEWxqDUaFVmF3SXrvvfMLemD2FjjJrGypmnkPW8cTMgsoq2BySjKq840A3i
	QQvN6iDJfPjb3MvzLfDiE4dzY/M67ZdGGAuzGof83LAU7DdHUXgr96R3VMXpt6xtSS4Z
	avLsqcrTwDMUYdk1s31IMTI6hEjg1g44bUW3wgR6GnVM5TlNuzeh1yx1HUoCfi8cIPBU
	SVKw==
X-Gm-Message-State: APjAAAU4IuAX35ZcOHlVtv5tQL9QuYx9qwqhrj/rZFmtlOgo75ZLeK4B
	nzBTwgekHqzKQNqLHRJdHlOiH3x+5Cc=
X-Google-Smtp-Source: APXvYqzVQvD+FkHsFjfMK+1qq7KV/+bnLphO2ky96hRgdyFmlnkJr8uoDp6QpBYTyKvSq+ECFMagsw==
X-Received: by 2002:a1c:99c9:: with SMTP id b192mr5365394wme.142.1559942893190;
	Fri, 07 Jun 2019 14:28:13 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f10sm4214949wrg.24.2019.06.07.14.28.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 07 Jun 2019 14:28:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 22:28:10 +0100
Message-Id: <20190607212811.19372-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] gawk: ptest fixes
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
X-List-Received-Date: Fri, 07 Jun 2019 21:28:13 -0000
Content-Transfer-Encoding: 8bit

In minimal images all tests pass due to a missing dependency on make.
Add the missing dependecy.

The test list created by the run-ptest script is incorrect as it includes
entries like "fi". Simplify it and correct it.

Some tests are skipped due to mpfr not being enabled. Correctly mark these
as SKIP.

Some tests need the "../gawk" script, create a link to it so the tests
work correctly.

Also print more information in the failed test cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/gawk/gawk/run-ptest | 24 +++++++++++++++++------
 meta/recipes-extended/gawk/gawk_5.0.0.bb  |  3 +++
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk/run-ptest b/meta/recipes-extended/gawk/gawk/run-ptest
index d23f0bf6d77..f67a95874f4 100644
--- a/meta/recipes-extended/gawk/gawk/run-ptest
+++ b/meta/recipes-extended/gawk/gawk/run-ptest
@@ -1,10 +1,22 @@
 #!/bin/sh
 
 cd test
-for i in `grep -vE "@|^$|#|Gt-dummy" Maketests |awk -F: '{print $1}'`; \
-  do LC_ALL=${GAWKLOCALE:-C} LANG=${GAWKLOCALE:-C} srcdir=`pwd` AWK=gawk CMP=cmp \
-  make -f Maketests $i >$i.tmp 2>&1; \
-  grep -q "Error" $i.tmp; \
-  if [ $? -eq 0 ]; then echo "FAIL: $i"; \
-  else echo "PASS: $i"; rm -f $i.tmp; fi; \
+for i in `grep -E "^[a-z0-9_-]*:$" Maketests |awk -F: '{print $1}'`; do
+  #LC_ALL=${GAWKLOCALE:-C} LANG=${GAWKLOCALE:-C} 
+  srcdir=`pwd` AWKPROG=gawk AWK=gawk CMP=cmp make -f Maketests $i >$i.tmp 2>&1
+  if [ -e _$i ]; then
+    cat _$i
+    grep -q "support not compiled in" _$i
+    if [ $? -eq 0 ]; then
+      echo "SKIP: $i"
+      continue
+    fi
+  fi
+  grep -q "Error" $i.tmp
+  if [ $? -eq 0 ]; then
+    echo "FAIL: $i"
+  else
+    echo "PASS: $i"
+    rm -f $i.tmp
+  fi
 done
diff --git a/meta/recipes-extended/gawk/gawk_5.0.0.bb b/meta/recipes-extended/gawk/gawk_5.0.0.bb
index b1e1b212a3a..578901355ce 100644
--- a/meta/recipes-extended/gawk/gawk_5.0.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.0.0.bb
@@ -40,6 +40,7 @@ inherit ptest
 
 do_install_ptest() {
 	mkdir ${D}${PTEST_PATH}/test
+	ln -s ${bindir}/gawk ${D}${PTEST_PATH}/gawk
 	for i in `grep -vE "@|^$|#|Gt-dummy" ${S}/test/Maketests |awk -F: '{print $1}'` Maketests inclib.awk; \
 	  do cp ${S}/test/$i* ${D}${PTEST_PATH}/test; \
 	done
@@ -47,4 +48,6 @@ do_install_ptest() {
 	    -e 's|#!${base_bindir}/awk|#!${bindir}/awk|g' ${D}${PTEST_PATH}/test/*.awk
 }
 
+RDEPENDS_${PN}-ptest += "make"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


