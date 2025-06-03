Return-Path: <peter.suti@streamunlimited.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B79C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 08:58:37 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.6688.1748941113147247809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 01:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@streamunlimited.com header.s=google header.b=AeoWAbxh;
 spf=pass (domain: streamunlimited.com, ip: 209.85.221.43, mailfrom: peter.suti@streamunlimited.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a5123c1533so589248f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 01:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google; t=1748941111; x=1749545911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7EsgYaFLLk0pePsr+hTCo3o8CsbydvfjYQ9kXndBVU=;
        b=AeoWAbxhw/O7YsJbG1tZuDm854JmuS4iTehxzpXCimxgKdYO1Scr6dhbpWWNFglYbr
         pgPAQe1ghfp62Cv33rXI/m4Rc4JQ7hz6DCMWJ/1ESt9hAVlp0WlTzHt2eCmdKQmbWKfs
         KwO6crDpl+fpFLGYW20LZte53UDGwwqg4kGjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748941111; x=1749545911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7EsgYaFLLk0pePsr+hTCo3o8CsbydvfjYQ9kXndBVU=;
        b=YAmGWLmNH9NxdPKsCymQdZyJkX3T+QlCBOKqBehz9+mPTyaxHLJ+3Y2Ij0UvCFO9jm
         0la9VwuxeIsJ8UeuX71RQYf/jx+ULf5i1u/6A5VSkCP3fNudKZrQGW/oZ40Xx5SL9LmL
         ZqNnWysMncaG6b4NO6mslH4m2v/FQWqkXoJBt3hoA3rsQUmtGjaIkVzlMBVYN0jyiQ1V
         goEx/OOjTEmkpjhOKTVlGFzM+8GpKURiKeVkUmU1O2VLkBnXIi5fudKnLxZOUsIeAl9k
         kw3Tg6H7NiRB2dMaemXbNQEtaHPl3eM31GchbNHSK9pAttNoOwzspbbRDXqgmnV37468
         c7ug==
X-Gm-Message-State: AOJu0YzjNsTN4Qq0N5Wwinkyc1Dt4HFGjteiwPwwmOkqjyccrFQbwRS4
	N4lqQ6mEDqvAJlQEk+7YBnxGqirJk8RRhomdW/pC+ShAScAtga8fhjcZPbIQwjB3WzU+AeBG1Iv
	D3qfPk7Q=
X-Gm-Gg: ASbGnctMe4tSghB2/CzyTOzVZWW0kvT7WDM4r6TwIWSCWLG2+FhfQFr6piyrFLJutdH
	68VST+4qZAznAh6W/qYkkN2V1hzit7kwetZhSR8P4T02W5UfP6T52fp6CYpAFQU2szigY2MunnG
	K/9zW0HLdWONgtDxmTBY9DyzySB2pvyi/8ikO5jqbPhh5F58JIpaTAf15p3G2HJNanJYhn9EyzZ
	jIDuV8JC+5oQt9itWPBkQcReKJdd8frdMUTyGo/W60Q3X/RQ6YQS4e63o+MS2m2pDBpkZeT06ZU
	FueqTzUh+M9taRARtI6QCugXj2ZU6VB7YUyXE0tWMgh3nmULwv3tSa7SThDiLj/QtgirDjG/TbF
	rG1gqzDGtDjVUF1Mtgqx9oSFoGxnQpOc7KQ==
X-Google-Smtp-Source: AGHT+IFyKBjL39N2H+Cof+GtLT+MwNrC4hGtUdbHEr0CaQXm0DnssVW0uJ2hzQpGMWj8+UAuq4F+5w==
X-Received: by 2002:adf:a111:0:b0:3a4:f2aa:2e32 with SMTP id ffacd0b85a97d-3a4f89dcc2fmr10346741f8f.44.1748941111067;
        Tue, 03 Jun 2025 01:58:31 -0700 (PDT)
Received: from localhost.localdomain (vpn.streamunlimited.com. [91.114.0.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f8cd2sm805691785a.32.2025.06.03.01.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 01:58:30 -0700 (PDT)
From: Peter Suti <peter.suti@streamunlimited.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Suti <peter.suti@streamunlimited.com>
Subject: [PATCH 1/1] icecc: calculate pn and bpn from FILE
Date: Tue,  3 Jun 2025 10:58:08 +0200
Message-ID: <20250603085808.4045687-1-peter.suti@streamunlimited.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 08:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217786

Starting with Yocto Mickledore the PN and BPN variables are set to "no-pn"
at this point in the `use_icecc()` function, so instead we need to
re-parse them from the file again as a workaround otherwise icecc is broken.

Fixes: 3be00ad9052de ("bitbake.conf: Add BB_HASH_CODEPARSER_VALS")
Where "PN=nopn" is set to optimise the codeparser cache's size.

[0] https://lists.yoctoproject.org/g/yocto/topic/icecc_support_broken/103429714

Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
---
 meta/classes/icecc.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 8a48f2ad63..e3b07028b8 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -143,8 +143,8 @@ def use_icecc(bb,d):
     if icecc_is_cross_canadian(bb, d):
         return "no"
 
-    pn = d.getVar('PN')
-    bpn = d.getVar('BPN')
+    pn = bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'
+    bpn = oe.utils.prune_suffix(pn, d.getVar('SPECIAL_PKGSUFFIX').split(), d)
 
     # Enable/disable checks are made against BPN, because there is a good
     # chance that if icecc should be skipped for a recipe, it should be skipped
-- 
2.43.0


