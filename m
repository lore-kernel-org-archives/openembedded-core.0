Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web12.9635.1625830369856692043
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 04:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S5eRWgqG;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: uvv.mail@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id l5so12032119iok.7
        for <Openembedded-core@lists.openembedded.org>; Fri, 09 Jul 2021 04:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=izj81jdoTw+au03RnFA6LCUrF+ukVU7gSKiN+qB//3E=;
        b=S5eRWgqGMN26uKZfOkepKakVR4YegR3SBiA8mXAm8sZuaipCbpWwht4jNd/vC/1Wmi
         jeWj8G8pFC0YN4erEZaZ/jVmSm5L+LS96GRx5EigytZalLEG3ZZ/1nNJsl+GuLqGZdyz
         0LSnT6ZtCyWb8kcdVbX13KruyFKrax+cxvOhT1y9XerQL1Zgr+vn7hADL4Dq44RCQd40
         OzozgMsFPiIODi7AXv69sCc/yNTBzDfOsuao7+zM1arSdLc+HW7ChWUO9meX8R5d4rOH
         5aIOL6shlbuA0BsxuWTyIJxSuq1Zje74NkfOjsILk7TuqeXA0FPaZsu6R+NdmTk82yOw
         vvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=izj81jdoTw+au03RnFA6LCUrF+ukVU7gSKiN+qB//3E=;
        b=NZ57aPr6ck1mW9hKI8ZSOTrGW8VNYIMAU9Pq4WZHUizFXd10Mxcn0jdppAzyhueUOe
         eV9UnsVgTQQIgwYf0uWyDhK+8XUvz04lkMyAqYvBOBte6XZrlREd827TDlZn5FuTaZHT
         esPL4oSiOF7fPgsjQuHLo3Oxnyzqyu7RSTI4a+Vb3BQ8F0625l8fxbaTGqC05iwvd/LC
         aH8H4ywY6ArexBtw6YZcB1cX0M019uCU1y5S03RhcoW+Ccpv/vU+SzQ0zDLgFt13PjCp
         sMVQNOAxQfhagyX/5rnQKXaMWRQ5q60DQPabYsIQjxZFUud2t9ywd0CZOFHC3XgKNT0r
         czdA==
X-Gm-Message-State: AOAM533xvR+RWhrulGl9+0IsQb4Te++S53/Fdsu3eqIleWaOTQdnCbCv
	HNQpfwmZkfUyESpb3tIeO7rV5RkuvtKPpA==
X-Google-Smtp-Source: ABdhPJxeOteDV7qfhLWOLgfTaK9PYB3TM1/G0hiuXRPpUo/6ZgTmLyX/bTpykr1r+B1aI3YRUdbTXA==
X-Received: by 2002:a02:204:: with SMTP id 4mr14825618jau.66.1625830369180;
        Fri, 09 Jul 2021 04:32:49 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([37.120.205.173])
        by smtp.gmail.com with ESMTPSA id q7sm2570463ilv.17.2021.07.09.04.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 04:32:48 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 4/8] rootfs-postcommands: add QA check for overlayfs
Date: Fri,  9 Jul 2021 13:31:42 +0200
Message-Id: <20210709113146.69020-4-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210709113146.69020-1-uvv.mail@gmail.com>
References: <20210709113146.69020-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check is conditional and only enabled when overlayfs is set in
DISTRO_FEATURES

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index e66ed5938b..b6ddf5475c 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -39,7 +39,10 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd"
 
 ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs_qa_check;", "", d)}'
+
 inherit image-artifact-names
+inherit ${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs-qa", "", d)}
 
 # Sort the user and group entries in /etc by ID in order to make the content
 # deterministic. Package installs are not deterministic, causing the ordering
@@ -373,3 +376,24 @@ rootfs_reproducible () {
 		fi
 	fi
 }
+
+python overlayfs_qa_check() {
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

