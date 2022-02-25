Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8305AC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:31 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.7084.1645799310819070901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=l5JmAaFN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id c9so4994286pll.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xEvSBxA2a8OQEcjrliGI3HuzBSASancq468k0v/m300=;
        b=l5JmAaFNRzLNykRp/VQvio1eQ1PABlt9QvDp1BC9ErWq4Dh45NeFRApwS2DEpeYQXe
         r00CJ6AlZV3e6aFtY7K3hJvmfbX6+sjyeeKoidO4jp/MPmy5hx8lfYHGNxHWuG76tCLX
         QumJxp8T7V8KEkW/J35i9m3OXZV7I1pIBXVQKM2X9X90K1qkbgqRF29cdLHdLIQSJW34
         XrLw79N60UxMZU/zKB+Twmd0d5VO6CrsanCkjpllhydOnmd0065EG9162+kI6wdEpWfc
         HfbtzWmmR9Aqg67kDBToYr52wL+uSBEF9e6Q4tUlLhcfjp7hLTnxoQsXshx0G3IYWzuN
         c67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xEvSBxA2a8OQEcjrliGI3HuzBSASancq468k0v/m300=;
        b=721KofcVBWen5bXKO6sYuuroOLvYOKvufmUueh3yc95Q8NtMZoh+jNBKmwX5mavV27
         tAGtv81PJRUfeif1wf6Q+qCtO515ZGlzE/SEDIF5kwJ8Lkq4L8ZgN4k/Lwqwx2MPZ4jv
         R+pUa0BUcyqIE0b7ftwPYh1og4WHDPXdAjG9C+1UueMcYKLsxu8wxaur/9Ny05wB9v0L
         MoRBfFkc29xpfASIE7AwBVPFyka17K3A83Ei0Cyy+9r1eppGJYaJEcuFLFFZwDq7pFzr
         5gNl05DuywsgMgIEWNilOFxxlWXY8t8sq01d2YV7hh1B2iSDhfgLnhbCCNc0CBHd5nLg
         fBXQ==
X-Gm-Message-State: AOAM530omfCmT7Q+ttXcRv393xOdrMUu6Yrv5PJlCEqiROsofq2S8H7g
	oWnklEg0u5SDvegdIwdZuNfUGpODCzzUkkS8
X-Google-Smtp-Source: 
 ABdhPJyz7mn86W2cf3e8RjuEarny8KcWF4jjTYEjAsoEbWpnEiv/IB5FVA3qpbBq/PcGlazAWMlPVA==
X-Received: by 2002:a17:902:ef4c:b0:14f:7548:dae3 with SMTP id
 e12-20020a170902ef4c00b0014f7548dae3mr7712465plx.92.1645799309853;
        Fri, 25 Feb 2022 06:28:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 45/50] grub: add a fix for NULL pointer dereference
Date: Fri, 25 Feb 2022 04:26:25 -1000
Message-Id: 
 <35310bcfd53752081ed600e77f58ca3fb8db46ac.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162391

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for a NULL pointer dereference in grub's
util/grub-install. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...nstall-Fix-NULL-pointer-dereferences.patch | 41 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0041-util-grub-install-Fix-NULL-pointer-dereferences.patch

diff --git a/meta/recipes-bsp/grub/files/0041-util-grub-install-Fix-NULL-pointer-dereferences.patch b/meta/recipes-bsp/grub/files/0041-util-grub-install-Fix-NULL-pointer-dereferences.patch
new file mode 100644
index 0000000000..ea563a41a0
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0041-util-grub-install-Fix-NULL-pointer-dereferences.patch
@@ -0,0 +1,41 @@
+From 5d2dd0052474a882a22e47cc8c3ed87a01819f6b Mon Sep 17 00:00:00 2001
+From: Daniel Kiper <daniel.kiper@oracle.com>
+Date: Thu, 25 Feb 2021 18:35:01 +0100
+Subject: [PATCH] util/grub-install: Fix NULL pointer dereferences
+
+Two grub_device_open() calls does not have associated NULL checks
+for returned values. Fix that and appease the Coverity.
+
+Fixes: CID 314583
+
+Signed-off-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=8b3a95655b4391122e7b0315d8cc6f876caf8183]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ util/grub-install.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/util/grub-install.c b/util/grub-install.c
+index a82725f..367350f 100644
+--- a/util/grub-install.c
++++ b/util/grub-install.c
+@@ -1775,6 +1775,8 @@ main (int argc, char *argv[])
+ 	  fill_core_services (core_services);
+ 
+ 	  ins_dev = grub_device_open (install_drive);
++	  if (ins_dev == NULL)
++	    grub_util_error ("%s", grub_errmsg);
+ 
+ 	  bless (ins_dev, core_services, 0);
+ 
+@@ -1875,6 +1877,8 @@ main (int argc, char *argv[])
+ 	  fill_core_services(core_services);
+ 
+ 	  ins_dev = grub_device_open (install_drive);
++	  if (ins_dev == NULL)
++	    grub_util_error ("%s", grub_errmsg);
+ 
+ 	  bless (ins_dev, boot_efi, 1);
+ 	  if (!removable && update_nvram)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index fad7415e0d..7ca0b469e9 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -87,6 +87,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0038-loader-xnu-Fix-memory-leak.patch \
            file://0039-loader-xnu-Free-driverkey-data-when-an-error-is-dete.patch \
            file://0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch \
+           file://0041-util-grub-install-Fix-NULL-pointer-dereferences.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


