Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6745EFB519D
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 06:33:26 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75271.1775543605837717655
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 23:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Bc1EmPQk;
 spf=pass (domain: mvista.com, ip: 74.125.82.181, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c56aa62931so9886949eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 23:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775543605; x=1776148405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pMvwwzBkAoJ3UlEcA7nrlDelNhpq5UjDnj2fD1d2CLA=;
        b=Bc1EmPQkfGjMoaOt4dZRwbDGHEgDrKUjNmZecI/5WkdOU+qEh6FvyiubvZQlYvinlg
         wGxX0DvqKitQS8iqL6e7QRVfDIacDzp6TajRpV8kTfwMPHf1otEP28apRgVRiQ+LNE3l
         JkqoNCmfX5gbK8BQEZqUENsLS1ptpki6RwIBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775543605; x=1776148405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMvwwzBkAoJ3UlEcA7nrlDelNhpq5UjDnj2fD1d2CLA=;
        b=oMfsQ3QoN8+YBbQ1hJE7wxvY2WIHgBe4ryoBquYS/0KAU6hIrcV86o2BmC3fI5hDJB
         OIIFJ1bDO5fd4CERC8Phm/Z7s8BOMxr7rqjyOTWyMTpaHfTFWvfA1IQMJLxts4C55jve
         cAUFaReLzanuAYc8LxpCVbsBmt2dz9RxKZAAf7R8xpE2lHAbVYvcHPkQP+k3K14Hqzif
         aL0BgS4w2HirwYRbxkbQK4jNPozTrs0Db7tvy+3Vf/Dqa1wRXQOMH+n4SCnA2P1MkKWI
         3NEHgvxC8XYYgUNAdjGUkYimi6GlCzQjow2haS/OsZR5oKHJnoWt71nEA5wS0SQhSZbe
         Akcw==
X-Gm-Message-State: AOJu0Yzjqj3Qr0wmlmL2217wLD+AChiX+/OvA5nZpouYms2afnh4zTjF
	YayhDNJiidMR0Y/uO0AW6Vn+lXJjGMpeXEzypzCGWTYRMUguA6IrslzheIP4Xe91GxwxRQO+VNa
	NPwpP
X-Gm-Gg: AeBDieuRt4ypr0L5QqiDuCZ1t1qvE6pfcKijXqOQTpNr4Yiku4cqUZiBFfBR7q88YjV
	9KKUnQjt+X+4h5Nw36fP6NEmCuUkRhERoF/G01qTIjzJwWQ1p+P2It3oFXqYUa0qOa2nedszC0p
	0tYBRZGcf7ezYZ/kh+vTwRPREKT+ns2FNK+RU8SZcU/G/kf4waT/A1+BOx++qa32Ay4+3ocuxKk
	w0r/YoxPkp+XufpfgbpXAApgQ4lhhA8ZYBCMNWkzeNgwXToy6IAuEkDcBxc8GPD/MILDi55o2fy
	gDeokq9TfJMm9ptV8fQ/p8+KCRqSiF6XZjBjbkFKs12QX2SYdY2GfxaKVicU+o9CjUJScMom3CC
	/RNps5Avx7zboUFMNMK3ly1yghnw60FEs0vxKQOIK6lxcnBLZV4sMfKJT6/Zo+RMp6FK2Phuzcq
	21fha7t9RrjuOsE4AANFPxJANG/hoLDNVbwvHV
X-Received: by 2002:a05:7300:6ca1:b0:2be:2953:fd74 with SMTP id 5a478bee46e88-2cbfa4c471amr8358199eec.14.1775543604774;
        Mon, 06 Apr 2026 23:33:24 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c30asm15876746eec.15.2026.04.06.23.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 23:33:24 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [whinlatter][PATCH] vim: Fix CVE-2026-33412
Date: Tue,  7 Apr 2026 12:02:59 +0530
Message-ID: <20260407063259.36321-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 06:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234696

Pick patch from [1] also mentioned in NVD report with [2]
[1] https://github.com/vim/vim/commit/645ed6597d1ea896c712cd7ddbb6edee79577e9a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-33412

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-33412.patch            | 61 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-33412.patch b/meta/recipes-support/vim/files/CVE-2026-33412.patch
new file mode 100644
index 0000000000..62daa308b5
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-33412.patch
@@ -0,0 +1,61 @@
+From 645ed6597d1ea896c712cd7ddbb6edee79577e9a Mon Sep 17 00:00:00 2001
+From: pyllyukko <pyllyukko@maimed.org>
+Date: Thu, 19 Mar 2026 19:58:05 +0000
+Subject: [PATCH] patch 9.2.0202: [security]: command injection via newline in
+ glob()
+
+Problem:  The glob() function on Unix-like systems does not escape
+          newline characters when expanding wildcards. A maliciously
+          crafted string containing '\n' can be used as a command
+          separator to execute arbitrary shell commands via
+          mch_expand_wildcards(). This depends on the user's 'shell'
+          setting.
+Solution: Add the newline character ('\n') to the SHELL_SPECIAL
+          definition to ensure it is properly escaped before being
+          passed to the shell (pyllyukko).
+
+closes: #19746
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-w5jw-f54h-x46c
+
+Signed-off-by: pyllyukko <pyllyukko@maimed.org>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-33412
+Upstream-Status: Backport [https://github.com/vim/vim/commit/645ed6597d1ea896c712cd7ddbb6edee79577e9a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/os_unix.c | 2 +-
+ src/version.c | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/os_unix.c b/src/os_unix.c
+index cf195e62e1..d767956b1a 100644
+--- a/src/os_unix.c
++++ b/src/os_unix.c
+@@ -7106,7 +7106,7 @@ mch_expandpath(
+ # define SEEK_END 2
+ #endif
+ 
+-#define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|"
++# define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|\n"
+ 
+     int
+ mch_expand_wildcards(
+diff --git a/src/version.c b/src/version.c
+index 4f3912aedd..712a3e637c 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -724,6 +724,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    1684,
+ /**/
+     1683,
+ /**/
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 792a46faf7..c29361cf3c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://no-path-adjust.patch \
            file://CVE-2026-25749.patch \
            file://CVE-2026-26269.patch \
+           file://CVE-2026-33412.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


