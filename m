Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D25CCDE00A
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:16 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33412.1782253632621926276
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Kh5X1CsX;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cdae130cso1779265e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253631; x=1782858431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64hfPaR3ZCGTt0j3dgFtHIXQWCvzcBg66HuUDhzXeqk=;
        b=Kh5X1CsX7tnTtOfqyaQSobQCfoIvPLQuY9LUZfatuCZ7yDLj0yAEYT9OT5MJutfjbn
         6wUpDRsOmUj0jk3CNmMZUa8csxTyC6LqMn1sGSAY3xYcChqEA4cAQ+fzWZ02yNvgDYtc
         DGvMpwsXiVulhaDXGHp1+SIQYfaHLkJfOoEYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253631; x=1782858431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=64hfPaR3ZCGTt0j3dgFtHIXQWCvzcBg66HuUDhzXeqk=;
        b=P6Yrzo4m+PcftHOPbViOpJn0ewsjApVHtKmlaynO9eK1Ubb0Y3ThrmUSyBWV9wKuzM
         j56d/cwoSBaghIUZg8CfcDVLpEBRTKo/X32+UpoUpy2YPWH1K/e01BA0sjWu4kdYmqoZ
         E1O8dptJQ7v+t4XwcfdH6o60qWbbBvugc+B90zWm/C2gfPO/KpCD/ki92m9EKwalPhSP
         K0HnJ10lh6148L1o0fujEbck1TkHxqOgaD2dRaj+ldUGAOxWcDGe6vnCtSEkTrgPsT11
         ytEMWcGXuHHVorN9nQaU/MZaWJfH8cVxlRGWzIEDI6IvM6EjhEgKd/x+iJz3zJAgxbDn
         CwMw==
X-Gm-Message-State: AOJu0Yy/am55bigkVknUn80mFoiz4uEEOpHT0kboPtcXeJMARpKj1iKf
	Uhu1EYMGENqjNIU6yQnC5/UoZ0mfMDiFqWEAzABy6M/1hnW0kuen49/e6MbO5RYlAoDJDhMohL+
	81gvJ
X-Gm-Gg: AfdE7ck7fS5bQPOIKxahxkzXOqypsKUa7fbrwZAaIyJSnCBg2yKz43ztfgOWHmcKC9Y
	eRh8n88XOFygdxKvKPXL9DNdRy6aUoxiHkoEQ6YDPX2vt3Lmns6Ct/0MrHnkBf+92UzhEKL7Di+
	G1NrgPHd6sCn00oC9U4MGzZb2vWYg4VNLd2UYyvio9+zGeQX/Xd1dzpflhk9TpJPT2LSoD/vse3
	w2+QNyAbfwt0ivDwIOyMKVC3yaZ3/HYoAzksurFyDCgV27atHSzvUjEtHEf4KWnALjMOA+njwUU
	tprIFAE/5ketjSVOrTYgb57Sr/KLxn6abORup2eLgDdCmtmM51YgpJ4uRtMEPBDRYgZ2Zb04RK1
	AWZXTOFWOsh2qQamVn1n1TaEVgLPmf0CMg2zOtrlxLUQLOAEWrglqePUJHRKRE2Xl3/llo4AzpT
	NAdBvnD3CSPqs4WLQ5zbw5byNCUBwGtRuagxSvI3NPEQk2B1gZSpuF6zp46DwkLFD//CX/g7k+t
	bbdBlcA6fa1ptzQ7l3dJufys/I=
X-Received: by 2002:a05:600c:2256:b0:492:5cb2:aa54 with SMTP id 5b1f17b1804b1-4926087ba9fmr5217035e9.34.1782253630917;
        Tue, 23 Jun 2026 15:27:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 24/41] go-binary-native: set status for CVE-2026-39836
Date: Wed, 24 Jun 2026 00:26:23 +0200
Message-ID: <8aab8b31425b3820ef65fc40061b9377c574607b.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239446

From: Sudhir Dumbhare <sudumbha@cisco.com>

This issue affects Windows only. The net.Dial and net.LookupPort
functions can panic when given input containing a NUL byte.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-39836
https://security-tracker.debian.org/tracker/CVE-2026-39836

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-binary-native_1.22.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
index 7688a090f40..dd84021cc9e 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
@@ -19,6 +19,7 @@ UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
 CVE_PRODUCT = "golang:go"
 CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"
 CVE_STATUS[CVE-2025-0913] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2026-39836] = "not-applicable-platform: Issue only applies on Windows"
 
 S = "${WORKDIR}/go"
 

