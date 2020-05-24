Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.11554.1590315849560427826
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 03:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LK0NBCqf;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: gzatko@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id v19so7108083wmj.0
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2020 03:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BQE+mRoAoRRMfALKKEQSVhGbe/54YL94HIv51g2ttmc=;
        b=LK0NBCqfQ8uA9cn7jmmWNuxSu4paGj6mgu7S4cdrv7X2l71yK1HP6XMkvkGgROLdtc
         dx/5e3Sym77laCWL6j8gRmemJnpftka3aOKm5MUwR4KU8k6IZATDb/Mv2CDLdq+Ef+DE
         I1h+u6NW0yljiguYXNc3OBrKucJ2rDh+osXLFTwUY1koHjQRLWlIKgq+IdiA3EgUP077
         +9UjqKEIwYXIybJpF9mmwMhMNZgoXD89Di61kgQUaNrg1yDRCLr38aNriLQeIKzLjAWm
         R806TI4KqjV3YzmmgPsYC/ZV+sPXJSq/sjS7BqQDe+tPDZVCoF6VW+CnD2bhscEeplLq
         siNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BQE+mRoAoRRMfALKKEQSVhGbe/54YL94HIv51g2ttmc=;
        b=AwcoWmex+kOobac0c0mYF1eOaNXGcJvI52VuS2sS5gMVOtu825+Z3n4QXwN/vLo1Pu
         cMZxPCRPIlCxuvFekyHQyX5p2Cm9brphVBcM2KB383SZ4z7OkeLGhJsgVl9g0N5nwhBg
         RphCfV0GFgnzoobdkX0nS8rNtuQK4jwxdKMEQkpUUnBP7f2Lm6nS1g/OVROpK7vm0V8a
         8FJ0COQY4ibDV4viEcH+UVemzuWCxlsCBXmniab3pwf6TPUFGInXpDxWVSFdvd9HZ7T4
         eW1gKcYEA62XdMPULOsm91HDfcuPP43euNuE+PW41RKnKIXkrOnal/efHg7Ni62duNAh
         KOkg==
X-Gm-Message-State: AOAM531ah4qoyrAdQW7FbUNxLOQG5s1YqPVmla+Mwh3BSl1/Hd45UtYP
	RqJtJhv7mGPnUjkQOTQeIbBpGlVoHqg=
X-Google-Smtp-Source: ABdhPJz5iiHORsJutrgv5u1w8TFCezdsElFwhy9bfuDsG/GUXGX5tOqIkembWL8dxrEhbtJ9P8T59w==
X-Received: by 2002:a1c:998c:: with SMTP id b134mr16076908wme.78.1590315847336;
        Sun, 24 May 2020 03:24:07 -0700 (PDT)
Return-Path: <gzatko@gmail.com>
Received: from blizzard-1040g6.lan (93.184.67.240.host.vnet.sk. [93.184.67.240])
        by smtp.gmail.com with ESMTPSA id i3sm9399887wrm.83.2020.05.24.03.24.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 03:24:06 -0700 (PDT)
From: "Gregor Zatko" <gzatko@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity.bbclass: Detect and fail if 'inherit' is used in conf file
Date: Sun, 24 May 2020 12:24:04 +0200
Message-Id: <20200524102404.3931276-1-gzatko@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'inherit' directive may not be used in conf files as it's supposed
to be used for the inheritance of classes.
Correct form in conf file is INHERIT.

This commit adds:
- a sanity check to find whether the wrong case exists
- fail the build if so
- tell user about the difference in directives

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5426

Signed-off-by: Gregor Zatko <gzatko@gmail.com>
---
 meta/classes/sanity.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 292c5591dd..e021b9d240 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -784,6 +784,12 @@ def check_sanity_everybuild(status, d):
     if "." in paths or "./" in paths or "" in paths:
         status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
 
+    # Check whether 'inherit' directive is found (used for a class to inherit)
+    # in conf file it's supposed to be uppercase INHERIT
+    inherit = d.getVar('inherit')
+    if inherit:
+        status.addresult("Please don't use inherit directive in your local.conf. The directive is supposed to be used in classes and recipes only to inherit of bbclasses. Here INHERIT should be used.\n")
+
     # Check that the DISTRO is valid, if set
     # need to take into account DISTRO renaming DISTRO
     distro = d.getVar('DISTRO')
-- 
2.26.2

