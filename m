Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CA0CD13CF
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:16 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.27135.1694943549554770049
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m8OJszSX;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c008d8fd07so1728701fa.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943548; x=1695548348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxQ3tC6f5gQVb8C4PT6rPYtWl7oJTqQfb+qCIMEfPVA=;
        b=m8OJszSXw//MdmdcDXmEyadtvl1dXeLwsGog5cttziuoNRBfnuwukyP9IAJwClcuOK
         OBfa7ECiCVxmcS1pn9HZXQuuv1HcL3LlULIqg30/L1fvX82Qtw0UmoQ5SsZisrj6ozNB
         ikLQjBQ1mHyitPXSFzfl1kjy/+AB4bzkGq+yWwAHW3HjFPKUyMl6l5XbWlmlOqJ90xAk
         9a5wZhSc/iwaQMJwHjYkyMK3bi9ht1BQYZaWyk6uXlriCmTim/tfSJ8+iA0qs8f/3Evv
         VCcGMFGvF+4vCFfqK+pAJFKIN7nJfYs+mAoAhza9JgtAQvIEZXkKSciRdMlEtD2pEpvO
         1SHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943548; x=1695548348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxQ3tC6f5gQVb8C4PT6rPYtWl7oJTqQfb+qCIMEfPVA=;
        b=d2kumWUpa+j6wpw8X2UV4IWBwdj06T8RHBeGqZabJ0Bf+tcOWX/HHLvwzAvFelgzvO
         6mM4YFREQu8KF5D0Cs6txW/qXsZmS7dnqonNFXWjyCRqJQ8caVvmsKKoDcEE2uz3pef4
         9UClCbbCXdBaUEWDRZ19u3T9CYOmUkgaVoDTlHaAoWlKJPf3AEEm/8VOLBO3d1zwuZVk
         5FACQxCcuJytxNlQFV+KrVm0UQttHc+Igd/coX0qqwQIYKnIhSZVaKru23Gt9W/bmz6W
         i+6P/lTcXviCyExd/zC0kYDz4mA7K2D4IcTXB/sZREySnwMOG3ZPmKUk+fLHrBQ/oQrB
         pA+w==
X-Gm-Message-State: AOJu0YwUBFzggibT0X31mUjJtm5u/WKulXRoT+ZhZ1XKuRYW1vi7plja
	eL0WzWHJY74+bOtHs03wu29SeYPCUUg=
X-Google-Smtp-Source: AGHT+IE/2S39MbNsfxw7WfNSR1OdiCz1OoKfb307s5+UC12hJkAg0gix4pZjxc96ypu/7//HqC1WOg==
X-Received: by 2002:a2e:87c9:0:b0:2bf:c5c7:757d with SMTP id v9-20020a2e87c9000000b002bfc5c7757dmr5556208ljj.4.1694943547667;
        Sun, 17 Sep 2023 02:39:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/29] curl: build and run the full set of ptests
Date: Sun, 17 Sep 2023 11:38:36 +0200
Message-Id: <20230917093901.428214-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187777

Not running make in the top level tests/ directory
excluded about a third of them (those that consisted
of running small test binaries).

Also, run tests in parallel, which reduces total time
from five minutes to about 75 seconds.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/curl/curl/run-ptest | 2 +-
 meta/recipes-support/curl/curl_8.2.1.bb  | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-support/curl/curl/run-ptest
index 2c74c58f5da..95af2bd7b34 100644
--- a/meta/recipes-support/curl/curl/run-ptest
+++ b/meta/recipes-support/curl/curl/run-ptest
@@ -1,6 +1,6 @@
 #!/bin/sh
 cd tests
-{ ./runtests.pl -a -n -s || echo "FAIL: curl" ; } | sed \
+{ ./runtests.pl -a -n -s -j4 || echo "FAIL: curl" ; } | sed \
      -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
      -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|' \
      -e 's/Warning: test[0-9]\+ not present in tests\/data\/Makefile.inc//'
diff --git a/meta/recipes-support/curl/curl_8.2.1.bb b/meta/recipes-support/curl/curl_8.2.1.bb
index 068486a3521..b86c6f3bbae 100644
--- a/meta/recipes-support/curl/curl_8.2.1.bb
+++ b/meta/recipes-support/curl/curl_8.2.1.bb
@@ -85,14 +85,18 @@ do_install:append:class-target() {
 }
 
 do_compile_ptest() {
-	oe_runmake test
-	oe_runmake -C ${B}/tests/server
+	oe_runmake -C ${B}/tests
 }
 
 do_install_ptest() {
 	cat  ${WORKDIR}/disable-tests >> ${S}/tests/data/DISABLED
 	rm -f ${B}/tests/configurehelp.pm
 	cp -rf ${B}/tests ${D}${PTEST_PATH}
+        rm -f ${D}${PTEST_PATH}/tests/libtest/.libs/libhostname.la
+        rm -f ${D}${PTEST_PATH}/tests/libtest/libhostname.la
+        mv ${D}${PTEST_PATH}/tests/libtest/.libs/* ${D}${PTEST_PATH}/tests/libtest/
+        mv ${D}${PTEST_PATH}/tests/libtest/libhostname.so ${D}${PTEST_PATH}/tests/libtest/.libs/
+        mv ${D}${PTEST_PATH}/tests/http/clients/.libs/* ${D}${PTEST_PATH}/tests/http/clients/
 	cp -rf ${S}/tests ${D}${PTEST_PATH}
 	find ${D}${PTEST_PATH}/ -type f -name Makefile.am -o -name Makefile.in -o -name Makefile -delete
 	install -d ${D}${PTEST_PATH}/src
-- 
2.30.2


