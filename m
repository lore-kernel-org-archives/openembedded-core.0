Return-Path: <r.czerwinski@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34973EB64DC
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 13:37:36 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.13172.1689860246395586359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 06:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: rcz@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rcz@pengutronix.de>)
	id 1qMTqO-0001AC-01; Thu, 20 Jul 2023 15:37:24 +0200
Received: from [2a0a:edc0:0:1101:1d::54] (helo=dude05.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <rcz@pengutronix.de>)
	id 1qMTqM-000qff-NZ; Thu, 20 Jul 2023 15:37:22 +0200
Received: from rcz by dude05.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rcz@pengutronix.de>)
	id 1qMTqM-005JQ4-1F;
	Thu, 20 Jul 2023 15:37:22 +0200
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Rouven Czerwinski <rcz@pengutronix.de>
Subject: [meta][kirkstone][PATCH] json-c: disable -Werror for x86-64
Date: Thu, 20 Jul 2023 15:36:56 +0200
Message-Id: <20230720133655.1266273-1-r.czerwinski@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rcz@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 13:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184639

From: Rouven Czerwinski <rcz@pengutronix.de>

Disable -Werror using OECMAKE_C_FLAGS on x86-64. This ensures that json-c can
build on newer distributions where the host compiler is new enough to treat
implicit fallthrough warnings as errors:
  | NOTE: VERBOSE=1 cmake --build /…/work/x86_64-linux/json-c-native/0.15-r0/build --target all --
  | [1/34] /…/work/x86_64-linux/json-c-native/0.15-r0/recipe-sysroot-native/usr/bin/ice/gcc -D_GNU_SOURCE -Djson_c_EXPORTS -I/…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15 -I/…/work/x86_64-linux/json-c-native/0.15-r0/build -isystem/…/work/x86_64-linux/j
  son-c-native/0.15-r0/recipe-sysroot-native/usr/include -O2 -pipe -ffunction-sections -fdata-sections -Werror -Wall -Wcast-qual -Wno-error=deprecated-declarations -Wextra -Wwrite-strings -Wno-unused-parameter -Wstrict-prototypes -g -fPIC -D_REENTRANT -MD -MT CMakeFiles/json-c.dir/linkhash.c.o -MF CMakeFiles/json-c.dir/linkhash.c.o.d -o CMakeFiles/json-c.dir/linkhash.c.o -c /…/work/x86_64-linux/json-c-native/0.15-r0/json-c
  -0.15/linkhash.c
  | FAILED: CMakeFiles/json-c.dir/linkhash.c.o
  | /…/work/x86_64-linux/json-c-native/0.15-r0/recipe-sysroot-native/usr/bin/ice/gcc -D_GNU_SOURCE -Djson_c_EXPORTS -I/…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15 -I/…/work/x86_64-linux/json-c-native/0.15-r0/build -isystem/…/work/x86_64-linux/json-c-n
  ative/0.15-r0/recipe-sysroot-native/usr/include -O2 -pipe -ffunction-sections -fdata-sections -Werror -Wall -Wcast-qual -Wno-error=deprecated-declarations -Wextra -Wwrite-strings -Wno-unused-parameter -Wstrict-prototypes -g -fPIC -D_REENTRANT -MD -MT CMakeFiles/json-c.dir/linkhash.c.o -MF CMakeFiles/json-c.dir/linkhash.c.o.d -o CMakeFiles/json-c.dir/linkhash.c.o -c /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/l
  inkhash.c
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c: In function 'hashlittle':
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:367:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:368:3: note: here
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:372:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:373:3: note: here
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:376:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:377:3: note: here
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:380:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:381:3: note: here
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:383:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:384:3: note: here
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:420:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:421:3: note: here
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:421:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:422:3: note: here
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:422:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:423:3: note: here
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:423:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:424:3: note: here
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:424:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:425:3: note: here
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:425:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:426:3: note: here
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:426:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:427:3: note: here
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:427:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:428:3: note: here
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:428:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:429:3: note: here
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:429:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:430:3: note: here
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:430:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  | /…/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkhash.c:431:3: note: here
  | cc1: all warnings being treated as errors

Passing -Wno-error x86-64 is the minimal invasive fix for older kirkstone
releases.

Signed-off-by: Rouven Czerwinski <rcz@pengutronix.de>
---
 meta/recipes-devtools/json-c/json-c_0.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/json-c/json-c_0.15.bb b/meta/recipes-devtools/json-c/json-c_0.15.bb
index 7cbed55b3b..749eb078f8 100644
--- a/meta/recipes-devtools/json-c/json-c_0.15.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.15.bb
@@ -18,6 +18,8 @@ RPROVIDES:${PN} = "libjson"
 
 inherit cmake ptest
 
+OECMAKE_C_FLAGS:append:x86-64 = " -Wno-error"
+
 do_install_ptest() {
     install -d ${D}/${PTEST_PATH}/tests
     install ${B}/tests/test* ${D}/${PTEST_PATH}/tests
-- 
2.39.2


