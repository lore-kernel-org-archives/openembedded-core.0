Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCB5CA9ED6
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 05:41:29 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7387.1791783687756582494
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 22:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KIa924JM;
 spf=pass (domain: mvista.com, ip: 74.125.82.170, mailfrom: vanusuri@mvista.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so2162903eec.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 22:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1791783687; x=1792388487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y7RIWlvhcGl8pIAD2hXxRROfFU7n+K6+D5pYzhjltLA=;
        b=KIa924JMYQCVcg245TzLGNFJH/u+c7+0XvNwGs6VvPs6lBVG1S9M9YJFJ9T8R1i/8x
         ZPp4yGiwmMQfVDQ3riYlvTpXVznBYTYufu+BJ4OBonFZcJQEUmfDIJYVt5c+iRhi7b3P
         4//g85TfgmJzIKU27wONtmnM2WXOWjmbE2jc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791783687; x=1792388487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y7RIWlvhcGl8pIAD2hXxRROfFU7n+K6+D5pYzhjltLA=;
        b=bHyukMfV2cu4W6WENyCY430xncS316CMGqPhlTzxuACzJZFWNOUFpYtKxJhW9o8PSO
         YwlvA33S9dnrKEY0MwgdDBNT3FIkR7q1nhLwtb9/S2i/B4Txio3+Ez7nFqFJ0iciL6Yz
         CspimSwIMh1tJhyd6zydaHwL6BXA0OoDo+aQNxsebh093lKrxW6btrSobtcGxyGHztbH
         qonbi3q8K6B6r+TI1ENSkqHqu4p0vxzz7fDjgogE4dB/PeDG9WX6z7MHcFpboQ8hv3Qq
         UmujC9vkxrEhyc6f5qlr0MM5jBWHz8i4008IRZmWq2sTOx1Kayx5yHYEbtUT2OlRLy1C
         ebmA==
X-Gm-Message-State: AFq9FYJn3ztEFeqYZ1rhMKNlGAmJghNsBJEg5gof9n0VYmYFHcWYq4Fu
	cuYd6YaVPHoTznUE+bx7DebT5DMpvy9ffw86PsWGnjbcoSw5mzuNC1m4hnorI8+MgFtxWBziPEn
	atbSOE/Y=
X-Gm-Gg: AYBFou3xlWt9FPgcyUQhsbPd7ZqixEPiw16oHdKzLUQG6mfnWQ35y4bsgqqiF289yUf
	tkRKLzeT4ZLAGDehMYVbF8kZGmii4TdpMsDIPzuYdHhrOoEQp75cfQFeGV/VR39hasXApxti/+1
	EW5GVVYHqoo01zQnLYV5hHSCbXu6joC92VF/cYH0XlpkkrU3KMNDGFVbBbzFhfLHkbJ+KVdV33+
	yCctEJ1p6dpqRLhqPcjxaZRVK/V6csEVMjrwKefHyO7DZKz0uIKBpzCfduMZGRdRmaJ7wvMq93q
	bZ3v7UQV0dIVgfeCsTe4jMJaBBojkuSw4WWiMov4fqOfwgTxFvgm1/zEAM9lblpoUV6SG+fbAf/
	PBC9XTtdz01u6606XpcktpS+VUu52W1SGtY2S+i215ztAUFamxNC+xR0V2ACZrPy0pqeJyf8/TZ
	mf+6B2SOcbtnoEqVhtmtEHfP8/8yqaoqJkbabSAPGQdorQgkdbXt3rEQof7B3DfFnSMQM4Hdh/N
	6uKdnHVEgxzB4ec7Cqp
X-Received: by 2002:a05:7300:fc05:b0:358:faf4:52e7 with SMTP id 5a478bee46e88-358faf453a5mr6216132eec.26.1791783686823;
        Sun, 11 Oct 2026 22:41:26 -0700 (PDT)
Received: from MVIN00352.mvista.com ([106.200.27.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm33518638eec.17.2026.10.11.22.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:41:25 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch] tzdata/tzcode-native: upgrade 2026d -> 2026e
Date: Mon, 12 Oct 2026 11:11:16 +0530
Message-ID: <20261012054116.237813-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 05:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247611

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.iana.org/time-zones/releases/2026e

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 35a0a18640e92bd98eca22ec9150be11daca1df7)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 6a65f2deb2..eb43970199 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026d"
+PV = "2026e"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -14,5 +14,5 @@ SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 S = "${UNPACKDIR}/tz"
 
-SRC_URI[tzcode.sha256sum] = "2f5c9f7fe29e6b8cb863583667884b8ce17b0a485355a054b591c6bdfcd81791"
-SRC_URI[tzdata.sha256sum] = "0cb2aa8e333c3dc049badc42a0c61f21987b8cd44e107fa900bad764aacc7767"
+SRC_URI[tzcode.sha256sum] = "cc3d27ca2a0d8399504551b920970d80af83bfb9c216e8082a15491921935d54"
+SRC_URI[tzdata.sha256sum] = "b26882805f26aac59d5b222978e6580484b834ccdc98be89df2f05a6dc53a652"
-- 
2.43.0


