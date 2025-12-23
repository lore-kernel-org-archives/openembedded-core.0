Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90E7E6FE43
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:26:16 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.109024.1766525173922952037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uXcaFwcp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0c20ee83dso67816195ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766525173; x=1767129973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qeJqkPozS2K21k8NUE6Lao44JVXufuGPxKYN84htEpM=;
        b=uXcaFwcpX2W52FbdHzm/qbSIp0R40mav1Xam45ADBWoIcAqM+B8OQgk+LO7vcwrL0/
         W/00qLhI/Dg/4ceNvT4xj5goAtqWTqvW/W+C9dFukX5qX3G3FxNJBDy2r3yxpCLb7YxD
         3MaIJCmr2WISh6YIwcW9QDXUqKO6iKBinW6Ad2WkBHuGHzv2GtvEHc1K7PkbkQPRYeM9
         gUTpbkbJAYD532fss8TsdgxLhPQGPGDsFa5p7H1bdEtv6P59/RWwZ8nQ8GnbbWpi8ni+
         rku/OA+7BUup85u3hBbCpIKTv1u0G0anHbeHYJO1Tr21ix+QZIdX9wvXovp/eeUv0fIK
         dcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766525173; x=1767129973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qeJqkPozS2K21k8NUE6Lao44JVXufuGPxKYN84htEpM=;
        b=BBXaxZJHUMT+lEqrTPwbjMBgYZBohiEL9u69gmSG2gM4ZXfUPzINs14NjM/CyETeNN
         B2sWLM0r4uY2H6fvnlTxAQqp8H/Op4lhPNtljbtom5sqmkXMxFWx2qgYFpst/7NNfURK
         tYsim2uOENZgkCb6LomstHNdt9gXsGSoYR2s4fXk+BYMe4eSlzb6jRs4rnpSw+gIMshr
         xM7AzA73BXdQjrgM+b1tWoFYf/Vh6rz0lG8XuuPHGUCz6zKaw9LKb6SOIMWxOuLhGZq3
         HirnAj6DCCFE1ZYPv5pFTK76m9aMn1VEMWRXzPQPc3tlTAEM0XpUsUYVrZOzaFL8nRti
         5IUw==
X-Gm-Message-State: AOJu0Yw081X8BJi1NPwZnKQiZFH/lis76lAGoQkCgtHfF+a4DKwRgCQD
	kelCydChSZ9JMHCPj+bc6brdGIefCk8hzjHeymW6anhv4TqjIWvicxyDLlbrTeZKFF71sQGQydb
	GruwX
X-Gm-Gg: AY/fxX6n41RTYOQiPippgzhjqD3MQKSgr8BqH/lURLVvwkeXfk5Scs0gGXMG3pKHoQA
	0CCZ3SAt7P+Viv4Lp2hWuHcLumZ2h5eXkmxDd7XSvEKKiptfN3f+yj5cLGhTBvJCPj50/zMKMWl
	5HP91gDSth/VLJ/lcher/ojKHiHxnvhteYYlrlg8PdvCERXe6RDgM9pfuAqUWN+TdJYcu7UsQeY
	Ns/ulGGL7DsEZY2UMANSpVf3mTAdISD6te0Zx08aM/s9V138cmmL+QQftR53dk4jWZJOPObSYPf
	5tbec9MpYXLPjfAXG6HqqjWuCPWKcl2q2zMfY9YGp6eWXUy4vP3X/UxufcvtTmtCC17hehFj5vB
	4VTqFjr4Ko1XDwf7h390agzW8Ji85Oot/3RMFGU1hz49kv0DcknQMZW4ntOLeaxk4p9a2dcLYwv
	OIEg==
X-Google-Smtp-Source: AGHT+IEOI3O5r+Qv89TSX8PzV2FdAFIxbDB0PonN59n0/70xM1ba10sCSEU4mrvAt2BRnGKTgksidg==
X-Received: by 2002:a17:903:190d:b0:2a0:a09b:7b0 with SMTP id d9443c01a7336-2a2f2c5f2d3mr160480165ad.61.1766525173186;
        Tue, 23 Dec 2025 13:26:13 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a80esm133756765ad.8.2025.12.23.13.26.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:26:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/10] rsync: fix CVE-2025-10158
Date: Tue, 23 Dec 2025 13:25:54 -0800
Message-ID: <fe4bea86b27551edbe7440ff47041b6d45b2f4e1.1766525021.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766525021.git.steve@sakoman.com>
References: <cover.1766525021.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228496

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

CVE-2025-10158:
A malicious client acting as the receiver of an rsync file transfer can trigger an out of bounds read of a heap based buffer, via a negative array index. The malicious rsync client requires at least read access to the remote rsync module in order to trigger the issue.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2025-10158]

Upstream patch:
[https://github.com/RsyncProject/rsync/commit/797e17fc4a6f15e3b1756538a9f812b63942686f]

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../rsync/files/CVE-2025-10158.patch          | 36 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch b/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
new file mode 100644
index 0000000000..cba7002870
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
@@ -0,0 +1,36 @@
+From a8fabf850c3c5164520c307199e9abc5ded45e4c Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Sat, 23 Aug 2025 17:26:53 +1000
+Subject: [PATCH] fixed an invalid access to files array
+
+this was found by Calum Hutton from Rapid7. It is a real bug, but
+analysis shows it can't be leverged into an exploit. Worth fixing
+though.
+
+Many thanks to Calum and Rapid7 for finding and reporting this
+
+CVE: CVE-2025-10158
+
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/797e17fc4a6f15e3b1756538a9f812b63942686f]
+
+Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
+---
+ sender.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sender.c b/sender.c
+index a4d46c39..b1588b70 100644
+--- a/sender.c
++++ b/sender.c
+@@ -262,6 +262,8 @@ void send_files(int f_in, int f_out)
+ 
+ 		if (ndx - cur_flist->ndx_start >= 0)
+ 			file = cur_flist->files[ndx - cur_flist->ndx_start];
++		else if (cur_flist->parent_ndx < 0)
++			exit_cleanup(RERR_PROTOCOL);
+ 		else
+ 			file = dir_flist->files[cur_flist->parent_ndx];
+ 		if (F_PATHNAME(file)) {
+-- 
+2.35.5
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index 37e79e1e56..e3dd1702ec 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2024-12087-0003.patch \
            file://CVE-2024-12088.patch \
            file://CVE-2024-12747.patch \
+           file://CVE-2025-10158.patch \
            "
 
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
-- 
2.43.0


