Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070CDC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 21:26:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.3660.1708032361548028871
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 13:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZLN1VKJ3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-411d231ea71so10596155e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 13:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708032360; x=1708637160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PSaW9nlGNDAcy4xfMYqVP2IvgvERT7mXu+ZspqZcArw=;
        b=ZLN1VKJ3iujKFIlwbq0QES4J1tlH9V4RhPA+bg0wQBeEFJY2ji72l2fb5r+Db/fi1S
         rDi2M6JEol6SKLlC+B2VSOc/ptHSaEdibUkmJ6/4SB7D9UNrQHi08CfmUGZPkc61rla4
         dwX2DnAcCFHb5BJAvEu17IA3Ksou7GfAqnNvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708032360; x=1708637160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSaW9nlGNDAcy4xfMYqVP2IvgvERT7mXu+ZspqZcArw=;
        b=iIV0uFHcQgtJRHFiGp9gNnzw53wbg3qJcUtQ3zJ6TMDarti4GtWjcHsobzuzZ8UY1J
         NZpFUnwjzdwe+alnRl3oYJiFODTsr7yjHNk+18M5w6PcckBDw5waOgJbrsymFBv3fBVL
         DaoaqWaTTv6F/Tvr1TpqExR+4Vuwq0UGRTIJgwGWRxiig38QRIpDLaAdfTcFkhDeZ0Kh
         dJpWdPLUO+F6T6Vx58KtBkVvwUT/Df72omccfPyh0sHJsu7XGJcqgGnmnClz+F66Y83r
         Ns0dr6YzH15Kk21YCshcm7Y7s0u7Whgiod+wBm1B3UIT5ZYV8B5O6S1NhOqG/hRS+/+H
         k4Hw==
X-Gm-Message-State: AOJu0YyndLaQT5Kw4aOZiDMC0xFVtXY3b5kdyUuIAoQmVu/hvrEMoH7F
	2z0RqnwFd5Hk+IRExnrLYXhjVyVihrfaPUFNiHzkf2cdnxJ3b4bDCc+i5q3PCd26HmvSkPaYaDt
	R
X-Google-Smtp-Source: AGHT+IGZfLZ7sQbeuzYLy+0KMZ41aPBzWsI9aI8rWdrOaxCFWYaIPrrblZ0AxGNCCQeaqFEtnUQL2A==
X-Received: by 2002:a05:600c:358d:b0:410:5897:1d85 with SMTP id p13-20020a05600c358d00b0041058971d85mr2414096wmq.14.1708032359712;
        Thu, 15 Feb 2024 13:25:59 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fd13:6695:6348:c567])
        by smtp.gmail.com with ESMTPSA id u19-20020a7bc053000000b00411e75eb83fsm301956wmc.18.2024.02.15.13.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 13:25:59 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2] openssh: Add a work around for ICE on mips/mips64
Date: Thu, 15 Feb 2024 21:25:58 +0000
Message-Id: <20240215212558.45933-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 21:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195703

Unfortunately the new openssh version has an ICE on mips. This looks similar to:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104817
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104820

Given how long these have been open, workaround the issue by disabling the compiler
hardening options on mips.

It is likely better to do this than have the open CVEs for everyone
as we can't upgrade.

An example:

| during RTL pass: zero_call_used_regs
| clientloop.c: In function 'client_loop':
| clientloop.c:1699:1: internal compiler error: in int_mode_for_mode, at stor-layout.cc:407
|  1699 | }
|       | ^
| 0x14d0acc internal_error(char const*, ...)
| 	???:0
| 0x5cf765 fancy_abort(char const*, int, char const*)
| 	???:0
| 0x826f1f emit_move_insn_1(rtx_def*, rtx_def*)
| 	???:0
| 0x8270c5 emit_move_insn(rtx_def*, rtx_def*)
| 	???:0
| 0xb7b994 default_zero_call_used_regs(HARD_REG_SET)
| 	???:0
| Please submit a full bug report, with preprocessed source (by using -freport-bug).
| Please include the complete backtrace with any bug report.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 6366cefdf96..fcd96f707f8 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -81,6 +81,9 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
 # musl doesn't implement wtmp/utmp and logwtmp
 EXTRA_OECONF:append:libc-musl = " --disable-wtmp --disable-lastlog"
 
+# Work around ICE on mips starting in 9.6p1
+EXTRA_OECONF:append:mips = " --without-hardening"
+
 # Since we do not depend on libbsd, we do not want configure to use it
 # just because it finds libutil.h.  But, specifying --disable-libutil
 # causes compile errors, so...
-- 
2.40.1


