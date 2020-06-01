Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.37919.1591020709915965137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ilad3jJ9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id m2so1045714pjv.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=lW5zQL/mgTkphlYJOVQi3o9lTxyOf44Q5jfhR6i6GfA=;
        b=ilad3jJ9kvdeUFD1iG1CkLwDZkwIOD7N8sHV4AXBPyKFwm0eB2mmAFEsWUu5RBwck0
         dn2g/qW5sViI1fZWqzmVXVpYIkdbgGR9U3jH+S7i4vntGFsrvlodoUMsZDNhI/8CH674
         HW6dwoMbuDaTYIQ7khvU8aVcuUJ/vqzOnHngc9PE5urPjtj62/eS6DSL7OoQq27+O5Mz
         /3BuTfKPo3lIOp1cOHrEyhWL8xQNOqCY5La+184n9x5yLUGXV0SB5brFPAZJx8JkmpMk
         v/apNjkzmfxLip9BADsHkhYGzpXNy3Xc9DnBqLDTlhhKf2o5zDksqNkluC6Sml8c8Qo5
         QHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=lW5zQL/mgTkphlYJOVQi3o9lTxyOf44Q5jfhR6i6GfA=;
        b=GpcOQg8EalNB/rqOSBcXN2HAlNRDI7leboz55Fy2nkA3hLTYsOTzShSjcjz/8wgCQn
         Hays4pF45t77y+Fp2qWhkD8lramrkRNdRcPYJv0G/y0dbfsIGI0OjBqfNo/sltNYx9QQ
         lF+S+aTu0BBw01Dp/Z8E1g/jUlk1/Xl2Ujr8FNy6e2Q+L04RKJHqT4goWPE74GLf+qom
         nH6epaWND0rr21p7AvQcE5mNUi7JDhXBGtjChruy+YjbFbmxFxSCeMfEE155zpujuNhQ
         mHa2p8nfcddEAFTEdxD5haDUx/1SY+FIE0s2VC64XAnNgk/YfrrllYqOgeTG7ZKB6j8O
         +GeA==
X-Gm-Message-State: AOAM533xuLLLrB5/x3XeEiKwLFDYHjPs0JZR+hrH2k+xLjBAoSiEQZGA
	Im+6UUtZn6JiaAw8xj4lyqUiVPDFYyk=
X-Google-Smtp-Source: ABdhPJwPhErq0n9aEiCvrYj94plrUHoySpPuuuYBUnQAry2Dj5EtYDntFwavmXRrGm+FSyGa0kAb7A==
X-Received: by 2002:a17:902:b110:: with SMTP id q16mr20025625plr.221.1591020709092;
        Mon, 01 Jun 2020 07:11:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.11.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:11:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/16] checklayer: Skip layers without a collection
Date: Mon,  1 Jun 2020 04:11:10 -1000
Message-Id: <ae65adf471a9ad04c6a44bf020a28f1006db106a.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

As in other places in the file, skip layers that don't define a
collection when searching for a layer to resolve a dependency. Fixes
KeyError exceptions when attempting to access the layer collections
later

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 26090a2861ebe21224aaf89d7be0c0a89ca58e48)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/checklayer/__init__.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 5aeec2f00f..1138000275 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -143,6 +143,9 @@ def detect_layers(layer_directories, no_auto):
 
 def _find_layer_depends(depend, layers):
     for layer in layers:
+        if 'collections' not in layer:
+            continue
+
         for collection in layer['collections']:
             if depend == collection:
                 return layer
-- 
2.17.1

