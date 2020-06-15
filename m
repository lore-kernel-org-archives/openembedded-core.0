Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.26523.1592249812958099265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ulBGTPuD;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id ne5so263817pjb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=hUR8DNwTU1VjLNFSaDF4q9HQdZHeJ/O2ITVozUZV3CI=;
        b=ulBGTPuDc7c1VaVvv1+xtF+gR99Ja/HZ/bmvoarmVzGhhG6+dCTMY9hgU6KkBid9JK
         BDa2ptBFQ+Hql1dIuGhM+6oDLEZmXV/W2toI011NnPQSASY0sv/YES5gmrnvZGGdILdr
         PG97dllwBgW0QZmlZ3Cp9apy6TG15GVDVkkCV/X4FKVqlQ3YksaBrFCVPU1uH+h5nT5g
         zhgMWbOs9oSXtltJOsQ78C/EBBwemgO+cIeZmLpsVuieU74/NsnHEeJ+l50u/aT4yhFt
         Z49634RskoHRBR7xJh/YdCppSL+koWyimVEUwqglGfglF14PChdNkQuZUvr24ITtdk8A
         Q/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=hUR8DNwTU1VjLNFSaDF4q9HQdZHeJ/O2ITVozUZV3CI=;
        b=Icl9mLHylR6TvjtVnHlcI4CYW0184DnKYGBlyWla3oKdV6NP/v+xVqtAMYQ2ZcCXgw
         0W8IbVm+8BX1deeWM7s+g0NY2Hsx/AEx5ElboOnOoCls+es6bwfRtJZCBx/YdZATMMDH
         l9dqdVKMd5dL3gXYPcnxVI9lh8b9BGyGOenr5k5LI0b8VC4ZGbqtcXvf+9tHKIRtIPM1
         +DEiYy2Raj7Mug4kR6zIEbeqJGfSgem6jxBsD4vVAdjKulIMi+1eUpPmHkkhCeSYpVYx
         zcjflQIQPmhtlc/bFxXCDde4IvFxRGNNt7gKGAzL9syA2EVAz6d5Jt1uv2dFcreJn/64
         rMhw==
X-Gm-Message-State: AOAM532k8niiw9pK3dpLIaGFQHLLoUTtye/kF0Rp57JeF4s0gbPiz/fG
	Tmea4JKlVYA4PK3ku8tPiai7MlzyCCI=
X-Google-Smtp-Source: ABdhPJx3yeAucltoAX03w/VWcbfHibKc/I0NdiHtZWeJ23i9xt5QUAYT6Fi7IMWvB1qGlNDC4I9Fhg==
X-Received: by 2002:a17:902:7c81:: with SMTP id y1mr24481173pll.236.1592249811898;
        Mon, 15 Jun 2020 12:36:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/21] build-sysroots: add sysroot paths with native binaries to PATH
Date: Mon, 15 Jun 2020 09:35:39 -1000
Message-Id: <20af231e71bc788b02cf4a5b2e3e2471feea9f17.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

staging_populate_sysroot_dir() collects postinsts from the sysroot
and executes them. These postinsts, in turn, may call binaries that
are only available from the sysroot. This works fine with recipe-specific
sysroots, as all necessary paths are already in PATH, but breaks down
in this recipe which imitates the old global sysroot way but doesn't adjust
the PATH to include the binary paths from global sysroot.

To reproduce the failure:

$ bitbake docbook-xml-dtd4-native
$ bitbake -c build_native_sysroot build-sysroots

...

Exception: subprocess.CalledProcessError: Command '/home/akanavin/build/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog' returned non-zero exit status 127.

Subprocess output:
/home/akanavin/build/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog: 5: /home/akanavin/build/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog: xmlcatalog: not found
/home/akanavin/build/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog: 8: /home/akanavin/build/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog: xmlcatalog: not found

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b5f7bda4204d45cd29670cefcd53dc5da031095)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/build-sysroots.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/build-sysroots.bb b/meta/recipes-core/meta/build-sysroots.bb
index 7a712e2f38..ad22a75eb2 100644
--- a/meta/recipes-core/meta/build-sysroots.bb
+++ b/meta/recipes-core/meta/build-sysroots.bb
@@ -20,6 +20,8 @@ deltask populate_sysroot
 python do_build_native_sysroot () {
     targetsysroot = d.getVar("STANDALONE_SYSROOT")
     nativesysroot = d.getVar("STANDALONE_SYSROOT_NATIVE")
+    import os
+    os.environ['PATH'] = "%s/bin:%s/usr/bin:%s" % (nativesysroot, nativesysroot, os.environ['PATH'])
     staging_populate_sysroot_dir(targetsysroot, nativesysroot, True, d)
 }
 do_build_native_sysroot[cleandirs] = "${STANDALONE_SYSROOT_NATIVE}"
@@ -29,6 +31,8 @@ addtask do_build_native_sysroot before do_build
 python do_build_target_sysroot () {
     targetsysroot = d.getVar("STANDALONE_SYSROOT")
     nativesysroot = d.getVar("STANDALONE_SYSROOT_NATIVE")
+    import os
+    os.environ['PATH'] = "%s/bin:%s/usr/bin:%s" % (nativesysroot, nativesysroot, os.environ['PATH'])
     staging_populate_sysroot_dir(targetsysroot, nativesysroot, False, d)
 }
 do_build_target_sysroot[cleandirs] = "${STANDALONE_SYSROOT}"
-- 
2.17.1

