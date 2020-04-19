Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.12668.1587278151141829933
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 23:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ap03Lgfb;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id u13so7990474wrp.3
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 23:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lQV2Rp865w8/Ok5hub1tAEN0SIPbXH28cesRMqhhG2E=;
        b=ap03LgfbNjGelz600NSX6fn+olA4lEHCTTBrpmkEKXhlSUmGctRVld3rjRpCGLiNlb
         mDXa8/iC74eyEr9MAUo/yPIo4VfAMljwzacjsWVAhql277g31vuJ3Xq4XSeye5cRQxLJ
         EZZ6JJCEtzt5aXf0a4UnqlRnTwNxiRMiph8QocjFNY8BLIcHZk/GWyFrKpq7GSfONuGf
         HuDUV11OcbVM4YCfVgc0QbQWXEG+oIR+7s54hQeK5ORuM3TXOh/BrzJ800/uxryrpfEH
         zPX5bndZvADjLra5wT150cM9mR6QwSWOHm3E4X8OE3//A6+XEBHg+ZclQcgoBvGC3wtX
         Y99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=lQV2Rp865w8/Ok5hub1tAEN0SIPbXH28cesRMqhhG2E=;
        b=Ie6zEUQi0ZTFs8YSpaUO9pwnGyHnwdDV8hIiUcAo6Hld2KVH6eUzIZ8OR8gkN0+/jC
         nItZrAEOeVEuoqiKUgR5N5KF8VMYAqmHSpJTZjh/+WrCbxPWKR21ySf46JUwI83+2EHV
         WJLtybFYOJWUm+GrNauXhZXtRbJN9dtJRB7ngoxa+Umqb0TevHCXy07O5+4WeexY/LFL
         w5vgEhaTZSG1bIs/EWWdHBFGgHtfDY9wDqmGDb591CBxVImY7pJ5GTxbrICK3qzkJMUR
         Bb8Nzl0N6VMJeZDjlhaEB16jxZz0IZWAkkcA+bS0dfC3i3CXlh8m1eR5zTZBv7yNpkCQ
         j4mg==
X-Gm-Message-State: AGi0PuYRbootIunpcSvIeNKui8GMWDbXzDJX7avPtSzjt7TmuqAtjTzH
	Uqn4l69Qda6rYUx9ZwuAVTDmTAu9ai0=
X-Google-Smtp-Source: APiQypIuCMGoNjnuM2IZJbfM4LxUpdmjwKU433XXzODPHKzAhaNY0RFeTRUNfT0O889kPTe+3jFWtg==
X-Received: by 2002:a5d:6a8b:: with SMTP id s11mr12074061wru.258.1587278149212;
        Sat, 18 Apr 2020 23:35:49 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id n6sm13980266wmc.28.2020.04.18.23.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 23:35:48 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v7 05/10] wic: Avoid creating invalid pseudo directory
Date: Sun, 19 Apr 2020 08:35:33 +0200
Message-Id: <20200419063539.1467641-6-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200419063539.1467641-1-ricardo@ribalda.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

If the source of the rootfs is not a bitbake cooked image, or it is not
pointing to the root of one, we call pseudo again, which will produce
a new pseudo folder at rootfs/../pseudo

Eg:

part /etc --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/home --fstype=ext4

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 scripts/lib/wic/partition.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 3240be072a..7d9dd616a6 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -199,13 +199,14 @@ class Partition():
         Currently handles ext2/3/4, btrfs, vfat and squashfs.
         """
         p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
-        if (pseudo_dir == None):
-            pseudo_dir = "%s/../pseudo" %  rootfs_dir
-        pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
-        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
-        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
-        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
-        pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
+        if (pseudo_dir):
+            pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
+            pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
+            pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
+            pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
+            pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
+        else:
+            pseudo = None
 
         rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
                                          self.lineno, self.fstype)
-- 
2.25.1

