Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A65FC61DDA
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:10 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3036.1787945887941518818
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qXjkSeGU;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso16802925e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945886; x=1788550686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4++o1DZ32sKRZ7bLsP1Qbb6D9+PYCsiiPOIRdQ63Y3Y=;
        b=qXjkSeGUbPOIKAGhb1/QfmnXF182GOd5kaEIcxdnTCZtN72j5ZXdDn6eiWH6xRoI2z
         EbCAAaBJhP0W9+nruw3S+2WufNIu+aqqXvIscvK5YZTOsh1OPoGDycIBCp5nINbVlf+S
         26BwWF0VYslGIA7Is8UNCA8HG+iB84YDhN+OU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945886; x=1788550686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4++o1DZ32sKRZ7bLsP1Qbb6D9+PYCsiiPOIRdQ63Y3Y=;
        b=ITHnfR5ZR2+WDXnD9tnd9VjYGzRnDLmoWYIWjFYvqocqy0owdYx9AvkLjOvIcPiyyp
         vXMZXczdNcr4jkh1FkW+LgTylGPbgwUSVx6FvGijJeeNMZPPyDEBwnNuSdcl2e89EfOb
         xpICua/ogYoqxmOCdWK/9snULWW8UqKS7i+KoIyg0+Qk65SUYdi0cbF7PA7vl+EceuLm
         bcYopKw9OtRhANu0pxfl6LmBRaBw06Rvr04yLLzhBReQDx1C5cVac3jWs1pM6mScya2z
         UNOotaebs/leDPAe07FydGoVO4LDGD8RVJEpA53+ZAlRG+PhqipZVxZkhyNaSDMPKBEe
         oK4A==
X-Gm-Message-State: AFuF++k+ulzzSYC8lPacIlEqGG5ZvGXXXLPpid8VGcnP4/L6g1TyCuNd
	12KG93LY5g2AN8w4gjw4M5Eo0K5Jo89nsvryeco8iriKyFPX1btxysCDDGewi6HVFlwzyIId+dw
	kyermtxE=
X-Gm-Gg: AR+sD11KKKHh3N9RAw5osI2LecgBenk/2ZdFRQt82s/EElVGFAmi4WWyOcaIQH0VURe
	e0c7xMBIvJbYA+itf2XFHGl9jrRPAsa32Ipu6/rZznsbqiHbnRqp6N1pQuU8VMZLWaVTABe4S/+
	60XECsdQa5Lbl6KGTvPztyqPZKE/If8XLAdfXC4mb8VYZm69BMtdvVGsBsccKvPtMR/bC6eJczq
	rvgJM70wOJ9AeqIMWYiU2AFvgiEEsjLkz0Bqa6R58cDlIi040avhOlEMpwefLVlnNMOkjapmJgn
	Kzf24EJROufh6QCtuJZp3HgvD2u6xqBBYmiqDP9RgM/VR9pCKZMsIVNbmwIEUmyRqjBCICdzLxB
	4GONbRR0zrV7xxFdT1Iim7Ss4XE97TjqEAugXKQX22aak2v2fEJyvWllaXydd8bGiqiNH4HP/I0
	8awCN7zo9eVb15wEv6Ws7j4izoXihGls/7ZaV5S+sc1/OwLFB31daGn/0Mwt/yE+mmiOg70zGxE
	tkrIli0/gba1SQfeCby9BZ7J9k0i4GXaXL+gpOiDozFO7iHPjEZU27axRnV3mTjgY5L+7Omn2c=
X-Received: by 2002:a05:600c:1908:b0:49b:9113:e03c with SMTP id 5b1f17b1804b1-49b91c26365mr108927815e9.8.1787945886170;
        Fri, 28 Aug 2026 12:38:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/56] openssh: set status for CVE-2026-55653
Date: Fri, 28 Aug 2026 21:35:14 +0200
Message-ID: <d1cf616d593e4534fc565d82c4161ad345581f0e.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244565

From: Peter Marko <peter.marko@siemens.com>

Per [1] "Only an issue with FIPS patch which is not in Debian/upstream".

[1] https://security-tracker.debian.org/tracker/CVE-2026-55653

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index b13488e2652..e6bc9e9a5b6 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -44,6 +44,7 @@ Red Hat Enterprise Linux 7 and when running in a Kerberos environment"
 CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distributed RHEL binaries."
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
+CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
 CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
 
 PAM_SRC_URI = "file://sshd"

