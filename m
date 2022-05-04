Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48720C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 08:36:06 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.4164.1651653363097693901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 01:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UhTwcnVv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so2757153wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yg7n4lOJndn139EfJxMQEcAPoDVlpwBvQnMPkI7kvUw=;
        b=UhTwcnVv3KnYUac8mSwaHOVXMnA2HIpbhkpbkHLyWxjMJDcB0N0kzWixJ5/XHmw0rw
         k7oAS/YjAeqbiZpb0mUQTQmxXQ5rkwO0zhfIA11SC3y/wdFPZC74H5kdaPnLrDNR5/7X
         Pf+yRifABPfzENXEPZBll8b7lc8dIKxbK8AIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yg7n4lOJndn139EfJxMQEcAPoDVlpwBvQnMPkI7kvUw=;
        b=44jsFpuitDChJr8i7rL/hAYEGT0qSXE+NdQaeTiXiWlXDTJTaO8VWU8tn+jRzlVGUY
         bjfT8MoA+bl7HHcAyZppHmdeaSvo6AcMurrkrptSv93xryxvwSJ47/6/kw5UlZxQ2QUn
         V34MI7DjqloXIZiJMA6yCKwB5uLdcAm+Iw+1ikC5+1ISShK74qevlU5i8wAallIYINa7
         tGMv2Fl1TBYJh1La4+zThQy15jUemCVpQ0OHAT4bRU3JFRvxULF8/NVyzFSUhvnFseQ6
         kz121ajmMad8gj6J0SaWHGSe8IbSsspYpoBJPzXdjw38Xx0JDuj/SaNDbKfguec43laB
         NOLg==
X-Gm-Message-State: AOAM531BSu0w0RAu2ky8ZazXGerSNuIiJKv0m4XbbaXYgry8r9l5Gsfm
	x8mpwnqAWB5I35Q3sRfuNmuoCSw1NPU1oA==
X-Google-Smtp-Source: 
 ABdhPJzMJIG4bIQGMe7UxZEhThTnC3FzAXyzM8hC3GvkjIHDtPvioZu67Ys8z2z11YV4K+tF4BsE4g==
X-Received: by 2002:a05:600c:a47:b0:37c:965:2b6f with SMTP id
 c7-20020a05600c0a4700b0037c09652b6fmr6677111wmq.31.1651653361329;
        Wed, 04 May 2022 01:36:01 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d387:a418:2b62:bd29])
        by smtp.gmail.com with ESMTPSA id
 o14-20020adfca0e000000b0020c5253d912sm11047949wrh.94.2022.05.04.01.36.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:36:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] abi_version/sstate: Bump hashequiv and sstate versions due to
 git changes
Date: Wed,  4 May 2022 09:35:59 +0100
Message-Id: <20220504083559.3049302-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 08:36:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165214

The autobuilder sstate was corrupted via incorrect equiavlences caused by
the security fix to git and the poor interaction that had with SCM version
checks under fakeroot/pseudo. Bump the versions to enable a clean slate
to work off.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 2 +-
 meta/conf/abi_version.conf  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 99d125b8c51..34e6a1c3ede 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1,4 +1,4 @@
-SSTATE_VERSION = "8"
+SSTATE_VERSION = "9"
 
 SSTATE_ZSTD_CLEVEL ??= "8"
 
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 2a08b1208b1..bb10500f53f 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -12,4 +12,4 @@ OELAYOUT_ABI = "15"
 # a reset of the equivalence, for example when reproducibility issues break the
 # existing match data. Distros can also append to this value for the same effect.
 #
-HASHEQUIV_HASH_VERSION  = "12"
+HASHEQUIV_HASH_VERSION  = "13"
-- 
2.32.0


