Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.12905.1594996680215677718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LPzjZx8j;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.193, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f193.google.com with SMTP id o1so5530022plk.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=FqRPytbcBo+IKF2ax44Qs5ZsIV56R/xBg8iJkpn+mVk=;
        b=LPzjZx8jnao66WxM+6WWWszNEP4texF7/v9J2RVwDwcx+igDTzOoRY7M6DKNcnmyN/
         3mVvj4CozAL5CWtPRlAEtl0nJ1RvsjLX5x9LWDRXmBbR3lExH3dDmeBJHDCLszvqBdQC
         5uahs0ZkMS3pnIU0K4/r9BBjPlDy6woD5GP3T6JeQiMoooYFjqN9Tmc94g1NKFedfet2
         hy5oeS2BUveSHrz5Nwsb4BS9bwVQ5bonWnqezJnYEktG3SetXJipHInFuiXBKcMS4wrM
         GsYmfeooBZynA4KrrQ9kuI1wJPns8XvsxUB2VnYorN0yHqdbHnNWy2dyvEfYPFnQ7R+f
         I8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=FqRPytbcBo+IKF2ax44Qs5ZsIV56R/xBg8iJkpn+mVk=;
        b=XZlTMXo9YOnN5a70gJRc4dHElaNPqtXz8YgIocv/UqnP+S+tHCGl5r3dMZ/GUYBt6j
         fhEnh4lfsuAYsIgF1A/ecXM9HVxkqcsDVYc1bL/rRijrRpO5HqVrkGBwm1WBUoxscS6S
         Y1D1C0yo2fXzANd1gGsrph8KisEL/IDOKZHQCd3igGOoqw/UlW7uncJMKphyuJ631hki
         27ERvCm8HD0pRIOswEPdKvAtE4fkYSlvlaJmmgWcaumxHjDbsgO20XgWDi/yxvRRKpT5
         2NS4RgZVAQAb+pmWGWs3s0rsooLg4vcK3TiQC7NQIY9yoDwXwx+5tcOMD2fFQJOTUDs8
         /fyA==
X-Gm-Message-State: AOAM530KNYGbqm1arPM4pGeghMp958eS5Xa8R1ss2BDjMk20HdR9a5Oo
	+HTtJZW+hrz690WTQcV6FmYNZXAJkg0=
X-Google-Smtp-Source: ABdhPJyd/1tiia2Aw8DBuT7xJ+I8Vf0sw2mwqVIfzKVx4U1X5U84BmxJz/UreacCJnpMj3JfTfMWGw==
X-Received: by 2002:a17:90a:b009:: with SMTP id x9mr3288149pjq.136.1594996679297;
        Fri, 17 Jul 2020 07:37:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.37.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:37:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/20] insane: consolidate skipping of temporary do_package files
Date: Fri, 17 Jul 2020 04:37:06 -1000
Message-Id: <0dbdcd305a969b67415ed74c3286af02612bd64c.1594996440.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Ross Burton <ross.burton@arm.com>

During the course of do_package_rpm and friends the tools create a
top-level CONTROL or DEBIAN directory in the package directory.
do_package_qa needs to be aware of these files and ignore them, this was
previously done in just one check but instead should be done once when
building the file list so all the checks don't see the temporary files.

[ YOCTO #13804 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4b2f45c47a5c8c800626f12c14f216a5ab923512)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3a0efa3ad6..1d76ae7c1d 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -458,10 +458,6 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     if os.path.islink(path):
         return
 
-    # Ignore ipk and deb's CONTROL dir
-    if path.find(name + "/CONTROL/") != -1 or path.find(name + "/DEBIAN/") != -1:
-        return
-
     tmpdir = bytes(d.getVar('TMPDIR'), encoding="utf-8")
     with open(path, 'rb') as f:
         file_content = f.read()
@@ -1023,7 +1019,14 @@ python do_package_qa () {
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
2.17.1

