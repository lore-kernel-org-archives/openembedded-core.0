Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18625C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:59 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.108.1667835454986864964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=8AFfrfRH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id k7so11394358pll.6
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdQF9NKkLbXuQ6mWDRgcXx/i0EWV6RsUa4R2WMCUalw=;
        b=8AFfrfRH8vYgFh7S9rpKJ8ZerE1t4EEPK4wd9wr8uyVikf75oN5H5AO7ACdpzh2/1Y
         p9YKcjZpM9zp05ww0YBx6k7W8tDWsXjU3iGhqrV/rF7yZ0i/h8W7HAMi5jCbQo/yzslL
         L60BtPCCCcGxvyopt9TEo2cQEa+71JzzSz/GWPn18sRIXx+UErfaODRLQ4M8JW2KEx2p
         lYn3TciMNnjkxvLhfHsgFKU9dIziRGYVvXE2nNsJGQ5MlCjOHS3LiwZjFzg4Lh8dOvMH
         InSSLkW2t4wVL8HfDr7E4wRHh+YJogFSruM3TXRXigorOrANYnr7Y4qC7HpxdN5EC/bi
         DuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdQF9NKkLbXuQ6mWDRgcXx/i0EWV6RsUa4R2WMCUalw=;
        b=WZA16/3rRh8yu07HLWvbLqkIZwYT4l2Ci6SVrQobVhs9Umtit1ReNxrbF4es85tkoO
         zr3jlEPsKmrWBmDVY55K/lRrbXXQqOUfK4JuBlz/hgLPb1G4jOv2C3L4T+dxlELGQ0fI
         e4mV4jl4BPqUL228skrxea7ylmXdXC5l6s+qwY4M5fl+ySVdDcpmSjXoucw3VVJi8yAl
         lt/aTCrQWRmMDEkp21F8pRw/kKLofr27vd8t4erlTi/g5Kr3gzwR/CppKtjTCahl3u0A
         BIksHe2WRD20GllDJ+M5NGEdb/uuopLqL4v6tWR1LR5HzgjFUU747piwTj4pkOdn56bM
         6c+w==
X-Gm-Message-State: ANoB5pmh926aeLJtOS7VjCvkiOMWzQwloVzXJKRw/ppRo4XvA1f0c49J
	muNFYf58ZcGebUtFX2kpdqW7LQIJKY8kG9RU
X-Google-Smtp-Source: AA0mqf4WZFMg8BeWrX3ryK84FU3/8SXHWqdV2O4ZZ6n/N+0Vu5/R9JvEUpcvxQZy8kKOcX4h0LYKgQ==
X-Received: by 2002:a17:902:cf11:b0:188:7dca:6f2a with SMTP id i17-20020a170902cf1100b001887dca6f2amr7270048plg.2.1667835454000;
        Mon, 07 Nov 2022 07:37:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/25] wic: honor the SOURCE_DATE_EPOCH in case of updated fstab
Date: Mon,  7 Nov 2022 05:36:38 -1000
Message-Id: <2671667f33d0eac1425db3fc4dff56d4eed1eb3c.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172917

From: Sergei Zhmylev <s.zhmylev@yadro.com>

In case user requested to build a binary repeatable package,
it's required to honor the SOURCE_DATE_EPOCH environment
variable. So forcefully set mtime inside all the routines
which modify fstab in case it is updated.

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 99719a3712a88dce8450994d995803e126e49115)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/partition.py             | 7 ++++++-
 scripts/lib/wic/plugins/imager/direct.py | 3 +++
 scripts/lib/wic/plugins/source/rootfs.py | 2 +-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 09e491dd49..7c288d2958 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -293,6 +293,11 @@ class Partition():
                 f.write("cd etc\n")
                 f.write("rm fstab\n")
                 f.write("write %s fstab\n" % (self.updated_fstab_path))
+                if os.getenv('SOURCE_DATE_EPOCH'):
+                    fstab_time = int(os.getenv('SOURCE_DATE_EPOCH'))
+                    for time in ["atime", "mtime", "ctime"]:
+                        f.write("set_inode_field fstab %s %s\n" % (time, hex(fstab_time)))
+                        f.write("set_inode_field fstab %s_extra 0\n" % (time))
             debugfs_cmd = "debugfs -w -f %s %s" % (debugfs_script_path, rootfs)
             exec_native_cmd(debugfs_cmd, native_sysroot)
 
@@ -352,7 +357,7 @@ class Partition():
         exec_native_cmd(mcopy_cmd, native_sysroot)
 
         if self.updated_fstab_path and self.has_fstab and not self.no_fstab_update:
-            mcopy_cmd = "mcopy -i %s %s ::/etc/fstab" % (rootfs, self.updated_fstab_path)
+            mcopy_cmd = "mcopy -m -i %s %s ::/etc/fstab" % (rootfs, self.updated_fstab_path)
             exec_native_cmd(mcopy_cmd, native_sysroot)
 
         chmod_cmd = "chmod 644 %s" % rootfs
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 4d0b836ef6..685d19b30f 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -148,6 +148,9 @@ class DirectPlugin(ImagerPlugin):
             self.updated_fstab_path = os.path.join(self.workdir, "fstab")
             with open(self.updated_fstab_path, "w") as f:
                 f.writelines(fstab_lines)
+            if os.getenv('SOURCE_DATE_EPOCH'):
+                fstab_time = int(os.getenv('SOURCE_DATE_EPOCH'))
+                os.utime(self.updated_fstab_path, (fstab_time, fstab_time))
 
     def _full_path(self, path, name, extention):
         """ Construct full file path to a file we generate. """
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index fc06312ee4..e29f3a4c2f 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -224,7 +224,7 @@ class RootfsPlugin(SourcePlugin):
             if part.update_fstab_in_rootfs and part.has_fstab and not part.no_fstab_update:
                 fstab_path = os.path.join(new_rootfs, "etc/fstab")
                 # Assume that fstab should always be owned by root with fixed permissions
-                install_cmd = "install -m 0644 %s %s" % (part.updated_fstab_path, fstab_path)
+                install_cmd = "install -m 0644 -p %s %s" % (part.updated_fstab_path, fstab_path)
                 if new_pseudo:
                     pseudo = cls.__get_pseudo(native_sysroot, new_rootfs, new_pseudo)
                 else:
-- 
2.25.1


