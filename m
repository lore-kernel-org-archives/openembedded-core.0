Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E41C433F5
	for <webhook@archiver.kernel.org>; Sat, 18 Dec 2021 04:55:17 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.1978.1639803316634772438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 20:55:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ellpr1mb;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: flowergom@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id u17so3543176plg.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 20:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PcQduq3H6xlyIFVD24vMWMCtakgxk3J5J2CJZCufvIQ=;
        b=Ellpr1mbZIPD7L4usVc/D1NAxU93N83TAIQHdIPK8JHVo8U+Jy6g3CB8ib+1+4IFgK
         OfebSPkk290zKJrEvbvMyoXOgleIJecV8wYvvRgBynCe8iMmlitnB6riu8/aENWZxMk8
         hyEnXXsNOlMVDM9/npLH2/+QvvDSvq9WILxtgKSyc9FUolBW6TXA54pAbwf2PSmCGOPN
         AC8lncP+ntlV6+QG5hKgRcN9aGerAjIeQQtGSKwvz0fwLwzvaNhqZRCwBH+QCnzuw+V5
         zZxIuBD9iv4cf+JRyCkusBJSJFokt0TIObGzyC9srPyeS19JuBmnVWEdKMAAI84Aw7gm
         uqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PcQduq3H6xlyIFVD24vMWMCtakgxk3J5J2CJZCufvIQ=;
        b=RxiHxi26HfIIgcQTt31iudCmcMw404/Dnq9+VxnqJpifnC40eoV7fTQHcGgCSUAMhh
         FAMecvekMLHDcVNailymMOQxWtL0+HZzBogiZPeNxFaDerkC2GKnkVIBTLAfftkkJxHL
         vNqLr3PnpyffAVIndasErLDdKsKH+V+O+L1n6qFSrDwHLETifLOH84ilFqaZXuqlIAKK
         buASmBLLWfd4yP19dzkOslU3YIXuGmwxv7i8iptPzsrRJzvhvVwgD1bWbJSsBdK4eNpn
         Vk6VfskWwmy0VhVw21oRJbgIA4NZVIqQDco/+lTnIpM9O2xNcSKAcJvCf1oZ9O2aF09v
         ivtg==
X-Gm-Message-State: AOAM532mdDlsSiJ2vu5vDm7T5HefqcEUp+GaebVqqr6TzjpaAzPyxLR4
	Z52foTcF38t+oms+CpbuA0Oo6cgetoXJwePe7nM=
X-Google-Smtp-Source: 
 ABdhPJzg0D5L8IY0S8O76EoRZYWOyUOmTgVKvHGR4Lbz6Irh26WY7yUJ4JfbrM5DV1jhZv656qTS0A==
X-Received: by 2002:a17:902:6b45:b0:148:a30e:5219 with SMTP id
 g5-20020a1709026b4500b00148a30e5219mr6283647plt.10.1639803315813;
        Fri, 17 Dec 2021 20:55:15 -0800 (PST)
Received: from ubuntu.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id
 mu4sm15031469pjb.8.2021.12.17.20.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 20:55:15 -0800 (PST)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH v2] vim: fix CVE-2021-4069
Date: Fri, 17 Dec 2021 20:55:05 -0800
Message-Id: <20211218045505.14123-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Dec 2021 04:55:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159840

Use After Free in vim/vim

Upstream-Status: Backport [https://github.com/vim/vim/commit/e031fe90cf2e375ce861ff5e5e281e4ad229ebb9]
CVE: CVE-2021-4069
---
 .../vim/files/CVE-2021-4069.patch             | 43 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-4069.patch

diff --git a/meta/recipes-support/vim/files/CVE-2021-4069.patch b/meta/recipes-support/vim/files/CVE-2021-4069.patch
new file mode 100644
index 0000000000..6a67281907
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2021-4069.patch
@@ -0,0 +1,43 @@
+From cd2422ee2dab3f33b2dbd1271e17cdaf8762b6d1 Mon Sep 17 00:00:00 2001
+From: Minjae Kim <flowergom@gmail.com>
+Date: Fri, 17 Dec 2021 20:32:02 -0800
+Subject: [PATCH] using freed memory in open command
+
+Problem:    Using freed memory in open command.
+Solution:   Make a copy of the current line.
+
+Upstream-Status: Backported [https://github.com/vim/vim/commit/e031fe90cf2e375ce861ff5e5e281e4ad229ebb9]
+CVE: CVE-2021-4069
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ src/ex_docmd.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/ex_docmd.c b/src/ex_docmd.c
+index 59e245bee..ccd9e8bed 100644
+--- a/src/ex_docmd.c
++++ b/src/ex_docmd.c
+@@ -6029,13 +6029,17 @@ ex_open(exarg_T *eap)
+ 	regmatch.regprog = vim_regcomp(eap->arg, p_magic ? RE_MAGIC : 0);
+ 	if (regmatch.regprog != NULL)
+ 	{
++            // make a copy of the line, when searching for a mark it might be
++	    // flushed
++	    char_u *line = vim_strsave(ml_get_curline());
++
+ 	    regmatch.rm_ic = p_ic;
+-	    p = ml_get_curline();
+-	    if (vim_regexec(&regmatch, p, (colnr_T)0))
+-		curwin->w_cursor.col = (colnr_T)(regmatch.startp[0] - p);
++	    if (vim_regexec(&regmatch, line, (colnr_T)0))
++		curwin->w_cursor.col = (colnr_T)(regmatch.startp[0] - line);
+ 	    else
+ 		emsg(_(e_nomatch));
+ 	    vim_regfree(regmatch.regprog);
++	    vim_free(line);
+ 	}
+ 	// Move to the NUL, ignore any other arguments.
+ 	eap->arg += STRLEN(eap->arg);
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 11fed67527..51a6861325 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://0001-patch-8.2.3581-reading-character-past-end-of-line.patch \
            file://0002-patch-8.2.3582-reading-uninitialized-memory-when-giv.patch \
            file://0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch \
+	   file://CVE-2021-4069.patch \
            "
 
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
-- 
2.25.1


