Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.41682.1601311884487442190
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 09:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jg6RfbEC;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id p9so9509090ejf.6
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Ok2GIPaSl6NpqxKvxf7fAjrIBDeTxGgoYfFxoFSi4Q=;
        b=Jg6RfbEC0isW0I+mhAwbD0hP1h3nBzvvEax3zbCRTvqDRPvSwlJWnXZpC+H1Mdjouw
         Au5HER1Y1h/rhQ+f3GanG2ROx4aOV5FrSIb41vg5vr0ACEOrmGqhek9qeBHiLzHueLJN
         qP0mys4C6PrXZQUryxDYQ48auAgE3AXdQ0RHdjlDMKNn58IL6Up70ZC1L/vT+AeTKv4K
         Be8/cwWe27WYZsC5Hs2jnrQ5liNse5dfhfB01XgCGenWW+pRPcuKm4ImiCW0ReTiDiak
         R15ABK4pC9LvpMl951u8Ke0ybDH3dJmGKsP6FWe4AYf6QUxitCZ2eXP1xGDl/gQEsb0C
         MVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Ok2GIPaSl6NpqxKvxf7fAjrIBDeTxGgoYfFxoFSi4Q=;
        b=EC/DyvumNRyTK+nK5GOAyj8YGn+V3Ur/6NzjBtcV6VR+8KHhDLN6ZkGGBhxGeSMXeZ
         zHji7MpDzOIawiW1ECmpaEg7xuZykE79ABN9EoiNvr0mhJ62RsDD4cx+M/qPk7Me9wQ3
         K+0ZyQXLPhkrTQpLqxUimEuW4WQFBXnYplOpNopNsqyF9odW7ioEce0+dSqXSI0S+YLu
         2l1rVn0dqdbAPF7xSSYsLjGyv2LR3nMke1Xuw73KIV7cc+vKhBQXS0MYbGeKZvp+wAtr
         vxJY2CpyqK2O5oMIKtEYBVXMP4a4joFGtSarX7dHbbATLkmRKrCsgobA7YIbrlg7TBwv
         vlYQ==
X-Gm-Message-State: AOAM531EvzliZUtPh7Y6VDW7A+1ZSk8R+o8NZle5dDC/TDN2ywbn+FxY
	ymzexotm42TrptB1zKXZPgyw6NVCctU=
X-Google-Smtp-Source: ABdhPJzGvVG5wd89vlACBbW3yU08cgThN3zz9Zy7LoqQRifd1ev3+bSxEdwy/wjNvCvJOFRrkCWjeQ==
X-Received: by 2002:a17:906:4d57:: with SMTP id b23mr2460467ejv.496.1601311882537;
        Mon, 28 Sep 2020 09:51:22 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q12sm2476393edj.19.2020.09.28.09.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 09:51:21 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] site: Make sys_siglist default to no
Date: Mon, 28 Sep 2020 18:51:13 +0200
Message-Id: <20200928165113.210944-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

glibc 2.32 has deprecated sys_siglist [1]

since no is default for musl as well, therefore elevate it to common
site file for all

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=b1ccfc061feee9ce616444ded8e1cd5acf9fa97f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/site/common       | 7 +++++++
 meta/site/common-glibc | 3 ---
 meta/site/common-musl  | 5 -----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/site/common b/meta/site/common
index ff552329bd..62907274d7 100644
--- a/meta/site/common
+++ b/meta/site/common
@@ -19,3 +19,10 @@ shadow_cv_passwd_dir=${bindir}
 ac_cv_buggy_getaddrinfo=no
 
 ac_cv_path_SED=${ac_cv_path_SED=sed}
+
+# General
+ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=no}
+
+# bash
+bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=no}
+bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index a0680bc44c..0a665658fb 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -1,5 +1,4 @@
 # general
-ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=yes}
 ac_cv_func_calloc_0_nonnull=${ac_cv_func_calloc_0_nonnull=yes}
 ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
 ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
@@ -18,8 +17,6 @@ ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 ac_cv_func_strtod=${ac_cv_func_strtod=yes}
 
 # bash
-bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=yes}
-bash_cv_sys_siglist=${bash_cv_sys_siglist=yes}
 bash_cv_getcwd_malloc=${bash_cv_getcwd_malloc=yes}
 
 # clamav
diff --git a/meta/site/common-musl b/meta/site/common-musl
index 4be8d002d6..44a7a1aea9 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -1,5 +1,4 @@
 # general
-ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=no}
 ac_cv_func_calloc_0_nonnull=${ac_cv_func_calloc_0_nonnull=yes}
 ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
 ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
@@ -29,10 +28,6 @@ glib_cv_have_qsort_r=${glib_cv_have_qsort_r=no}
 #dbus-glib
 ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
 
-# bash
-bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=no}
-bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
-
 # coreutils
 fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
 gl_cv_func_getcwd_abort_bug=${gl_cv_func_getcwd_abort_bug=no}
-- 
2.25.1

