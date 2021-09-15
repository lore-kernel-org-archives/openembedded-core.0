Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.6331.1631706385548292524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 04:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AJ2h4Qny;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: pgowda.cve@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id k24so2432910pgh.8
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 04:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IvbEHxEzc3WFiiCPmQOIjAcOAynBaU5C/VY9MkyFo1I=;
        b=AJ2h4Qny/AoroWtum+6wCXtnDCa35ik2RxfysVyMX/O1sVSfOYAdXHJpVXmjziOm5p
         46OMymX7dDqVHw///TdQBAveZh8YqwZd36+9xXhYx889Gqc4dmdPaBVTMAV3uNEZp2Fl
         9IvRJ7egrnaEm9bU5UfPr903V4tAUI2muwaWGEMTWUMMqgkUzofNVc0SikM/riBtDWB8
         5pe5+YwoIGl/h6EktI43RWHRa3/F7f1EeThMRL0MQ+gtHl6ut6RDoRC0yaE9i2mLyR8S
         bMKB93bSindrih+66jPSmdqyF4GrrU6FmDQ0l+irXfWz8NLWPsnem7blqtCeJikaUJGU
         4wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IvbEHxEzc3WFiiCPmQOIjAcOAynBaU5C/VY9MkyFo1I=;
        b=odBqKz6NGmnuCec3UtxlyK985AjSM8hUzT7Oc1jOTXP1MJlQdybJHE2lPUTWkFGIE2
         APVlOxooJHOWFHPlBeOg9JFNRvPKgBn7nEhGUE/jSr8DiVgTEA0s7oTWAS+D2Y5LL3fw
         Z4/ZGLM1gK1UvOH/0kmKwdyBD9arzpNGA1RJpDLFYLOvb4Tt69gryrziP0G2t0HfEg/R
         apzNmK2ap6kRYJ/kaYYWRLre4JKt2tqaryiKxRZhvd+Pm6w9EkMrvXk1zqRR4fi0BAug
         fL+dxOKFRaGL9DOX2wJO6T+Fo1j1bxs9nIFX5beg6srsxGip5wV1tiaP13yxngdZAvgE
         ALVA==
X-Gm-Message-State: AOAM5330ptz00PE5mM4ixtKXhRBFP3rYFmy8zD6k3YdKiLTJzA5fihpx
	4wTKKIYp7kdnVsW2lkksnHTon2vB9+4=
X-Google-Smtp-Source: ABdhPJwt9OdVVoqVeY+L9uddXDhiykHPnfcoOmJR1HjSK/GrdrilKUabTGAihMdpWxH8gYyC3PKnLw==
X-Received: by 2002:a05:6a00:22d5:b0:440:3750:f5f4 with SMTP id f21-20020a056a0022d500b004403750f5f4mr1695646pfj.64.1631706384791;
        Wed, 15 Sep 2021 04:46:24 -0700 (PDT)
Return-Path: <pgowda.cve@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id s192sm15232418pgc.23.2021.09.15.04.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 04:46:24 -0700 (PDT)
From: "Pgowda" <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.m.engg@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] state/staging: Fix directory not deleted for race
Date: Wed, 15 Sep 2021 04:46:18 -0700
Message-Id: <20210915114618.157245-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The race issue resulted in some empty directories not being deleted.
During staging_copyfile, it results in "file already exists error" on
creating link for directories during do_prepare_recipe_sysroot.
The following patch checks whether the directory and its sub directories
have no files in it and removes them.

The issue was observed on running rust-hello-world for glibc and musl
one after the other.
TCLIBC=glibc MACHINE=qemuarm bitbake rust-hello-world
TCLIBC=musl MACHINE=qemuarm bitbake rust-hello-world

On fixing the above issue, it was found that
arm-poky-linux-musleabi.json files are not being generated.
$/del/build/tmp/work/x86_64-linux/rust-cross-arm/1.54.0-r0/targets/
arm-poky-linux-musleabi.json': No such file or directory

It is generated and builds successfully when musl lib is built standalone.
However, when musl is built after glibc or viceversa results in the
latter json file not being generated.

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 meta/classes/staging.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index af3397bab6..4b751af4d3 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -145,6 +145,16 @@ def staging_copyfile(c, target, dest, postinsts, seendirs):
     if os.path.islink(c):
         linkto = os.readlink(c)
         if os.path.lexists(dest):
+            # Check if directory is not deleted for race issue
+            if os.path.isdir(dest):
+                count = 0
+                for root, dirs, files in os.walk(dest):
+                    for Files in files:
+                        count += 1
+                if count == 0:
+                    import shutil
+                    shutil.rmtree(dest)
+                    os.symlink(linkto, dest)
             if not os.path.islink(dest):
                 raise OSError(errno.EEXIST, "Link %s already exists as a file" % dest, dest)
             if os.readlink(dest) == linkto:
-- 
2.31.1

