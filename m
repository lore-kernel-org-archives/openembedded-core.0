Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D74FCAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 15:16:41 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.10235.1759504596537129124
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 08:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U2Eno7Rb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so22514205e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 08:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759504594; x=1760109394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IJBv243Vi4harZR85JjQTF5P7Er2oQ2peJ6KlXX1Vg4=;
        b=U2Eno7RbR2kt5iCJfXV480ehHadomvDt/a9GN1DXxy79D0B10f6pNvfZprH2Q9bnaD
         2P6Z/HF2IRgnosWgxwzhYYcHRmiP4G66jXaN861DQ/eDuC6RSCyFhnwpDQ9q0Ghe5wIY
         HAdOZrEgTcN044s05x4W6PNekOIrd49SMlryA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759504594; x=1760109394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJBv243Vi4harZR85JjQTF5P7Er2oQ2peJ6KlXX1Vg4=;
        b=vi9d3YG0KSq/1nh4zOhi1PX5NRuBRGuus0bKVc96Cs/mPV1wnRqavkxbYJVfuAhMxo
         rBHCG61dOSvauVTGkm/tzomhd+VeSU0O1yLGsvT+05G62UTyjG/l8ONxFxs3993Eid/w
         /ly7bWAVAnV4KijbranXydc1TLzuvPxltSktF++69f+rJkQhTMzcbOgdD89AKXNJPros
         AUxdAIdsYPY42AH7btEAoX98MckEIZfK4L4nvggYWy/IQTHaCOTgvg62EH8rc34sPjr3
         xL9qhNeccqF4huMB45Jr/QXpdTyXgMb8F+Y+3rW0D5R0M4XLlelPmxNi89aXuevbF7RA
         sg6Q==
X-Gm-Message-State: AOJu0YwxYd9vrwaabcyA9k2SRzQrslKQpDk3kfkieSR2g4jLpxg4FKRR
	//yeM7WQXmiPNuXe0e4NIDnClG0nch7pVw3cFCaNL5fCJiZ1f8VeDGze5VQhBKtgbB4/LgMBADa
	M3t9h
X-Gm-Gg: ASbGncvWQG/4DXL3VswVqYzaHx+p3Va3ojF+K8mHCfJuQEGaKRf7u9MgvfYsEoj4nxA
	3wK+/rHnwtYrP+ju4FDq1CIKmxqvDRdBY8sgXwlloKeLdHbwfp3fcDx4nlooCMLmbrTUa+loN2l
	1DIo3fBIvxlh9KgNEFBhI8BXEccVUtLRsTXB6m8D/bXTVdiNSd2LOT78mC0lx0XC5ytQfDZVriN
	96MdRKKlFpWGmix1KHQQvdQ4dEYjYGA236Qnk9sgL9Xm0u0hQE/F4wQpiIlD3X8pe6EEUBQptKx
	kyg6AdkxLBZij7BclzkAQ5kcMwTBw0981M6yyf8S25ypd9VsS/l8dDv8FP234QNb85ET2xnyoRg
	r8tS6CmFrPBOUOymKfV+ulWn7zUuCxZXrVY+k2O1+V5z2e1jJH4p7SNLfvsJrdGAftmmTJc1ukw
	==
X-Google-Smtp-Source: AGHT+IGIV5kGdapk5S0VmXY3/UWgDcZpetu+w+hvLCLsFPv+VhElIpoRVOqfw8hhE7l6hDyoCuTXNA==
X-Received: by 2002:a05:6000:2287:b0:3fd:3bcc:c239 with SMTP id ffacd0b85a97d-4256713eacdmr2667435f8f.5.1759504594351;
        Fri, 03 Oct 2025 08:16:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:67c:cc8a:4a49:c12a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e675b557fsm115616825e9.0.2025.10.03.08.16.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 08:16:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/bblock: Fix changing MACHINE during the test
Date: Fri,  3 Oct 2025 16:16:33 +0100
Message-ID: <20251003151633.487380-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 15:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224396

With config fragments, changing MACHINE in the test like this no
longer works. Use the forcevarable override to allow it to work.
This also needs a tweak to bitbake to work correctly, sent
seperately. Whilst ugly, this avoids the need to start changing
config fragments.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/bblock.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblock.py b/meta/lib/oeqa/selftest/cases/bblock.py
index 2b62d2a0aa2..cb99d32bb5d 100644
--- a/meta/lib/oeqa/selftest/cases/bblock.py
+++ b/meta/lib/oeqa/selftest/cases/bblock.py
@@ -122,11 +122,11 @@ class BBLock(OESelftestTestCase):
         else:
             machine = "qemux86-64"
 
-        self.write_config('MACHINE = "%s"\n' % machine)
+        self.write_config('MACHINE:forcevariable = "%s"\n' % machine)
 
         self.lock_recipes(recipes, tasks)
 
-        self.write_config('MACHINE = "%s"\n' % self.td["MACHINE"])
+        self.write_config('MACHINE:forcevariable = "%s"\n' % self.td["MACHINE"])
         # modify quilt's do_compile task
         self.modify_tasks(recipes, tasks)
 

