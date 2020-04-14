Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.11167.1586871389540058913
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 06:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pjDj7781;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id v9so5863711ljk.12
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 06:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rgz+fXa1n7w/1rzPsSmIwuGdziuSKGYCgl4Zf7oQlek=;
        b=pjDj7781meTgLMcwUJN9fnpBS6EmbTEvuR8NYaSeE7S3Q1FavGjV2l/F7CufzSxL3A
         DWlj6J2F/4c1OdaB6UR3qpC1p08/xdiVb3riOCf6cVyVKxRIih6mnKQqYLLJkCxEPccP
         AMhJU9fNFUwbv7ACW+JLU5tWh9KelujwN/o22vsXkVK7ViIG5ri5ZoVNzX8OSiARJjyH
         ASOR0ZdgwIDdpYP2/gW1Z9t13OJW9Gbp9ApLQS69+SEAPXVhkzoVFMsAn8qUUZ7wdidB
         7UMXHO67Yl+Lcf5kvbuGzJ6WmrOq+RFeDFTr844H7kRCEQoazWoRVnFUU948GtBTQjF/
         g4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=rgz+fXa1n7w/1rzPsSmIwuGdziuSKGYCgl4Zf7oQlek=;
        b=hsPOXVoUJnHjo/rPkGssSmuw8iRE48w+mMvDFsPn6FVLO4NE1gyDpoDLNYdzMgLXXU
         db7/29EkxI87Y2LQplMVGXQozmy9F8CLSMGJ31iP9fJjHgPB4y2tspCxvuyzooy0BNjs
         yl3aYhnYK34HK93yuqcrfQHG/CDApC/ZoJvtJDEFvaLj6o4L0VgrNnJcpciSjFqLRDqN
         T+zcqpvDHdCbUUlaTUplbWLfCvLYb6FSHSQLV2F22o7d5Gok4N1S0cZYlCe86VhB1/mi
         Ha0UXg5JfNxUoLEKF8j8aOIH9ySTJ68nxaFqX+cmbldKA2kwwBz9hyBBCghFcAQ9Fiao
         tEig==
X-Gm-Message-State: AGi0PuZkpMe9y/3wGd3TVQni5LGDnDlOngwFZ2/ma3FG+A+ix+tEMufG
	tWm2DcJ5FT5zDL03Ab2VUGGKanjvnFI=
X-Google-Smtp-Source: APiQypItddjm7iZiwiV7gjslUiZ5kiv/siMUUEfbuV81g4FTsrTjv4ZznqLhlvcCJezWFeUJl5AeCw==
X-Received: by 2002:a2e:9ac9:: with SMTP id p9mr146316ljj.222.1586871387124;
        Tue, 14 Apr 2020 06:36:27 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id o6sm9218344lji.15.2020.04.14.06.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 06:36:25 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v6 05/10] wic: Avoid creating invalid pseudo directory
Date: Tue, 14 Apr 2020 15:36:09 +0200
Message-Id: <20200414133614.1830058-6-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414133614.1830058-1-ricardo@ribalda.com>
References: <20200414133614.1830058-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

