Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.344.1611586346923454507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=a8irHI6z;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id b8so7715757plh.12
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BcmNTvT5qIpThUGGd0ih8RCSyXRxCqpOAdfnJlZxAg0=;
        b=a8irHI6zTtISbuAX+UnkwDUwUuUwT7HT7mgdhMvsjWHAICSPRmE9fHM9B980l/Tf7C
         /ZkisFLnIQdpWkjxg0rpqXq8wjxA2pb4Lx23U+MupT3WcTRAMu2ZnjpDBU3MPMTn4IiH
         kew+6jPaeya2NyckQQKXGP5knXWWX8cNaP48wISeC4NmgRMJNtUytuKXaDnekm1MOr13
         oq+g2Ngz2EQJM1goQStreq2XA7hKoOnM7mh2lm4Po7wOGum7yjVg6nwwLDPR+6lMMZor
         WWiEQU0QLCxbnq/27cpTsj/bgajz8Nx9f5iQqccC47RQRykPo4HGA6Fawi03OSS2RYY9
         gjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BcmNTvT5qIpThUGGd0ih8RCSyXRxCqpOAdfnJlZxAg0=;
        b=uHdPkDKOks9M8mJIWJXPW++qDLgOC42vJ867YkB8nvAiyKLFGBiBWBWQ/v2YbeywmK
         qutHeCyfHIJm6ea0R2oGlEsVZORcB36nZNTOmecb0fM2gSWLv9oFkXZ7R2kiI3ngyE2H
         OkcX1TcFAQ6reF1fQGeZkBYOJ+TgeNkSCFYM4C2vdW+0UfGp/hA8OSlF8rWQpT40MFQo
         CcAujkEZTMecBPoprEJGU2y2DSqzLOBNSmnJpYRXIPnhbWmnYPCpsAg1voMfYMpLIZ9S
         Q8QFSvnEbfqyeYirRCjRDVgsWmgcN67bUazjYiUlY2fzpM+xKOrQofQoqJlOLd6A/hEa
         9ufg==
X-Gm-Message-State: AOAM532y8yUEQpEY8P9sNgJLOir0wkCyz7HyYgKhYI31Uxm9rkL8v8lR
	D5jNkMt9NHw4qHSiIOpWrH3FkgkhBcvn53UGQxQ=
X-Google-Smtp-Source: ABdhPJx7pgXz0j2vZLaNeV+2XowN0EHoHX2Ds7dAF+L3PbaXRW1NxXpysrLMEIIz+B8euPZFH8EuDw==
X-Received: by 2002:a17:902:a5cb:b029:de:cd0b:1424 with SMTP id t11-20020a170902a5cbb02900decd0b1424mr965887plq.63.1611586346035;
        Mon, 25 Jan 2021 06:52:26 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:52:25 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/47] wic: Avoid creating invalid pseudo directory
Date: Mon, 25 Jan 2021 04:50:48 -1000
Message-Id: <f03f82a1ca5da99249c25f1ceca64a8066dfbbb3.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 799a24ae78655f7a3eda7456b1a0ffaf3e43ec16)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/partition.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 18ecec2de9..1347571aa0 100644
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

