Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.13441.1589899884258437539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 07:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZEUvRsxc;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id n11so6508205pgl.9
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 07:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8irEoStYwVHeec+sRyqjBZiEXiqh1kECNu7xavtAVl8=;
        b=ZEUvRsxcbvAVYtFniEwP9/59eKAXxDu5Fa/d/Q4BRxsXqlcKaE2Hp8Ue1OhXJzDmU0
         ojh1CEndqJxe8dKEayYXIVS9BQW2DXoWf9Z/DdDtarcuJ1F8mHhDnaJcJ1tQYWJvjFpd
         CTNHo4bVZJkUp6iVKfa/HawR7zc6gXJj53DpRmi9fpE4rIbKOASSt9/VE5ZycdxiWtTC
         5I/u8P2Yxfr4xhf8Y5VOpv1wnbj7hJKDsSFATESpU2souYDl2o/V82X/9vFFcmsNLLcW
         QeUjoTNGDkZWhEmqfPgHdD91e+ygxUw8yYGLubr52FSsmqdHLfySHUY7GT3AbqQegfES
         afYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8irEoStYwVHeec+sRyqjBZiEXiqh1kECNu7xavtAVl8=;
        b=B8+NM8uP3dndZghkk15TXB11eOYQ67UXU9NB5JLWag6IDJzGYwBXYPBaFNDSFaWbs4
         eGvceNc1K/Xukw4hpB3uvoG28uKseL/szNsUggl2uwIDifjqQkPxteU2R3y6yJYfPJJV
         /xzxVgABqQmXhGdnFucYCkHtzZWMDJkBeyAvUZnHDJBND045vgsvzbBDjGspcIbvvmLG
         yS3hXPBZJndnXF1vDfpkc3M/QmlRUGc/B3QHW1+5G1jhBGDSWTbGnccyjZdCK/Fq9slf
         9nVb+ikNuHjVyLH+qkIeWicfB6vozNyubxRvaD/6P3k45dd0X5qN8Inf9tJZ1BSujPTB
         KCIw==
X-Gm-Message-State: AOAM530OohWFhX+1s2hcD+ODlkFbwCrZCuD1jH0iSX6gyQQ+xNTyVaDP
	0ZP2bKpMbkPp7JVoNoZGLTy/s6L0
X-Google-Smtp-Source: ABdhPJxpbkoLhD6CcSJLYZtsFLN9tFJ59VCQGuW9rXreFtvT4Um3aLljGDEKolBZuq8+G9ZLU/1mBQ==
X-Received: by 2002:a63:4c1f:: with SMTP id z31mr19722869pga.143.1589899883502;
        Tue, 19 May 2020 07:51:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id b63sm4551196pfg.86.2020.05.19.07.51.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:51:22 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 3/8] openssl: Fix reproducibility issue
Date: Tue, 19 May 2020 07:51:10 -0700
Message-Id: <4a8d927dc3ef569830c417d46e5d0a0318a69cde.1589899663.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589899663.git.akuster808@gmail.com>
References: <cover.1589899663.git.akuster808@gmail.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There was a build architecture leaking into the target ptest which
could vary depending upon host. Remove it as its cosmetic.

[YOCTO #13770]

(From OE-Core rev: 37db519eedb7eb5cd4f14d05f30f5d580aa7458d)

(From OE-Core rev: c31c676319812e6fc036741db2ab8e16eccff723)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openssl/openssl/reproducible.patch        | 32 +++++++++++++++++++
 .../openssl/openssl_1.1.1d.bb                 |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/reproducible.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/reproducible.patch b/meta/recipes-connectivity/openssl/openssl/reproducible.patch
new file mode 100644
index 0000000000..a24260c95d
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/reproducible.patch
@@ -0,0 +1,32 @@
+The value for perl_archname can vary depending on the host, e.g. 
+x86_64-linux-gnu-thread-multi or x86_64-linux-thread-multi which
+makes the ptest package non-reproducible. Its unused other than 
+these references so drop it.
+
+RP 2020/2/6
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: openssl-1.1.1d/Configure
+===================================================================
+--- openssl-1.1.1d.orig/Configure
++++ openssl-1.1.1d/Configure
+@@ -286,7 +286,7 @@ if (defined env($local_config_envname))
+ # Save away perl command information
+ $config{perl_cmd} = $^X;
+ $config{perl_version} = $Config{version};
+-$config{perl_archname} = $Config{archname};
++#$config{perl_archname} = $Config{archname};
+ 
+ $config{prefix}="";
+ $config{openssldir}="";
+@@ -2517,7 +2517,7 @@ _____
+                           @{$config{perlargv}}), "\n";
+         print "\nPerl information:\n\n";
+         print '    ',$config{perl_cmd},"\n";
+-        print '    ',$config{perl_version},' for ',$config{perl_archname},"\n";
++        print '    ',$config{perl_version},"\n";
+     }
+     if ($dump || $options) {
+         my $longest = 0;
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index d256646934..67eea6592e 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://CVE-2019-1551.patch \
+           file://reproducible.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.17.1

