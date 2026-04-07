Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73A0EDB7CA
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 07:13:56 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75570.1775546032829428289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 00:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Oz/l1ip6;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so6563375e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 00:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775546031; x=1776150831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMEM8VvFmNdDO0qa35jZnfImu6P/RN8dlTc/DuIxpfs=;
        b=Oz/l1ip64rIO1cgQ21YOiVEGBp7BVMvAP9TFjTXDSQGhMYm5KdwKNHSnllZnBKld4y
         pEpHanFxsRE3yQZcwxriHXB8EKNtSuGy1J92BETnVmDgl7WGxgHoZZrnl0K0Om7Yf8gC
         GgVj0jDyr82lyiuOnWvvclcY9JTqAYSNXfHP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775546031; x=1776150831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sMEM8VvFmNdDO0qa35jZnfImu6P/RN8dlTc/DuIxpfs=;
        b=gCIMQyK/QEpFuxogzCJRXseXPi+WXgsmE5xA3NWVnoOy7oofPwLI5guTGye7E7LqKe
         MU2UsUxJSvFKqg0bdJjyHl6oLAZeDZg/0VBmfvVy7Nwt1PzQGtaMictvNoT1q2BhvsUN
         fCkxVrSN8OiVA4QeErfd0XwJGdvTQFM7kPcdS+sOgspkf/nlsX+CNX2Go5LRnF+/Dx/5
         XIh+NMQFVCUgEYmMYyyHM7mopBnRJ+xIQRa6n/P4+KRYLahN02EYeI45cBkhsSsRqiI6
         ARz0ReeBbs1TeSbfIbRHSRNhxvhvEEM3Yolj9yUTMeVz7jDmATSaAx3jmUSOxv7eLgV+
         RgfQ==
X-Gm-Message-State: AOJu0YwGCF2gZRi051av7h8SCgoiaYmUmQPFbIAJeHBSL5GveOtxxz2O
	LHUvRTIxevbkJ89KW4RAKdRaSfR1UFf/NKkZTjI1Q56P8CTNhvWZWblddbqd026fTqckfbywqUd
	bFjlt6p0=
X-Gm-Gg: AeBDievbFWaZ4yKckqO+HlrBsU1UdTafZaVu5b/1CVZS1GT3l9JAIfNW9+5dPPW3bmA
	EuWYZn8sK7LSYFBfMLmFEzW17cKjF+BmjcCDn7kS4PnBCG50eZQxMYLajMsJ92ztrYPf0/WYA2Z
	ipDDxEJIbXy4MozwqejGpSKwr5ldMXmS+Pumx7U5H0lE/LSpj6Seu8JISgwQQhLgLx1fAI6Y3LE
	wNRrr5s29XwW81jiokwo0jWUQ+a+bjQ5qDoVzhVc5xnwM6Dkite+dLmWbsJ48kzix6wXpQNeXHc
	DGC/j/FJ3FNPXpFzdupz6pgeH8Hnm0HuBT6ckkbSOpgeYEGYtgi3hMwzz1vGROMKd49skL8LHyp
	GpQay4kkGsdkhnNkN4zui+MtcLEvoRLS24ibpRwDS7Vgsu1V/KVGLu75aHRcc6pZgvs6PeckHxi
	xCVolRcWsNjofk0xSJaoZ8o9zzxsqpTeBVUCz0GBaH3cQF6ACliNufdC3UA8N1H+sNn4nHISeAa
	cwpKO3zE0jwvzmqdagu0lvICJwZu981VSfqfg==
X-Received: by 2002:a05:600c:3b1e:b0:485:3f1c:d8a1 with SMTP id 5b1f17b1804b1-488996e728cmr212900685e9.9.1775546030843;
        Tue, 07 Apr 2026 00:13:50 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d0fc00sm156364925e9.4.2026.04.07.00.13.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:13:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v2 13/18] sqlite3: Fix CVE-2025-70873
Date: Tue,  7 Apr 2026 09:13:21 +0200
Message-ID: <c83cd0147548921f87d4167f6a4a7c58ddc8600f.1775545489.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775545489.git.yoann.congal@smile.fr>
References: <cover.1775545489.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234717

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
 

