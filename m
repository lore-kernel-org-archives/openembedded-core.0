Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3C3C54F56
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:15 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2807.1785277332387301047
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AwiWOqK8;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954dff6536so1986185e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277331; x=1785882131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l9QDBnORzfaqwAXmNpzJLvX56UhTLgj1utaLfcft/rU=;
        b=AwiWOqK8uMpnSxBydZyDtiEICqlLeSIn13DIuEKiFAJEyzJt9aTB6VeiTuFVm0nDTx
         JI103sIwXqt8gkj0YmNCp4nGeiZT4FkdYjqqumWIdX6BTfF5NcuTdkpieKVd54AoKTcL
         46slw+ClUIhroTYNKx3NWK+iixnpmcGuOXBzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277331; x=1785882131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l9QDBnORzfaqwAXmNpzJLvX56UhTLgj1utaLfcft/rU=;
        b=Zczz6vwmgGU4RY9Ua8Ht8TowsUcHkFcONdnuypsDAziNh24Hcg96mPVlb4i8Qk2Lwj
         KlVuscoQtMpzeHAqcLINCPtlNJXbjl4IMXRASbDX4/pdeqXv4VP8ip6SasgQ77NzVkaW
         Ou4Kxn0SaMQs/Z7gau1vhfCngWzTA4ksfFRRFXltmL3gVGIf4ciiz/SMGy93t7lPlu5f
         e+CZXRNR7pi0JjZBAgRMtodd0BOCaX7lmlx9FouvFA3DWcG72xdK1xMQcV+Qqg3/CV03
         0pnBp68jxSaY1bh/BXa7XTY9cBdm7qc2duHdBRhhjBR1L++7+7Fvo3lxbHr7vxdRYvlF
         TGPw==
X-Gm-Message-State: AOJu0Yx4s0xoZIPwPnHJUuizuGVw6wuRejeniZq/XjWIH9CYjj3+aVqG
	3CnxCA6wuGHAZCmcYkuGWpF6OjsGDOA2iGdQLeSygBS9KPkCsjMHL5YDuJ7/gqK260efjOzqrJb
	tbyfRmjk=
X-Gm-Gg: AR+sD13beVXDuT+kbhXMLBcvIgGoZK9WQQ4xApuLpj8SEEE+C2eUZuSjVNfoEYuXEUs
	v9TndF7v8JPg5z6mhCmhD6NvP0OU+vJkAjj1vHmCiDm61kV3arqmEnrop70+ogGd9yeNeqUAp2k
	VTc5fp0ywXjKr0o/H/3Y1rqIcHpZX3xGH90XjN8evw+1d+5qk8d/JODblvYXFuC6yghOauW3y47
	j4RFWL6v3yG9ZSTte198oGmbRxBeS+0JcEqLf/+tYuVV1C4DDLPprQdrBVTNieMeBwzx8pPiHYK
	PHyF6dKrZo/m5gXXWfDbW/B55umtaKJ2Gj2xfsHYFkFdqLJHkkJ36jD+g5DcgMQqtN2e4Hlw5wl
	FFjVa2V8JYFMPnZdIFwpmIuCJBKX4jEMoYA8C7Rqq5MMK85FebqCwNOLw/CseXACFFuFYpmLzW7
	kondE0mqcLNYKKXnhstwHlIzNQexS+D2Klx0NEB/oIQ6rxa/TvV9MhCsR+ktbiC1Jp/+0msstIW
	E+jHg4t8ZZsMOqfPHDhAT8b55dA6CtrBsSpw1d4QTiMk+7mbtnYB9tBHeEP0Xz9GT/+NfvB5nU=
X-Received: by 2002:a05:600c:8b55:b0:496:c977:3b6d with SMTP id 5b1f17b1804b1-496c9775067mr30949675e9.12.1785277330598;
        Tue, 28 Jul 2026 15:22:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/19] vim: Security Fix for CVE-2026-28422
Date: Wed, 29 Jul 2026 00:21:46 +0200
Message-ID: <5568c80413e04ffe9a495b28fa1d067bd8cc3209.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242214

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-28422
[2] https://security-tracker.debian.org/tracker/CVE-2026-28422

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-28422.patch            | 44 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28422.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28422.patch b/meta/recipes-support/vim/files/CVE-2026-28422.patch
new file mode 100644
index 00000000000..89f219ccf60
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28422.patch
@@ -0,0 +1,44 @@
+From fcf19885004325f5a52db6bd6893cb5b387799d3 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Tue, 24 Feb 2026 20:29:20 +0000
+Subject: [PATCH 01/17] patch 9.2.0078: [security]: stack-buffer-overflow in
+ build_stl_str_hl()
+
+Problem:  A stack-buffer-overflow occurs when rendering a statusline
+          with a multi-byte fill character on a very wide terminal.
+          The size check in build_stl_str_hl() uses the cell width
+          rather than the byte length, allowing the subsequent fill
+          loop to write beyond the 4096-byte MAXPATHL buffer
+          (ehdgks0627, un3xploitable).
+Solution: Update the size check to account for the byte length of
+          the fill character (using MB_CHAR2LEN).
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-gmqx-prf2-8mwf
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/4e5b9e31cb7484ad156fba995fdce3c9b075b5fd]
+CVE: CVE-2026-28422
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/buffer.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/buffer.c b/src/buffer.c
+index 0feafc590d..363dd0e04a 100644
+--- a/src/buffer.c
++++ b/src/buffer.c
+@@ -5293,7 +5293,8 @@ build_stl_str_hl(
+ 	}
+ 	width = maxwidth;
+     }
+-    else if (width < maxwidth && outputlen + maxwidth - width + 1 < outlen)
++    else if (width < maxwidth &&
++	    outputlen + (maxwidth - width) * MB_CHAR2LEN(fillchar) + 1 < outlen)
+     {
+ 	// Find how many separators there are, which we will use when
+ 	// figuring out how many groups there are.
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index d69a337b4e8..485eedb0615 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -36,6 +36,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-52858.patch \
            file://CVE-2026-52859.patch \
            file://CVE-2026-52860.patch \
+           file://CVE-2026-28422.patch \
            "
 
 PV .= ".1683"

