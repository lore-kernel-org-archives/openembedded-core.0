Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.25324.1594154268530580974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 13:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=i/X47t/Z;
 spf=pass (domain: burtonini.com, ip: 209.85.221.68, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f68.google.com with SMTP id q5so46634406wru.6
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2020 13:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fyTollEHbpYg8SDpoAR8ZJITBF3mzo3VcMV23ZpOPfg=;
        b=i/X47t/Z9znAZ8v1GBAFa+wD4sGaJCTK16B0OlMlGYBnTfW0cFz//eMnMhtdu1Tp1f
         AfX0/i9+5dk2TIj/ycL2if0AJNk6JgM+DDTmweW7jKRboqvb8zyxYfcy7ca02h57dFZ3
         ekkKSZtul2KJ0n5JgO9QJWUToZ8sN/GuHr7utCOimDZ/iYNyMO9sdz6iaawEXDDvSdYX
         5bupE8NjAMFYE5BUaGRwUAtaaKhTT3ykX3TXoFF0NSkJSIRZIagt2sHeUdNdhZPlsAH2
         W04obWcXANwqlTVlFtKdjqTSSUOw9OdFmhSabXpHvdL/XUvpmeeEz+KCfAX+yX+7V4hJ
         rEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fyTollEHbpYg8SDpoAR8ZJITBF3mzo3VcMV23ZpOPfg=;
        b=ltRHVS2oA3emuChrk/5TXH4ANkSL9BQa+iyEFveyjxcFfubBu01pv9PdmZVEuzoSZ8
         BYprsauSDFfznojJPVUhJ6qkFgLJQXTufPKcwZoJ6DlE9Qox/k8/CvssJDPKzQkbrrBP
         XDYa6WfW/QljVrbLdhH/XnQbc1MBrMCiS3itIU4IUEhsHeLJGkqI5VxSRDqcqz5P7kZY
         vt87y3L0darhBGxBqNBGX5kKdDcAYxsWTpWsnTw6E2XmgHH3oGMLebxvu98/QJLWd4ze
         Abe3tE/4ehZIzvYvwh2+F/FMwvlO1MRXQvNaG6A0/LH/8RZrgBtA85DJZMvpCpOEqba2
         t3pQ==
X-Gm-Message-State: AOAM53315VVcFY33/Q05hhxyx7uSLOcFDBOaA+KB8NIVQoE4ix/uFveT
	FPjM3bmUJriIUeQb/15OTMEMpU0NQNrDWA==
X-Google-Smtp-Source: ABdhPJwToCtULtQA3+zLJWJW4YAEfgRFIfgJeB4h23LvN7BEbadufR3zdrJRPkVYgvZ/IjkD1GKvwA==
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr26587816wrj.14.1594154266731;
        Tue, 07 Jul 2020 13:37:46 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id v24sm2960437wrd.92.2020.07.07.13.37.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 13:37:46 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] insane: consolidate skipping of temporary do_package files
Date: Tue,  7 Jul 2020 21:37:42 +0100
Message-Id: <20200707203743.133023-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

During the course of do_package_rpm and friends the tools create a
top-level CONTROL or DEBIAN directory in the package directory.
do_package_qa needs to be aware of these files and ignore them, this was
previously done in just one check but instead should be done once when
building the file list so all the checks don't see the temporary files.

[ YOCTO #13804 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/insane.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 649aea1da1..89a516882b 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -459,10 +459,6 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     if os.path.islink(path):
         return
 
-    # Ignore ipk and deb's CONTROL dir
-    if path.find(name + "/CONTROL/") != -1 or path.find(name + "/DEBIAN/") != -1:
-        return
-
     tmpdir = bytes(d.getVar('TMPDIR'), encoding="utf-8")
     with open(path, 'rb') as f:
         file_content = f.read()
@@ -1034,7 +1030,14 @@ python do_package_qa () {
     pkgfiles = {}
     for pkg in packages:
         pkgfiles[pkg] = []
-        for walkroot, dirs, files in os.walk(os.path.join(pkgdest, pkg)):
+        pkgdir = os.path.join(pkgdest, pkg)
+        for walkroot, dirs, files in os.walk(pkgdir):
+            # Don't walk into top-level CONTROL or DEBIAN directories as these
+            # are temporary directories created by do_package.
+            if walkroot == pkgdir:
+                for control in ("CONTROL", "DEBIAN"):
+                    if control in dirs:
+                        dirs.remove(control)
             for file in files:
                 pkgfiles[pkg].append(os.path.join(walkroot, file))
 
-- 
2.26.2

