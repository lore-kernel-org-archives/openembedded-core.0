Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1069CD37AC
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:50 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8181.1778224368249346683
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qhxv6MHM;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45297094718so1336339f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224366; x=1778829166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbLMxbqJvbTldMzQ3NnHLQf60DA369NifxApNJQLXOA=;
        b=qhxv6MHMTSbHNJPhg4Zp8INeLHhf7KEwSH6U1OmawEeleJ2Mqr/GlGeTRTu+rdQb0S
         EA77XBrMbOSe22FCPGtb/ToQDVKA1yyK1J5+8mGclMyU6WrxAj0OOsnN1nPKj8mxWDv+
         N1v3b1vUKrTFd2WweWFtYFjKZVS6AzSXnOlBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224366; x=1778829166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DbLMxbqJvbTldMzQ3NnHLQf60DA369NifxApNJQLXOA=;
        b=PelZYmcHxkpusywqRu4Oshpx+j8QnQQUu6eKO2WQIW96PYWkJ4n1kyzxOJmTh7KgRN
         fpGRFuRlREClpQcMal/BDjxA7n3d+BuwYCPuh6a+GIUiG4LssxgqbJKQ9Z5/cbw53gBG
         vmL61yF3eVA1AVSX5zqA3Yl1wFkntyLpNxMgmj/XKWV1Ia0eGlKnVFjd2OiXcMcB477I
         N6pi2E38avt49ppv5L8/d48i2i438A+q2dEuw78sXSFaHAwhUEavG7+RrjnAnRFXa/fW
         p23V7lPvMNqNxf2Tlj0wgWsPq7Py5Cowq8tcC1UfRsR5s4tPDrZRqxxw7Q5Psunl/6zw
         n6Zg==
X-Gm-Message-State: AOJu0YxgJeRBTvqaZzp93ybekHuNEv4c+iHnjDj7T5uDIVGIMzNcl6A9
	FzgjA0K3y3CHjz2jxFi/iS2ku1+9eJs3cH53aHhgOZd9E7k39S28AW8YnItPWX0jeqbwYy6NQ0S
	4XBQdHuQ=
X-Gm-Gg: Acq92OFXefm6hn9q6/6UKSFsd6Qvx1doAo+svFvGMgi7nRNr/kOvsUnpqHvSMIztPFk
	01g6tMZYUTwTve4S5kuFVCgWnSZpoYzLuwqHoAV/gX4y9iVzXSeMmC+IPvPNdi0TRz8qLn+FSFL
	x6LEERF5RNs0YWHSLdM9tzpMZ0V+GfDi+crsqJQkiwZwm1aTImyZDGHf4vqV9QsyUaGKT9Z3cKE
	iEW5nHrMdbkN+3ztw+JAW2tbvXfJJQC+A+fRo7mr8UYLC67ktf5LduSc5k8jIg2vA+9iMLVuZNF
	lVau0m+S2TcKcUEGEaGUuH/FFDN59sFfgg1e1lvUHWczGBvW/rGzCwuVhJUVYnPdPNS7cMpDp5o
	fSyw/4fUSSuQfnZ9dy2xcfNkjHte86hhWEMqMdF6uN1wea/ukKu+3+D5WEGmF/k7CiCZxKB01ZI
	sImkov6if4+tNDA9PN5jb4Hz4sPas7n/y7mB1TiywFzouzyKKxEgq4gDRWK4WQiZp1ZpXXKRfs6
	zy2m9S6pSIpVY8V6cl900B60IM=
X-Received: by 2002:a05:6000:1acf:b0:446:189c:ac4e with SMTP id ffacd0b85a97d-4515d5c63f0mr17368689f8f.34.1778224366175;
        Fri, 08 May 2026 00:12:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 47/52] apr-util: Add CVE_PRODUCT to support product name
Date: Fri,  8 May 2026 09:11:40 +0200
Message-ID: <057caf59552ae32301a0c8868abf7b0f10f481db.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236689

From: Himanshu Jadon <hjadon@cisco.com>

apr-util is tracked in NVD under apache:apr-util, while a smaller set
of newer CVEs also appears under apache:portable_runtime_utility.
Set CVE_PRODUCT accordingly so cve-check can cover both the historical
and current NVD product identities used for APR-util.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 927b505c982ed7443aed348ca54b0073ac63d938)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/apr/apr-util_1.6.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 17dc79cc9a4..cb5465f8729 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -94,3 +94,6 @@ do_install_ptest() {
 	  cp -r ${B}/test/$i $t; \
 	done
 }
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "apache:apr-util apache:portable_runtime_utility"

