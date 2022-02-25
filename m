Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A004C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:21 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.6893.1645799240885817912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2HPoSP/S;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id o23so4767849pgk.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=khJyXlze8+n+Yqg+hQnC2MQMdC56jNApVNEL1TcFlco=;
        b=2HPoSP/SKQPn5x2rcfzgp+EBc/MD4coAGDJ7YvNbiI6j3K1RYfZ8B8lDEVBHFqYnYq
         kxvGDUd5lNbsdRQMN37JSNiV9VVZOWedNpaul8DpOkKkVaEvn+5+seYSrOC5OdYQrYgt
         CluD4D5M40FlEXgIYSPtH2NNpzblF1wrzPBGFgBp9jkWp4is6yfU5bUBJDfnr4WFGeRD
         6FFbu6vRDp1WO42nzE+1DBjM/1FHqJoJBPDpseyDhUYcqOd0FvM5n8VqgPz6e48k6Bjb
         eKB4eyGqF5PIhh1L+J4/e/AIRimgw1P80PLGqvLBrgOlEJMvtS/w7qnees6n0GLEG+Nk
         qljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=khJyXlze8+n+Yqg+hQnC2MQMdC56jNApVNEL1TcFlco=;
        b=6F16Pl2KAldK0vmws4fuwGv3fbB7i8RC88fzbnwhspPdHzlSVT0In/8MqdjSzT2b5l
         Xq2M3bEJ/bc7UcWVOHiGj+c3reng8/2ieHwtRmW8RuO7BcSJQpz5O5NhffHOZF5GyF2g
         R/FjVADqUaf7yXL92y6zfxHLYHiqdK8aSQCm04LuJfvCzLwr/ujAG3pRqjEtxBKcPDQJ
         USjf3hRonQ7iVw3vhY61I9T2WkRubuGe4G0UlXNdhUjXgrm/B855a2p/bFV/1LSetdoI
         YUa4Cg16LyWj57XbkJaIpCJdRwckJI+CpM2W8W1bNNo61lrGPC6Txedv8KuCt25usnUA
         jKUw==
X-Gm-Message-State: AOAM530ODUT9w+j87McduCi+mnFqoaviwxdxZjPQM26Jw0E5+uRNznNn
	SUrtfXN9Gr1JKqtwnyM+e6YsCdb8LuG+Vpad
X-Google-Smtp-Source: 
 ABdhPJwlLYC9PEQ68A4uTukKVeug30bZXMTDxMcFmwa8R0J7qGmG3zrNbNQUP3Pfxyd7yjpvETubUA==
X-Received: by 2002:a63:e84b:0:b0:372:a079:302 with SMTP id
 a11-20020a63e84b000000b00372a0790302mr6365304pgk.272.1645799239837;
        Fri, 25 Feb 2022 06:27:19 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/50] grub: add a fix a NULL pointer dereference
 in gnulib
Date: Fri, 25 Feb 2022 04:25:54 -1000
Message-Id: 
 <37900e0b112bfd66ae61c03470fd32f77dee1aac.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162360

From: Marta Rybczynska <rybczynska@gmail.com>

This change adds a fix for a NULL pointer dereference of state
in gnulib. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-Fix-dereference-of-a-possibly-NULL-.patch | 52 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch

diff --git a/meta/recipes-bsp/grub/files/0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch b/meta/recipes-bsp/grub/files/0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch
new file mode 100644
index 0000000000..102a494561
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch
@@ -0,0 +1,52 @@
+From eaf9da8b5f8349c51cfc89dd8e39a1a61f89790a Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Wed, 28 Oct 2020 14:43:01 +0000
+Subject: [PATCH] gnulib/argp-help: Fix dereference of a possibly NULL state
+
+All other instances of call to __argp_failure() where there is
+a dgettext() call is first checking whether state is NULL before
+attempting to dereference it to get the root_argp->argp_domain.
+
+Fixes: CID 292436
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3a37bf120a9194c373257c70175cdb5b337bc107]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ conf/Makefile.extra-dist                             |  1 +
+ .../lib/gnulib-patches/fix-null-state-deref.patch    | 12 ++++++++++++
+ 2 files changed, 13 insertions(+)
+ create mode 100644 grub-core/lib/gnulib-patches/fix-null-state-deref.patch
+
+diff --git a/conf/Makefile.extra-dist b/conf/Makefile.extra-dist
+index 9e55458..96d7e69 100644
+--- a/conf/Makefile.extra-dist
++++ b/conf/Makefile.extra-dist
+@@ -29,6 +29,7 @@ EXTRA_DIST += grub-core/genemuinit.sh
+ EXTRA_DIST += grub-core/genemuinitheader.sh
+ 
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-null-deref.patch
++EXTRA_DIST += grub-core/lib/gnulib-patches/fix-null-state-deref.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-uninit-structure.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-unused-value.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-width.patch
+diff --git a/grub-core/lib/gnulib-patches/fix-null-state-deref.patch b/grub-core/lib/gnulib-patches/fix-null-state-deref.patch
+new file mode 100644
+index 0000000..813ec09
+--- /dev/null
++++ b/grub-core/lib/gnulib-patches/fix-null-state-deref.patch
+@@ -0,0 +1,12 @@
++--- a/lib/argp-help.c	2020-10-28 14:32:19.189215988 +0000
+++++ b/lib/argp-help.c	2020-10-28 14:38:21.204673940 +0000
++@@ -145,7 +145,8 @@
++       if (*(int *)((char *)upptr + up->uparams_offs) >= upptr->rmargin)
++         {
++           __argp_failure (state, 0, 0,
++-                          dgettext (state->root_argp->argp_domain,
+++                          dgettext (state == NULL ? NULL
+++                                    : state->root_argp->argp_domain,
++                                     "\
++ ARGP_HELP_FMT: %s value is less than or equal to %s"),
++                           "rmargin", up->name);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index df2c8b8a16..94873475c1 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -56,6 +56,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0007-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch \
            file://0008-gnulib-regexec-Resolve-unused-variable.patch \
            file://0009-gnulib-regcomp-Fix-uninitialized-token-structure.patch \
+           file://0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


