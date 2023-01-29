Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30046C61D97
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 15:55:02 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.18485.1675007700743543346
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Jan 2023 07:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U9h+VX9Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id m7so8984660wru.8
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oXYXjhdbarriiPJ0x9l1qmktC1lhMUg+TpQG3C3rAB8=;
        b=U9h+VX9QidXwPh0oMSnw/pUF9jYRGSO8pMazU5MVI8zWeqiIBze5hVupM4TSwXjwPx
         NLfXDnf+WWX17V01xAjZEid9dH572pfvZYCt4cAsuiopJ3FtP9xB8sWbI/05bg6WItDK
         wgjfwQtqRBUwIFnyb0Njxza4ChdgEq9HFMgbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXYXjhdbarriiPJ0x9l1qmktC1lhMUg+TpQG3C3rAB8=;
        b=jcO9Hv0ZktOJIQgZXLbIYDjOGYdgg5IB9n/7ue7ka8wxXdV2hOfChY4xjdTuLX1Ml0
         0tii5C0cokRzhbHHT6oVWtYRiR6T5Ij6Yf2/Un87qss7aQCjmqidAUOyOO0JhPTPwjZ/
         WHA7eiJjtSb4JK/AeKX0ZPEIXX9V8U07u7BoaR2iTCNnJswLysyP9Ksm7JEvYVjJyqn1
         76Oa/XA6M0kaTP3erb+B42grH3LhO/5aSEP1VU8uKge3s3SG5Yz0CE3ln9a/InZHbqep
         DHuhOFi8g+BE9dvFgpYws4QIV8WUfb6N5AWjG2Ee0MEwc+bsOUJzyMnMtBgH2wp0bSCN
         d3Kw==
X-Gm-Message-State: AFqh2kr85Zc7qkJJeJ0nwN5Cmy0n7BGspxUG/VrFXMsqyTwfQSzL10W1
	Ly50nsuMmW4U+3h6EckVWVjCiDJIRwMAYlAx
X-Google-Smtp-Source: AMrXdXsDN5apFyThTjQbU72TzLBYZINXN2hsizgjMfuHCsovnMliID6q/fMbiRX7NsqB0bOz7EUDtQ==
X-Received: by 2002:a05:6000:384:b0:2bd:fe8b:2a22 with SMTP id u4-20020a056000038400b002bdfe8b2a22mr42906869wrf.49.1675007698536;
        Sun, 29 Jan 2023 07:54:58 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f380:b6b4:14ae:a3d0])
        by smtp.gmail.com with ESMTPSA id l15-20020a5d6d8f000000b002bfb37497a8sm10019519wrs.31.2023.01.29.07.54.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 07:54:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts/bitbake-prserv-tool: Fix to work with memres bitbake
Date: Sun, 29 Jan 2023 15:54:57 +0000
Message-Id: <20230129155457.2816600-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 15:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176477

Deleting data files whilst bitbake is running isn't a great idea.

Make sure memory resident bitbake is stopped if present and make
the file deletions a little more specific and safer too while we're
here.

Note: The cache directory layout is different on older releases (some
are split level) so this won't be a direct backport to some.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/bitbake-prserv-tool | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
index bed97bd8ac3..80028342b16 100755
--- a/scripts/bitbake-prserv-tool
+++ b/scripts/bitbake-prserv-tool
@@ -17,8 +17,11 @@ help ()
 clean_cache()
 {
     s=`bitbake -e | grep ^CACHE= | cut -f2 -d\"`
+    # Stop any active memory resident server
+    bitbake -m
+    # Remove cache entries since we want to trigger a full reparse
     if [ "x${s}" != "x" ]; then
-        rm -rf ${s}
+        rm -f ${s}/bb_cache*.dat.*
     fi
 }
 
@@ -62,7 +65,7 @@ do_migrate_localcount ()
         return 1
     fi
 
-    rm -rf $df
+    rm -f $df
     clean_cache
     echo "Exporting LOCALCOUNT to AUTOINCs..."
     bitbake -R conf/migrate_localcount.conf -p
-- 
2.37.2


