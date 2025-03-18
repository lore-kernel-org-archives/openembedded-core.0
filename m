Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7415BC36006
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:39:06 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.2940.1742323137972064825
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XtMDV4sZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso5184741a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323137; x=1742927937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ05rwQLgpD4nQtUXB+ZH8/aCYggtjCAeomRqpq1MPI=;
        b=XtMDV4sZqvrCHre7aJe31Oly2qce6gOU8i7yawHCluzIiJkOK8w/rRaW8lfkstLAYr
         kbjd6eWQmcPp8eCT3q1Ed4aYZWT5GMwqPyCDlU3CR72Gat9xthvH2mZzUnuRy9qrJ/6P
         vZVbE2Q0iLjUjyCP4USh6GB1xPTfRY4z/TJT6XiDAbxM7iifAD689NSCAe56WfjdHuWc
         zos5lSXIdXJnfNgL9ifwCiEH+B4WKaJtCAFbC9hgK7lLOkQ2Vgto0/V/ENSkJc3gnWqi
         8YTOemIwycbpnw6EB8PbWfQw1OwLUMYtEiK/aaSyGTfRwBVmXQmyknvPgnHPi7Yy4eCR
         S79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323137; x=1742927937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ05rwQLgpD4nQtUXB+ZH8/aCYggtjCAeomRqpq1MPI=;
        b=bOwYOudKHgxsT1KAxl1zBnKa2ZYCCSo08hnO3GOWxoby0leJ+iriAZTbmHunjq7PPn
         Dp5gxD3W4RQjgpJDAFhCPGwSIwpUVAF3TBa41NXvdrIauihVr23+wYfVCCbhux98vkKN
         ZeRw4T9ByKSe6P2UHgTBha8+b2wnh0eIa/4ndO9hZRYpCVgplCPb6gEGADMPvERvKiGp
         rqgux08Wv46zgZifiMBub0ZQdDDwcAhCKNrkqPrTs1xjP8mbp4kNsT4PIp65dnenR/Og
         7sIrj//4zl+f5GXAAZVb9/JKRUrIQQaFcxyg3t6woedsWOL/LnRMGKh9tGPSH9Y2GjJ9
         CHvQ==
X-Gm-Message-State: AOJu0YzFRW0QLTNy//k6kl42+Wf3xLFv2yv4wLock4G+kGXRxq1k/YLi
	GLriAcsM/BUP3uKp3/7oDydlXnybIGqUpPh/7JY9irZf5Fdz8ZE/XKEFxrHd
X-Gm-Gg: ASbGncvwytoNmYpbK/Hj1FiuSyByT0ahnU3Rc2LHzLVjHf1WODN4GmMDjuY+1Pwr0Ev
	itegTUdzDwxaIoSSscvSeZDQmXkXjluv3WEaFFuaV6DvfnIjr+z1Kwes/YoDSPbUJf4p+24UT59
	AT6HcHH6JvOEdXO+CU4SJP6FuCXqpcWrzN1784BP3FQFwJlFpNFc7VwHH1kyRvR4/oyZpFzN9D7
	/+v/QnM1pFOQUb9GPg3wMWY+ms/8veuwV85jVTjoee59yIOShMTX0rjP7sg/Z8e6wtMbpslC2Yl
	fDI2KCY5NdiM6AmUyJbcbOxkoM+sl61tm2rm
X-Google-Smtp-Source: AGHT+IFjilfKH/obXXKAmJGGQg1l6CdmHbMuvBfhcFomASF2yuGGT+LvPRiNoq4yy6LD6pNcx6F7hg==
X-Received: by 2002:a17:90b:3846:b0:2ee:cbd0:4910 with SMTP id 98e67ed59e1d1-301a601d171mr5170622a91.1.1742323137068;
        Tue, 18 Mar 2025 11:38:57 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 15/25] ppp: Fix build when shadow is enabled
Date: Tue, 18 Mar 2025 11:38:30 -0700
Message-ID: <20250318183842.2256284-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213241

GCC-15 patch is not sufficient when shadow is enabled, therefore fix
the remaining issues.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-session-Fixed-building-with-GCC-15.patch | 33 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.5.2.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch
new file mode 100644
index 00000000000..d95c72e96ba
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch
@@ -0,0 +1,33 @@
+From 5edcb01f1d8d521c819d45df1f1bb87697252130 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Mar 2025 14:38:26 -0700
+Subject: [PATCH] pppd/session: Fixed building with GCC 15
+
+Fixed building with GCC 15 which defaults to C23
+and find conflicting declration of getspnam() here
+with the one provided by shadow.h (extern struct spwd *getspnam (const char *__name);)
+
+Fixes
+../../ppp-2.5.2/pppd/session.c: In function 'session_start':
+../../ppp-2.5.2/pppd/session.c:185:18: error: conflicting types for 'getspnam'; have 'struct spwd *(void)'
+  185 |     struct spwd *getspnam();
+      |                  ^~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/ppp-project/ppp/pull/553]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pppd/session.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/pppd/session.c b/pppd/session.c
+index f08d8e1..9cc7538 100644
+--- a/pppd/session.c
++++ b/pppd/session.c
+@@ -182,7 +182,6 @@ session_start(const int flags, const char *user, const char *passwd, const char
+     char *cbuf;
+ #ifdef HAVE_SHADOW_H
+     struct spwd *spwd;
+-    struct spwd *getspnam();
+     long now = 0;
+ #endif /* #ifdef HAVE_SHADOW_H */
+ #endif /* #ifdef PPP_WITH_PAM */
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
index 5565ce51cff..602f98991dc 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://provider \
            file://ppp@.service \
            file://0001-pppdump-Fixed-building-with-GCC-15-548.patch \
+           file://0001-pppd-session-Fixed-building-with-GCC-15.patch \
            "
 
 SRC_URI[sha256sum] = "47da358de54a10cb10bf6ff2cf9b1c03c0d3555518f6182e8f701b8e55733cb2"

