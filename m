Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82ADEC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:38 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.6939.1645799317754911228
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4/LK6GcW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id ay5so2137087plb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Lwn0NSUIGNYtSlUStd8OtEfW1Yjwd0d4hwnK46Mch68=;
        b=4/LK6GcWd/4FNeftFF4fRtD4H0zh3HelZO/2104ldKO3l05o2CvVRpIKJwB+xIyj3a
         ZBTM8Y2BM38XX7shEcvpn2ThIYpq1KVLFY/Hn2yqm0Vm5iWBboVmPWOOia9ajmDc+jcK
         DCnEhdN+38ssFF0j5vcbWwpXkiQq7isYZihkKxWZA69b7ClYCQwnvHr3sHbbLs1fUB7y
         TlwHrwK9tcB3MLIuVLQG7jpFcnl5q0XdRpF8eGAhnLjdGhS/6ENN6bLqIAocC95Idx29
         URaHDz3gfZTvh/pXWQX3BREYur35Uw5FQd4NsVoeTR1weqH8vG7F2zQcnRQKam43NrKW
         gGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lwn0NSUIGNYtSlUStd8OtEfW1Yjwd0d4hwnK46Mch68=;
        b=63KqC6JU347UBAdFwNwnPfxBIgVDqXyAMFCIVfxlohhv0h9TcrTErmHQq5O/fHFz9v
         ZC44lftpEVDfcgxmgVBgPoWhtx///llDGiZXeFQWK582s3Q8KgLhnTtpTofe7EUnkk5L
         chCwxp7O73S+oxzxJmRpQE2KGcR24mT5HbWIKasfHb/zgenrPQNzAlksKoYmTcTIzMg3
         KZr17KBwJ5S0v/IV8cBhDlpXhvxqCdm+Hs2WRzfGYTiFtVg6kPnJCio/Ova+e/wcaUAA
         KThAJBJku6b/d4I3vAaco8VMnh4EhaSf4JTu1Xeh8O4yrtpxnG2I5U5TTyG7hla/WL0r
         Fz9g==
X-Gm-Message-State: AOAM531pKZuxzCc1y23OPspkMXyZerEzj9CdZ2q3VhZrr4K8DS7ypyx9
	F7rHZF0mlx9bDsLJrLLE2adk/RrI0Hq6eICS
X-Google-Smtp-Source: 
 ABdhPJyOL6Z2VnZ+NrwcrKMijR6GsAAPLvATUBrSprBXtFdD3afMMr+YkbsYVGcDeh44Z2R9cFSMUQ==
X-Received: by 2002:a17:90a:a887:b0:1bc:388a:329f with SMTP id
 h7-20020a17090aa88700b001bc388a329fmr3434640pjq.17.1645799316735;
        Fri, 25 Feb 2022 06:28:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 48/50] grub: add a fix for a NULL pointer
 dereference
Date: Fri, 25 Feb 2022 04:26:28 -1000
Message-Id: 
 <ddf62ae472c3c26af7a4c91e4216c8d5ba4604ac.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162394

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for a NULL pointer dereference in grub's
script/execute. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ix-NULL-dereference-in-grub_script_e.patch | 28 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch

diff --git a/meta/recipes-bsp/grub/files/0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch b/meta/recipes-bsp/grub/files/0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch
new file mode 100644
index 0000000000..b279222fff
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch
@@ -0,0 +1,28 @@
+From f5fb56954e5926ced42a980c3e0842ffd5fea2aa Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Fri, 3 Apr 2020 23:05:13 +1100
+Subject: [PATCH] script/execute: Fix NULL dereference in
+ grub_script_execute_cmdline()
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=41ae93b2e6c75453514629bcfe684300e3aec0ce]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/script/execute.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/script/execute.c b/grub-core/script/execute.c
+index 7e028e1..5ea2aef 100644
+--- a/grub-core/script/execute.c
++++ b/grub-core/script/execute.c
+@@ -940,7 +940,7 @@ grub_script_execute_cmdline (struct grub_script_cmd *cmd)
+   struct grub_script_argv argv = { 0, 0, 0 };
+ 
+   /* Lookup the command.  */
+-  if (grub_script_arglist_to_argv (cmdline->arglist, &argv) || ! argv.args[0])
++  if (grub_script_arglist_to_argv (cmdline->arglist, &argv) || ! argv.args || ! argv.args[0])
+     return grub_errno;
+ 
+   for (i = 0; i < argv.argc; i++)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 2f230065b2..84b8b8d1be 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -90,6 +90,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0041-util-grub-install-Fix-NULL-pointer-dereferences.patch \
            file://0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch \
            file://0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch \
+           file://0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


