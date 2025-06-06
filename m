Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B15C61CE8
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 20:58:36 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.5463.1749243513018054745
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 13:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lcEn/kxz;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441ab63a415so25482225e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 13:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749243511; x=1749848311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGUtRVgK01lWp+cK69bvyOfQLszffiiiYwEGnPFfTe8=;
        b=lcEn/kxzkKqCudCQwH/jN1uh7Z3ljvKYKCb7Q4qCIKgwUn7XWWJ31BLykSvXfBBSG1
         1EZP2o+m7BgYrJUyEl293jlDgHzNoIfOupmYoBv4RblWVJK1Eg9MdBjPOTRTz3rSPyry
         JVn3coF3CucTSizusVnRwZJE8LtwkffxMzqSjhFEwKkT9EX64TWvivT+BtfP7EF6EApA
         XexscVuTv0JeXI4Yde9ZRD8lsEqJKVXo2I3tVD0ZPRZlo2vWI71A5zkeFaqyugypFufq
         7Aa9WJTFGYqu1KOMzOEA5uh21goLI+O0RETicQMebMUd4tX1HUBKWIZgppTKvejcEsWF
         puCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749243511; x=1749848311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGUtRVgK01lWp+cK69bvyOfQLszffiiiYwEGnPFfTe8=;
        b=D/e8+4pIeogvzlKLSgn1lKhXHV1q2YNqq9oIkR5mHB2GGXcO8XmaEt1SiZv39o4y97
         WX06f0tYSyW1Z0v6oqTNMcNt2Bqx7ghzuiYqKGaycrK5ZCdFNODFeldgk0U7s+UDZva8
         K2rfJstDgscpNzLAvnb7P6uDmfnMYOo3/h8l//BKxeowvoy0g9hryLm9YBvCWI9WNnfH
         KXgW0I+sr9ozLZBhEqQEF4oRgS8EuGP8Z8ab9tguIinDSPu/YkDOvPEEFdmNcen+jHkN
         YwzG2iRVt5kB1H5PxYe34tWULQt7uBCD+b4dJGJgUJICveJz3Jy1PsbOU7j5/mJGzLf/
         Kdng==
X-Gm-Message-State: AOJu0Yz3YQZyzmg3O9/fcfrxGkOwRtEHGGKBh5yK+VI7iOEsmmOV4Jwn
	oB5RIFYXKblL/a5+nV0OFc43kUTk0CZb1r/Z4ZFINgz3P/4oOyXzfS3inMJjIA==
X-Gm-Gg: ASbGncumi/mcU0nl8jwR5XBJeBPHx99JN51XiKsVSHSW7uI9oT0RADuOLVDAEGe/iCX
	fRRAJEEcmTELWR+6hQbv7GvPfxLpUBimR3xlXpxneBsOkEeo4GDWkvzIabJ4IxWtlknOJI60wbl
	SWsOfTQ5KdZ/V3KGBDDsSaO+A7ZafMSlwx7DDI8pQFXyo8+C9DbLtwo/c+GpvZ8iWGzerw6voPV
	RU8kOdZX1kI1XMVCiri3PwF614LUUj1OlCljhpJsXEBrrE89kdeqyjPLHA246UmA2WwqtXgmgLG
	WkK75r9nsyRSR7LiXSvUPVX/rA6AlL6BN9Y8ThjcuCWF8/+r8HX+/grjqRXTEMMtD3xaF9+WcEX
	+gNhXQGfGOEYL0DBr/kKHx6Y=
X-Google-Smtp-Source: AGHT+IEhB2l2+ZCC1+igVuNNHlw26bxvJ/iLBHFo/26E/4Bh0qBEIcKC500VHDgxUfnFvel0SCVOVg==
X-Received: by 2002:a05:600c:8b02:b0:43d:745a:5a50 with SMTP id 5b1f17b1804b1-452013b08a9mr46748075e9.19.1749243511277;
        Fri, 06 Jun 2025 13:58:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f4e7sm2850859f8f.77.2025.06.06.13.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 13:58:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/5] m4: simplify path substitutions in ptest
Date: Fri,  6 Jun 2025 22:58:09 +0200
Message-Id: <20250606205809.4071299-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250606205809.4071299-1-alex.kanavin@gmail.com>
References: <20250606205809.4071299-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 20:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218185

From: Alexander Kanavin <alex@linutronix.de>

There's no need to setup a fake 'source directory' and
redirect the tests to it; rather it's possible to point
them directly to ptest directory (this needs to be done
twice, in Makefile substitutions, and as a C define during
ptest compilation).

This also eliminates the assumption that S and B are in the
same directory (no longer true when S is in UNPACKDIR).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/m4/m4-1.4.20.inc | 5 +----
 meta/recipes-devtools/m4/m4/run-ptest  | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/m4/m4-1.4.20.inc b/meta/recipes-devtools/m4/m4-1.4.20.inc
index a31335f173e..aad57b8b649 100644
--- a/meta/recipes-devtools/m4/m4-1.4.20.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.20.inc
@@ -27,7 +27,7 @@ EXTRA_OEMAKE += "'infodir=${infodir}'"
 do_compile_ptest() {
 	cd ${B}/tests
 	sed -i '/^buildtest-TESTS: /c buildtest-TESTS: $(TESTS) $(check_LIBRARIES) $(check_PROGRAMS)' Makefile
-	oe_runmake buildtest-TESTS
+	oe_runmake CPPFLAGS="-DSRCDIR=\\\"${PTEST_PATH}/tests/\\\"" buildtest-TESTS
 }
 
 do_install_ptest() {
@@ -39,9 +39,6 @@ do_install_ptest() {
                 chmod 0755 ${D}${PTEST_PATH}/tests/test-spawn-pipe-main \
                      ${D}${PTEST_PATH}/tests/test-spawn-pipe-child ${D}${PTEST_PATH}/tests/test-version-etc \
                      ${D}${PTEST_PATH}/tests/test-xalloc-die
-
-                ln -sf ptest ${D}${libdir}/${BPN}/${BP}
-                sed -i -e 's/@BP@/${BP}/g' ${D}${PTEST_PATH}/run-ptest
 }
 
 do_install_ptest:append:libc-glibc() {
diff --git a/meta/recipes-devtools/m4/m4/run-ptest b/meta/recipes-devtools/m4/m4/run-ptest
index a91c372e541..da786e26f43 100644
--- a/meta/recipes-devtools/m4/m4/run-ptest
+++ b/meta/recipes-devtools/m4/m4/run-ptest
@@ -2,4 +2,4 @@
 #
 #This script is used to run m4 test suites
 cd tests 
-make -k runtest-TESTS abs_aux_dir=../../@BP@/tests/build-aux abs_top_srcdir=../../@BP@/tests abs_srcdir=../../@BP@/tests top_srcdir=.. srcdir=.
+make -k runtest-TESTS abs_aux_dir=./build-aux abs_top_srcdir=. abs_srcdir=. top_srcdir=.. srcdir=.
-- 
2.39.5


