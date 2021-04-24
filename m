Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.7181.1619274396219342590
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 07:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d3F6g/bb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id p6so44563376wrn.9
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 07:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vxzNLbNRKzoto7OHeEm4wZVAGSwCG1250LuVwl5zYV8=;
        b=d3F6g/bbw26rVI1V5jAQnVo+3+j9nSX8T+ad3O+cOL4BGkPahyn2jISSDZWqpxEhxE
         AlWSO9a1uh0lPiDfQIiy5HS49LqaABOxUYQzWeuRRL4LRMm8TCoKkeW4dDOIIqNA9Zgo
         9dFAdZfZFnl4l8paIJm0iwU8BIjXS1NE9bveQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vxzNLbNRKzoto7OHeEm4wZVAGSwCG1250LuVwl5zYV8=;
        b=fMQnhRa7YsHOL8U9GBk+v/zCYn/6L4ZiAynfxmeiACX35frTh60lMNFn0e93lSkGm6
         gLxvjPASMx6IctOnoy7DTl1ClQ7rFI9+mX+OdDMwxYZ5YepcTBqhMXb0yUzr0o8wifzz
         I8rbEOhjuGH/03QfpQ3p0gkh8By4gOzU/lJGuxamjFULoJWAqJpkod4adLmX3Z0RXgBQ
         V/w7g99Llb2RPJCoWhodHvcIU7iHhwm6ZWaAEMWDdEuhT+bIKPEBkWAaS0vnBfY50bCA
         uaZ0jVJBf9cQe5drzP7sg0h2GajvXO1XPXWtGYwg1GFIfO5XHBaAUpFs+M850rdAieUF
         as+w==
X-Gm-Message-State: AOAM533xE/3y7/O3dzzC4GTF5ilxt5fhObPQ1OQtfmHYerIo1QlugxWL
	FL3v0cbiLC6me7zfw5gL0B9YfUA02SdskA==
X-Google-Smtp-Source: ABdhPJyA2Pe6Q0y4KtZfcY1wBQHPRca3IWQOaMxrOl1oKeHACPYwDrfaMPA8El+Gk4bJix55gT6I9Q==
X-Received: by 2002:a5d:660c:: with SMTP id n12mr3917301wru.87.1619274394351;
        Sat, 24 Apr 2021 07:26:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5c62:6d9d:139d:d68c])
        by smtp.gmail.com with ESMTPSA id 186sm14189080wme.10.2021.04.24.07.26.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 07:26:34 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] yocto-check-layer: Avoid bug when iterating and autoadding dependencies
Date: Sat, 24 Apr 2021 15:26:33 +0100
Message-Id: <20210424142633.1646440-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If iterating a layer with multiple components and auto-adding dependencies
the tests can break since layers are never removed and order isn't guaranteed
to account for that.

Fix this by resetting the layer list back to the original list each time
before auto-adding the dependencies in each case.

This fixes scanning of meta-openembedded in particular where the sublayers
may not be added in order of minimal dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/yocto-check-layer | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index b7c83c8b543..deba3cb4f8c 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -138,6 +138,9 @@ def main():
                 layer['type'] == LayerType.ERROR_BSP_DISTRO:
             continue
 
+        # Reset to a clean backup copy for each run
+        shutil.copyfile(bblayersconf + '.backup', bblayersconf)
+
         if check_bblayers(bblayersconf, layer['path'], logger):
             logger.info("%s already in %s. To capture initial signatures, layer under test should not present "
                "in BBLAYERS. Please remove %s from BBLAYERS." % (layer['name'], bblayersconf, layer['name']))
-- 
2.30.2

