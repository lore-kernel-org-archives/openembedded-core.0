Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51741C6FA89
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 02:26:20 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.1755.1663122372909214641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mnbVTwxG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id e5so13506704pfl.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=oAwnqHrvrnS+SyGh8ETlN+8EktBa5eaUHD+Dt6xr1Ws=;
        b=mnbVTwxGZy3PVJKefAUjym+2jBHsPmpNB6Dee2Zz/MUfkpsg3otar+w2mNn62/6Daw
         RyRMNys0u+P0ZaoMAIHMjoXd8CVuoue1isWOeNo+ZAv3YUDj/Re0+wluNd64e21BSFlE
         s+TvVnWcNlDSE1WwScKJ0ZHVdnf2TwiTnnws7KrZIChJARvN3L6HVAoumEZjPL7lRvQz
         iMHXa7N5omw8FrcKEQKcSrOQH80zHihFI/mooTgUIktNxke1DlVPBWgVVxiMqTfl348p
         idQv+y10ShDK5q8XQzpFdC1SDrF+eI4nU8Xv2fAJFboXLLGm2Z3VCI3x0DWfsNn+F3an
         fm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oAwnqHrvrnS+SyGh8ETlN+8EktBa5eaUHD+Dt6xr1Ws=;
        b=PBrey8fqHj/+rRB+E+le4UN7rcEfJ576b0XTOtGGMjE+ULINWdJ/ixgb0rqOpJgA3p
         ov09Tj78F12REIpEhYdLEyXP7GJxxy63ZtKft8p+G7by36b/azJR8c8dXS3JNtAGVIMd
         ztaBUTrCh3JAXiNkwOzGk47vQge1nftLf9YuNYFnLfLk3cOLRdLO0ClMzDkpYNYTWgXW
         fg4wVi8+tCcFbPg3wpDbLCMxd87rYs1oHLhUDhZDVOx6VA3ixLv2ZXU9ILj77ya2EXgj
         3BgBv5Jes6mI3wc+uS6PGG+EzB9VPHjyLKDm0t88gALQcibDOZYtz8dtNsDmEoxJcFap
         3x4g==
X-Gm-Message-State: ACgBeo31DbIDJa1w5gai6hwXLdRAHAQ7quvUfCrtP/f3GA+Lo6KUU+kK
	SrqUAg4oHTqkxgUxhT/7hOnQ1/7eJ3yJsjx2
X-Google-Smtp-Source: 
 AA6agR4g1cs0Pv6bZYBqTxdUV+htXGR0DcxB/1HXS7UxctYr+SrtWYWSP7xZTmwngccISPEjhZok5w==
X-Received: by 2002:a05:6a00:852:b0:544:5907:7520 with SMTP id
 q18-20020a056a00085200b0054459077520mr10854134pfk.31.1663122371844;
        Tue, 13 Sep 2022 19:26:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s14-20020a65644e000000b00438fe64d61esm5259871pgv.0.2022.09.13.19.26.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 19:26:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/9] connman: fix CVE-2022-32292
Date: Tue, 13 Sep 2022 16:25:14 -1000
Message-Id: 
 <380b6fb2583f875aad0cb28c91b1531e63eb2eeb.1663122098.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663122098.git.steve@sakoman.com>
References: <cover.1663122098.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 02:26:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170622

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../connman/connman/CVE-2022-32292.patch      | 37 +++++++++++++++++++
 .../connman/connman_1.37.bb                   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch b/meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch
new file mode 100644
index 0000000000..74a739d6a2
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch
@@ -0,0 +1,37 @@
+From d1a5ede5d255bde8ef707f8441b997563b9312bd Mon Sep 17 00:00:00 2001
+From: Nathan Crandall <ncrandall@tesla.com>
+Date: Tue, 12 Jul 2022 08:56:34 +0200
+Subject: gweb: Fix OOB write in received_data()
+
+There is a mismatch of handling binary vs. C-string data with memchr
+and strlen, resulting in pos, count, and bytes_read to become out of
+sync and result in a heap overflow.  Instead, do not treat the buffer
+as an ASCII C-string. We calculate the count based on the return value
+of memchr, instead of strlen.
+
+Fixes: CVE-2022-32292
+
+Upstream-Status: Backport
+https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d1a5ede5d255bde8ef707f8441b997563b9312b
+CVE: CVE-2022-32292
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ gweb/gweb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gweb/gweb.c b/gweb/gweb.c
+index 12fcb1d8..13c6c5f2 100644
+--- a/gweb/gweb.c
++++ b/gweb/gweb.c
+@@ -918,7 +918,7 @@ static gboolean received_data(GIOChannel *channel, GIOCondition cond,
+ 		}
+ 
+ 		*pos = '\0';
+-		count = strlen((char *) ptr);
++		count = pos - ptr;
+ 		if (count > 0 && ptr[count - 1] == '\r') {
+ 			ptr[--count] = '\0';
+ 			bytes_read--;
+-- 
+cgit 
+
diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
index bdd1e590ec..4f22c7ad49 100644
--- a/meta/recipes-connectivity/connman/connman_1.37.bb
+++ b/meta/recipes-connectivity/connman/connman_1.37.bb
@@ -12,6 +12,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://CVE-2021-33833.patch \
             file://CVE-2022-23096-7.patch \
             file://CVE-2022-23098.patch \
+            file://CVE-2022-32292.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.25.1


