Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.13473.1611073581147626222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 08:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jN0Arwbh;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id c12so1803976wrc.7
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 08:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nDSNwDtbrXbeOcq8rz2RhiYRB2M0xm/mxCeyTgaatM8=;
        b=jN0Arwbh4+Q0qqvZ+QU3KpOyG8zVCI0xFh4GA+WCB2cwXKuuiIlnP4dswEslY5jO9Z
         p87oYraoPXwed32jge0cKEhE57JcE4eJS394NW3BZlmVr/NEcVN1PeMMla2n0naR5XEd
         rbfzaCu1C6FEv8WY/uXBlWnd9VyC58N428kDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nDSNwDtbrXbeOcq8rz2RhiYRB2M0xm/mxCeyTgaatM8=;
        b=rJyXr5qZi2CWUo+dd1dVA4xwnhmDK1IawGoN+utJn1T380zsv0K2E1A0yuwWYd90Xv
         fIaNxjj0xuytooYvOidM7Uot5TlEQIPmxBsDrjmiEZNxBHYW9CyfoawSYs8ImLwS58AZ
         Ypd42Gh3kMlpCLQmllEm5NbZaFGZjLgKiSZmBoQhR3QJLDb8oHVi1O4orkQ3PqXRSA16
         2uPpAx88lzRzHxAWu3F+Zcc32oZHHQ6Ydez8zAK3KE1IgfyhEzs7SCTTUyE5iYO5Lrxi
         fyj9tl7bFY2lZw8tIL29kXpwUVgmZVOvImt5G3DTkOkIFgH6yeKScybedykTRfP2COK5
         5uZA==
X-Gm-Message-State: AOAM5314OjMk2WU2qZI/IjRrk8im/ImHevAFlgtX807a+rTUsJ5IxP9j
	vQnhOm82GPUfNoNsWclLptkd3q86Zvi2Vg==
X-Google-Smtp-Source: ABdhPJzs2jxkZn1QY7tX1lQFVXreK8hGPEBK1Q1ypxqNhOPbOIjRRbx7h2kCOqfcqk0W10scgDOKkw==
X-Received: by 2002:adf:fb05:: with SMTP id c5mr5089708wrr.69.1611073579549;
        Tue, 19 Jan 2021 08:26:19 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust80.12-4.cable.virginm.net. [80.7.160.81])
        by smtp.gmail.com with ESMTPSA id d85sm9223754wmd.2.2021.01.19.08.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 08:26:18 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 3/5] wic: Update pseudo db when excluding content from rootfs
Date: Tue, 19 Jan 2021 16:26:08 +0000
Message-Id: <20210119162610.13104-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210119162610.13104-1-pbarker@konsulko.com>
References: <20210119162610.13104-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 scripts/lib/wic/plugins/source/rootfs.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index f1db83f8a1..afb1eb9202 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -199,17 +199,20 @@ class RootfsPlugin(SourcePlugin):
                 if not os.path.lexists(full_path):
                     continue
 
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
2.26.2

