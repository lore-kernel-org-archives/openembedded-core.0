Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.3848.1628251610127262272
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 05:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oKHkJOXx;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id b13so10788384wrs.3
        for <Openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 05:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gdHz6BOjeLcZw3jf//eJXDnmAArcClHApRpSLwq5T8s=;
        b=oKHkJOXxUmzcKn5fYbIKP3HbSSV15dyEJm80EgVYZl+6YqazV+whlZiFYuoU0zJus2
         UNTvaNsVMKi91ejy3YCHJmSlZlyFdhb+L8ZwlStpe8p7+/YQm2v+piASQA6ZgHeXv9D7
         qtMdXa2OfbOnlpAcqr/50lAcraGzOJC7r86lOpAVOy25sWJrcJa2oP3gKsRt00oln+D/
         FU/M83eHgxVH/5Hs4+MumdtSzOPmEMpdm9HQaAme10JCHsgWcjIEWkjaXf/xKYtMqt+o
         9PaQtt/6bxOLJBs5WjfloS8Sj/jODiFbnrYADVZ/Ai/r71o3dinoh+505dO51oDv+CpI
         x6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gdHz6BOjeLcZw3jf//eJXDnmAArcClHApRpSLwq5T8s=;
        b=TET2heYdyRNf/kn6ZFe0rC5wq1wTlrafCg9NTGA8iyAwPZFM6XnnODjvc85jeHaC3J
         4Q00sv4XeZKPr5a0OA5XvLG22MLYIGnORl46RVKqla0thZ303LgI1+Lx3YMbG28zxm5A
         hHT2Nzge0ARvjWEPzMqxk7vepjvfnfZGl5jNsbdhmRK1WW3bZOlxzfADU2ynCctNYUA9
         PG8+7B4RanOdn0E9mEI29talP7Rv5/m5qYUHQFMfjvKoOSwt66weT+JPR9nVpSCVXFAZ
         UMpbo1m7PRKDEgNdmRDIAB4U7yLqkzGLBJP/yJVayrjJpi6HY+K82Xa8Unfcvs/xNLsW
         I+nQ==
X-Gm-Message-State: AOAM531UnBUEr8JoHuKDDKKn38Y6vEJl/KM7vpArQ+xFtXINq0Zla+ot
	S+QX+NWEtgiHY+xQbgV+jSjcC4XJ8vlOjWbT
X-Google-Smtp-Source: ABdhPJzUQXoQQ4wjRxRkUKcOcPmfWnjp52bbGBGjVyu55Zcaf6Y7v1kHRbYWA6IDANWXgCHdjF32kA==
X-Received: by 2002:a5d:6389:: with SMTP id p9mr10605514wru.1.1628251608543;
        Fri, 06 Aug 2021 05:06:48 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([194.99.105.70])
        by smtp.gmail.com with ESMTPSA id n11sm11093049wrs.81.2021.08.06.05.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 05:06:48 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v4 3/7] rootfs-postcommands: add QA check for overlayfs
Date: Fri,  6 Aug 2021 14:06:07 +0200
Message-Id: <20210806120611.124246-3-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210806120611.124246-1-uvv.mail@gmail.com>
References: <20210806120611.124246-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check is conditional and only enabled when overlayfs is set in
DISTRO_FEATURES

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index fbfa63fcb3..c5746eba13 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -39,6 +39,8 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd"
 
 ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs_qa_check;", "", d)}'
+
 inherit image-artifact-names
 
 # Sort the user and group entries in /etc by ID in order to make the content
@@ -373,3 +375,26 @@ rootfs_reproducible () {
 		fi
 	fi
 }
+
+python overlayfs_qa_check() {
+    from oe.overlayfs import mountUnitName
+
+    # this is a dumb check for unit existence, not its validity
+    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
+    imagepath = d.getVar("IMAGE_ROOTFS")
+    searchpaths = [oe.path.join(imagepath, d.getVar("sysconfdir"), "systemd", "system"),
+                   oe.path.join(imagepath, d.getVar("systemd_system_unitdir"))]
+
+    allUnitExist = True;
+    for mountPoint in overlayMountPoints:
+        path = d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint)
+        unit = mountUnitName(path)
+
+        if not any(os.path.isfile(oe.path.join(dirpath, unit))
+                   for dirpath in searchpaths):
+            bb.warn('Unit name %s not found in systemd unit directories' % unit)
+            allUnitExist = False;
+
+    if not allUnitExist:
+        bb.fatal('Not all mount units are installed by the BSP')
+}
-- 
2.28.0

