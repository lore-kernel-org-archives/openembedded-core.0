Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.57667.1595862620707707094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xFmjOB8o;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id r11so1323465pfl.11
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PVUXeGmzvUIZ+mpPYkdtn0LYi6cJPJ6bpjiQpEayOZM=;
        b=xFmjOB8oPjflatPY3LpZScYtN0lPP2akcmzs7RFZNtzMQsFpw1Sjjt4C1u+CyOK8fK
         vQeQ3cMeR8ClnoH370H4Jt6kw/pTDPGpJReEeyWJoeFC1pcpN7Nq06eh01RKIIF5i2uv
         GFlhO91Jfpxyq05Uzlg9kRN8c3LecDOtwGvDcVn8yHC0wHXZsqZJsV52djpoca4MHtcN
         agsnhD7+D3f3mZoysp+bCsfFPFeSi1B4zGEhXrnBhZMa/yKE+xC5SBb1+UYuFeCoRLKU
         KcCWXiKtYdNAFuLFgqyU2PmN2mXJW9BsbDw3AyfCLSMV9wL5IoNxuDbLKNcvbaiDnaDz
         ncOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PVUXeGmzvUIZ+mpPYkdtn0LYi6cJPJ6bpjiQpEayOZM=;
        b=JtkT/e/vwhYalEHsRXUWL8snhm5XUhUPJMOQOHPY4Ad3TcL67bXeG38xVI1ycax68K
         WOns+Jy3gMOuRii2Jy6/R/2w3XsDRZU0E/hk1h2yGznhxALjPnxb84zMMtwBKDCOr1Gu
         olfztsgaSkpekKYbsa4JdbKuKycU9BpJOfErZEbev32HlU/J3HCxYz8PjUe/1VyUbJmV
         gxphCPR1YS870QghjLXCCQkYkkDpnzlRh2xpqz4qq8+vGmCJZItjpvtIdQvgMf+STWcj
         pOogGzp038RvMuNEQ8Fk2yx2WXC/sXq0pI5leBGTuz3EBXYOADLd2xn17UEBAoJsaHdb
         4eGg==
X-Gm-Message-State: AOAM531IXmVBXby92QSwXJNFAODPqhCtXGe9ffUFI7ytqH+V8dif3mvs
	CpTkxAYZAJRj/tUy27y1MMSQozP0uiU=
X-Google-Smtp-Source: ABdhPJxjGiAh6yPhFiXxmdgbdAxf3PeeOH7Gb72blOolMlLA/3B8xm0/XkPxMwWRicFdxdpA/IIlbQ==
X-Received: by 2002:a62:19c4:: with SMTP id 187mr20459202pfz.312.1595862619411;
        Mon, 27 Jul 2020 08:10:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:18 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/18] wic/filemap: Fall back to standard copy when no way to get the block map
Date: Mon, 27 Jul 2020 05:09:42 -1000
Message-Id: <66f9db48bb9d59f08492f0515bc08b6b039aa03f.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Kevin Hao <kexin.hao@windriver.com>

For some filesystems, such as aufs which may be used by docker container,
don't support either the SEEK_DATA/HOLE or FIEMAP to get the block
map. So add a FileNobmap class to fall back to standard copy when there
is no way to get the block map.

[Yocto #12988]

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7934ed49179242f15b413c0275040a3bb6b68876)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/filemap.py | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index f8c6e09d01..4d9da28172 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -469,6 +469,29 @@ class FilemapFiemap(_FilemapBase):
                         % (first_prev, last_prev))
         yield (first_prev, last_prev)
 
+class FilemapNobmap(_FilemapBase):
+    """
+    This class is used when both the 'SEEK_DATA/HOLE' and FIEMAP are not
+    supported by the filesystem or kernel.
+    """
+
+    def __init__(self, image, log=None):
+        """Refer the '_FilemapBase' class for the documentation."""
+
+        # Call the base class constructor first
+        _FilemapBase.__init__(self, image, log)
+        self._log.debug("FilemapNobmap: initializing")
+
+    def block_is_mapped(self, block):
+        """Refer the '_FilemapBase' class for the documentation."""
+        return True
+
+    def get_mapped_ranges(self, start, count):
+        """Refer the '_FilemapBase' class for the documentation."""
+        self._log.debug("FilemapNobmap: get_mapped_ranges(%d,  %d(%d))"
+                        % (start, count, start + count - 1))
+        yield (start, start + count -1)
+
 def filemap(image, log=None):
     """
     Create and return an instance of a Filemap class - 'FilemapFiemap' or
@@ -482,7 +505,10 @@ def filemap(image, log=None):
     try:
         return FilemapFiemap(image, log)
     except ErrorNotSupp:
-        return FilemapSeek(image, log)
+        try:
+            return FilemapSeek(image, log)
+        except ErrorNotSupp:
+            return FilemapNobmap(image, log)
 
 def sparse_copy(src_fname, dst_fname, skip=0, seek=0,
                 length=0, api=None):
-- 
2.17.1

