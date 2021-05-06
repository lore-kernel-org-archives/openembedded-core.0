Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.1415.1620316471794270195
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 08:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=INrPtx6/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id t18so6163403wry.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/80R/jieuoXfWetytbHnmbSczKQpZJoBOjriMDCUHD0=;
        b=INrPtx6/0lbw7pp9N5qpM6wMLp+aNMIpTeQkxPzqhaQX7ScUHeCS31FpUD2hvLf1Rq
         DctWNGd+aMpC7G8aTxS0nlk6NV2DjChw98rOOsfIgpa20thJdwzwocvbMn/qUmleKPxS
         B7pYgS06N8dxQSMB5lahJpXq9oLe2H/tSeL4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/80R/jieuoXfWetytbHnmbSczKQpZJoBOjriMDCUHD0=;
        b=j9VP2Pqj0wzd4+Nqvnsy5HtGhgLh06Rl0iaktLCaf/7skuvmw/GH/K5ZWGa42JtGEd
         dxQE0vXbR4g0gFFMIL6u3WHoSLcKxwlxzOIQzc+Cgxs5ZN1fEMbbSy59+NIyFLe5JVcx
         7w3uA7v2NJPvCG06ICwjRVfeNMBK9XqhE9K0ziRNfqij0oY/+NcajYCthvd2GvfF2t87
         iAzHTa3gLCLXJlsiTdF39VwOiKk3ZjlRJjGgpViXEOompcMwrZhFK1q8ZiFinJHZDLAy
         V6nxtpcvyO8GFS+0x+1GxqzmzzsFiuz6dg6XdNj7sxuHz/CYJm7BSopzyEt5kebYVyQC
         VDnA==
X-Gm-Message-State: AOAM531Zb6h+pUpgkx4TMpXkpheoay5ZjzJ5Y/pTMWmn2D9ynj9f1dSA
	mberTrkYJlGKzND3JIItZ5LayfssddFE4A==
X-Google-Smtp-Source: ABdhPJzo/E8H8GXpzmau3GgspzhHXJQ+CCkFdUPNe7dmgh+treMdnnzQEHRDH3vlHRFz12Wj6w/2Uw==
X-Received: by 2002:a5d:4a48:: with SMTP id v8mr6297891wrs.204.1620316470132;
        Thu, 06 May 2021 08:54:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e])
        by smtp.gmail.com with ESMTPSA id m6sm5223525wrp.29.2021.05.06.08.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 08:54:29 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] yocto-check-layer: Only note a layer without a conf/layer.conf (versus error)
Date: Thu,  6 May 2021 16:54:29 +0100
Message-Id: <20210506155429.2005103-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Dynamic layers may have a conf directory, but don't need (or
want) a conf/layer.conf

This isn't an error, so we can just log it and indicate the
layer is being skipped.

A full layer without a conf file isn't all that useable, so we
aren't letting anything subtle slip through by just logging
it.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/yocto-check-layer | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index deba3cb4f8c..44e77b73d0d 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -112,7 +112,7 @@ def main():
                      % layer['name'])
             layers.remove(layer)
         elif layer['type'] == LayerType.ERROR_NO_LAYER_CONF:
-            logger.error("%s: Don't have conf/layer.conf file."\
+            logger.info("%s: Doesn't have conf/layer.conf file, so ignoring"\
                      % layer['name'])
             layers.remove(layer)
         else:
-- 
2.30.2

