Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D928DC43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:38:35 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.64622.1656877108539508379
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2p8FeCWC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 68so7105964pgb.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=otVHgLLXy5MlcUvziQmxF7FORcDqPihk5lI2JDRPhR0=;
        b=2p8FeCWCsbQKSy7KNKdTpY2gjgksknEDRs2GnIctPLSjL4UyXZc0A55gDwcU1E8W80
         Xb98NOLDBPvGEAdFuWrHB9vyTiXihUhERDw54Yabf2/iyjxwY2zEgF8nSJKsKnn4IOLi
         alA76s9tjdwMTRuM4NyihwN9jFM63wv3oGjLyx/w2pd35mAkvBiqGADwN+9oOJ83RTSK
         HF6fbrE6uk02jDNRkUxjjt8vBNBFSM5oQuWngS4rWUY5Bsn19PxC94uzxWSYYxSlvnBW
         aMvnO+wcYvy9ohEgRQVvOY23fA9l+wZh/gp4IW6OBXSaVfWRk5wEY/SMwtja1BUXpUJa
         LVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=otVHgLLXy5MlcUvziQmxF7FORcDqPihk5lI2JDRPhR0=;
        b=VswZjp3JoMSr3U+NSQAvFJkMLSzK0HA1JfB73lFO48Wa9/BARxqzZsRdIXDk1Tt9r4
         hzujl3rzfI3dfa8kFRbGEuHwW0Kd5wzA4JE3jEVKgTJJNN7q1f9zQBMrzm0IJJBL2IH/
         8s7uI4AoGWL/VApn3g4e+BZuSr7/95VcFGKI22urIJEJ/oUGA/XKNgOEijZrAAfTI1XD
         pmkLBxUP7bPI3v/rsJfEiD7tgVZ0bCx/RBP2bhxt7cQ/7k1vWPcuYgEkkZoe7kzNSgP1
         4JIqSeFBZ415FAbAz6DwVliXBDawq8Q8a17PwCJ12wbp5OK5tMLGZjPpJV2QclnR6Xpl
         R2ZA==
X-Gm-Message-State: AJIora/TRRPBtmQFE/iACY5ix4zGk3GghDQrT0/Ho6GGfNzZJYTxi41F
	SPykNWKsELG9zGE/LnMmVIhSP7YmAEdtCB/o
X-Google-Smtp-Source: 
 AGRyM1u6zr1A375w735wa6YlJKLlm5jGD2QFWK1MhG/e+HTPJ9yJYtDtTX7eoTZIXy//nuqHNWLnvg==
X-Received: by 2002:aa7:8883:0:b0:525:6b0a:b23d with SMTP id
 z3-20020aa78883000000b005256b0ab23dmr31883718pfe.82.1656877107551;
        Sun, 03 Jul 2022 12:38:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.38.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:38:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/30] oeqa/runtime/scp: Disable scp test for
 dropbear
Date: Sun,  3 Jul 2022 09:36:01 -1000
Message-Id: 
 <a7ae2ad652546470be552bc53ce41d25850b94ec.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:38:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167586

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fedora is switching to use sftp as the backend for scp. This means the
scp test fails on Fedora 36 hosts with a dropbear target as dropbear
doesn't support sftp. This change is in the upstream openssh code, other
distros have not yet changed the default but probably will follow.

The easiest way to resolve test failures in dropbear images is to stop
testing this against dropbear as it is no longer expected to work and will
likely spread as the change filters through other distros.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a71fc7d455400f406b0d607be712a1133fe91166)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/scp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/scp.py b/meta/lib/oeqa/runtime/cases/scp.py
index 3a5f292152..f2bbc947d6 100644
--- a/meta/lib/oeqa/runtime/cases/scp.py
+++ b/meta/lib/oeqa/runtime/cases/scp.py
@@ -23,7 +23,7 @@ class ScpTest(OERuntimeTestCase):
         os.remove(cls.tmp_path)
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['openssh-scp', 'dropbear'])
+    @OEHasPackage(['openssh-scp'])
     def test_scp_file(self):
         dst = '/tmp/test_scp_file'
 
-- 
2.25.1


