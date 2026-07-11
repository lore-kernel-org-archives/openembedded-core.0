Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9EFC44507
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:43 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1283.1783747482781339483
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=GM1mz/mF;
 spf=pass (domain: underview.tech, ip: 74.125.224.42, mailfrom: vince@underview.tech)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-667a0f55a59so2355147d50.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747482; x=1784352282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Trr/FnSJ5bRv21XqJTunBJln2ck7zq1v3ecb2nfqzOA=;
        b=GM1mz/mFa7Ixtg+KUEftD/O0LEKRXUQLsGSd/UpybXUJ96op66thYnOIWzaqMMkxVr
         /uccJhKojVFL0Vke4uxYbKZ73cRM1kAmA8AJM8DLhB33MsgHP0ZETV/7Axv44Al5u2Oc
         HdqBmqwx9AJKmJIv2C2RJ50uagf29636AxsoXBi+Mce2EJvGH/hw+yyW3wLNc8Vv94Z1
         1mnw6fuFDNxnngaaW9j7jmgM0DIYl3aqjJmpgxAvp53c7eQxUXLvSCKGgDrp6tjYvQFT
         +vpqmLZiYVplvikJzcOc9VaGF+C5K57f+evM7XXep7WmphETo5e7hmZnFnH61iA2RfiV
         oLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747482; x=1784352282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Trr/FnSJ5bRv21XqJTunBJln2ck7zq1v3ecb2nfqzOA=;
        b=haJOPEeQUasLLcYTmmudhkJeXho5KwVIO8ItJGE/vMDgDf4DF4KSVGtXtcEj5ygiBO
         xLZkdWgKIdc3i+93gT0BDKkTKNgkX+T9zXmN5ecKsx6poBfdXAnaN6ovGj1dT44DiJrT
         2wtGjMfcI3mVLn+I9kdLfd15SjtUhIlxkEfLFpcZCmK7g9gMyLgy1lmAn5Kmj35kRKxT
         sbWDzNjz4svK+GKF1YVxV0Zewtnt58lKy7BhSI0tod0v1MPLeRMWilJWAzV/jjlkMh2O
         8NpXP1mSV7EqcgAvUG2gqhqmIS/0XvlohFvGnzeOQviGgaR42THyPIHaQCl05yy2y43Q
         7YPw==
X-Gm-Message-State: AOJu0YyTtJMM6iCrUarWuy9u4sTFjIMvtvlFQWUL5pqKsD7EabIyJzQH
	55i8rMm674bK3s4WL1KKfyKmSgRmA3wpulPLxNHL8LQnn1VrKEMCE9oBnb4mKDApaSgZAl2rI9p
	g5gOnxGQ=
X-Gm-Gg: AfdE7cmuZeBWBf1yDw6CthrresNjU6R+3gEIwz/TrzLnFrLDbIHjtnNUhdfkDWpCFlO
	gCw7+R1guRxIm3McI/U1321CZUiodAx7V5WAdlxJcpjkNjj7r29L1BB8FuEYqS7T1sfrDcr7tjt
	XjaWefDm/WWpaU8jtZpQt9ydm1USO1BmuyZRw5HNYLrVKIOIvfmihPQKU+DgMdbgoKlKjsmYmCj
	sUp8QHLev2MLziuK3wopg8vAl78TPmad0c2s+ryA7LyEM0Vf8j5cxyomptXuumqhYVpi+rWuCE9
	y0IGMyVISpJeb2yYN4v4RTmFC12Ihjp3ROxxplXzaFVNgbGvkuq0nfmHM9aOZjIigCotWWBSS12
	smQSHVStUeY3K+/rbOTC8zssTtyQ7hEOx69ICAI2ayhlYtBLyJ+y16FlmF8JiVhWSK+KWHaAflB
	PZ+dxAWubPKPIdEw==
X-Received: by 2002:a05:690e:d48:b0:667:aa5c:d2df with SMTP id 956f58d0204a3-667d7ac5b24mr1232978d50.32.1783747476761;
        Fri, 10 Jul 2026 22:24:36 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:36 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 07/19] iptables: rename kernel prefix
Date: Sat, 11 Jul 2026 01:23:51 -0400
Message-ID: <20260711052403.1292286-7-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240691

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../iptables/iptables_1.8.13.bb               | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.13.bb b/meta/recipes-extended/iptables/iptables_1.8.13.bb
index 11b287ed3b..89757f72fd 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.13.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.13.bb
@@ -21,7 +21,7 @@ SYSTEMD_SERVICE:${PN} = "\
     ${@bb.utils.contains('PACKAGECONFIG', 'ipv6', 'ip6tables.service', '', d)} \
 "
 
-inherit autotools pkgconfig systemd
+inherit autotools pkgconfig systemd kernel-vars
 
 EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR}"
 
@@ -92,18 +92,18 @@ python populate_packages:prepend() {
 RDEPENDS:${PN} = "${PN}-module-xt-standard"
 RRECOMMENDS:${PN} = " \
     ${PN}-modules \
-    kernel-module-x-tables \
-    kernel-module-ip-tables \
-    kernel-module-iptable-filter \
-    kernel-module-iptable-nat \
-    kernel-module-nf-defrag-ipv4 \
-    kernel-module-nf-conntrack \
-    kernel-module-nf-conntrack-ipv4 \
-    kernel-module-nf-nat \
-    kernel-module-ipt-masquerade \
+    ${KERNEL_PACKAGE_NAME}-module-x-tables \
+    ${KERNEL_PACKAGE_NAME}-module-ip-tables \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-filter \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-nat \
+    ${KERNEL_PACKAGE_NAME}-module-nf-defrag-ipv4 \
+    ${KERNEL_PACKAGE_NAME}-module-nf-conntrack \
+    ${KERNEL_PACKAGE_NAME}-module-nf-conntrack-ipv4 \
+    ${KERNEL_PACKAGE_NAME}-module-nf-nat \
+    ${KERNEL_PACKAGE_NAME}-module-ipt-masquerade \
     ${@bb.utils.contains('PACKAGECONFIG', 'ipv6', '\
-        kernel-module-ip6table-filter \
-        kernel-module-ip6-tables \
+        ${KERNEL_PACKAGE_NAME}-module-ip6table-filter \
+        ${KERNEL_PACKAGE_NAME}-module-ip6-tables \
     ', '', d)} \
 "
 
-- 
2.43.0


