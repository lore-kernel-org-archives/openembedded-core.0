Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BB3C61DE8
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:34 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3057.1787945905992309555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=O8r8WUw9;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482fc2b44a7so852135f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945904; x=1788550704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EYhuumx2P0taLGekfmW6knyntNT9Rct6qAJciMpayCY=;
        b=O8r8WUw9G8WL05XqkwYVJBLnBNd57XC3R1Aqul5+uAd3q+zniRdbiS5WgVkE80nRJT
         X3DofvrTElOqtYVSYOYJHQeHtAkjdheV/TxS0rdhLeIwQMxdmOQ85jNBCVIho72HI/MR
         K8yrkgAy2fgSk8bZ3PE0tMIueLIm9QU/mnoVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945904; x=1788550704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EYhuumx2P0taLGekfmW6knyntNT9Rct6qAJciMpayCY=;
        b=l7Xf16XZX/Nm6opAGTl9xcJvb2lS4NkZwaSCjDtvbG66rCtiZhOh+SYp0WxL2bMP06
         wrrgKoAsjwolDR2ws04Dj8DzQT/cJneACa6izz26P0WvUR/YxC/G0F91jevW1pQWfO4P
         /NG98NPga5jt+H7RzjwLlBDWO+euWndXgc0LVvHkBoqWz7hNSfJ6cwmzfUi+bW9wTX1v
         aCDwzpYVHzRc/aVuNj7qeAI43L/SE/SA7fXVMXsmboF8kw9FtyTbsJ7IFjLuGcPm6nSf
         HNBRWCN3Lvyo+M6W2WpPFXU1CiQVKdhWi5UXohLwq/KWkGcUf3u6nMwAFSM87XbPYxiK
         VQFA==
X-Gm-Message-State: AFuF++mNF5PJunNFZnRezoZfluW6zME8tp84gbNPSDMoruUTMU/na3dE
	D7qcZiWBPICPpypiTzH2KCcDQrykcAlbme239Ftd7iAcz2E5LMe5576dl8FeNG1xJ/4Z9qcMFOc
	JRZCNdO8=
X-Gm-Gg: AR+sD13eZmICfSgJNcaNY4d3TjooV2yYe6xbtNxnZIfuOf+Hzzq0vSComkFVubdMplh
	DpwMs331LYRDgP+saxh2gDjGfraSvp3cbLX1kx/aiTTL4fX47tGKPi0A4SXGR/C7sGK84wCZ7sJ
	e532+5kW2agMvnNy09/xQ/q+zUgLEKTUYdNBHzR+UO5zwo9UGcXW1nYdU4pR4sMhAKjHsqDYW2j
	nqh0zx8adVm90TmmEkS2bjItokp19RGqpN17P7EiTAUl0TlN5hUNJSoHHtE9xoQS0ozyX4v8Bqs
	AiAxkhRedeafWrLFvlqI9lQgF8stojtJ/WoDvDstmBj66b7PDYhFSZP7qiDO4udZ16570RSuinX
	13vKIUFN7jmSvPdBjJixLHhb8/+T8ReynXnzQIgAG43nCEpYOkF5CENjkKFRzgOoRG7WrMQixTJ
	E0gb2J+SwE3yHrcYVviOcxzuK+/kQgkz68XFo/D4nywvZ1PEQwU8rYnhHvUOWE9MlehJs65PRt/
	kAda5BMLmjOzpWcX50PYr5yqt9+9CI4yqlYOuS8VC/Gve8xL0MAL11t2/43PRH6
X-Received: by 2002:a05:600c:1c0a:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-49b91c1dd3fmr147805825e9.1.1787945904263;
        Fri, 28 Aug 2026 12:38:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 35/56] python3-pyasn1: upgrade 0.6.2 -> 0.6.3
Date: Fri, 28 Aug 2026 21:35:45 +0200
Message-ID: <b81e00d9edead702887df1d60c3e49a97d6f7877.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244596

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- CVE-2026-30922 (GHSA-jr27-m4p2-rc6r): Added nesting depth limit to ASN.1
  decoder to prevent stack overflow from deeply nested structures
- Fixed OverflowError from oversized BER length field
- Fixed DeprecationWarning stacklevel for deprecated attributes
- Fixed asDateTime incorrect fractional seconds parsing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(From OE-Core rev: a82592f0a7d104f617f206fe0b9bcaf7f9df3efc)

Release notes:
* https://github.com/pyasn1/pyasn1/blob/main/CHANGES.rst#revision-063-released-16-03-2026
* CVE-2026-30922 (GHSA-jr27-m4p2-rc6r): Added nesting depth limit to
  ASN.1 decoder to prevent stack overflow from deeply nested structures
  (thanks for reporting, romanticpragmatism)
* Fixed OverflowError from oversized BER length field
* Fixed DeprecationWarning stacklevel for deprecated attributes
* Fixed asDateTime incorrect fractional seconds parsing

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/{python3-pyasn1_0.6.2.bb => python3-pyasn1_0.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.2.bb => python3-pyasn1_0.6.3.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
index b44e8774474..60b38c57c55 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "9b59a2b25ba7e4f8197db7686c09fb33e658b98339fadb826e9512629017833b"
+SRC_URI[sha256sum] = "697a8ecd6d98891189184ca1fa05d1bb00e2f84b5977c481452050549c8a72cf"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

