Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.431.1606848751732496385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MMXoo1XS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id l23so1836327pjg.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VmRmM8D7RfzQENSukXBQZ+6zzNa/QwSALXXP13N/NU0=;
        b=MMXoo1XSI6JZfVV5342ehy0j1O35lSUefqEM68mZl+AlSol3nJ7faS8/qTeClfafre
         gz5vXjXfIHG3aXrItIazeP4SBdRsqu1gDK7p1JDtb0ckKgb6q1iAaYQZPtT9Xy+IRYkG
         cyX0SrS6QepI38XcZIbx42/o+glOiBKqQEkaJ1OI+r3pQz+DQqrqm1XpkQVp0bzIWQ90
         MElOKQ4n4z/B8fD3E52YLklaOe7YK6aqKUpR4mHjIlJ3VU+VEn7XQVyM2mXMBOZXLUgt
         vM/yk952aEvC8aUkf9AcaBNulQ46C29ZWgf0wynzSWGfyH50jn5NH/ZjN2iVaihMxKY8
         rO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VmRmM8D7RfzQENSukXBQZ+6zzNa/QwSALXXP13N/NU0=;
        b=qos225ozHyNShsaEQikHo2tk/vh5TEsPxiP7wVJ0jgmSEYUZm3QwOlRnBgILc/HgMS
         JqrzPFGW1REWSG+CojLuSXh69LagAtydJ1W0mtK4A7/COo8kDQNeyOpO34A6Qgo3hRfM
         nNPFwtkBWlmdhz4IhSZzzDt8J5flEYT1ycsjhpr5ceF1VDD59iK0TVWazfq0gUh4xNcc
         bOJznbn97HYhwvM1KKInqwWzkELTI97CVeeaYJZt0AGhu4D9p/m4i+oFOlIiWeQks0fp
         N+iQfmuidV/I7IMsifbBrx6uiq9swQvy8uCPpOfTIgdzrP8JLgTo3/jFxoE1KDT7t7N3
         Gzvg==
X-Gm-Message-State: AOAM531FFg397xVKU8IapeG4FkbEgpTY0Sfl7Tjq7kOcd5VlyXuOeoLP
	c4BcAFcLw/nhM8SLkKmMOzgr2BVci2VsP1G6
X-Google-Smtp-Source: ABdhPJysmmDvZXdhJerWSxIQcMIMGixpSczk6PVbg/bNqGHH7brRhpcDWAqIqeyXrjXwhsy0v+AWZA==
X-Received: by 2002:a17:90b:b0f:: with SMTP id bf15mr4078921pjb.202.1606848750898;
        Tue, 01 Dec 2020 10:52:30 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:30 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/16] roofs_*.bbclass: fix missing vardeps for do_rootfs
Date: Tue,  1 Dec 2020 08:51:47 -1000
Message-Id: <5ebd147ecb59a8b3b9919c5c96ebc1dd66fefa36.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

From: Loic Domaigne <tech@domaigne.com>

As per lib/oe/rootfs.py and lib/oe/package_manager/???/__init__.py
the PACKAGE_FEED baseurl is defined as the joined paths of:
URIS/BASE_PATHS/ARCHS

Therefore, the do_rootfs task should depend furthermore on
PACKAGE_FEED_{BASE_PATHS,ARCHS} to properly retrigger a build if
the value changes.

Signed-off-by: Loic Domaigne (ljd) <tech@domaigne.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5329464f5ebad909c4c9bd27a718bbd8f4cc221)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rootfs_deb.bbclass | 2 +-
 meta/classes/rootfs_ipk.bbclass | 2 +-
 meta/classes/rootfs_rpm.bbclass | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 2b93796a76..ef616da229 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -7,7 +7,7 @@ ROOTFS_PKGMANAGE = "dpkg apt"
 do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
 do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot bzip2-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_deb do_package_qa"
-do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
+do_rootfs[vardeps] += "PACKAGE_FEED_URIS PACKAGE_FEED_BASE_PATHS PACKAGE_FEED_ARCHS"
 
 do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 do_populate_sdk[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index e73d2bfdae..f1e0219732 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -11,7 +11,7 @@ ROOTFS_PKGMANAGE = "opkg ${EXTRAOPKGCONFIG}"
 do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_populate_sdk[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_ipk do_package_qa"
-do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
+do_rootfs[vardeps] += "PACKAGE_FEED_URIS PACKAGE_FEED_BASE_PATHS PACKAGE_FEED_ARCHS"
 
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
 do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 51f89ea990..ae0f541c49 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -24,7 +24,7 @@ do_rootfs[depends] += "${RPMROOTFSDEPENDS}"
 do_populate_sdk[depends] += "${RPMROOTFSDEPENDS}"
 
 do_rootfs[recrdeptask] += "do_package_write_rpm do_package_qa"
-do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
+do_rootfs[vardeps] += "PACKAGE_FEED_URIS PACKAGE_FEED_BASE_PATHS PACKAGE_FEED_ARCHS"
 
 python () {
     if d.getVar('BUILD_IMAGES_FROM_FEEDS'):
-- 
2.17.1

