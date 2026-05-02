Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A50CD3423
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9502.1777739450719414959
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QPsJBNy2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso1143699f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739448; x=1778344248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PwcpiLiGv+XpKEQ0Oe5kkEWJEEArkcz9JmXtOuj78Ds=;
        b=QPsJBNy2hEFiEHoYeh7zTPTv/NL5OxacBQbzFihiCUPy8m5gTE9GNqM03ClTZeXOBk
         PbcgfhXqpxosCjXChqO6Yl1gkfXpWjxkFk+24X8WfDszJvnf8pn1RnqdMDpAkkBpnEFv
         CpKDTcfXnaandHOiKHr7rN4r2PcP4P/iIaaAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739448; x=1778344248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PwcpiLiGv+XpKEQ0Oe5kkEWJEEArkcz9JmXtOuj78Ds=;
        b=HtyhoPVnEsgF5l/5JmJCH0KmttjMt7DllQ66bXNxKpvVLnq2HNrqHri6XxN1I8QWUO
         D0vjvOFSrRQjas8llOzwLi+y/zbs9z6Pm4I5XqgJWNrwud0AFpubmp0rkp1+osN7MxtS
         idZXeUBW07A6StGjjrWUypxz/G71q2M9CjdXzYdx4NIy3rfdREKWvrzraZhjkVbiIIpr
         3EQJSsVeUeEjxwPTlqji/5l7o0nC6Q9MvriFxE5ecg4xhtH/IVnUGnV0Z/RRm6tOEchm
         aR9AekHuj0qa1eYDINQ/XWoqBwHhuMGs51cnuMXMSck47I2YCNgWQBdc345hx5ktZvoB
         XQgA==
X-Gm-Message-State: AOJu0YwudGBoj0D3uZrslIW6rUmBwKeVo96tjnCSBpfRVroqXDqPXK5a
	BoxIWemB3c9tV4tIJv9cr5keVM86IrryBti8He5La4S40IUVFvqrKZ3GRhqEIgGmcVwL0vcsov2
	6cmohdsWYdddjFErRPw8QIJKTT47MBrew9BVT6plH/he2hkERt+u/KY6myruo1tFFeIf7vzwzHG
	qJsw82kK4nQo0LG/M=
X-Gm-Gg: AeBDieuZsfHnIf8RCpvH6l5I/8Ey3FanGxLerbe0cZDEFNsarveY33VVCp3DSgJdMrp
	lcE7aeIuMvOPZuuFTPvJBIqHgPL2aKOL/jBKeaLLgeI7UBSJvelbv55uFccjuKpKSCDJgIoFavj
	rLcPNCHW97b9ASZ3TqcOKD57doptiz51/aBRAY+mv3+kDB4XiKMYpsz6zaJfsIp9x2FjMSMW7GM
	wIqqejwg4wuOSG8OdDBND9TPslkkBp61TcnwD0A4v50bQg1CsE8Z8sU07qPu+9hTf0Ao3702/sK
	+DGSmzURVV6nZ0hYh0kLxOB5/LOG/b9rKfu36T56C6aHdagmFGvcoVhXCBGrY2d/GD1PNxHJcJZ
	g0BsVz8CQDaGHa7n3lncP1cjZXIwo2rhxxziynbiRQZNGABpE/iAxcJAI9AptiEhb1DRDPvHpgh
	oKit6K3lDzCOMZF20qURZ6dutdrZ8YWeyC7gg5Lo5XEqz/gNKOTbDL8UOK0ueN8NY=
X-Received: by 2002:a05:6000:178b:b0:43f:e9f0:f1d4 with SMTP id ffacd0b85a97d-44bb4bee73amr5586789f8f.18.1777739448430;
        Sat, 02 May 2026 09:30:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 37/62] python3-jsonpointer: upgrade 3.0.0 -> 3.1.1
Date: Sat,  2 May 2026 17:28:57 +0100
Message-ID: <20260502162929.1377831-37-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236346

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ython3-jsonpointer_3.0.0.bb => python3-jsonpointer_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.0.0.bb => python3-jsonpointer_3.1.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb b/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
index 0a23dc31002..ddc8e256a4d 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "2b2d729f2091522d61c3b31f82e11870f60b68f43fbc705cb76bf4b832af59ef"
+SRC_URI[sha256sum] = "0b801c7db33a904024f6004d526dcc53bbb8a4a0f4e32bfd10beadf60adf1900"
 
 SRC_URI += " \
 	file://run-ptest \

