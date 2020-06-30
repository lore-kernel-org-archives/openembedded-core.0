Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.7510.1593486322988393219
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cN+IWqCK;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id e9so9241273pgo.9
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5Ih/zfpEEq3bJUo3QUguQnYTMWhZDlBXvxn/XIB9TRg=;
        b=cN+IWqCKays2X9pKrDAGNGlJnzlufI9HFlxb9qH2h4GW+VGxmwZodq9KwbIPXSzNki
         vUXXrpuhw6TBzZGrJEUqQS2IpkSN4Ab0iFtc1MhaFeTZIyk1zg0KOoaVCHhWCAuXCm6G
         gRkGmcIJQZ13IGs0LwVLbpt+3RYg0fKLsU3mysrL3aJ8GhdG+fLyHzMZUZ2B/3ywWt8O
         JJ55V+UJlTsLZxdbvSRuJKctDiu4QRHUm/tgUy4upr76O7stGdH7Eer7pPa6zuz0B5UV
         AWYViA0doBZErnUxchrmzJ5hiZJfr81tC5NSAXQE/eJx5EC+MkwnYIjtfivWBx1F0H7q
         MNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5Ih/zfpEEq3bJUo3QUguQnYTMWhZDlBXvxn/XIB9TRg=;
        b=McmSMPhnfdBSZMl1S5cp/KNXmyypRt9ZymW3lwbFk47IbiEEhnQYztDWRaZw7E82KE
         NHYgGO6ig10aE+xcrduvof5OsiQCyxdXSk02X4msRGLUJibN70yUStwL1q/rcx4UL7ql
         9mD0g1wMffUsi3dxDH+sVTlDwkiGT6nVqA36BzqYbLkOciL0HnXtCIfr10QRr46PnzrZ
         1I5MKcIZP+J05urUYl1zvx05UhqSAS9DtJmbvE095cjdoZwQ0zAeM8grwYnayQbjjsDV
         O71uNnT8FwKZIZVskRLe7PO6z7vaCopNDUU1zD+oCqvQPb5VJucF785DnB7oaBdYidL/
         yYxQ==
X-Gm-Message-State: AOAM532/zNukzJ2lstjPaBTI8gJFnHjbhSAg0+qMdlshHitFp/v4iYuZ
	RbHyNmS8F5Rsn3uhiVGZZEPh2r2B83W2PQ==
X-Google-Smtp-Source: ABdhPJxQQgIlDiQlyUzwrTJD+Nbrv3aoLbvMm0P7/GT1is13HCuv5rY6uLkhlFhCH0rZUDFaiTDPSw==
X-Received: by 2002:a62:ed11:: with SMTP id u17mr16413491pfh.70.1593486322117;
        Mon, 29 Jun 2020 20:05:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.05.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:05:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/22] checklayer: parse LAYERDEPENDS with bb.utils.explode_dep_versions2()
Date: Mon, 29 Jun 2020 17:03:17 -1000
Message-Id: <819f41906197bb712af37349c0865002bfbd7c9b.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

LAYERDEPENDS is a string of this format:
"DEPEND1 (optional version) DEPEND2 (optional version) ..."

However when we parse LAYERDEPENDS in _get_layer_collections() we
parse it as a simple string, and if any optional versions are there the
'depends' field is wrong. For example, running yocto-check-layer
might result in such errors:

ERROR: Layer meta-python depends on (>= and isn't found.
ERROR: Layer meta-python depends on 12) and isn't found.

Let's use bb.utils.explode_dep_versions2() to parse LAYERDEPENDS, and
create a string that contains all dependencies, effectively
skipping/ignoring any optional versions.

[YOCTO #13957]

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f81f07afc200fe06c5c06ea81a4f8a3a43436faf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/checklayer/__init__.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 1138000275..f625d59896 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -59,9 +59,14 @@ def _get_layer_collections(layer_path, lconf=None, data=None):
         pattern = ldata.getVar('BBFILE_PATTERN_%s' % name)
         depends = ldata.getVar('LAYERDEPENDS_%s' % name)
         compat = ldata.getVar('LAYERSERIES_COMPAT_%s' % name)
+        try:
+            depDict = bb.utils.explode_dep_versions2(depends or "")
+        except bb.utils.VersionStringException as vse:
+            bb.fatal('Error parsing LAYERDEPENDS_%s: %s' % (name, str(vse)))
+
         collections[name]['priority'] = priority
         collections[name]['pattern'] = pattern
-        collections[name]['depends'] = depends
+        collections[name]['depends'] = ' '.join(depDict.keys())
         collections[name]['compat'] = compat
 
     return collections
-- 
2.17.1

