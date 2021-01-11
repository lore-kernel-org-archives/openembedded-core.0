Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.32277.1610361179574186290
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 02:32:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DUiVo+uP;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 3so14522232wmg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 02:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nDSNwDtbrXbeOcq8rz2RhiYRB2M0xm/mxCeyTgaatM8=;
        b=DUiVo+uPg+0F7R9ULccc/OEXM36aLL0cVRXPycgjdtCCmU0JCNn3xkhDrXvsW2gulV
         5nna76wIQx2Fhn2k+0cHOUr2Q5LdyDdzpmY0q0DcON5VIZwdqnekJAtpIBxNG0URoX7C
         pmq72Jwy1uLLv85uJGs8E5L/N1vPthZ29yLiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nDSNwDtbrXbeOcq8rz2RhiYRB2M0xm/mxCeyTgaatM8=;
        b=oXVl2AkD9GlOqdzPMIi5tOdZDAU3vATihzE8FdVX4636WYpwC3fGWL72Ht6V7wi05C
         Kjcg1bUHRvWGKW6uKkPBhfLH3AFixxRkLz6a0oYKLRg2cf5loOL0wlOr0qG2sJ4mXgQE
         uCsbNubtDqAjIIz7ySl7RhfAZkfdFl2Yk6Utjl9MO7NGuiQdQr12cRMg/gY2+fB3gf8L
         6XJW3bOxDq5XBguKlmCqB/jqncS0p5WLz4Q+aZVFzZmZnNNpCh+KdX6oDGY1emHRH8oQ
         S/q8dyhLeTJT/8ewmSIVxpWM9Fs6FdIrkhjaCx7NC0fVVmq64fgFNsw36nGcRqgYmVYc
         Fu9g==
X-Gm-Message-State: AOAM531NFyDcUX05Pijgb7bwRh2k2YupJ8nqRo9vk2Ocv3DDHf4aeIN8
	Br3iTiW1Xf/RZ7/L+O7yHbEo7dfTZm2Lxg==
X-Google-Smtp-Source: ABdhPJxwuowMUKHcw7so3Nn8H4wN8QyI+yqoFi0T5w7VZlw5EjHCkDT1vPtt84+8aRqx+7VmS6+Bhg==
X-Received: by 2002:a1c:4184:: with SMTP id o126mr13622121wma.107.1610361177969;
        Mon, 11 Jan 2021 02:32:57 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust80.12-4.cable.virginm.net. [80.7.160.81])
        by smtp.gmail.com with ESMTPSA id a13sm23536969wrt.96.2021.01.11.02.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 02:32:57 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 4/6] wic: Update pseudo db when excluding content from rootfs
Date: Mon, 11 Jan 2021 10:32:45 +0000
Message-Id: <20210111103247.11685-4-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111103247.11685-1-pbarker@konsulko.com>
References: <20210111103247.11685-1-pbarker@konsulko.com>
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

