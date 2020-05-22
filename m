Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.13952.1590157586378258037
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 07:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F0vl/rzw;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id x18so3345961pll.6
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 07:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8irEoStYwVHeec+sRyqjBZiEXiqh1kECNu7xavtAVl8=;
        b=F0vl/rzw8/5T/2nq7UhSUQurHfgGgE3lKr/gF6EgD1EG3C9Qh+N/LEO7FaLigINPOL
         BIYkysz7VDo22y9a4vjVty7WzWFuCL5XzyXdUs1ChEUXmWtqRKqXY5pGkZCNplAa8xif
         fDmcsVda536sI+Nazp3SQeLjC6zqVGmg15ZTfw+McBka6ARY7p31eRhmPG/3WD+5OX5t
         QUEj3NnojA1njFyfdwuQtRo3toNTMX7wnkMvstQMwWgHuEXIqXrjQbMDSTAfOoKv4oiA
         AlCdGujko/vfz1TD+j5d03+1VEGW0iR499YIFLt1Pt3TzmCa4v1L7cg0tXf2aEPb7Wei
         8ewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8irEoStYwVHeec+sRyqjBZiEXiqh1kECNu7xavtAVl8=;
        b=ebXuCdfOgVg4RjI3TTlAnJ9sjldOSrKVIB/MMI0vb/Y7hFIn4gDNYcpbUj8hPerDNf
         Fku8z+iQZu65SfNv4g4MMp321bdq5sfzQA9QzbO1K7FTTWWpQB2C54y7+vwgKE0td/NT
         hprsmr+6PlUCGFUbf7o34lRy5qsRLE+VLFev55EFsY2Mi3x610Xb/YGcQTeCv1/F406J
         ROBnFawte6Gz6sPmZ3uXpJxc8CkmezrOd0Ea772oTEpc8e4zkyB5TTDJVstNI5VHyL02
         4zUfVErakoDslE4BMY1PI73/kTlEQ6WP+eXLYwahMvctZHK+qNYi+96pBiPN7/tM4CWf
         ROjw==
X-Gm-Message-State: AOAM5321Z7bGn+FL3lbQNPQe/P3rWzOZ3QJEJjbwAwyP4AkYuWywsjqL
	1tIaWwwVgcA/AzuyySZSbhr7+iXp
X-Google-Smtp-Source: ABdhPJxlbRGetclSLx5r0CY57bgt+EmwEQVMPj5Seqh3yxO4MDvScB+rDrpVa8aVIZErbBfyAqMUNg==
X-Received: by 2002:a17:902:c213:: with SMTP id 19mr14974716pll.190.1590157585488;
        Fri, 22 May 2020 07:26:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:2019:1800:ef81:a76f])
        by smtp.gmail.com with ESMTPSA id v75sm7347763pjb.35.2020.05.22.07.26.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 07:26:25 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 3/8] openssl: Fix reproducibility issue
Date: Fri, 22 May 2020 07:26:12 -0700
Message-Id: <4a8d927dc3ef569830c417d46e5d0a0318a69cde.1590157490.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590157490.git.akuster808@gmail.com>
References: <cover.1590157490.git.akuster808@gmail.com>

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

