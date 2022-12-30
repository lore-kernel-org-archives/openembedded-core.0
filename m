Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74CEC4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:45:24 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.22328.1672418724642916473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:45:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=k1vgFAaY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 82so14542410pgc.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QyfxUIodvA5ne3cDU9dsNhpaeMb+bx08A/FeTdUf8Ng=;
        b=k1vgFAaYI5r2w4+6BLbh5mZkPDytutVmdaBagnn/5DFT52Tv9m97byiRSnTNcn+gW3
         tKIAEzVoE9U20gSPd+LbD/R2XDEaGrYCe6Cv+15twDEjAbqhdAy4URNFmFTxpcRkGVUS
         UW30Kt5sdSUSJyJSUrJfpChqU7dKOpCmnvif90oaK3zdgoms3RISA6ir+bvSsjWa0cU5
         2DA870Vkc3tcyAyij6CwfVuTy6NtRzF4nzzQ/7StXQtJK/xnjyEFosP6+shrBPpjEA2Z
         MoOriJj91VL+bus75h1T0Kpru2pJiRtIbRvSu4/v2E3Gug2migABTO+qkFZ93aRx3F+A
         O6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyfxUIodvA5ne3cDU9dsNhpaeMb+bx08A/FeTdUf8Ng=;
        b=h9BbTv69gqR4aCJ4ozIOpPkNS2at+etk1jabtqIaxjndRr1Qf4OcfW5Px7j7GX7AgP
         9Ul981WTQSoWgTspOMvjexZbYTJe6wQhdVACVLn36EMgubZqgIZsj+G2qecIFjuFepb4
         pI0H8RJXUH23pzyT64AEjb08/I1U7josBQZ/vYfKnkC6cvvhz4Y8QAQyIjA83P7qjvFS
         k0NguKMPDdQSINbKtzYgvbo2nsrwF5tLQKT3AucQp298sQjLePmzGS+UPNNY0KMQfkZU
         n7xNBR/eZgjTUSnWfCiF2yTlkWcCypUeBl6bzIN7zvspC7GeD1DHxfAUCYCdsHe/3Xsv
         QIqg==
X-Gm-Message-State: AFqh2kqMhEAdUFl4+Fd+H4sZI+QEhFUEUc+Ms6SmWBesfb0HXLJd63cR
	grmJwrTCBu4RgNoT/Y1gB/w/qPdDb7iXwmKq8+M=
X-Google-Smtp-Source: AMrXdXuO7GEnzZSJgWtVzuRAhtvnAUYg2u0V0l4Q/1qxgJjqOs+TWst88RTkbV9XkGXEs+jwGAAgIA==
X-Received: by 2002:aa7:9154:0:b0:57a:7140:84ae with SMTP id 20-20020aa79154000000b0057a714084aemr28890130pfi.9.1672418723717;
        Fri, 30 Dec 2022 08:45:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.45.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:45:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 21/22] valgrind: skip the boost_thread test on arm
Date: Fri, 30 Dec 2022 06:44:11 -1000
Message-Id: <8fa2ec3fb273dda307782aa12c07929a07237055.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175162

From: Randy MacLeod <randy.macleod@windriver.com>

This test is failing on the arm workers only so skip there until the issue
can be worked on and resolved. The bug #14311 will remain open for tracking.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d98deec9e4aed9e05343d2758f3a3892e2044616)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index 887bfd2766..432dcc916c 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -1,3 +1,4 @@
+drd/tests/boost_thread
 gdbserver_tests/hgtls
 cachegrind/tests/ann1
 callgrind/tests/simwork1
-- 
2.25.1


