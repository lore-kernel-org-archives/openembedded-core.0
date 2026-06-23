Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37768CDE001
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33413.1782253633774080347
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nmFSMJC/;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so3487315e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253632; x=1782858432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WPRV6tNRd22hIPzNE58QF8SoiX9yip6gF0cBKnZ4jU=;
        b=nmFSMJC/3v52lq8WPW8GrSG+1+x9y3Ej44Ai3L/U3T+NrIlkwATD6vKGM0bLaFjoqa
         7hq6EIzktMsyHlMTOQ+3JLG+GAvkTN6QQ8wMZA+e9H/CgU2l3ZBFr80VngXrZ1H04pdh
         kJSus0mj+ZR3TUombdY2L6icg575AE+SlULIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253632; x=1782858432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7WPRV6tNRd22hIPzNE58QF8SoiX9yip6gF0cBKnZ4jU=;
        b=pVN3Dt41bJ/yNbnlQkXG/2X6ZW4CJn1au2gXikf1kov9ec2llDheX1ihzpWuTu7+Cr
         pEydd2oWY3vkVHKX00EJSn+aaC16wYfR6UwMc9PCCYIP25WcgCsZvl5chTHxfiNS+kuh
         +QLFpROkzZR8thrNjEevQd2HocwRfEtFe0SgoPcQQ3DmQUjdNHAmrjLFgJg6W7ifQndz
         hUAoEZyh0KYvX1Gmf8Lk3Ohu4EB1e56LR4iJlZRc0hhMIeUh68ElVJJ1Ufbd7q5z6ga+
         bUG1oRJ5AFtbRy0VPUYyHctiwo5ZGMkn7FHYo9PID995GZZXQGELbcDiIXr7T8H974Bn
         Z/qw==
X-Gm-Message-State: AOJu0YwVpF/GXSBg1OUSp5YCt5StbVYeeaHHTrrNCWmYkvf6jk/iOl9t
	zML4kwFMhQ5lh869XvMWESmJcXuQK/UBC8almBLragMiVnL8EjVaUNjS080h0lZZNAJnPDzeK0J
	1fvGL
X-Gm-Gg: AfdE7cnNnGe91R8woBtopbLt5PIuxu79NIgJDDdULMKgGnHdbR7wY+Rm4lyZD8nhNlr
	fT5B1Hd38Q1CtCoWvUsbTD6drlg63sadtYmd0+ZwUmo7E5DwHBzbblU62IWBlvlVwkKJvI+r0ys
	BaTJ5+HXPB1ADDWz8NFkUBDWhETZYbS74dZGlvzKyMCSAUws8zp7nSJTapybEO91KJ2dJ/U3YnU
	Efb4Jj36WMnxp/og0BbNWAaPCiFryegLH/2RJF8Khwcl0VooV1t7hjU8w8O4shQkfsYaT3wlGEI
	KPkCveyn/ELA7xgDCmDmomzQStHPBr6rNf1Gu1e6ryyWeJyyOb/q6M/+VJJ5xY8HVUyuH8szlyq
	+CrL1529xNMUHRfDo7Qbub/shef9HnF9Ym6qvSCagmfy1NFfiq4vTBVt5kWb3Iu7FgONCKtjB9F
	P1q78aDVDxnsfoOcvIU2V5RCoxhFp/+BFiQpZr0i3/9QsMXtA9A4OVK63O2S7uGX7s9G+6qgj8e
	eiiLm9PVaPAt/HV
X-Received: by 2002:a05:600c:4686:b0:490:50c5:8153 with SMTP id 5b1f17b1804b1-4926084ab47mr6505325e9.2.1782253631984;
        Tue, 23 Jun 2026 15:27:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 26/41] rust,libstd-rs: set status for CVE-2024-3566
Date: Wed, 24 Jun 2026 00:26:25 +0200
Message-ID: <8c56e85dd02063da5630c9b73fb242686a970e20.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239448

From: Sudhir Dumbhare <sudumbha@cisco.com>

The vulnerability is Windows-specific and depends on command-line
handling through CreateProcess, which does not apply to Linux/Yocto
builds.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-3566

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/rust/rust-source.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 5b433ceae78..318c7f0e293 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -23,3 +23,4 @@ UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
 
 CVE_STATUS[CVE-2024-24576] = "not-applicable-platform: Issue only applies on Windows"
 CVE_STATUS[CVE-2024-43402] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"

