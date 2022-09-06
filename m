Return-Path: <joshua.downer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C275CECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 10:36:34 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web09.2377.1662460584311059009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 03:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=okN4yFUC;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: joshua.downer@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id j17so7611982qtp.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=OUHAh+k5Yg+cuv/WmWFNQ1OiEIfbmcrghChocfKnKhs=;
        b=okN4yFUCiOT1E6PJk/X1tIjbU63TNygPR5DJC4ecW0jdiTkT6Q+FaWP1TgJVg3pyF5
         aeI11RZl9AzKSnsr3EEr4LxiKkyQyLK8jgzfsjlfExuYHCSfVIkYPFsQRJlh/FNbmfOF
         89LPseklTGQOb8zsIL4w8xXLQpYQqSglbzxJ/MJzDrKNiFbTxNO2l/TQF/TMu9qe/c8c
         760v3tdQy4GNFFMzKiqSOUoyVAT11QdCWuCh1h5dg+YSvu5vo1bIOgJUr+yk8ze6Y19u
         iCWB5rgFf7RXhkJzuunXt42IklSfKrMUXZAgwU47lalF/I+NPQaLg+IpVNseW1KcbWEn
         2EKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=OUHAh+k5Yg+cuv/WmWFNQ1OiEIfbmcrghChocfKnKhs=;
        b=fC6dbvcwgwdi9uGXREhJiv0AnYQY1r9JO9TY720FV2mYIH0jMXs30sUyLeqOEW1Kb4
         XsSDBTRBH31kdl1aGWRLqaNvkmLcwf1fMeMqqhs4hQ/oHYXwyXSiib3QEzr6IRJTVUWR
         l7vykY5zHO0o8wshl/1rwFnntTtU+TvjtHrr0UiqDNux7DGkqG812Tow5k67L9UIv7SL
         W7An2k5ZVdp2TAGL4n5ouS02eIUI5AZyaX42hKP24+camEt4Tu1LNjp8iGx2R9iJgHql
         ScQjH76f941niCxFvi8y0rb1fcwAmErmlwL8nJ1kFHhAMZHNQSwWt1WANKuH623BPtyE
         b5RA==
X-Gm-Message-State: ACgBeo3JQkOWEvDKB2CP5MRSHAN3YuYipJaVGapLufTIcWGbiqlGqRbk
	ANjufGfy2VVt4MgfZWkA0wQIhTocwiA=
X-Google-Smtp-Source: 
 AA6agR6P8ZcQKIXmLjgkGHznzlxI4NRppHMnOB/qt4kQ/xZdjWdOaQLntkD0OH+0rYjPycvsaD6+dg==
X-Received: by 2002:a05:622a:40c:b0:344:5aba:a153 with SMTP id
 n12-20020a05622a040c00b003445abaa153mr43672021qtx.261.1662460583091;
        Tue, 06 Sep 2022 03:36:23 -0700 (PDT)
Received: from pippin.fios-router.home
 (pool-71-174-218-167.bstnma.fios.verizon.net. [71.174.218.167])
        by smtp.gmail.com with ESMTPSA id
 s13-20020a05620a0bcd00b006bb82221013sm11204984qki.0.2022.09.06.03.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 03:36:22 -0700 (PDT)
From: Joshua Downer <joshua.downer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Downer <joshua.downer@gmail.com>
Subject: [PATCH] scripts/oe-oe-buildenv-internal: add SCRIPTSDIR
Date: Tue,  6 Sep 2022 06:36:14 -0400
Message-Id: <20220906103614.37073-1-joshua.downer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 10:36:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170342

The addition of the SCRIPTSDIR variable allows the user to customize the
location of the scripts/ directory. The default remains $OEROOT/scripts.

Signed-off-by: Joshua Downer <joshua.downer@gmail.com>
---
 scripts/oe-buildenv-internal | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 485d4c52e1..564b7c8b55 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -77,6 +77,11 @@ if [ -z "$BITBAKEDIR" ]; then
     test -d "$BITBAKEDIR" || BITBAKEDIR="$OEROOT/../bitbake$BBEXTRA"
 fi
 
+if [ -z "$SCRIPTSDIR" ]; then
+    SCRIPTSDIR="$OEROOT/scripts"
+fi
+
+SCRIPTSDIR=$(readlink -f "$SCRIPTSDIR")
 BITBAKEDIR=$(readlink -f "$BITBAKEDIR")
 BUILDDIR=$(readlink -f "$BUILDDIR")
 BBPATH=$BUILDDIR
@@ -93,7 +98,7 @@ PYTHONPATH=$BITBAKEDIR/lib:$PYTHONPATH
 export PYTHONPATH
 
 # Make sure our paths are at the beginning of $PATH
-for newpath in "$BITBAKEDIR/bin" "$OEROOT/scripts"; do
+for newpath in "$BITBAKEDIR/bin" "$SCRIPTSDIR"; do
     # Remove any existences of $newpath from $PATH
     PATH=$(echo $PATH | sed -re "s#(^|:)$newpath(:|$)#\2#g;s#^:##")
 
-- 
2.25.1


