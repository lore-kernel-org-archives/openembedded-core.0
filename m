Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.13116.1611672248666450577
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cn4192wT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id t25so3632517pga.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DyD4gGVB2S8YNI3gIXKvnLBFr+RC9x8Fn3u6k6dSBnc=;
        b=cn4192wT6/44cq5XimpHaMYzBEOdzxvkCw4v+BtFJBFJvRIXDndPOH5iyzDBu+ZW3C
         Em0jAG8RvGg0Domfa5uwvKoT6ysAdczz/C+3J8gV+Sp+HzQ0P9yKHMEfpgAhJAmes1dn
         9Q7u/oZhv9fLBnfWv3uDggHSeom9AlHc+5xTlbNNOICIOvXf7JDV6sBvHUcsHds8tqHH
         jtPgcTeO9RnA9xdEDpUij0wdj4WLyRGQaE/iyiJOIDF01i+SqX/ofsOMjAK9RD36oP0x
         hmcrgG3rS63f9e9u5qZe+AuJDk4c4wJV6RqYfiRDS+4+mHo3VgahwaXaNTQHuNMTYxxN
         8/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DyD4gGVB2S8YNI3gIXKvnLBFr+RC9x8Fn3u6k6dSBnc=;
        b=B1vPEzmBef1IU3koAtbiBbc7Pc5XooExhJ5xgEubXgzOKxxKVJWcbJoCz3OuzfdvPz
         5IWcA8oOpJiPZvkiFQZ3Xxy+FtB1sxTY+34cW7bhY5Ew+vt27pNDW42fD3AAlbOdOHqv
         38jYEb/+97vrfw0F2+F88c2TMyisqRdoM9COod/oVGpbdBx4ImU8ElgoiLQVvceXbApG
         NoRsJeWH/qaXMC6aJAL5AC/bQK9vboq0TEd8D/v0LusbtEQGxeoze+hjSSsnmtkUPyCv
         pae0/Hhavs/+lrL6qW7KmRJEbuPX+x282yx30q6kZiuDV4ctK0qwHZEdVJGuFZWFY2M0
         MPrQ==
X-Gm-Message-State: AOAM530v0FqG7oBZSrwKGpwqzNBmr+7Gdn4VU3PpuQPcqfMUHkWROdl0
	mDyd33aB1mav2SWvDSI+5cu8OZaR/XakvOwmHKI=
X-Google-Smtp-Source: ABdhPJzNMCcS9GQjJ4nH44d3V/gl7kAH5dAAYnbSd9GUTo2812lhPtoLfB6x1Ozo6B6nslLSwcXgkg==
X-Received: by 2002:a63:5407:: with SMTP id i7mr6024996pgb.418.1611672247715;
        Tue, 26 Jan 2021 06:44:07 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.44.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:44:06 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 43/46] wic: Update pseudo db when excluding content from rootfs
Date: Tue, 26 Jan 2021 04:41:54 -1000
Message-Id: <5c251ea02eeaeb0ea4ace76196191a2c93921d7d.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
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

