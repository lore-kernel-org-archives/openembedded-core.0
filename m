Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88929F364C4
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 22:03:05 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.143926.1775772175717408849
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 15:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=prKTHcIJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-48374014a77so18820055e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775772174; x=1776376974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/Ye+f7BthEpP1oFiu0AFeFEWTFcP9JcHcob84EL8Go=;
        b=prKTHcIJG7Va2UbMNizxhay9CUYmTvtvGexHDlzKbMzXnsP5atTH3WV2Ls1tvFz2JA
         N2ICtC6qeAYHXf8Xs+w2mrwAcG1I6kwReVgHPiJLKlKXwPPmHbzwHRTW1FfGUzWIxLU+
         yYu3K9B4CyRrZZ5XycB8mtDZJa+gBQozMivJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775772174; x=1776376974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/Ye+f7BthEpP1oFiu0AFeFEWTFcP9JcHcob84EL8Go=;
        b=gqyo4So7gvXuOD+UxvWX28FqTmY72CpBCDkkH+XMiBpEP/X54qQ+O/JhQeiDczPiWx
         wS9XskKMsDFqxQwGMNAvWC4CSdjo7fMBKR/pUPqOdMiue4OP0A38LhcWiB+b2C7ZIMzB
         zFKAdv2T3OfC+/JZrHJIe+zfoISyPuNR87LYSrxxLNOQCDJhLwV1feyn7Ni1eesQop4b
         tRTUHFayIrr6NWEar1+SxHYIG3OCxT4MMgSIVP7uba7AMrjuB4bnsWyVmaDVdeCvMrBO
         AmuqQ5pVQsbG468k5mDx6M6wo5LFeQ511o8d3jSSdNPo3+yuZkvJFeoIjZeRjNZlt2yc
         XZFQ==
X-Gm-Message-State: AOJu0Yyb/tW6F/LVGtmh1oEKsaXHtZkcYzVHrFGBVaiQ2u9xGf6pgQVR
	nqvjXqMpWFegSNb/1DorWaleQPMQpu9dFqqIH/SCgQmMRLioL0HwJMOzl2IFp5tXcq0EbWWDbJ1
	b/UU7IwAVX9Rg
X-Gm-Gg: AeBDietyViLz/tik82DezDoisDHpLQlx1S+bIhLCfCiSxUar86f4MmovJaxy+PpMLk/
	yZVImu4AqUFGa77g1XtgxYZeWTuAz15zr3Jg3msiTij5lDnq8v4JKVvujQLSmtVx+X2KBr7xvUW
	WTsI2l6TjflsruPT5bIHCvu4cmZtIdVcKJaDuL3M8Oji+akWQlsZ7qMn2VBnaLcZV6izZ6pppv7
	PNfX9DXTcM+zLF78qVj3w8rD+KGIbmi/sN91PmI4opRCa3vPT+PUMD1S8v8XXy8Hw7eAHHbSrCL
	MxbFzQ+yQ5ExnDK0xcWE0mfwNWF4xEoPjgYQ12cNAMb8Vbrk0kVjsIyQ+bLjV+FHRYxBZaqfXeK
	3QovniLQKU6AJW4JdFEkY7cuIU1a4PjilUvpJeagnaFizsgx1CDLVQKfscURIC3JKDckxRgG9Yz
	SYRhytuGeBBu6N24no9GAKGaqoFlYCbb3PW2YTAM6QvsAWgGbLi4n8mTQEG300CLjrN7vkdhBvR
	tXyP43PXWO+5rc24szJgU6l5HU=
X-Received: by 2002:a05:600c:1391:b0:486:fe23:1707 with SMTP id 5b1f17b1804b1-488d687116amr6244195e9.20.1775772173611;
        Thu, 09 Apr 2026 15:02:53 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d592d606sm20730545e9.9.2026.04.09.15.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 15:02:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Ross Burton <ross.burton@arm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] tcl: skip http11 tests
Date: Fri, 10 Apr 2026 00:02:32 +0200
Message-ID: <20260409220232.2424825-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 22:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234952

From: Ross Burton <ross.burton@arm.com>

These tests are either unstable under load, or just unstable.

A ticket has been filed upstream[1] but for now disable them.

[ YOCTO #15467 ]

[1] https://core.tcl-lang.org/tcl/tktview/3764f4e81f1483ab554c6d60f8483887bde28221

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8f1538518fd3a3017189b38437691ce358a2566a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index 87e025fce12..29dd57cde1a 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -5,8 +5,8 @@ export TZ="Europe/London"
 export TCL_LIBRARY=library
 
 # Some tests are overly strict with timings and fail on loaded systems.
-# See bugs #14825 #14882 #15081 #15321.
-SKIPPED_TESTS='async-* cmdMZ-6.6 event-* exit-1.* socket-* socket_inet-*'
+# See bugs #14825 #14882 #15081 #15321 #15467.
+SKIPPED_TESTS='async-* cmdMZ-6.6 event-* exit-1.* socket-* socket_inet-* http11-*'
 
 for i in `ls tests/*.test | awk -F/ '{print $2}'`; do
     ./tcltest tests/all.tcl -file $i -skip "$SKIPPED_TESTS" >$i.log 2>&1

