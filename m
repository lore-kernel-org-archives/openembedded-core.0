Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D143C76196
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:02:00 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.8797.1678888911264008541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mjqkftPI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso1953634pjb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUqFVeMVWMKzKo5IyzDSMaEpyvUNLHrQTM+i8TdB4yI=;
        b=mjqkftPItURk64n7hHCuA5u8Cd7sUMFVO7HHJt8h6+T31VLHkPJnoEIQCncniOdtgy
         /4yOBrXx8WP421VT8r8y6LFvabfjm2X2lavRORexyiSvbfDa1+256HY+ObMdNP9bs7H1
         CblTllLuWT5+eVS3rj+AiZBZ0X4QROkd9GoVHd4z6mTvpIqfXizC3dD1ECuQDvhYH2Si
         tNC7AeCBz9ZLgaC4d/5Pn+IAGiuFftLRHs4z76pG3h6PCH5p8mfUCbL1cbQGd+sKr4NR
         uahhdbMu9Y2QKrJRkpZ9DQxgzR+WCC8Sx1FizS/2qtauyt41IoWUYlSosQh+559n0wDh
         M7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUqFVeMVWMKzKo5IyzDSMaEpyvUNLHrQTM+i8TdB4yI=;
        b=Xnxv8hpf7iMf64R6Sg7LGIEwWj0RuXphl7n/q4jfXJ1Tclo23akuEs9BUMrKlpTKXb
         666AM08MCTy3/OMq1khZge3zdy1MtsUhUyIF6jyisXeNq1xA8nZKuwVxiDjD9ew1dHrH
         GAhLVhtTiuSAvAa3lyTgVHc7DyE5lKS08jk0sWewACb24zMVyAmm9Ed50ERomRlm7EG4
         l/BPzPQ1LhEkCf1x+CnlQw3DTgnLcnmpubK1BqsqrFd4ck57AvGwnzRtH6z43xB/IkLh
         ynlDTJjFqax2K0TVqo7QyD1jYSQL/xbAYD3eTx57PKsBFpV0IbfZd83hJN1ReMcbmzht
         rb9w==
X-Gm-Message-State: AO0yUKWui4eCDRAhH63a2d/HXgNe+x4fyQap7poB1IhKH6BmWVKXcNlj
	H1W5uboMWE0KYOOfOzNJL1jo1NXyoN6fKcmYDlY=
X-Google-Smtp-Source: AK7set/7nxer+oUH/QuhYEPfURhK0sLpeM8flM21S7wPcuZ0N2v7UaAT7flJrbXG3Brn7SNcdK02tg==
X-Received: by 2002:a17:903:41c7:b0:19d:297:f30b with SMTP id u7-20020a17090341c700b0019d0297f30bmr3157084ple.19.1678888910347;
        Wed, 15 Mar 2023 07:01:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/22] oeqa/selftest/prservice: Improve debug output for failure
Date: Wed, 15 Mar 2023 04:01:06 -1000
Message-Id: <9afb0e2f781720715fc6fd8595d6996465589892.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178566

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We keep seeing this failure on the autobuilder but the output amounts
to "False is not True". Improve the debug message on the chance it may
make the issue clearer.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d03f4cf19c2cc96e9d942252a451521dfec42ebc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/prservice.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index 10158ca7c2..a41812148a 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -75,7 +75,7 @@ class BitbakePrTests(OESelftestTestCase):
         exported_db_path = os.path.join(self.builddir, 'export.inc')
         export_result = runCmd("bitbake-prserv-tool export %s" % exported_db_path, ignore_status=True)
         self.assertEqual(export_result.status, 0, msg="PR Service database export failed: %s" % export_result.output)
-        self.assertTrue(os.path.exists(exported_db_path))
+        self.assertTrue(os.path.exists(exported_db_path), msg="%s didn't exist, tool output %s" % (exported_db_path, export_result.output))
 
         if replace_current_db:
             current_db_path = os.path.join(get_bb_var('PERSISTENT_DIR'), 'prserv.sqlite3')
-- 
2.34.1


