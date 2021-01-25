Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.378.1611586424420595514
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IWYQGRac;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id p15so8552108pjv.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DyD4gGVB2S8YNI3gIXKvnLBFr+RC9x8Fn3u6k6dSBnc=;
        b=IWYQGRacu3EEJrhi0M97Te7GVgaOYgE3DfUM2dkvS3xmN4lyaW9HgYY5aQPwLxGpur
         ke4mb6K8oqEngU5zu+pAruNuTxRWfzXKuk3wa9+ZWALHTvks+rqEqamDA+qVDNKx9N4d
         1DiglvXOHykyHxncSOmbG6Qug0Yh//ZR3/D8q/jhkXLqTK5IOSZ49WP7qEwIXFTi33hL
         2DGbD2gLWjWkmKtk+3h7iIqY5SoDCn0LudwY5wKn3q8RUPKqSyUH7xFLyn1T1CnIHib5
         HVX5OG+KWXwVljMlrEsSP9lK/lU6Iff/81bum6YAyTBiKJJzdO6GrUYySucaX4MXE9To
         nTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DyD4gGVB2S8YNI3gIXKvnLBFr+RC9x8Fn3u6k6dSBnc=;
        b=k4QIkOfdgLrl+L3jBroejovyEu0I1Lg6YJAfrP4jjPPK3/T1XA+3/nyg6pTmwlrhCY
         QB4kAR/ZjxNY54DYwvpY4ZCyrb1zotSV3zHdkmLbV3sc1AGQP/s06FyAVYOnT5m80zXz
         hbvvcWVWCg+cEwltIlhny2nLzOOk6Chx0+UBc/Y9LnVGrsgQx8G9wLkIZ5rOFoD/Sw1d
         pxpahZSfbun/QNJ34g7umw3bJLVGAAGAJKMbjvWK0fbt5ediFJjr5TAU5OnMMcIJS3Sj
         bpawY4XchPUnwBuVSnBDohPdr/hDKlI/QbdZwuX9oX+t2sezvD3NhCVm5DBr0krEKSs3
         vt3Q==
X-Gm-Message-State: AOAM532W9PSxoPINy96c+5+Mzg0zFRgYrFzWsFscI9YCiYnbFiklkC3K
	hVa+1uhjhpHtMNXEp1huxhTES8dq/7C+37y4JcE=
X-Google-Smtp-Source: ABdhPJygFC5J/7n/hgbE1RFWtlfbo12qD3JfFo3+kPpWs2GMEtJbh2Ftvwo+3sUdutTZEWhZeWsgAw==
X-Received: by 2002:a17:90a:b78a:: with SMTP id m10mr578980pjr.164.1611586423542;
        Mon, 25 Jan 2021 06:53:43 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:42 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 44/47] wic: Update pseudo db when excluding content from rootfs
Date: Mon, 25 Jan 2021 04:51:16 -1000
Message-Id: <da0d410ff0c0a952bb4a133b8821a061ddcad798.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

To exclude content from the rootfs, wic makes a copy (using hardlinks if
possible) of the rootfs directory and associated pseudo db, then removes
files & directories as needed. However if these files and directories
are removed using the python functions os.remove and shutil.rmtree, the
copied pseudo db will not be updated correctly. For files copied from
the original rootfs, if hardlinks were used successfully when copying
the rootfs this should mean that the relevant inodes can't be reused and
so the risk of pseudo aborts should be avoided. However, this logic
doesn't apply for directories (as they can't be hardlinked) or for files
added via the '--include-path' argument (as they weren't present in the
original rootfs) and so there remains some risk of inodes being reused
and the pseudo db becoming corrupted.

To fix this, use the 'rm' command under pseudo when removing files &
directories from the copied rootfs to ensure that the copied pseudo db
is updated.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d5db7e268947f0392c2126137571a44acd29ccd6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 8b2a067385..c96c539d03 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -129,17 +129,20 @@ class RootfsPlugin(SourcePlugin):
                     logger.error("'%s' points to a path outside the rootfs" % orig_path)
                     sys.exit(1)
 
+                if new_pseudo:
+                    pseudo = cls.__get_pseudo(native_sysroot, new_rootfs, new_pseudo)
+                else:
+                    pseudo = None
                 if path.endswith(os.sep):
                     # Delete content only.
                     for entry in os.listdir(full_path):
                         full_entry = os.path.join(full_path, entry)
-                        if os.path.isdir(full_entry) and not os.path.islink(full_entry):
-                            shutil.rmtree(full_entry)
-                        else:
-                            os.remove(full_entry)
+                        rm_cmd = "rm -rf %s" % (full_entry)
+                        exec_native_cmd(rm_cmd, native_sysroot, pseudo)
                 else:
                     # Delete whole directory.
-                    shutil.rmtree(full_path)
+                    rm_cmd = "rm -rf %s" % (full_path)
+                    exec_native_cmd(rm_cmd, native_sysroot, pseudo)
 
         part.prepare_rootfs(cr_workdir, oe_builddir,
                             new_rootfs or part.rootfs_dir, native_sysroot,
-- 
2.25.1

