Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2CBC38150
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:56 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.8999.1720096074397980150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sZpQGsFC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1faad2f1967so12879265ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096074; x=1720700874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mqvoaL3nr52Mk7rVbNA07e6CoNIL78KHb4osQO5HnI=;
        b=sZpQGsFCci5Oq0VfMR/kaXdCfhXXak56ZqzSJv620rF+zh1/xeOIS8ZC9BrSNlicDe
         8FZnJE9gHhJXyJCIjHi4sNI79hkBxGOGmkhzWoA7Syi+da7cy1+oGWu5SekkjNdCuuGC
         87h39bb20tUwBbMMeLOldwsI8ZaDG4GEZiNTJQ7kP+2GOfZJQ9CRuGreBepAY38aTl20
         aETWT8drWWBctga43zsseWLjlEQWlEQeHHLmnFbEBoCeJvTRQdGzwqtB+fXrD3U3zwZN
         rx687rX14TBRz+QevuwGNWPJuIisxxygX9HuXPGEs5R53TAQ2ZS0Ed2PjJjbr13jIkJM
         IoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096074; x=1720700874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mqvoaL3nr52Mk7rVbNA07e6CoNIL78KHb4osQO5HnI=;
        b=PbGueugai8vzLhyoZBb/ybj3eovVpNrheNSs/bOP2u41uqtra9x0Kz5Xtm2TEIqOMJ
         PLBpmLetUO49WTudN2wC3fjrcRtdSE69EneHbWN1slmqKs0AspqFQdCzB6AZ2uWW6Dna
         hZ4vrQizi3kuty9o077IB0DuaEZmdksScyvR1KHxOviWeLbJ/DVjhRK3XxubXQgDfmCf
         0+qHd7vVwfJfD/3/Zr6Nh2Xs62eXD/s65EUYRcXoIJdef3GU83LMI5xDJrUvmjHBvb2K
         hxNy1shLdRZpuK/uaXa3iS1uye80Ck98tLB1U0eaIKqnRY757wO3AWiR7pc6qLgO9BTN
         7t4Q==
X-Gm-Message-State: AOJu0YyVGpl00e0CllKWK6Mj8kxsOwPryMmxGxBLvPR46t8TSN29Rmtb
	7EiOzfK2dwGe99NdPwHSjIQZqmfsmWtd01LokheV3k3sHlOK1cYACSe78MbtTmpFOk9pYMtbRtq
	A
X-Google-Smtp-Source: AGHT+IHPsISb/UrneLHiHhUx1LI1xmRMDIAcaovFtlt2tyim1q/DCyfOCUXmEzVD94kxdR0EE9RWvA==
X-Received: by 2002:a17:902:d58a:b0:1fb:24ea:fe29 with SMTP id d9443c01a7336-1fb37051fd6mr24094965ad.15.1720096073524;
        Thu, 04 Jul 2024 05:27:53 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/21] oeqa/selftest/devtool: Fix for usrmerge in DISTRO_FEATURES
Date: Thu,  4 Jul 2024 05:27:10 -0700
Message-Id: <4dc35667143f19a369bdea9ce2f011a04132509c.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201560

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If usrmerge is in DISTRO_FEATURES, assumptions in one of the tests would
fail. Improve the test so it works in both cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit afa211746a2aa1993a54cc5a5e1937679341da8e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 44a2a50f2e..fc08906117 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1792,6 +1792,8 @@ class DevtoolExtractTests(DevtoolBase):
         # Definitions
         testrecipe = 'mdadm'
         testfile = '/sbin/mdadm'
+        if "usrmerge" in get_bb_var('DISTRO_FEATURES'):
+            testfile = '/usr/sbin/mdadm'
         testimage = 'oe-selftest-image'
         testcommand = '/sbin/mdadm --help'
         # Build an image to run
-- 
2.34.1


