Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D232D711AA
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:22:53 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1922.1766089370232684946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fj24BPRf;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88a379ca088so11001346d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089369; x=1766694169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bopPMKFAnqTrHIFhiq3L6qJjRCSiquT5yxGykNrlIY8=;
        b=fj24BPRfsiZuCRfTPEa73GlsCEYicGktRsW+Xiw0KjUqELfsa78cCSDC4foJq5TcyU
         TMMquOQFNY0zTWf6qdYpD/wADYE9BR70urxOh27qGmEu2ii6utUvkolNMiWphqEbUBAo
         TpQTJpQ1lPMyW+TR353luikxUbygvT1SWvF3DbDtOW8PBXNQwUp2nru2SZLzZkVngZqS
         NXO9k6/8WX8+7ZixTnCGneQtO+4vRHuPnSrG6K1uh8KniljZwRxnOxMeZJGNTlrxHFjD
         areMA17aBd36g4UZq+at1nzoWbSNZ3vf4nay4BBWibQUBf+KZLyN5K3t6ivIvJ1ydUWn
         VJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089369; x=1766694169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bopPMKFAnqTrHIFhiq3L6qJjRCSiquT5yxGykNrlIY8=;
        b=RyY0UbFgDLbMKchepUUyHFkzP5oxAFsIVZRKxfjQ/OFFIwNfeQjRi1rreVg7nS30SP
         agO48RlnIxjg97lsIIW9fYfBzPuywJDx6Ya30FdyfIz7mE007o4bKVZT65dVYMOoxEqU
         5Pali2P+LdmsrcKZiSjCFLhEfaBt+ciTaqrStT1/mELXhRdq2sdQB+cDxJAz+/4PZum+
         kJoJ1PGFGY8qM8PCh+hr8zoeXb/xCYnYTzVThm1q0wD5NsXqrSudds3lJ15/DRNrEy/3
         20vz1FuX3YcxEdqQLCX8SR4TA6BrOOw6lBzuW0AijWvJfVhW3ln5x50HaZOxNfIRmLd9
         HDHQ==
X-Gm-Message-State: AOJu0YwkqFXCPj57KnZ8ktly4aPCJ8sXAxGQkwZAsJZ4HldLSjcBQaTv
	R1B8d0EzOMMhyD4Sfs/PyUG2zs+viu7XPMhwfr9AyPiH5gy6AYwLQkYA
X-Gm-Gg: AY/fxX7QUT1p/IvkPUWehW1/7a3HdYEa/1/ZSroN30chXBABxdu4A0p7ucH3Mok/0lI
	pgZ8/9kPVfOvZaK1QRUOI/byE+uIXU3Ifaa9ST9XqsWjVO/0YQXssW2LgvOjoP1PwB+ZWAZi31J
	CFCQiPz/tuzMxdoryUKr6FzFtqCrSdEBPr/WVd5JU1jQEjJDTClqn/eFb1pVtrZLQ5fhGeliX0u
	7OSKD7zMRBg+83h7d/h7YdpK5DTLVsxA8/dVV/fhRS2YbbwpPQmL2iWrpSsWaoQaNcFIrk0wWKW
	ArKUMezPf4dp0LbCcn7ABABFo27/H4xMWPaC74YbmRaEe+39rHVocfbB0i3vj7nGW/JMp6kR7MT
	VPY4AuDn8Bd0PN0JyV+0IcyIDwtM6pYysODX6exKcTyrxtgCffHRBjQH/QLvoTaa3GGqNCX15OC
	++6Met0k7RwWpDqhDxh6kuhiTTf6JJJ7f6GME9HItV1ZFTALQntKGDzW/JemxS12p1a++1ZNAY/
	+P9vvS045Q2YcE=
X-Google-Smtp-Source: AGHT+IHKWQKrDJ8qNGqhrC+r9doWtzQ2ppNUJSQU34+R8nA1q8/8f8/SLlC2qDkEQ7tts9Dilvj/ZA==
X-Received: by 2002:a05:6214:3a89:b0:88a:57ec:9828 with SMTP id 6a1803df08f44-88d86e452d7mr14433306d6.64.1766089369060;
        Thu, 18 Dec 2025 12:22:49 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:22:48 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [01/15][openembedded-core] kern-tools: fix commit SHA reproducibility with raw diffs
Date: Thu, 18 Dec 2025 15:22:26 -0500
Message-Id: <20251218202248.70476-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228144

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit:

  commit a4a362d9f4f0abc8ab145a8673166b9bd875731a (HEAD -> master, origin/master, origin/HEAD)
  Author: Hubert Wiśniewski <hubert.wisniewski.25632@gmail.com>
  Date:   Sat Nov 22 15:23:02 2025 +0100

      kgit-s2q: fix commit SHA reproducibility with raw diffs

      In case of git-am failure, kgit-s2q tries to read the date from the
      patch. Unfortunately, if the patch does not have a date (e.g. raw diff),
      no date is set and git uses the current system time.

      This patch makes kgit-s2q use SOURCE_DATE_EPOCH as the last resort or emit
      a warning if it's not available. Additionally, GIT_COMMITTER_DATE is set
      to GIT_AUTHOR_DATE if requested with --commit-sha option (same behavior as
      with git-am).

      Signed-off-by: Hubert Wiśniewski <hubert.wisniewski.25632@gmail.com>
      Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 9240ee5db8..bd90316050 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS += "git-replacement-native"
 
-SRCREV = "f589e1df23251d8319063da0a61c1016b2a0bf85"
+SRCREV = "a4a362d9f4f0abc8ab145a8673166b9bd875731a"
 PV = "0.3+git"
 
 inherit native
-- 
2.39.2


