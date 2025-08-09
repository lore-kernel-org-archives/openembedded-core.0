Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3830C87FCB
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 14:44:41 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.7608.1754750673892966384
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 07:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tj+lg//c;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3214762071bso3684644a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754750673; x=1755355473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gA2gg6Ze+Utoyct+NIylVvgewG/Do4PxzK70wnjxJJs=;
        b=tj+lg//chKOxGN+syJJoK4XEV6Kv7geMvVl7unhZ64+ebJmx+vbUH7vMs4gtz1zQkt
         ML0hqRQve4PZ121Jz3pR9g/+Ky0FWrZmCgOcsd/Buch3zq2UcUPt3u15PSJtGNxz2p2h
         H1IhwJ46M3Nf0eU/Ydr5sZAdxZg8QQBas24RRS0MsusqJvfIQdqzux2IBPWtbJUdtb76
         jbWpgiCw4Fe04t9viRsJO5ew+r3QdgyWu5gHBxEnAy9YSLI0mPFlDM/2x0uz3jd3ED7G
         diSbeSDaLrdDlzwlRJSX3ipZUDwBrlpTGWmoqwSLQq55s7CNvW76esZ89d31YnXfTVE7
         Useg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754750673; x=1755355473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gA2gg6Ze+Utoyct+NIylVvgewG/Do4PxzK70wnjxJJs=;
        b=UNUUIHlmgJOvxrb3+hDpAMsJCXwmKp9Qn0Ex8lYVW0BH2J6qOnjGUecFtyxJocQjxi
         voVQqUyUBeeRiQUrLMWhPBkqstem05gqerm0MuZ3qGL2k5j44YwO3TY1J063CAgio5ek
         68Z7nkJs0CURbGsXBgigEPbHD1XQudk9Kk95qNq+S/P8tieiTgpO94qfF0vqL1gYm1rk
         EvE9FXOe/bQjv3cuLRGS6IAeUgtPu27uVLF2eq+CcFcIWQdPhsazoRcz2Rt0xsMiIQeN
         nVF5X/5KyVPzFFq+aHA/clqhQ4JQR2WQNglM9iP/l/xZnq2XkoJeJsnkU5BGOkaqIYzS
         r/Mg==
X-Gm-Message-State: AOJu0Yxawd1ed1ZxogR3nn59xvPXYPljdMbe01e64JlQPHGvzOrETsGk
	rxZ1Hols2LX5iogeeAClU1HVyksrzKSjW3nRUUTa2FmDzy5AmPAfc6h7zwUqBy7fnVj83M3fgSN
	olJuW
X-Gm-Gg: ASbGnctCn+zYSws/VFNIfMDCCbXPNEYqMifHegNumQMCAHMBas9qnEEuIob9knAVyQj
	BhJ02NjI1teQntoq+MJYfPyCVfGYSv+CxpWnClOPOwq65LbGWki0DCPAoqVXQaI1oUS7ZJkBy0j
	+0MCUtZ6LCVrjnD3Ttad7fJ4Jo32VXB2a2FO5xtYGzIfY+z4EsoPmByet9CXUxDBcP7G2561b5y
	g9nMZoEvbAbq51px5C5/HSFdI6C0L5ygE3qQlgouED9TCpLKigbkJ9o6FDP2QybZeG7UR2Jg8de
	oG3AOwdnftKuKekbNrre2hlYwYUDT3FjwTpt71GH/CQpjlIRhSjfulVxX62VIITgvlkoKWTMT2i
	osi6WJsv7uvPlkw==
X-Google-Smtp-Source: AGHT+IFzTXPLGwV7BwlSloRHwbLE3y2sd7tFwzwXeBlUAMAtcAMXDn4kKAEV9ML48GEblVE8hs+/YA==
X-Received: by 2002:a17:90b:4987:b0:31e:ebb6:6499 with SMTP id 98e67ed59e1d1-32183e6170fmr10545158a91.24.1754750673024;
        Sat, 09 Aug 2025 07:44:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e40b:779f:346e:b2b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b428f4c8639sm5736428a12.43.2025.08.09.07.44.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 07:44:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 4/6] glibc: stable 2.41 branch updates
Date: Sat,  9 Aug 2025 07:44:20 -0700
Message-ID: <af3e5e432d9bf1e5811ea92f3e29c0874b6b9405.1754750560.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754750560.git.steve@sakoman.com>
References: <cover.1754750560.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 14:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221679

From: Peter Marko <peter.marko@siemens.com>

$ git log --oneline 6e489c17f827317bcf8544efefa65f13b5a079dc..e7c419a2957590fb657900fc92a89708f41abd9d
e7c419a295 (origin/release/2.41/master, release/2.41/master) iconv: iconv -o should not create executable files (bug 33164)
1e16d0096d posix: Fix double-free after allocation failure in regcomp (bug 33185)

Add CVE-2025-8058 to CVE ignore list as this is (bug 33185) commit.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.41.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index a2cfd0f308..881a9cce2c 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.41/master"
 PV = "2.41+git"
-SRCREV_glibc ?= "6e489c17f827317bcf8544efefa65f13b5a079dc"
+SRCREV_glibc ?= "e7c419a2957590fb657900fc92a89708f41abd9d"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glibc/glibc_2.41.bb
index 7ddf7f9127..8a65e8ce9f 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-4802 CVE-2025-5702 CVE-2025-5745"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-4802 CVE-2025-5702 CVE-2025-5745 CVE-2025-8058"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"
-- 
2.43.0


