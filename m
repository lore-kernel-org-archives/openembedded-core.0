Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE10C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:47 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.7204.1667530905248326411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=SUb/8Gj5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 128so3323402pga.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6q9xUFV0mSUDXrbIQfReNmIVVL6FKmKyRRynJJmhbLE=;
        b=SUb/8Gj5wkVGxwbjPuy/ey5yboUY0DjMhlbDacVvsHmhrq22kfoW9XUoNM1DehGN/R
         +dOHrAQc2hbaw4Za3jAn7Ow/+bJieBrZxff/K80n+nho959nrF4sQ5+6s7y9LBxxjjgZ
         2af81sVrWZ9GRrl41Z566Uvdaicsf/H4s/RfBSEpY6KO8H12FPIZKAAcmNUC31nNEmfd
         f41A6Xe8keG7FR5iPa4d2XHeF1PD4SloIDrhGIcz+doP7CE9r/eLBolfuDQYS2MZ8UT8
         RZFKyE6NPirGeEbBz2ZcGbqc0MyCuIv0lDZ6yJ9ihOxiNIg/iui++NHCKD6iztSQN5iA
         q2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6q9xUFV0mSUDXrbIQfReNmIVVL6FKmKyRRynJJmhbLE=;
        b=MdLFyBhZkqDzITIvJtAGfZ+d8mOF0YTM9I1EXt2yJ9P7zRUW7q7yYrVfXUfVObVxUO
         YLxax56nHPgCSOx+zL5s7D0sqcU5IHIyO17gSwZm8/b4lEHEJJr5pcEyCDrTwiJ0Tt7s
         3pkhJleyZNUsF4i01UW19rpUbQNc8NnjAZEOnSlAdk2QEXMDENNp00VPkZyT9MdNigqy
         UZ7C3xFJRM0aqaEcG8lMdcq9+CVGKY1qyKYssCgV3ID3eSogCTdJucfxTWVRWOOQS74Y
         0Hj6O7Hw5cLN/L633Tn/ZIDKwSderKQNuZFoX9MDR5cFzBs9IFM0+HBnb/LoHQWZ4l4R
         k7zA==
X-Gm-Message-State: ACrzQf3n20fWX5NjyXg5Lz/+hLkvxCBoEVdzlFx5oCouAz407nqQXMCp
	ExQbI8N69cAhsTVdJ7zOqPCDgMwWRL+d7zU8
X-Google-Smtp-Source: AMsMyM6tQ9aKyMYcnCJRLXHQZUR4Lb64pTkfKEH1C8PJrMu71dLoKG+wb8JH5pcv0zEtD4EMDm94cg==
X-Received: by 2002:a63:464d:0:b0:441:5968:cd0e with SMTP id v13-20020a63464d000000b004415968cd0emr29760130pgk.595.1667530904259;
        Thu, 03 Nov 2022 20:01:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/31] scripts/oe-check-sstate: cleanup
Date: Thu,  3 Nov 2022 17:00:48 -1000
Message-Id: <f87842a4cafb8b935c2a49443b3b98916199945f.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172674

From: Ross Burton <ross.burton@arm.com>

The scriptutils import isn't used, there's no need to run bitbake
in a shell environment, and invoke bitbake as a list instead of a
string.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 663aa284adf312eb5c8a471e5dbff2634e87897d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/oe-check-sstate | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-check-sstate b/scripts/oe-check-sstate
index f4cc5869de..7f9f835da4 100755
--- a/scripts/oe-check-sstate
+++ b/scripts/oe-check-sstate
@@ -18,7 +18,6 @@ import re
 scripts_path = os.path.dirname(os.path.realpath(__file__))
 lib_path = scripts_path + '/lib'
 sys.path = sys.path + [lib_path]
-import scriptutils
 import scriptpath
 scriptpath.add_bitbake_lib_path()
 import argparse_oe
@@ -51,11 +50,8 @@ def check(args):
             env['TMPDIR:forcevariable'] = tmpdir
 
         try:
-            output = subprocess.check_output(
-                    'bitbake -n %s' % ' '.join(args.target),
-                    stderr=subprocess.STDOUT,
-                    env=env,
-                    shell=True)
+            cmd = ['bitbake', '--dry-run'] + args.target
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, env=env)
 
             task_re = re.compile('NOTE: Running setscene task [0-9]+ of [0-9]+ \(([^)]+)\)')
             tasks = []
-- 
2.25.1


