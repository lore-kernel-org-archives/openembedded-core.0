Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.353.1592848779459759707
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 10:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BDYyXmS6;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id s21so16407969oic.9
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 10:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1iSGIvXT8OVXs514w03R0mGMIxm3eQspJKDvE7HHOVg=;
        b=BDYyXmS6zt/Jw0buE8Yu0GJk+oBsSzeRlSjKyZgVUiQLDbs2N1ShOcIH5OtaX/DdjC
         2S0cIUFzqfKnuFQYY758SV4Gba1NmlTUutehnJMLrz0DIkElKDdPglm9pswaY9X7Uxrb
         g6lw7X6rwTklf8CubawpaSHeoSrSndveATK7i86IP3690HJsWNWIpuMK8NoVN1+T4u+J
         Hq+sruZ2f7DN20RM4ub3Mc/rzCHUWlX+2VwhbNxBFPx4XA4VFKQysLf5U+tmbxN/PJw2
         ihdZ17VIQIDYXdl7hfgDKBIzOPly8sBLuJZdvE8bhPIfC9OTx2eGg+4HgzU2SPDJC2Ru
         Sj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1iSGIvXT8OVXs514w03R0mGMIxm3eQspJKDvE7HHOVg=;
        b=ukI7nyqxAu0c3QuyVe79NxLgKL7okDvdi8pXQSzaq0TSqx+5TOBFVzeY8wKtArHk8H
         1z028JVvm8UA1dH6Qmu04vVSTdQNRby2u6Si4fzgMHGqbmlRLj+OuASMEEO3w/pSN6+/
         MyWMxC+okj9KnjRvALNE/yF4c9Bqvxb6HtXmj18tACDjotA+fGoDoHu//2uOzobbGyjF
         khDtgvDZe2k2Z0MSrWf9EOkU9+XyBVOmpz8ciwmGvhHCUWwXxbGtDJOvTAph5VDdApE+
         8LGrI0SJkOk4LkESHTFgsqvFF6ZHlVkTvp1fHOAx02kmmxRdFqH0rpatBmyVbpKYE2Ny
         j0lg==
X-Gm-Message-State: AOAM531WKUV5KmdOZc/FZ6A8B2J5dOnPfCk0ouP9xF1wMDDgpplqPwKA
	Ke/L6LjP9xzRcOI+dQhJHr8fL2pedi1o5w==
X-Google-Smtp-Source: ABdhPJwHPcTSDqDv6VlHPG2IwZqq6aUhjbTift294FlP4EQ/IBMRu6nD0iDDObaquJsKPOsmXAN2cw==
X-Received: by 2002:a05:6808:299:: with SMTP id z25mr13484784oic.26.1592848778317;
        Mon, 22 Jun 2020 10:59:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.10.59.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:59:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/33] ltp: Add missing dependencies on coreutils, bc, e2fsprogs and gdb
Date: Mon, 22 Jun 2020 07:57:58 -1000
Message-Id: <c84c3caff4ef16c72390a7b941b71919417c9f51.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When the tests are run we see messages like:

/opt/ltp/testcases/bin/run_cpuctl_stress_test.sh: line 242: nice: command not found
/opt/ltp/testcases/bin/run_cpuctl_test_fj.sh: line 66: tac: command not found
vma05 1 TCONF: 'gdb' not found
memcg_failcnt 1 TCONF: 'bc' not found
Owner=nobody; perms=-rw-------; sudo: lsattr: command not found

so add missing dependencies to avoid these.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit faa01e1ae7a92d60699cd8865d1106a13549b096)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/ltp/ltp_20200120.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/ltp/ltp_20200120.bb b/meta/recipes-extended/ltp/ltp_20200120.bb
index b25da4030d..6633755a20 100644
--- a/meta/recipes-extended/ltp/ltp_20200120.bb
+++ b/meta/recipes-extended/ltp/ltp_20200120.bb
@@ -83,13 +83,17 @@ do_install(){
 RDEPENDS_${PN} = "\
     attr \
     bash \
+    bc \
+    coreutils \
     cpio \
     cronie \
     curl \
+    e2fsprogs \
     e2fsprogs-mke2fs \
     expect \
     file \
     gawk \
+    gdb \
     gzip \
     iproute2 \
     ldd \
-- 
2.17.1

