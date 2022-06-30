Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A04CCCA481
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:23:42 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.27453.1656606218664775094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Ir8u37vZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 c6-20020a17090abf0600b001eee794a478so3664574pjs.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=z1vozyKnZEA89Nj0n41A5BVHi5xhRnB0RDOV3xSgbEA=;
        b=Ir8u37vZmN71Q/+Tt7c53lYxPZ0HdcDgR1OTulwAQAwDkuXYADJefSIpykxAIoSK8v
         8y2yyiwWFvQIL4JfH/MmDGACj7oELXSRMvzr+KnVlvbygdYxOp0cJdK78Ke4OD1Wt7ZC
         /O3zZe7qFMZzJaf2dVWOFH7Achr9LbQ9K9JXiF7YBt5ca8TQwfaGCpCJ1EpxdTxmm9GE
         5+6ht31FM/HSmlvd3grHkn4GjS2TSzn6QH1Q8wnDgtL6/7fuOG68rLFV+lNWNtDmm3Qa
         /UGDlgOdsihtDkAhMw4+hRoPmXSuMys5RnWMJdrnHtEWj7bbWgsEq0lgSGpqksMvCzhd
         5k/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z1vozyKnZEA89Nj0n41A5BVHi5xhRnB0RDOV3xSgbEA=;
        b=tTY2/AvlNJF+yjtoYl9SnqQecIC95mZwG7HkcFUw9X4wUy3DU+M8vLKveMDqqoIAIr
         /Z8/cGPudNQKZPSZBz/WehxOFKH7wi+t4tM86iYnW5nNUIEon7RK4Ywh8IVZknewwYif
         LCJpkGC4GU4lCNwV/1cIwCJPdHShMMnl+HZoZCkuCMsto0mDYXb5GnOel4yvas946MQ/
         CnUnAvrsl06IDBwdaf9IEtw1/MMGu3D1wr1PUKVaT90XWHr8AWKIR/hUiLqpkQJ0QDLN
         6mlPgd3kaAUI6eHTY+FnZiol3FvitkpsRimN9dePVZD9IyStJrneB3ZgCVGRjz2R3wib
         0p9Q==
X-Gm-Message-State: AJIora9GtxAPL1z2QulnE6PzuOxma+lZoEO6srHO8vm6dfLkdhD30N1t
	Jg2JlootH7xdGrlh2F9oK1XMo4yAGEXCEFiQ
X-Google-Smtp-Source: 
 AGRyM1vvusQRMNFipy1bbEEQ7kSM2tEZJbPtFJpyjcKxiDOavJlnXKrX5n4a6FdpnJ7NaODWNDjcng==
X-Received: by 2002:a17:90b:388e:b0:1ec:f6b6:f31f with SMTP id
 mu14-20020a17090b388e00b001ecf6b6f31fmr12828207pjb.181.1656606217433;
        Thu, 30 Jun 2022 09:23:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t129-20020a625f87000000b005259578e8fcsm10517611pfb.181.2022.06.30.09.23.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:23:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/12] grub2: CVE-2021-3981 Incorrect permission in
 grub.cfg allow unprivileged user to read the file content
Date: Thu, 30 Jun 2022 06:23:06 -1000
Message-Id: 
 <fd9dc688ead5cf0225cba94c380a618e332d548f.1656605800.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656605800.git.steve@sakoman.com>
References: <cover.1656605800.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167422

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://git.savannah.gnu.org/cgit/grub.git/
MR: 116495
Type: Security Fix
Disposition: Backport from https://git.savannah.gnu.org/cgit/grub.git/diff/util/grub-mkconfig.in?id=0adec29674561034771c13e446069b41ef41e4d4
ChangeID: fce3d59e50320bef247bb981352051b8f953a4fc
Description:
        CVE-2021-3981 grub2: Incorrect permission in grub.cfg allow unprivileged user to read the file content.

Affects "grub2 < 2.06"

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2021-3981.patch            | 32 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3981.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3981.patch b/meta/recipes-bsp/grub/files/CVE-2021-3981.patch
new file mode 100644
index 0000000000..e27027ea65
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2021-3981.patch
@@ -0,0 +1,32 @@
+From 67740c43c9326956ea5cd6be77f813b5499a56a5 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 27 Jun 2022 10:15:29 +0530
+Subject: [PATCH] CVE-2021-3981
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/diff/util/grub-mkconfig.in?id=0adec29674561034771c13e446069b41ef41e4d4]
+CVE: CVE-2021-3981
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ util/grub-mkconfig.in | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/util/grub-mkconfig.in b/util/grub-mkconfig.in
+index 9f477ff..ead94a6 100644
+--- a/util/grub-mkconfig.in
++++ b/util/grub-mkconfig.in
+@@ -287,7 +287,11 @@ and /etc/grub.d/* files or please file a bug report with
+     exit 1
+   else
+     # none of the children aborted with error, install the new grub.cfg
+-    mv -f ${grub_cfg}.new ${grub_cfg}
++    oldumask=$(umask)
++    umask 077
++    cat ${grub_cfg}.new > ${grub_cfg}
++    umask $oldumask
++    rm -f ${grub_cfg}.new
+   fi
+ fi
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 0d3f6d05da..9e98d8249d 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -95,6 +95,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch \
            file://0045-commands-ls-Require-device_name-is-not-NULL-before-p.patch \
            file://0046-script-execute-Avoid-crash-when-using-outside-a-func.patch \
+           file://CVE-2021-3981.patch\
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


