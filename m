Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8FEC5321C
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:20 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7142.1785054615757643681
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GzS3OhVD;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49550ec592cso17330295e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054614; x=1785659414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yD5QazPs+etgQNlHA8Ujuia13fmc6M31bvjDi2XbffY=;
        b=GzS3OhVDx1C7Z5rDDoRJwa65CUZda4ISbGT55z052S6PcLAmyx9EFFZdgOjDCKMYy9
         bMJgYk2pbMsGi/LbHF8QYKXBnTkBkyzIf4M8I9+mZ6aKhYtLpaysqWza8lgekvLsSQ4+
         JoJLpmiVhINEWUDZhcoGZcpshG3N1sKBrw++Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054614; x=1785659414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yD5QazPs+etgQNlHA8Ujuia13fmc6M31bvjDi2XbffY=;
        b=qIcgAHy6Bp2OXhmzmnx0rA7AAs+vurtGny2LW46KuX8D4LhdF7F6TpEltM9owCfgd+
         UTs0Z4TRKxIqtnfI82wlz5lRdvGUGhqhy9rOiiZCyr5zN6Ic+XoXQYriGUxVg0DO6VNj
         iZ3tXc0TLhS47h/mqHpReKYlwu7VcTU8MxA/oW1WgcPrfojxntqDAFunmiG6o7lfZBZK
         e2tkXb+YXVzEMkAE54reAJnLxe1+GoIz4NLCsx11CAm8376Ja6s+iolNdjugmgYru61o
         v97SvSLpVN3J/KeJs8dLhuGNfdODpHOIaXTjuz2RUKkqRPuIcdFNHsPYXQM7VK9z4RfG
         q8pA==
X-Gm-Message-State: AOJu0YyEsRh2jk70ZJuWg/+fMV95SEvF+zEZnlgLbpe1W669CZ8JSFBD
	9SwA+aKMG8jKw8Ul39rLD+l7ocDvSBqdiVibA++4MB6hzbxFweSxPHuNnDzrTlXjVJcbkSHCm8H
	jNi8WfRM=
X-Gm-Gg: AR+sD13nuHmHpGSlmEVqZnTkCNkQjtW+ZB911Zgl6jap0P7VjrzPaBSYtID8BSuIOx9
	oppGxDa+v+Kn57oNBomys97RHkXSVEsetWC2wnA7FQvt/htOqBjnC9q0OK7veoarbXYjvHumn/m
	wXH9P2XB5DLYmXqve5QHakwQquvJyfZsEIsQV1WF+PRSwdOHAqjEjXAP60fkjLIHnN/A1LgVVll
	8anMB7dX8zAP4WhMy4mHUhdaiz2xENbdT//wnBJnAtw2v6ArRaiksZIllfKK1/j8TCLpMjx2rb9
	Epf52EmkHAJgMQcoZV2IBb1CAc9foTQhHXXctV0UG5/HYfYzhAPxF0e6N1nAle5WEFDdSN2OMGR
	LPe+HMq5/ANgShghx/DTiZmQD370rnBWLwwUrH5imaPocav9A9QGtSagKqZ1MnliOIE3P6T/DiS
	if6vtLCsbxP7cQI1qOI0WmXvXwzX4nJAqh1XRilQOIWvis1Vtm4cRg2JD4Zm33Lc6VfLfhYLq/S
	VTh2A==
X-Received: by 2002:a05:600c:4585:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-496b5b59658mr57009165e9.8.1785054613976;
        Sun, 26 Jul 2026 01:30:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/31] openssh: Fix CVE-2026-59996
Date: Sun, 26 Jul 2026 10:29:32 +0200
Message-ID: <c0c407666d264d94091d994f2d468369c37cc336.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241990

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4 backport for
CVE-2026-59996. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/36480181fa22f98e180b4f9e10203480c0346c78
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59996

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-59996.patch      | 37 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch
new file mode 100644
index 00000000000..b13390b25b7
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch
@@ -0,0 +1,37 @@
+From 762b3d438547893d62ce3e147dce6cef14697b09 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Sun, 28 Jun 2026 23:47:16 +0000
+Subject: [PATCH] upstream: resist that return ".." via remote glob during
+
+remote/remote copies, similar to fixes for bz3871 for remote/local copies.
+From Swival scanner
+
+CVE: CVE-2026-59996
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/36480181fa22f98e180b4f9e10203480c0346c78]
+
+Backport Changes:
+- Retained the Scarthgap scp.c OpenBSD revision identifier because the
+  10.4 identifier does not describe the older source baseline.
+
+OpenBSD-Commit-ID: c0c20a1b746db55c08e53658bf21ea9405b300a5
+(cherry picked from commit 36480181fa22f98e180b4f9e10203480c0346c78)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ scp.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/scp.c b/scp.c
+index 2c21fa19a..00d87517d 100644
+--- a/scp.c
++++ b/scp.c
+@@ -2043,6 +2043,10 @@ throughlocal_sftp(struct sftp_conn *from, struct sftp_conn *to,
+ 			goto out;
+ 		}
+ 
++		/* Special handling for source of '..' */
++		if (strcmp(filename, "..") == 0)
++			filename = "."; /* Download to dest, not dest/.. */
++
+ 		if (targetisdir)
+ 			abs_dst = sftp_path_append(target, filename);
+ 		else
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 4c8604f4b74..8f44d4b9878 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -39,6 +39,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-35388.patch \
            file://CVE-2026-59999.patch \
            file://CVE-2026-59997.patch \
+           file://CVE-2026-59996.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 

