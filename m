Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742F1C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:27 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.9106.1645178786144510730
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sep19A0I;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso6006094wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LjI27LnK64nL9hqgiiXCvXM0WdUdi/2YsdU0oZvS2qo=;
        b=Sep19A0I6QgZmmxs8U1mMbmv/F1ecqRjLOSCCeF52xycUbRUaVXJ+LukYTEklURs1x
         yCF2nYguffTa67xuRVMZJhDzh+1Gd+BsCyTu/Zj+pICnDFMTqx0W4FIM9E5btsoZCQT8
         dYzhQOceUrxTtMiTUYcrNUJk5Q/TBc3gJkE0ON8r9G7A0I7C8nzEf2z27oZ4xDWklUFc
         XJFD2LR6KM+r+lqo31vEpQLMzC+QwTPx8n5IcSXfh3RM24iuF3BPkF6o0AWSfJmbLlK1
         zTagFjwOULZWiJGCH9FUpDFfsEFNGmsQe0X1Kpe6rNtx+olb2Qg/p03vDh2tkCzyo4R0
         q01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LjI27LnK64nL9hqgiiXCvXM0WdUdi/2YsdU0oZvS2qo=;
        b=3KinzkEiQxUngYWWEu7PnCr6o/0CvBvFRPTRdqpJj+zc/HsP2azhN2c7g2HkQQfcy1
         15Sh7IGDw55wtvFj9VGG38h30hDqdooMzGiMRhHq0+n4IbuzM1s3NtWDxEys76JJ8sKe
         w8X+ayiioirr4tHkjzftkeMHPl/afK3o7vx5RMlPlQcfEImKqjiYZbWRU1/FDUugjAKn
         7HJv+HH/a/ShyoxyJChnye1U040lQc45Gatw9phOVPpR663xdLD6DIIZv8LWMdrKiaAX
         xRb+MoFCVpNUXg5Aj/8rudcN5ef9QmJ15rwNDHMU2Aw7oOdulcAhns2xB/7MiTFP6fXz
         hZgQ==
X-Gm-Message-State: AOAM532nqHgDQYi0yuC7H28QUpP8jen+LuEvVjgRDwPiaJ0BI1HHWJ/h
	XPwqGjsyV5TjgVDNVUR5LYpitWjUQDU=
X-Google-Smtp-Source: 
 ABdhPJwaUIhBdQKHGoe2F4I3pUhb/xxNOvhVmjeV4io62K83HxMiui4DZUocHos12D6YyLsIsY6dDg==
X-Received: by 2002:a1c:7419:0:b0:37b:b96e:81a6 with SMTP id
 p25-20020a1c7419000000b0037bb96e81a6mr10038666wmc.8.1645178784668;
        Fri, 18 Feb 2022 02:06:24 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:24 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 08/46][dunfell] grub: add a fix for unused variable in gnulib
Date: Fri, 18 Feb 2022 11:05:16 +0100
Message-Id: <20220218100554.1315511-9-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161896

This changes adds a fix for an unused variable issue in gnulib.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...ulib-regexec-Resolve-unused-variable.patch | 59 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0008-gnulib-regexec-Resolve-unused-variable.patch

diff --git a/meta/recipes-bsp/grub/files/0008-gnulib-regexec-Resolve-unused-variable.patch b/meta/recipes-bsp/grub/files/0008-gnulib-regexec-Resolve-unused-variable.patch
new file mode 100644
index 0000000000..74ffb559e9
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0008-gnulib-regexec-Resolve-unused-variable.patch
@@ -0,0 +1,59 @@
+From 9d36bce5d516b6379ba3a0dd1a94a9c035838827 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Wed, 21 Oct 2020 14:41:27 +0000
+Subject: [PATCH] gnulib/regexec: Resolve unused variable
+
+This is a really minor issue where a variable is being assigned to but
+not checked before it is overwritten again.
+
+The reason for this issue is that we are not building with DEBUG set and
+this in turn means that the assert() that reads the value of the
+variable match_last is being processed out.
+
+The solution, move the assignment to match_last in to an ifdef DEBUG too.
+
+Fixes: CID 292459
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=a983d36bd9178d377d2072fd4b11c635fdc404b4]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ conf/Makefile.extra-dist                           |  1 +
+ .../lib/gnulib-patches/fix-unused-value.patch      | 14 ++++++++++++++
+ 2 files changed, 15 insertions(+)
+ create mode 100644 grub-core/lib/gnulib-patches/fix-unused-value.patch
+
+diff --git a/conf/Makefile.extra-dist b/conf/Makefile.extra-dist
+index 46c4e95..9b01152 100644
+--- a/conf/Makefile.extra-dist
++++ b/conf/Makefile.extra-dist
+@@ -29,6 +29,7 @@ EXTRA_DIST += grub-core/genemuinit.sh
+ EXTRA_DIST += grub-core/genemuinitheader.sh
+ 
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-null-deref.patch
++EXTRA_DIST += grub-core/lib/gnulib-patches/fix-unused-value.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-width.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/no-abort.patch
+ 
+diff --git a/grub-core/lib/gnulib-patches/fix-unused-value.patch b/grub-core/lib/gnulib-patches/fix-unused-value.patch
+new file mode 100644
+index 0000000..ba51f1b
+--- /dev/null
++++ b/grub-core/lib/gnulib-patches/fix-unused-value.patch
+@@ -0,0 +1,14 @@
++--- a/lib/regexec.c	2020-10-21 14:25:35.310195912 +0000
+++++ b/lib/regexec.c	2020-10-21 14:32:07.961765604 +0000
++@@ -828,7 +828,11 @@
++ 		    break;
++ 		  if (__glibc_unlikely (err != REG_NOMATCH))
++ 		    goto free_return;
+++#ifdef DEBUG
+++		  /* Only used for assertion below when DEBUG is set, otherwise
+++		     it will be over-written when we loop around.  */
++ 		  match_last = -1;
+++#endif
++ 		}
++ 	      else
++ 		break; /* We found a match.  */
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 46d65d8609..d2a1502d56 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -54,6 +54,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0005-efi-Fix-some-malformed-device-path-arithmetic-errors.patch \
            file://0006-kern-efi-Fix-memory-leak-on-failure.patch \
            file://0007-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch \
+           file://0008-gnulib-regexec-Resolve-unused-variable.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


