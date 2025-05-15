Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF56C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 14:51:25 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.14714.1747320675604491955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 07:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bvN/inxF;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: liu.ming50@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5feb22e7d84so2089822a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 07:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747320673; x=1747925473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZM0FsU0CjsCzXjZVlgPHJMrtX+Xn07BuMFdoeVS/0jk=;
        b=bvN/inxFkcX0s9lXgUEk5mrlamXbNJP6FS1JjPnS2J8rMsqXCiRM6LLw0jXYX/5GaH
         gLccjOUB6jM+FPsAPfEebyNwbPN2PyGfxa1SjM1LRZt5nt4+sGNTkvdzriNOaR6IADnk
         4PKzgA3lVZxcplZCA2LxdLZ81u7Q6g8bm/A1pOd48HAi0ey7MxYA4UPOXpHhKTQMwk3Y
         EYyoPv6yDxlo5SNxiFALev0CCuK876Jd47QSblwnWTowYcfAw1qd+ofRPacmfPZ3FGA1
         WhBXrW1DcjELTZg4dN6fYogCJQ8ngBT48ZoTcsXIbLzTuy7hHmEYCDsaHKGyvrwvnWnM
         lSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747320673; x=1747925473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZM0FsU0CjsCzXjZVlgPHJMrtX+Xn07BuMFdoeVS/0jk=;
        b=BCCa52mV2/jIHdGUQSetAzAXwuJBzSUnAJIgkM4iPCowKyEh6RnedkExlpEz2Smyil
         wYNA8Wfw9bLm9CHk8Aozrbk4iaQcIKa/EG06MZQyXy7XIxYcrkxecuVRWCt5axNwUQpK
         Qk5i7aNaeywyVcb5GuGWCn1E91rbKVvR9rL0H/8Hm29tDo0R+IwIPY3GTJ79AakXr6ak
         aDfa84GpdvNzKHfXqKQeTzzE6NeT8BYHVSkEHFPXqLOhcoq795cHAMXfx7ZceREjOtvH
         mYPRenlBYHtxAE8MtT12fNJ549w9rw2/x9csjgf52KiAl4a1PVVXHjjpxBPqtCavRddV
         ovEg==
X-Gm-Message-State: AOJu0YwovB/+T7BupuKGuDzac/0+BYE4ALGYW8wjbG4XVLA68gkcJcjL
	BDHy/Wmnz8tEsQfIH18nzBSH11UkzjG3i73ZPzL1+Qr97gax5iNDBSmZiQ==
X-Gm-Gg: ASbGncvzU94qctnXoVVhfDtnBDWc1KVLrp73xw/w7gu/vegou5BQSI8Hxf1yi/a/U4y
	YkuOZEee5oXxxLr3u1nije4RNVKS0Da0Wi1MUUFPv8/hBtiHq/K/bSA6fROOqAS+729CUqgtbj1
	pejxCdRDUiqYWEvgg5QSXY5ZDyLOTEMYbq70b2egCvLM5h67Qlsm2Lp62ZbHDoJlGqD3zHwQdFa
	lSKDv4pTqhta6yCjpYooj/71J/Wh2zhX/RyWHFgtnBP5cFO4/QH+zfhOIUa060Ipgy8PGXS6tpp
	gQYsQNYm5vly39d2bLd+WWOGuf+bL6ddsfG2YqSzeBy7e/kMKsmS9Ev9kmXOLFRdrlHPwIXO/DC
	q+pRF04VI5cC3VUU6TAwhQj1aUcFSjAFdy9JLFt1k7MzfnZNIK3u1zSa1
X-Google-Smtp-Source: AGHT+IGRvWRnNl0BlKFjL2Qv53N99RfiNXL3zyTW7CDROgJSpl259SfgUNIpaScCGqu0adnK23a3wg==
X-Received: by 2002:a05:6402:1d53:b0:5f3:fad4:fa75 with SMTP id 4fb4d7f45d1cf-5ff988deeb0mr6944292a12.32.1747320673296;
        Thu, 15 May 2025 07:51:13 -0700 (PDT)
Received: from peterliu-Precision-5680.atlascopco.group (static-212-247-106-195.cust.tele2.se. [212.247.106.195])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc5134fsm10658622a12.46.2025.05.15.07.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:51:12 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] zip: fix a buffer overflow detected issue
Date: Thu, 15 May 2025 16:51:08 +0200
Message-ID: <20250515145108.617315-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 14:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216689

A "buffer overflow detected" issue was observed as follows:
| *** buffer overflow detected ***: terminated
|
| zip error: Interrupted (aborting)

This issue is addressed by:
https://bugzilla.redhat.com/show_bug.cgi?id=2165653

Port the fix.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 ...fix-a-buffer-overflow-detected-issue.patch | 38 +++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch b/meta/recipes-extended/zip/zip-3.0/0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch
new file mode 100644
index 0000000000..a21027383e
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch
@@ -0,0 +1,38 @@
+From 23b4ed82bff20c737fe2e95d5b035e92a9522ca2 Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Thu, 15 May 2025 13:58:45 +0200
+Subject: [PATCH] fileio.c: fix a buffer overflow detected issue
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix a following issue:
+| *** buffer overflow detected ***: terminated
+|
+| zip error: Interrupted (aborting)
+
+Reference: https://bugzilla.redhat.com/show_bug.cgi?id=2165653
+
+Upstream-Status: Pending
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ fileio.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fileio.c b/fileio.c
+index 1847e62..5a2959d 100644
+--- a/fileio.c
++++ b/fileio.c
+@@ -3502,7 +3502,7 @@ zwchar *local_to_wide_string(local_string)
+   if ((wc_string = (wchar_t *)malloc((wsize + 1) * sizeof(wchar_t))) == NULL) {
+     ZIPERR(ZE_MEM, "local_to_wide_string");
+   }
+-  wsize = mbstowcs(wc_string, local_string, strlen(local_string) + 1);
++  wsize = mbstowcs(wc_string, local_string, wsize + 1);
+   wc_string[wsize] = (wchar_t) 0;
+ 
+   /* in case wchar_t is not zwchar */
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index b573669f2f..27691bd89a 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://0001-configure-Specify-correct-function-signatures-and-de.patch \
            file://0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch \
            file://0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch \
+           file://0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.43.0


