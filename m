Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEE0C44508
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:51 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14792.1783866581440150518
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=GTE1aUGR;
 spf=pass (domain: underview.tech, ip: 74.125.224.42, mailfrom: vince@underview.tech)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664db84f074so3717112d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866580; x=1784471380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccqQOmdDM/FxPbN/f6xcWjhryokDDB53Pag5RvW67tg=;
        b=GTE1aUGRu0aBnvKbpZPy9Yx7ffvIAd+rC9Kb7rvwaFh/y9WVNnkU/z9CuW3wmnCqBB
         incoW/ewQTdm4Tqiydo8hQAruEPBi7PDEaWyWc4OEYKdod1w93IAYPozFEzcIc1MaUDr
         mJ017XVmbVQizwvm9GekCJ4/F6DVXUXsjA3gc3orpbghuL3CJcsGkcAlkcVgta1ACSLp
         +AgYM3q0fHbV1D8969pCVxFLsniuqSKpS3FCMchj4VvL21R3zhFd3FVq5x+gX6fAE14m
         TpoOHuEJWy7gQrLWH2rB9Ei69gSsO8sioZkQfhropJ3k5jmawgi0sRR7cj52yMju6Uim
         lAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866580; x=1784471380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ccqQOmdDM/FxPbN/f6xcWjhryokDDB53Pag5RvW67tg=;
        b=lxp0JLnDNR0/VUxoBzq+J4+/JNy0kUrlmvKncM3+v2fvxbMjNKZT3PEfGXJIItlNsK
         jjWoVIUhKqw9CIALA80VplwpYT+Yo3dS+Kb1SPrGQmoItDCm93LrWEPFixPYfOyEspgC
         CGOyikI8ATsJEi3+Rl2RpcTzht3LLDYsORpXcv3aYSjxVYs0FfzWsqKA9UMVCSgMBMkm
         eicoRWfqsIaQrbZsVqlSIhyEh1rLZEv80SnXr5tUPqwujyxWM7rzrd1ftd6+q0Cji5uf
         EjkgZRDiwAuvOt6JTERVJ72eX5yypOv9ViWqNMTRn0tsKAIJ5gOuCYRXRJ7nF47G63sa
         0oAg==
X-Gm-Message-State: AOJu0Yx/pmciz7Wqpsnfot1vSiCf+KZ2GcAYhNO7dOuxDbtFof/1dZk9
	Aw9COSW2NQz85SuBwrNlaXD5vT4AxZW4cJnBqLGmaM8iB1/hHT1QSrozky8pZJSguD7ZoVgxl0j
	qRrrEgVo=
X-Gm-Gg: AfdE7cnkRVo+BTEt4sGzB6fWbhAY6kuV2fKyj7U5rAck9QxmhKHk5pnFCxubl+uB9o+
	7G1uogU6/ftp5n9uwpMWBxHcYsybjo1ihGtrhyxPTNA+6VBEDqWqqZFBPdV6oxufet23iMWNsBg
	zBxotlPzt+Zj2WCYpTnHBTSN5rtxsWSxVoemoUBPzeilpCUDLyphL0rMlDxOFktOIWSyuQaNwNn
	DSJdoUbAgHW5nE5SAlR5mxTMBDEFT2zEUQ+fY2IhMwIYj/uRa2+GeuugZsaxIYy6E4yXC9W6Wdi
	px2l3tK2y1kMnfn/d/yS9UtdsYfg6SOsMAWoGb9IjqJGEm79EjykZfJWBePr1vd+NsotsWwQR8w
	YXiwQ5iwzIpEhPHbSrE032eQcmBK6MyTsUUGS3O5TU64fgdLjMdF3PS0sjxuJCFP6cdN5fUM3LB
	YEqLO6evsO6We+lg==
X-Received: by 2002:a05:690c:c6d0:b0:81e:9ba9:d36c with SMTP id 00721157ae682-81e9ba9de48mr19508807b3.48.1783866580506;
        Sun, 12 Jul 2026 07:29:40 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:39 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 18/24] v86d: rename kernel prefix
Date: Sun, 12 Jul 2026 10:29:10 -0400
Message-ID: <20260712142916.2573370-18-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240784

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 3bc9b24487..66dc3b177e 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "v86d provides a backend for kernel drivers that need to execute x
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;md5=94ac1971e4f2309dc322d598e7b1f7dd"
 
-RRECOMMENDS:${PN} = "kernel-module-uvesafb"
+RRECOMMENDS:${PN} = "${KERNEL_PACKAGE_NAME}-module-uvesafb"
 
 SRC_URI = "http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/v/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://Update-x86emu-from-X.org.patch \
-- 
2.43.0


