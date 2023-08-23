Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0B8EE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:37 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.13108.1692801448385592153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=QGLsRtml;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68a3cae6d94so3335804b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801447; x=1693406247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwnxQoR0s8b/+SCK+RZriKQK6RNOOR7pxsb9p7RepYA=;
        b=QGLsRtmlvxpqS5gIN8mJaVHrEAF0kF8rV7LYtGaSG2s4gb7ejYmMwZzyNSxsF8ImtY
         GEEBJrQKMGf7OMNvWwg3EQqVqJH+BvG9po6+98SUQz1ofdUuLqsS0G6vAuSDcDnJaeuc
         odKpKzszPs/nT596s087wr+Qh2jSahNvThl5ZuDA3uuXQvANASqp/Qf8ylFNLqWK7ijj
         +dAazXcRpShdh1bSJt/nFL1SZNuHFuXZfF0zdK5sti1Z54qvl4zcttIVkyX+WHnrKYDt
         WlpKFrqvTQ890bBc0+b0PLhe9aTgnNWJWfOwx8lnAuZd/B+ENR+Z9KWoxJcqbUvtLvMt
         do5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801447; x=1693406247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwnxQoR0s8b/+SCK+RZriKQK6RNOOR7pxsb9p7RepYA=;
        b=jJbYsCe8pkIR3XcAGlHueXdq9Ixhxin8Sm5XQxsooNu3M8CeI/U22AkrIrpPzii0Z9
         vzC2SEsEcNlQOFiZrmpLlNhwY7ftRSXPlDqrkaG0fEWWeqqljwwLafjtSncjf8L6Cmja
         EnY+2djRqFCM8SibyP2RYEq+rKFlCeT7Tv3XpJWmw7VrkfaUQB/oKvTJkbdFVDUfysLO
         F2YYQnTeu1QhRSDr9/5B8rDmK87+pqcIJ7evsVJZgMayjKCBESFSa01Nlf9gnFPqmpy2
         pSfvFJhWu6S75ofLL13xAYcj7WdoR5nj3rhgki+Bulx/9mgNZw1HFZ0DwBtZT5fTguRe
         mgsA==
X-Gm-Message-State: AOJu0Yyao29VBhCRBBeu24pzS2yWSpb4XjJ/knmIXsq8m61yH+8nOx+r
	i+w6fDMEik9yw2SUuPi3Pjb+tBUPurP+g/Ssvfc=
X-Google-Smtp-Source: AGHT+IHO1E+CcxY1r4/oCpTKARt2ycXRK/xmc/BAzrg+MQTarKbGV9JWHlvfvomjgJy0Idm8HoXd1g==
X-Received: by 2002:a05:6a20:8f13:b0:149:44d9:467d with SMTP id b19-20020a056a208f1300b0014944d9467dmr8557562pzk.32.1692801447446;
        Wed, 23 Aug 2023 07:37:27 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 33/36] oeqa/runtime/ltp: Increase ltp test output timeout
Date: Wed, 23 Aug 2023 04:36:03 -1000
Message-Id: <b161af52b9454e07435dc9737b0a2522295f3e4d.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186614

From: Richard Purdie <richard.purdie@linuxfoundation.org>

On our slower arm server, the tests currently timeout leading to inconsistent test
results. Increase the timeout to avoid this and aim to make the test results
consistent.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a8b49208f3c99e184eab426360b137bc773aa31)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ltp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index a66d5d13d7..879f2a673c 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -67,7 +67,7 @@ class LtpTest(LtpTestBase):
     def runltp(self, ltp_group):
             cmd = '/opt/ltp/runltp -f %s -p -q -r /opt/ltp -l /opt/ltp/results/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
             starttime = time.time()
-            (status, output) = self.target.run(cmd)
+            (status, output) = self.target.run(cmd, timeout=1200)
             endtime = time.time()
 
             with open(os.path.join(self.ltptest_log_dir, "%s-raw.log" % ltp_group), 'w') as f:
-- 
2.34.1


