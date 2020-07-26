Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.29450.1595772214486183323
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 07:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YTru7cwu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id f1so11794723wro.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pIEX1gR/R99T7FykH1sieThQ5NAZFJT3yNkGvv8k09A=;
        b=YTru7cwuFqSdtCORrDJvTW/l2E0KRdFWzpImXXxAir11DM3fkLmg56Bie/5vp29IEV
         NCAGK2lSxmr9mb1miYNDkppSm97frvRDtjobzUZi0JvvqfE0HsXVOT9mI8IvVa9OisQP
         CZUtCOZakDGf7dfgyyDZwDE/Mv5EiZSOsV4CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pIEX1gR/R99T7FykH1sieThQ5NAZFJT3yNkGvv8k09A=;
        b=bdHHwfqk6mg+MKvRGdM6PPleAhik7+6TagHKpf2FSB85nr83qXi/SXklcR3XjAn96K
         NaEWN5++wkWZ3Ac55C/wdAmFbMEzrvR8Gr7xWdsbuVQYwttIhGghGQVhhaOsicMub16B
         TmnHxP4K/sMh2oOYzOjkM2VexVH+iTOJC2g+Q5qVl04N46bxq0rjbBLx5c7kk85kPXFc
         IqY2tLHMz3S+RQ73GKeXb1HV0Ekw+tVYaKAJk/KbqoJYGKRqqczyXH2qmKji4WwC6iym
         mXjvq+mEGfsix+RY1sh1D02DFNoPm+JivW2S0HMW1Os4AorCC+Hje/MaTqI0R0KQtey8
         sQvA==
X-Gm-Message-State: AOAM533pz/oyac9Yb6LNHoP3/rZAo8PWSOaGWqhhrSv6se1X1gRasJsB
	XPicHAXkxBqB0zr7iIWxMwLrQo1oOiawWQ==
X-Google-Smtp-Source: ABdhPJwevRRLT0EjRhuzYuIVzgMAq76r5KDeA8GJkD7//xpP4N73+m/IskvuqZAEUC1HGFrXEi+8zQ==
X-Received: by 2002:a5d:5486:: with SMTP id h6mr15682505wrv.136.1595772212600;
        Sun, 26 Jul 2020 07:03:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c1c0:577:97eb:ef04])
        by smtp.gmail.com with ESMTPSA id 31sm8492462wrp.87.2020.07.26.07.03.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 07:03:29 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perl: Avoid race continually rebuilding miniperl
Date: Sun, 26 Jul 2020 15:03:29 +0100
Message-Id: <20200726140329.264842-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When we run "make install" we notice miniperl rebuilding multiple times.
Usually this is harmless however sometimes race issues occur such as
miniperl not being executable.

The issue is that crosspatch is a phony target so it always rebuilds.
Adding this as a dependency of miniperl means miniperl always rebuilds
too.

Avoid this by injecting a direct dependency avoiding the phony target.
miniperl is then only rebuilt when its input changes as desired.

Patch submitted to upstream perl-cross.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../perl/files/perl-cross-makefile.patch      | 29 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.32.0.bb     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/perl-cross-makefile.patch

diff --git a/meta/recipes-devtools/perl/files/perl-cross-makefile.patch b/meta/recipes-devtools/perl/files/perl-cross-makefile.patch
new file mode 100644
index 00000000000..5d3f998200d
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/perl-cross-makefile.patch
@@ -0,0 +1,29 @@
+Makefile: Avoid continual rebuilds of miniperl and associated races 
+
+In the Yocto Project, when we run "make install" we notice miniperl
+rebuilding multiple times. Usually this is harmless however sometimes
+race issues occur such as miniperl not being executable.
+
+The issue is that crosspatch is a phony target so it always rebuilds.
+Adding this as a dependency of miniperl means miniperl always rebuilds
+too.
+
+Avoid this by injecting a direct dependency avoiding the phony target.
+miniperl is then only rebuilt when its input changes as desired.
+
+Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/95]
+
+Index: perl-5.32.0/Makefile
+===================================================================
+--- perl-5.32.0.orig/Makefile
++++ perl-5.32.0/Makefile
+@@ -56,7 +56,7 @@ crosspatch: $(CROSSPATCHED)
+ 
+ # A minor fix for buildroot, force crosspatching when running "make perl modules"
+ # instead of "make all".
+-miniperlmain$O: crosspatch
++miniperlmain$O: $(CROSSPATCHED)
+ 
+ # Original versions are not saved anymore; patch generally takes care of this,
+ # and if that fails, reaching for the source tarball is the safest option.
diff --git a/meta/recipes-devtools/perl/perl_5.32.0.bb b/meta/recipes-devtools/perl/perl_5.32.0.bb
index 1adfd90e739..c10ce123030 100644
--- a/meta/recipes-devtools/perl/perl_5.32.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.32.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch  \
+           file://perl-cross-makefile.patch \
            "
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.25.1

