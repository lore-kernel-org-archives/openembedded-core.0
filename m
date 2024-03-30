Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB21CD1288
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 18:09:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.2624.1711822189972781239
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Mar 2024 11:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C9SOVLZK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4155f5b8c41so255995e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Mar 2024 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1711822188; x=1712426988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7QLQFdRBzvF4SSb1KdRG9nJdtXaKlj0hI8VLxmSrJQ=;
        b=C9SOVLZK3e6r2bf3HhgPG4k/zT1ZNAUCpVB0YYXSYeLbeC47LhyXO+zZSkb05eHBO0
         acDhx6SOipB1Lm5/FagtNItilWgb+DMxp5SyG0cYxj2KM2TJkmVJiElL8XEn/BRFCeho
         UE7LR2Y33gbJIcY8oRk/xm94dleCqL1u+UYi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711822188; x=1712426988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7QLQFdRBzvF4SSb1KdRG9nJdtXaKlj0hI8VLxmSrJQ=;
        b=Lrrfm/RhdFmv1wXBkWPLibQ3oCorFwsNmrwv3KXIWQvJAkhVCDsgd3q+fLqdv7/TlL
         TpXx/w8v2r+XEEg7g+LPqvHVZ3k5g/NFPoZMTCpn6B3pk6tVMYUA4R5jEiNPQfTfWrXf
         hwF0rplDK9PWbsiywxs9tA1KtnCSeO53XwMZdYvKDWXK4ZmnT8eGa/TQXr9XAvZt4RgU
         eeUayQ0VYn2mB4M0xdCLbw3PRkE0RbdeCWUZEH2yXgP2P4XzMQ3rSTsg3mOyS6UjzvG4
         oGDN1IkCUQUWtjmBMbW5JJlnJwn7dKWCsjm7/og5qAiQ2aTtnnxAcgTprAWHI8iraMKo
         GPKw==
X-Gm-Message-State: AOJu0YxVRqwVQnY7F5PyN73lX+hLSbBpqQ3PHZkywHkcyY3LLx0uBPKk
	0lvkntOOXN8NyahyuRfADHbTiPLJd5OgRmeRL9+RAPtwGQtnvPBQcFWtnTBs/n26c+MKCfQWFKD
	I
X-Google-Smtp-Source: AGHT+IFjER6BwW85wVjGyssMrzlVgscMbszy4UdR2Iq6Pts9zXecbspCOyo+0s9AdJJXWiQBxq6OlQ==
X-Received: by 2002:a5d:4e07:0:b0:33e:d6cb:34be with SMTP id p7-20020a5d4e07000000b0033ed6cb34bemr3862127wrt.29.1711822187801;
        Sat, 30 Mar 2024 11:09:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:71ca:5c3d:96bc:4b3d])
        by smtp.gmail.com with ESMTPSA id n2-20020a056000170200b0034335e47102sm5004582wrc.113.2024.03.30.11.09.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 11:09:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/sstatetests: Fix race issue
Date: Sat, 30 Mar 2024 18:09:46 +0000
Message-Id: <20240330180946.1116232-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Mar 2024 18:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197653

Under some load conditions, the result event can come back before the
command complete event. If that happens, the code would hang
indefinitely.

Rework the code to wait for both events and avoid the hang.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index e2f509c3e83..86d6cd7464f 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -772,15 +772,16 @@ addtask tmptask2 before do_tmptask1
 
             def find_siginfo(pn, taskname, sigs=None):
                 result = None
+                command_complete = False
                 tinfoil.set_event_mask(["bb.event.FindSigInfoResult",
                                 "bb.command.CommandCompleted"])
                 ret = tinfoil.run_command("findSigInfo", pn, taskname, sigs)
                 if ret:
-                    while True:
+                    while result is None or not command_complete:
                         event = tinfoil.wait_event(1)
                         if event:
                             if isinstance(event, bb.command.CommandCompleted):
-                                break
+                                command_complete = True
                             elif isinstance(event, bb.event.FindSigInfoResult):
                                 result = event.result
                 return result
-- 
2.40.1


