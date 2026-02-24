Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A8FF357A3
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21281.1771943120234756495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PdNCazWg;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48372efa020so44678515e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943118; x=1772547918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dJdZpC+KRVDh/rR8uzotdyweT24CuoI7toTAKoG7KQ=;
        b=PdNCazWgTBkNBt4KX9wHdkqRDY91Ho1CPnIRoiyMUvmbXmJNlX4jVQOXkBSWiiW+2a
         2PHlGKjuBugMa3umkPj66bPOQIaIsHKGOmlbiZbzCeJNiggb0K73OCCHSVVWnCf9VhmH
         UmpveQqIObtqfSECYiHO0PzA6TYU5cWC5HN2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943118; x=1772547918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1dJdZpC+KRVDh/rR8uzotdyweT24CuoI7toTAKoG7KQ=;
        b=aeOKlq5RdxvnS2hAujOhMinhu3kC7jCqAISjv+LxdQbijUTWml4TOhhS5u68QhDnmi
         rsfxRrQ5rxN3BpPy/pLaw7PXC6YhO+9SBLOKtNjRHKEU/J1PHKE2mXITpvsrPwm5NXpt
         7mp9NihmP3+wYcr8KyJWnh50m+9iVd8nFG3eAz4XfjLdwKZenlWNfx7038n737mYNgSh
         iOYQlnhxf1uMybM7ss4S3J6a8EpsUlUx+MG9gUPgBmHHMBuWveASChFwrdWIYskqu7rK
         u2vF9X3sTadvSrxuIXKVzpsTjS4IfOLfxVyhJ6THAMNR8YlpluRnGDulpEpi75C4UxJQ
         HDWg==
X-Gm-Message-State: AOJu0YyQ3LPzr5i/Ej4ej5RHnE2t97vDejHsD3kcWWk7dlL3l8UZp4NZ
	3LTw8XNkdX3tVqpcUI6OKQrnwm+W5GhlaX+wMyhJipgG1spT+GJtWRHNuUAi0NwIQDrUY1PdGur
	PTEDp
X-Gm-Gg: AZuq6aKA3zu2Pmaul2mB6NvgNoIKd2dPEri2rveunmjuM9DynwRRjkxFkWjuAMoa+E6
	6i6tarZ2Sc7lW9BaJekrSQ9ccSsinZRe0vb8a2h4rWBR4OUPT95/5ctobeg5n0no6cnSTxMKHys
	K1iKbHgphXTcHCSYx5kMdL5z+Z3jIPIFD6UZGLI1HxtewOFxELC8/fmq6wEppKl7wm2V1S/TJzj
	6qrtXA1cmIdtQcbH2m9eUTn3eRtn3ZqyhMnmBkNMepoRENf2bJAlWmu34nxRmWSZpnNJnKq4752
	8lDiM8zkveumuzukV/ZBEth5fZY/Pv3bzypQxOfnAXED+PphbxGcTBPKTBT3i0UExU8RMLDwTpy
	WtXdWO4aqTwOJZtwDSHO3fv26U0zsht16I3f60oLxWOYeWZ4C6TeriAtEWImn+M0aomcCXnEmCn
	b/nkYDHO7wZidaoiH7GxqPFvFORrmysQXgeZIaOfDxmmsrW1Gcu832F3DSudVsMUQaFbWC7I6CG
	NxQkyZQlsac22rnRdjmvs9c34jv9F4spw==
X-Received: by 2002:a05:600c:1f93:b0:480:1c2f:b003 with SMTP id 5b1f17b1804b1-483a962cf2bmr225336965e9.20.1771943118376;
        Tue, 24 Feb 2026 06:25:18 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:18 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/38] vim: ignore CVE-2025-66476
Date: Tue, 24 Feb 2026 15:24:19 +0100
Message-ID: <ba472832474a56b11ae11973aab90d5b4eee95be.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231793

From: Peter Marko <peter.marko@siemens.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-66476

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/vim/vim_9.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.1.bb
index f358e61132b..e536d4ce4bd 100644
--- a/meta/recipes-support/vim/vim_9.1.bb
+++ b/meta/recipes-support/vim/vim_9.1.bb
@@ -17,3 +17,6 @@ ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
 # in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
 #
 lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
+
+# not-applicable-platform: Issue only applies on Windows
+CVE_CHECK_IGNORE += "CVE-2025-66476"

