Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0FFCA0EEC
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:54:09 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.25462.1694526844617210856
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jZKs04tJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c06f6f98c0so47436255ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526844; x=1695131644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwnxQoR0s8b/+SCK+RZriKQK6RNOOR7pxsb9p7RepYA=;
        b=jZKs04tJZI4iWEwUYIxpsbrB1nEvFaNmg5xG2fP/EYv31nsxZEhmQgAqLTjcd0SUg+
         M4SiA7iltnUWlzAbEm1Qb96vJI3NL5M+/7ebELikudt0sEKXMzeYjhrBjF0RlU34xptG
         dXky8EIKGjdcKOdp31YLyW/yXmtu9zqwGqPIC/GuMUmlc8RhWi+TS8dGld3KXqHIDFZU
         LfRw4eR7Hfvda8fSiY6kTVLPorqV/lnGMqLD5xLCMwtPeLHq3nh9PgyfKvlO0EuDFdgX
         ZWEbuIgx3QkwbOANAQyZB9M83iXbIxeP5qSWOPih3rKV7m/KATjIoeTMPz/sYdFPlkoc
         YZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526844; x=1695131644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwnxQoR0s8b/+SCK+RZriKQK6RNOOR7pxsb9p7RepYA=;
        b=iuaLaKQBOBhNYQcpq8fbMjEEnB07kctfFSfPA5Y8oAZRc19Z6REwWQDv5XssNWF9EE
         pnEoF5sZDmbn34+5V/mRx7qEqeDLHeBroJCG2LO0jz4A06VG9xqgFP28MxDVTvuW8HXY
         O6MiCveF1/P+l6toi8ILJj0ZXmCKt1u/nHonm74x3nWy85YAVSFYDOgJJBQXFlScrEdk
         jmgXMSgZX9avoCCJrna/hL0p1zsZK1ZAud2UW2meF9iv/wVt1VlD68PuEqs4fRArrNWh
         CVZpi8ENmy46boiHXPjh4EThOgo77nUMtj37tHhDRvNsjwn4Xn5zn+iHZTc1mnIQtJ6X
         sl6w==
X-Gm-Message-State: AOJu0YwiP3KmWXPEawN5Gv7Xq8VRkE8tSiN4XZyB2/8vLNvaeG9MC0Nj
	CR9JE2SpUy9mOod1vm9K/d5enOisf67tcTr+Gy4=
X-Google-Smtp-Source: AGHT+IGaAFRFFQMxWYnfUc+3S95Dq13eD82EMU1rTKOqFTH0UVm9ws+/VPrPNrJP2XYTM8RWjzQhfA==
X-Received: by 2002:a17:902:c40e:b0:1bc:98dd:e857 with SMTP id k14-20020a170902c40e00b001bc98dde857mr19531633plk.38.1694526843821;
        Tue, 12 Sep 2023 06:54:03 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b001bdeedd8579sm7635246plx.252.2023.09.12.06.54.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:54:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/14] oeqa/runtime/ltp: Increase ltp test output timeout
Date: Tue, 12 Sep 2023 03:53:23 -1000
Message-Id: <76b065b3e802fc7dfa9a370e273b8a4187072623.1694526588.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694526588.git.steve@sakoman.com>
References: <cover.1694526588.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187529

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


