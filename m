Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.6540.1599512022890377434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FZb+2N9D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id z4so16969992wrr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kYwa0fHDqGQ/eIULJjWSV4YhVc3hGyNdwkomzdsjap8=;
        b=FZb+2N9DzyMePks7n8W85setY+QHqjwEpnp9UJJVfN6IHtzcImY5L/oxJIxbpLy1Ct
         uFHvk3qgpqiJclB3Zqx02tgnGdk4QoXn0undVDwYZKYVUuLo9p2tUzLBYvvaqASISNnS
         ftaVyx2WkJexKZeyeC2mS+n/KRgYy0yxcekuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kYwa0fHDqGQ/eIULJjWSV4YhVc3hGyNdwkomzdsjap8=;
        b=SVuR8+7Rwq4KEGDoQFzseXGGCLQIYkZQPQhw3av04hLh1biOVO03+/EfrDeT6hmbQB
         fvdj9s0cKEIN+rap4fujiiYr2RlPubAm83KO+5FYaFKRuAl7NUUiwfFldWhhr4gxjnVI
         g3rMkd41LoKecmv2UiwLEWH03bDo/Q1QO05nsJHgNEQMiP+2l+9Pz4idnpEWgyJt3GL4
         dneFI7Wh99N6rBbjudnorz4XIn5XiTkv+jr8JSL60g60+ubO4c9nz+NCtgTTly8C0diY
         XWg0yy6iLzUz9dBxJJ67Q9T3mvkVNcmFkOXu9S3osgYJ3sGEVsRFUBjhZutOhejZ2I4c
         zZwA==
X-Gm-Message-State: AOAM532TybihOvNWk1UaUQqgK31TqzP1DtlDR8HT32dUlj3XXOFu8u30
	Ozzy2UzSGwnHbZKMRihGB/z0N1WlGIsIOg==
X-Google-Smtp-Source: ABdhPJwMAhgcssHKMS80yrNB6Ps2kHtm1fvEkxPgbkvmh4QGVFBxhNnJtIHUuFyf9I7R46UvygJJlQ==
X-Received: by 2002:adf:a35d:: with SMTP id d29mr23370049wrb.307.1599512021048;
        Mon, 07 Sep 2020 13:53:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:40 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 19/19] python3-testtools: Avoid traceback2 module requirement
Date: Mon,  7 Sep 2020 21:53:21 +0100
Message-Id: <20200907205321.1941682-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

traceback2 adds traceback for python2. Rather than depend on traceback2, we're
python3 only so just use traceback.

This caused breakage in oe-selftest -j which uses testtools on the autobuilder
using buildtools-tarball.

[YOCTO #13652]

(From OE-Core rev: ee80a06c107375e3cf0d246ea17c09dda4536dab)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python3-testtools/no_traceback2.patch     | 23 +++++++++++++++++++
 .../python/python3-testtools_2.3.0.bb         |  2 ++
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-testtools/no_traceback2.patch

diff --git a/meta/recipes-devtools/python/python3-testtools/no_traceback2.patch b/meta/recipes-devtools/python/python3-testtools/no_traceback2.patch
new file mode 100644
index 00000000000..594510342b9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-testtools/no_traceback2.patch
@@ -0,0 +1,23 @@
+traceback2 adds traceback for python2. Rather than depend on traceback2, we're
+python3 only so just use traceback.
+This caused breakage in oe-selftest -j which uses testtools on the autobuilder
+using buildtools-tarball.
+
+Upstream-Status: Inappropriate [Our recipe is python3 specific]
+(Once py2 is EOL upstream probably could/should take this)
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: testtools-2.3.0/testtools/content.py
+===================================================================
+--- testtools-2.3.0.orig/testtools/content.py
++++ testtools-2.3.0/testtools/content.py
+@@ -19,8 +19,7 @@ import os
+ import sys
+ 
+ from extras import try_import
+-# To let setup.py work, make this a conditional import.
+-traceback = try_import('traceback2')
++import traceback
+ 
+ from testtools.compat import (
+     _b,
diff --git a/meta/recipes-devtools/python/python3-testtools_2.3.0.bb b/meta/recipes-devtools/python/python3-testtools_2.3.0.bb
index 896ecee65c5..a254b90a758 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.3.0.bb
@@ -1,2 +1,4 @@
 inherit setuptools3
 require python-testtools.inc
+
+SRC_URI += "file://no_traceback2.patch"
-- 
2.25.1

