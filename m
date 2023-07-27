Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33585C04E69
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:42 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.16772.1690487075711210174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=SovTd3Hq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-56345ab18b0so757317a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487075; x=1691091875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5LyPvYb6yQ5cLKRfudL5mf/VTcUSP9Ijj7EbiAjT9A=;
        b=SovTd3HqiP3b57ikr71V5jib50GaJ0h8OVjTIitam7HSxt8YkvrdZ5YMCBFzgoId9+
         k8xd3HVnp1F4+yvJHHtuIf/S1Sk5O9mA++EVO5UuyhTw8+O3QiYD6q6h2TFirWpwlikN
         FaXDojEhOCVoYKDHVPrqGLFMs4cpWuqqFFaRob3e7c3br77tdYMAz6fytYl7zYhd61xs
         YO6XbpnakeqZkAM11cDw43uQZfjJFTaohogqZO3wYknD1nX5bWpFzrJRUjdzaDSg5t+9
         yZPfWVdsJ7dPFnsT8JO6jxvT0v9SdC6OhBXINM4KSHiyEECupKSmrdrVO7NwTqM5p4tq
         WR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487075; x=1691091875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5LyPvYb6yQ5cLKRfudL5mf/VTcUSP9Ijj7EbiAjT9A=;
        b=dNRtGK4Ne6NbEI31+bM8WBEfMC8N/M4KhpZgV6g6LVzGxcWcT9t3+EcmywFnUea+3+
         3bhqZL+HMUQXHUW9BXaYpMhbDA+mDJQRr1HImYvI4BP1w3oCM5qx5ub2t3j+6LxWBysn
         C5cFPW2KBEW9t1FCyXeLbMg1Y5aaCZuCpnB2XyjiXmQdwuPiyGRhA2njxKbdGlVZlznf
         G6juWbQbHIlYHoWUEcERWar+M/dx+6FWfXLLBUFjxf77qw/u5PMCIZNHhZdQe5gPZSdk
         J2pTv1VJdV+cmtT4PaB5g1Bq+Hh2A4+5g/oaMHmAt8WG1DW4OwwmWDAO8/f+ZHcO/CHw
         KGuQ==
X-Gm-Message-State: ABy/qLYfJ7t81sxNQdifdpQd9EtpBnKonlV2rViwcYmlG6mAFf9eYkim
	gH+IPdKtKGTRMjtGzRiaUxTfrnZGT3lKc6NMqg0=
X-Google-Smtp-Source: APBJJlFDWf/Ouc8s5G6V5n0GWV9ZDmnwnBgeogd8SJKX2v9/xZMo59M7n8Z2jiMbupzw4lKJoDp8ig==
X-Received: by 2002:a17:90b:1d86:b0:267:eeee:ab17 with SMTP id pf6-20020a17090b1d8600b00267eeeeab17mr251323pjb.45.1690487074735;
        Thu, 27 Jul 2023 12:44:34 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 22/27] oeqa/runtime/cases/rpm: fix wait_for_no_process_for_user failure case
Date: Thu, 27 Jul 2023 09:43:40 -1000
Message-Id: <c88b9eedc81529c67f2e628ae5e7325daff2535e.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184997

From: Ross Burton <ross.burton@arm.com>

str.format() doesn't use % notation, update the formatting to work.

assertTrue() is a member of self not a global, and assertTrue(True) will
always pass. Change this to just self.fail() as this is the failure case.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 017f3a0b1265c1a3b69c20bdb56bbf446111977e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index fa86eb0537..a4ba4e6769 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -59,8 +59,8 @@ class RpmBasicTest(OERuntimeTestCase):
                     return
                 time.sleep(1)
             user_pss = [ps for ps in output.split("\n") if u + ' ' in ps]
-            msg = "There're %s 's process(es) still running: %s".format(u, "\n".join(user_pss))
-            assertTrue(True, msg=msg)
+            msg = "User %s has processes still running: %s" % (u, "\n".join(user_pss))
+            self.fail(msg=msg)
 
         def unset_up_test_user(u):
             # ensure no test1 process in running
-- 
2.34.1


