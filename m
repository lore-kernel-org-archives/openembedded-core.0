Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.12057.1586447584126164012
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 08:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TpEI4gUR;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id h2so247253wmb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 08:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sQn6QvR3ZSgLyvyyvoNcThmMRbw38uXlPlfUuaTh9Jw=;
        b=TpEI4gURW9r9dM3ec+KFuToD2Ut5PLEKvnAJOO0hE/xgbXlHd2ttZ0MUMc0xu8XjJ7
         t8sd7+9cloDyGoqho2IArrbrJEMIiAHGowWfhxZh6Cl5J7XsgLXvN4RHOX4bXCvWL81J
         jPfoRjS2wKd2LR7zlF5ItqmMZhpbVf6DMecghUyVEqTD4ohwEuF7cLpNup3crwkXl59Z
         iE9BKNMkWEOt3G0pA/NHslYAXOlgFE4zRzP41GNz5HIUWV8WPkod7RU0cA0SM8dGhSpw
         AoVkeKaiujGpPqjYXkwM3oBvqs3oigLiUbTK/CoP94V1uRuzuI+lBgoO29OJvDBWVD3T
         NmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=sQn6QvR3ZSgLyvyyvoNcThmMRbw38uXlPlfUuaTh9Jw=;
        b=e4v50Gi6b7Wt2WY7EYN/S0guuua6jhBJzuXofSfVbhYbYJJ1CnsVlx+MUlvjipxHD9
         PloM2zt3lG6xkYtkOO2zYfPpELzbcwgE/GVqBOg9ym+ER/JWXctJyhS04lJfwcjKQZoi
         XujL0WJL7oP2IhfyFlyRGPWSt68VG2WnXc+Ju/f9usAloyUCPisSGXnqg0Fcw9bttDYy
         JJ6CLOVzEFs3syryjPSj0UVVpzvOhBdwdqdUoHvv5BeBOLQkC8HGOvMgKf0l77OVqnKB
         uwTAvXROlUn3j/ASmcIP11YzqTHs4EkP/qjTOZyNxZLj2w3IlJrm8NGkzkofdUMNN8sI
         sD9g==
X-Gm-Message-State: AGi0PuaMa4SOWU6dbeOOgX/CHn68u+8XWoYu0fmOdA5/qxB6o69mB+V7
	aKfbIoVQ/UMcdZ+r39OKeek9EHRX7f8=
X-Google-Smtp-Source: APiQypLrfdmlkHTy909k2Op4O+CW9DKyXpof4j/4UWhP/YrbwEpVuD3lgg9bl4RUoEXPFUJ3gOCtEA==
X-Received: by 2002:a05:600c:2255:: with SMTP id a21mr532021wmm.150.1586447582393;
        Thu, 09 Apr 2020 08:53:02 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t67sm4253635wmt.48.2020.04.09.08.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 08:53:01 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v5 5/6] wic: Avoid creating invalid pseudo directory
Date: Thu,  9 Apr 2020 17:52:50 +0200
Message-Id: <20200409155251.982424-6-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409155251.982424-1-ricardo@ribalda.com>
References: <20200409155251.982424-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the source of the rootfs is not a bitbake cooked image, or it is not
pointing to the root of one, we call pseudo again, which will produce
a new pseudo folder at rootfs/../pseudo

Eg:

part /etc --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/home --fstype=ext4

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

