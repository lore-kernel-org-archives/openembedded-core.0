Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.368.1592848801773671596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Bpc8Qznk;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id 25so16406168oiy.13
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=faNx1irZCeZ5FaXOWSFkJ650NhJJ1O+guXZIIR6xyW8=;
        b=Bpc8Qznk2voelco/2TS0E3/4nXPZdN5KBnN1d5EWLC/e65ihnYPH9sqHOQHAuEdKJL
         NMfKghHpV3rpiHE3/20CnUapZgprd4a2f6KJBI2xYXMN7ovAUFsnBwwaycHbh6nAcs2y
         ND888r72c3nHOSdB2ZHvjfbY9OqTpQW5MPOeYD9HOXLkaHol5GZfmpLQ+XqtpsAqvyqY
         +p36MgbESwTJZGJJkKlRNCAQFQ+B4mh9KTeLjvocSCr7D/dsAOQk+KMf965N2hSpfdZW
         6xBWd/hlX5UYVd0XAp+JfPELFCBl6gpk3Av53i8g+tFcxOCf/upaKA8Im7o2p3k8rwgO
         7axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=faNx1irZCeZ5FaXOWSFkJ650NhJJ1O+guXZIIR6xyW8=;
        b=fJxg49MwZUorqbXEzvVA/17Rr3T4Zw57PKJJkcwLjU2Bd6ZvGivGGUJiwx788kGe1a
         EDpO5PO6YJKQhSLqD/LxNpgQ1x1Qb092AKIzXIkRpp5gh5rblMrguUuvIAF/yonq3bSK
         uT85tjKOjWaicEdAK0Of3ImCe6Bfe05WsZwkHUdhFf7IZ0BJVINIDy+bLBX7vmgU2nDG
         g87cVYlQl/C6UC2X3wIFeRtcRYISirygmBlWgIVgkFiHIFPgodPl/JNEmaRdzSG7G6OM
         sfsR6KBI/xyxqs6ocFzbtXelxC18ZmvgYDuKQTjnP+ASBZntGf8T6JGtmE74y0yIV6RH
         3GJQ==
X-Gm-Message-State: AOAM530mekWtFpK3rSf4ANhDTT24m/GDhX+iYz8JwG8W0Iuo/pim89Lk
	3luUxAfQFm5K+Eim2490m1mlABZ1JQB61Q==
X-Google-Smtp-Source: ABdhPJxqc5S4fSTpZt01Q8qkn4G9v+4BZg8veIcu9vhZ87Ml2Ee+k79Aewet8/TrPG5Vn5i+YxwmCQ==
X-Received: by 2002:aca:d889:: with SMTP id p131mr11281795oig.170.1592848800451;
        Mon, 22 Jun 2020 11:00:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.10.59.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:59:59 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/33] vim: restore the 'chmod -x' workaround in do_install
Date: Mon, 22 Jun 2020 07:58:02 -1000
Message-Id: <68b2dc03e55b4977b8647e8d36c40c851414c13b.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Chen Qi <Qi.Chen@windriver.com>

These workarounds are removed because a previous patch
solve the host path reference for gawk and perl, and it skips
the do_package_qa issue by setting the INSANE_SKIP. But it
introduces regression for do_rootfs. The dependencies are
calculated and will require packages like python, perl, gawk
and csh. The error is like below.

Error:
 Problem: conflicting requests
    - nothing provides /bin/csh needed by vim-tools-8.2-r0.corei7_64
    - nothing provides /usr/bin/nawk needed by vim-tools-8.2-r0.corei7_64
    - nothing provides /usr/bin/python needed by vim-tools-8.2-r0.corei7_64

So we keep the previous patch which solve the host path reference
problem and restore the long-used 'chmod -x' workaround here.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bf3e799e32b4de300887b844b0b7bce3d60ca379)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9f3dc08027..4d2886c19e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -83,6 +83,12 @@ EXTRA_OECONF = " \
 do_install() {
     autotools_do_install
 
+    # Work around file-rdeps picking up csh, awk, perl or python as a dep
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
+    
     # Install example vimrc from runtime files
     install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
 
-- 
2.17.1

