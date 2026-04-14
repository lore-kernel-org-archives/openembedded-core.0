Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC29ED7BBE
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 11:03:31 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16181.1776164606589420265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 04:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=csO4UTHM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b8efed61so53327815e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 04:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776164604; x=1776769404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4aGmsXsN9HqpN1ZByM9Oxob4nIW2C1qKQHCFV4IawM=;
        b=csO4UTHMsjtpvmQP7iEki1fw7PtSPftVN9m0okezUydYO8Q5UPnMxmrx67b1wfQI4y
         K6Iwc4lQCgih1v90azZvx5j52o6TDBJQUaFTjiBQr+quqlMNiNRIi6NTMAKYZ4xz8+Dm
         XoJ9UWSsPOF5Pl0ueTqXjOnxO6CVMTonHGdDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776164604; x=1776769404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4aGmsXsN9HqpN1ZByM9Oxob4nIW2C1qKQHCFV4IawM=;
        b=Re59pi6uyaLx6CHhsG8F3f1u6pRWXunrcNPzgFBx6cA64ByedEn05XWBBlaySGIDN2
         mUkLgXn2QLYitIcOIMk/nKVxQUZZeWaRjx+uya/DTdsQhfbjnem/zSyeohznzn7pmxJK
         7Yd0L7Xvjkm+82RX3pZ9kdXybyeHUTmgZWalJOPpRM+t2lVh5ZE+hLGfqZ8eZChsZf6A
         xZSkpSL+Iu2UouPmM489CQBEtvel9m4z/cPlBz6x5QQTC+fpFBG5Lb/BOxZ4U3FhWkBC
         mwosYqmtX/kVbCDIJvH1m0mzn1Tv/PaHBk9rjLnuKHDKagX7MhHdOFXBtD6HTt9vSGjx
         oPcQ==
X-Gm-Message-State: AOJu0YzVpWnR+ZOKFdKea/kxvyqGIQVTOg2bFSShtmH7duJNc5V6VAud
	BENSdsStb3ZAORivkRadkRQ78yKrcd8DsklmkFC0I59GiaCQ7W9eMmhsk1TBxi9EvGNf291uwIK
	XBQgnqkk=
X-Gm-Gg: AeBDietKU1BVsA6pdAu5jg89kbzpsnw52HBcSgYS+QDGkRp1O1iZFq6y3c6P5Qikc3r
	1SOxNn/0duFt1DUYF/rjHzjgaupMUy0dGu2MTGGc9OLWyNhNWQy+52WL38BUWKhmMtuT5VGeLcC
	mATXC+cZ1hV3mOwD2FlCr1AaZ/5WjSpkbaqwBnzs7jsaE5O+KdJaEQDnNsBrFN1YBRhLVpbw8Uw
	xuIgsO2hsDXQQgiPMgRexTIzvaZNe74GM+QaOe6FH/sgun5U1PGAlG+yjTlsqQQixZ0qkcD/eCr
	abV3FgvRSqAOPW0vDTWlbbqjoaJzWfYi3m2v+7+mzNeoh3Qp7ZD02cTj/LBgECy7/adxjcyd8Qi
	MWrsbxum7ZAPxJ/7mQlErb0swBtIaaYjnnyT5F9IEKiRYybkCXRy3uubJ5OoRhr9V5iuWtV0EOZ
	iFxMXSgUyj9ywc3OaLdOR+B1MgM77cg+3uO3VW/FAqoKBe+CQew2C1
X-Received: by 2002:a05:600d:8496:10b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-488db8d16aamr119230555e9.10.1776164604382;
        Tue, 14 Apr 2026 04:03:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3d85:f6e4:d741:ede1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d684406bsm113934885e9.24.2026.04.14.04.03.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:03:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] strace: Fix reproducibility issue
Date: Tue, 14 Apr 2026 12:03:20 +0100
Message-ID: <20260414110320.858716-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 11:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235154

With the updated ax_prog_cc_for_build.m4 CC_FOR_BUILD can include a
" -std=gnu23" option on some hosts. We don't need this on target and
it leads to a reproducibility issue, so remove it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/strace/strace_6.19.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/strace/strace_6.19.bb b/meta/recipes-devtools/strace/strace_6.19.bb
index 9dcf9d14d53..f44e9ed6f92 100644
--- a/meta/recipes-devtools/strace/strace_6.19.bb
+++ b/meta/recipes-devtools/strace/strace_6.19.bb
@@ -51,6 +51,7 @@ do_install_ptest() {
 	install -m 644 ${B}/src/config.h ${D}${PTEST_PATH}/src/
 	sed -e 's/^srcdir = .*/srcdir = ..\/..\/ptest\/tests/' \
 	    -e "/^TEST_LOG_DRIVER =/s|(top_srcdir)|(top_builddir)|" \
+	    -e '/^CC_FOR_BUILD/s/\s-std=gnu23//g' \
 	    -i ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
 

