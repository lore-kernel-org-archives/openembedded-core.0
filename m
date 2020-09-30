Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.6579.1601504120906573976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ltoRAVTz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d9so2355242pfd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=X9Ke3f5xS6Y3vIPHfIc2j6n27QznM3SVaBXRLq+sTys=;
        b=ltoRAVTzmX6a4az5pPF92mXt5geNSXCDRmfIj281uKi44N96LOO1IposqFkDaRKY1t
         7rnSndor3ZEMl4fRIzqHLDZsog4Qn9wkJoG6T+DecpLHbLTzN4PsiozUC4Ujik9NCtQ4
         kksHGZCLvbLwlkP514pXDb/U+V3R3FxJyouHQ8MQso3iKuPBhyOQO7K8ng6ij2v92G7D
         wXao5vdPjKR5UBJC9fuMH+dVmC1m1PmzwcSLgYLGk1RvS8lC5h1glQktVT2CBQSBR6wI
         YCkukoG9eI+F149XLaZkj2MGM09vN3PcvcmX6tyOaUvR8HVKdAMiJcluqw86a64HEaJR
         wbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=X9Ke3f5xS6Y3vIPHfIc2j6n27QznM3SVaBXRLq+sTys=;
        b=QMxYRQ1h6cbG2BnBdjgW8XBp2Oy7okd41MvUvO/stPim5gkWxjUtyNGul1jbrpEnMi
         ZGnTnaufySXqbXaypIxQSUIDWlNGRfGRQQRPfWaEC2AQXR2rz6/4KZ3AdrUwBqwSNUV2
         KIRG5WksZDDgkUYlgB+pBbDsp2SjoAl5kQAShaam9UhKrYGkQcTz/igY5F1Qy6PvlDWc
         vd0juFfWUDrzojDPr1RctNWHIW66KGp6KaGLl/P5bwUxW5K4hEhKRgXSC/bGSfuxTwz1
         N1NFgV9ciq5Pdk1hikqKjCzFaUqDMlpa2H3BRtsm112CfytY8FNpkKSEujzrYSazPbLQ
         t9dQ==
X-Gm-Message-State: AOAM530VkX353LFr3VgxVxYldUr3rjnsL8wOmg7pYtfXwKuPjvMZfYd5
	+j0HMaIXbYKmwiwrv1oh1EMUVLkXBce2ly2llMU=
X-Google-Smtp-Source: ABdhPJw6OVjN7J2UDneAkq6FLhKVdGtSBo5sK4pcCxMwWLxiIEKepdL2TKW56fhTY0PCBffqyQkz7g==
X-Received: by 2002:a17:902:bd4a:b029:d2:2767:dabb with SMTP id b10-20020a170902bd4ab02900d22767dabbmr1466361plx.64.1601504120030;
        Wed, 30 Sep 2020 15:15:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 30/41] sysvinit rc: Use PSPLASH_FIFO_DIR for progress fifo
Date: Wed, 30 Sep 2020 12:11:32 -1000
Message-Id: <0f395ab9d276595e75233dbdbb9ebb610bd1d3af.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Michael Gloff <mgloff@emacinc.com>

psplash expects the fifo to be in /run or specified
by PSPLASH_FIFO_DIR. This patch allows psplash to
quit normally. Also, fix the work around of using
echo directly into the fifo and use psplash-write.

Signed-off-by: Michael Gloff <mgloff@emacinc.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2b48bbd0a8de17df74d1fae12b5e4eb3c2c0fb90)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/sysvinit/sysvinit/rc | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index 7ca41ae1ae..fd1fdd26ba 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -26,11 +26,8 @@ startup_progress() {
         progress=$progress_size
     fi
     #echo "PROGRESS is $progress $runlevel $first_step + ($step of $num_steps) $step_change $progress_size"
-    #if type psplash-write >/dev/null 2>&1; then
-    #    TMPDIR=/mnt/.psplash psplash-write "PROGRESS $progress" || true
-    #fi
-    if [ -e /mnt/.psplash/psplash_fifo ]; then
-        echo "PROGRESS $progress" > /mnt/.psplash/psplash_fifo
+    if type psplash-write >/dev/null 2>&1; then
+        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "PROGRESS $progress" || true
     fi
 }
 
@@ -176,7 +173,7 @@ startup() {
 #Uncomment to cause psplash to exit manually, otherwise it exits when it sees a VC switch
 if [ "x$runlevel" != "xS" ] && [ ! -x /etc/rc${runlevel}.d/S??xserver-nodm ]; then
     if type psplash-write >/dev/null 2>&1; then
-        TMPDIR=/mnt/.psplash psplash-write "QUIT" || true
+        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "QUIT" || true
     	umount -l /mnt/.psplash
     fi
 fi
-- 
2.17.1

