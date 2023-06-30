Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C231DC0015E
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:24 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.3845.1688092161959071155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cOt5KY0p;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-666ed230c81so1285705b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092161; x=1690684161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfKzUfer7KZaVftsKZNzplsBhoSONvxFvBiKQUmyMv4=;
        b=cOt5KY0p8tSjQGvMJY534DFlcVUUUrS284vYHfrmRHJAWxxh+L4jWS8+5jtsn+rs1k
         nCPLZKc4Z8lOncCO6YCMmQBQJ2dfYrooqF+gZO2opas8/4uqE7Ucb308x1ZxGAc8yWla
         GBHpR+J8wcvjUCbTUnyPWyBba096L/6mX3hkkoOMUZaw1P8Xw7L+aA2YeQVQP5J6COv4
         5Q2mKCSHMizbIWbPj1kqiVzZBziW6H5w3e+3vtzdDvw6IYDTImQxM2ZhLQ4le5BKGmXa
         +cEnCe+vtaERrtl+0VXBJuoQtJBEKwUeOwEP3PNchnAwVvoRuU786QkcmpWkdDkoYrFO
         PnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092161; x=1690684161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfKzUfer7KZaVftsKZNzplsBhoSONvxFvBiKQUmyMv4=;
        b=SqTr2bCsa+6Rrriv4qwJuoFId90Suz66HoFDNasl1W/agW9exDsBJ5b/eb2xTZQCkk
         n5OikXmqXtwP+eJzb/NkuJ9E78Z9ePxBMuEG5cGDrO1DOOJ1hQDeOCv9KfwAn4CgRnSZ
         4oRlPAKywhKSUTAuSX7K+VoMceRJ3DPFX6ID8qZw1k0q92Bs0CJBWksfForx+KEn7ghG
         tmIxhW/oxAvNkselB6DPPoOjQIUnLAAx8/Qsh0rft8410JT/5GvRk/yZirijI7Is56Yw
         wOONSvydckmZhotYqGcy9I2GkQ9PVlcvpOc5DqH/jw5fFlrXIgw46QjEdfTv3NcVzt5B
         T3QQ==
X-Gm-Message-State: ABy/qLaFSvyGIO72V84dDIdSWtKwFRMfbcc7cWI4RDW24/Bj7+bqyIXS
	fxQUIV0xu+EFAJEkB5HswTunRhDJUlXYu1KSMzKXtg==
X-Google-Smtp-Source: APBJJlGqIzyrvbnoZdDsm6nMPCv0yfZh1HlSloqRC9yYr6ynzsO83dKosyZzzeKhTKRNuW9nHfgZvg==
X-Received: by 2002:a05:6a00:174c:b0:668:81c5:2f8d with SMTP id j12-20020a056a00174c00b0066881c52f8dmr2287914pfc.3.1688092160944;
        Thu, 29 Jun 2023 19:29:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/30] bno_plot.py, btt_plot.py: Ask for python3 specifically
Date: Thu, 29 Jun 2023 16:28:41 -1000
Message-Id: <055330871b0d8f443d8eded6c0fcc0e404f70b8a.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183645

From: Sakib Sajal <sakib.sajal@windriver.com>

python2 has been deprecated, use python3 instead

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...plot.py-Ask-for-python3-specifically.patch | 35 +++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
new file mode 100644
index 0000000000..a3b8a98589
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
@@ -0,0 +1,35 @@
+From b8d9618cbbec5a04cf6dede0a6ceda41021b92ae Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Mon, 26 Jun 2023 17:34:01 -0400
+Subject: [PATCH] bno_plot.py, btt_plot.py: Ask for python3 specifically
+
+python2 is deprecated, use python3.
+
+Upstream-Status: Denied [https://www.spinics.net/lists/linux-btrace/msg01364.html]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ btt/bno_plot.py | 2 +-
+ btt/btt_plot.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/btt/bno_plot.py b/btt/bno_plot.py
+index 3aa4e19..d7d7159 100644
+--- a/btt/bno_plot.py
++++ b/btt/bno_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt blkno plotting interface
+ #
+diff --git a/btt/btt_plot.py b/btt/btt_plot.py
+index 40bc71f..8620d31 100755
+--- a/btt/btt_plot.py
++++ b/btt/btt_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt_plot.py: Generate matplotlib plots for BTT generate data files
+ #
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index d0eeba3208..288784236a 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -14,7 +14,9 @@ SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
 PV = "1.3.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master;protocol=https"
+SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master;protocol=https \
+           file://0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


