Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371E9EF4EBA
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:41 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49555.1775456858781706173
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pdeoAcRX;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso51480335e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456857; x=1776061657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMEM8VvFmNdDO0qa35jZnfImu6P/RN8dlTc/DuIxpfs=;
        b=pdeoAcRXl6yDeCnM9X25p03D+l+QLNOWmW6zJiGHzGa//Tdv65ducIWgZq/iI5nCR6
         BwCLUa90OaiMWKAvknBD/b7mh9vtlMegfHGPnQ3iNkKRFTLXjK/EBW0fmaoWEI0K/rK3
         2T9rUHybF/n5dqQoBRp9V7UDestIohOvwL9hA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456857; x=1776061657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sMEM8VvFmNdDO0qa35jZnfImu6P/RN8dlTc/DuIxpfs=;
        b=LgU7GqVbW7hhMNtZ0fl2AdKIthw46Zy/cVMEd2iTNZlmGgn37VDfk3JRyt+4Fh+t7k
         NFsO7USL8H6n1Tz8o33/HTefMx1oYU9h6JgbPURJVWldXgBdw7tmFuF0JbkM2+QbRZxn
         PD2wbKN9ky6JRIXFNtEn5lKUPiuyXkBdKBeBN8/ciLSefQBle/v2fr9PMG2tovMTJPpf
         0xOBKHEdf0nfILt5e7h6uJzxNRDuz7vqZyoz/0xJStgda+9EoTy908QpfoqXllo7DidV
         t5r9z4qknOQ0RzA3Ga8Zrj4lIL4h56e9bsSq5RDZo6k8Vj6qs/pNQooKLoxbCyaz+7BI
         a2yw==
X-Gm-Message-State: AOJu0YxVIjZxLXiSQNg2bg+il+SpmkWliTmp1QMcq48nMc6F2wzNbtgy
	1B8Dm1E+brLifxJhwE0DcPcaDBK64dFSoZROpG3BcV+Q97W1dr+3SEagvY1/jfEB9DkOptI1Wn+
	lyuYyQik=
X-Gm-Gg: AeBDietx0OQ2XlAFHqMlqqDpoCPhf/9QHTCToeK3Vjcx1tZjYq8pIlWby1KMD9bgOI4
	DxyeP7NF45tGmO2tbyMHamIMJ4CUDBXAEkXXGxEVjdlNUNzs7t6VWFl7YSChFKsx3+TNS0o7d7r
	0DffCQ9E6Ov6vFibBf0VzKEeB/vw5WUGCsX8Ielpt7482oKD99Lz/ILuTyG/jEOOkRv6NytR3Gc
	fLVy25B3PTXsFm5fZRMxgHzsYt1IjQpZaH9mQ8UVc1bqe7FBUi+Fq03d6QiYkdtnnhsS2lbqXUE
	l4Ni8olf7IgUt7U2CYMuV5ljYdz55gNt1LCopLXJbe1qbZZUJeRneix6aVkSbQth6ot0ppHK+N9
	UOeyAmlzin+8+/B8l9OY23c3xaY31e5UESg6wu9XhDEHrSwT1XwXXAaQU77PTeTSgDSf47AbH1M
	mIeJmiv9BoGWYdBg7xffTJfS8iy93PTZZnp1MNXaAov7HVB8kg33iY1mhf+1EwpHlfXXhQWMN6P
	FHHv+vKAuP3qT9NDx03tAuihr8=
X-Received: by 2002:a05:600c:3546:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-488996e8774mr168589235e9.9.1775456856753;
        Sun, 05 Apr 2026 23:27:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/18] sqlite3: Fix CVE-2025-70873
Date: Mon,  6 Apr 2026 08:26:42 +0200
Message-ID: <b37ba2e0b63ba41e4ff959a590f448157fc4463b.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234659

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch as per [1]

[1] https://sqlite.org/src/info/3d459f1fb1bd1b5e
[2] https://sqlite.org/forum/forumpost/761eac3c82
[3] https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/files/CVE-2025-70873.patch         | 33 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2025-70873.patch b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
new file mode 100644
index 00000000000..86004c0b741
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
@@ -0,0 +1,33 @@
+From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sat, 6 Dec 2025 20:41:24 +0000
+Subject: [PATCH] In the zipfile extension, only return as many bytes as
+ Inflate actually generated.  [forum:/forumpost/761eac3c82|Forum post
+ 761eac3c82]. Adjust ./configure so that it builds zipfile into testfixture if
+ ZLIB is available, so that tests get run on unix platforms.
+
+FossilOrigin-Name: 3d459f1fb1bd1b5e723629c463ab392af7b206ece3388bda216c6a4c26160909
+
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f789954bf8a]
+CVE: CVE-2025-70873
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ shell.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/shell.c b/shell.c
+index fa45d40..3c4902c 100644
+--- a/shell.c
++++ b/shell.c
+@@ -7668,7 +7668,7 @@ static void zipfileInflate(
+       if( err!=Z_STREAM_END ){
+         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
+       }else{
+-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out, zipfileFree);
+         aRes = 0;
+       }
+     }
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index acdd80022e1..9e10caa399a 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2023-7104.patch \
            file://CVE-2025-29088.patch \
            file://CVE-2025-6965.patch \
+           file://CVE-2025-70873.patch \
            "
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 

