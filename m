Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EF8CDB483
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:23 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.51145.1697234001663590019
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EQxRhM8x;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso366687b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234001; x=1697838801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWtAzkwpBMwDVCD0rJNVdshahtDA1V6UOzr8dJWXaBE=;
        b=EQxRhM8xVyAmzL2pEKZ2BArkvVhnVfRGqjk/J/3wkP16WsAmEvynTRrlmvtaTb/TM4
         FCu1E3mj7oOTS/1QBGbZqEUJG6a1O/e73Gioan3Njlf2DV0+OkjxqyiKrM2nRpsyxQ/W
         O5SBYDxPKOaMBlBiMd9DciHD6PtRoT2Su2ViRlH2/nELbLx0gfl626TCPoMmPItSdxYi
         Dn2agXKBLlvDEEQwSX9nrDCSXSBEtwxFHghWx35UK/lLK4upNeAGdq5yhUz2iHAHgfTu
         75q/XQN//klmSbZtdAx9gQYaWWkUuXLhYu6B5AUx1AV7u6ThUtFAlhsG/OmKAtWQgSSM
         1Bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234001; x=1697838801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWtAzkwpBMwDVCD0rJNVdshahtDA1V6UOzr8dJWXaBE=;
        b=ZKIPzmavGOAM2mlEV10hc1/sjN1LguRmbXQ3Ix+E4Yr1ogj5oPvboLxkrqgLesBDFn
         3CkCRizC4CwpF5EPkw/HH43yFHv6Xo/M1ytfpZNRUXifx70jdE2/0TY568x4eSIFNyyY
         SbTR7CPAuCwlgLBDw8LQLpnIHseKkQZSsdVu6l3PXEb07TduPdemPf6Mx6VShw8tQFC7
         GuS9zO/c0LXIAkGljzizlnZKrhVAf3rUe/sHUKOIO4rfbeZ62TAylywbDj0J4flIflnV
         qQY6oz9rklJm/P6nDEHC6SQptdmZTOq1rs2Sip4YrdI9l4Hb9TQ5TLdKn63vR+A4VZZX
         VDng==
X-Gm-Message-State: AOJu0YzNLTk1a7tbNGAj2Ox9eQTyVsRytzLTGBzA0nla64FNO8zSIzc5
	z3gXUxIoOP8zoPnaPzCyjzBdQjDuZTvE9TUPBp8=
X-Google-Smtp-Source: AGHT+IF+bG/zqD9x3GSfB4pmP9B91XvMewMp971J2B2TON0ztCKXb/iW5MBGI9gs6sP4q5NxpnF6ew==
X-Received: by 2002:a62:f20b:0:b0:6b4:ac0e:2f70 with SMTP id m11-20020a62f20b000000b006b4ac0e2f70mr1937657pfh.29.1697234000757;
        Fri, 13 Oct 2023 14:53:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/27] nativesdk-intercept: Fix bad intercept chgrp/chown logic
Date: Fri, 13 Oct 2023 11:52:35 -1000
Message-Id: <e27982afaed33e5823962f7fefe6f709c10e9107.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189088

From: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>

Running either of these ends up corrupting the os.execv args.

If we run:
./scripts/nativesdk-intercept/chown -R foo:foo bar

The loop here ends up missing the conversion of foo:foo to root:root because
it sees sys.argv[0] and assumes that it's the user:group argument and that we
should convert that. We end up a os.execv(path, args) that have the following
args:

['root:root', '-R', 'foo:foo', 'bar']

As os.execv ignores args[0], we can just populate it with sys.argv[0] and then
loop through sys.argv[1:]. As both chgrp and chown would have either flags and
USER[:GROUP] next, this fixes the issue.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a75f647ec7696d353f4b09099d777ba53f34d36)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/nativesdk-intercept/chgrp | 5 ++++-
 scripts/nativesdk-intercept/chown | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/nativesdk-intercept/chgrp b/scripts/nativesdk-intercept/chgrp
index 30cc417d3a..f8ae84b8b3 100755
--- a/scripts/nativesdk-intercept/chgrp
+++ b/scripts/nativesdk-intercept/chgrp
@@ -14,7 +14,10 @@ real_chgrp = shutil.which('chgrp', path=path)
 args = list()
 
 found = False
-for i in sys.argv:
+
+args.append(real_chgrp)
+
+for i in sys.argv[1:]:
     if i.startswith("-"):
         args.append(i)
         continue
diff --git a/scripts/nativesdk-intercept/chown b/scripts/nativesdk-intercept/chown
index 3914b3e384..0805ceb70a 100755
--- a/scripts/nativesdk-intercept/chown
+++ b/scripts/nativesdk-intercept/chown
@@ -14,7 +14,10 @@ real_chown = shutil.which('chown', path=path)
 args = list()
 
 found = False
-for i in sys.argv:
+
+args.append(real_chown)
+
+for i in sys.argv[1:]:
     if i.startswith("-"):
         args.append(i)
         continue
-- 
2.34.1


