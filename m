Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337A3F3D5F9
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 07:59:22 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25987.1774771157615639593
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 00:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YqhnfNe/;
 spf=pass (domain: mvista.com, ip: 209.85.215.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c757a9251faso1371094a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 00:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774771156; x=1775375956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WKryjJkVMHkGgtaXXmCoMQg7yl/RoOvm5MtGhV5nxRQ=;
        b=YqhnfNe/Ll5/74dt8v/ysJid30ckk2qIpMhThIAYOqCDBxVFDmkV8ddTZSovytO55Z
         fBwdk/Ue3UH+6v9353Yui8gkbzxS4FuEvx10CgN2V4We8+x0DP756wdy1chtrwz5+cOb
         XAVPZ1gr+P3wZa33bJsFAZLXA9sbyJSUmZwnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774771156; x=1775375956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKryjJkVMHkGgtaXXmCoMQg7yl/RoOvm5MtGhV5nxRQ=;
        b=cekWZuEBxGPtLY9z6WPLT0GnFE1zHTnhNZIma15fub/16rcl68hlLicMugBQTkJIlE
         X4Ol3UlseWbCExAYuuGy4PFKLJwljxB90gSpXPDwQpsIR3+nNR6fEeklyH/qTArMo/7M
         sQ84Niz7NHwKZrQX0KA1RtPSt7j88RMJYBiRUcBvcHpn5GMVX04yDPisvP1NmQknYsTG
         FZ/GRMcziefPBPd0o6JUKS/Wufqab6lGQAf+w7VJoHQo+XTr+OD5c4Zf/nfrU124wCQT
         GimbZ1atKNzguRJpzGQtCjxfe51ykNgAiAmkV8S8MD4dXh3GRKZI/zg8r+i1zUPKxXPc
         Mv9g==
X-Gm-Message-State: AOJu0YzZj9W4u7PMjRGFY9WeYWjfEhTMeedcAJr1ldK5mfIrKKO1zOAA
	scjZ5K5wHUyW/xChwkh8XDKUH9MYyeYh5u/pnHwC3Y6XicnKxQ1+jy8bf9jLNjIlRYsO/2xDSc0
	d0Z4Thiw=
X-Gm-Gg: ATEYQzz1uKIudt6lfXsR+NVwzbTCJ/Ycv4rAa9fRV/qI6Ie8SaEBqaIVQusEHne1A+4
	Bnsu0CWvwOF350KeSkG1PlIGGitIXi5uFq3SqscZtvXCQUXmX0luWkFAj0fEQ8SAMx/KeWGo+Ir
	Jo6dknwGQqcOOT8JUsdokq9+mRppe2plfzsApCRhTOVKH20p8W0tE2LUBUVygRBLfjwC6bNjr4U
	mRknx2u+h5GZpCNxQDP4uih9WG1lvHL230LGqGsWHetxKktQct1I5zK9XeCW45hT950r50CWB8X
	Ybph3B1rVxRAQPK8KQRJzCbyDqqL9zm1X5Qikw9cmlNuDv4BcBK/X3rAKPHtyDJXbpT9kRviU9q
	G16st1ppmsbt5NTfEO2Tmk0wSxkXMZrLXoqb6HV1wtVxQCZYwh2P/q80exBxPasCNUScXo6GuEi
	weQ4UYh0ua4X5AFxyuqu2JW//h0rA8seNl8r0T
X-Received: by 2002:a05:6a20:2593:b0:38d:fad1:cf2a with SMTP id adf61e73a8af0-39c87823b55mr8634244637.13.1774771156050;
        Sun, 29 Mar 2026 00:59:16 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2406:7400:54:2bec:35cd:b317:264f:767e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916cc65esm3102970a12.10.2026.03.29.00.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:59:15 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jinfeng Wang <jinfeng.wang.cn@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][whinlatter][patch] tzdata/tzcode-native: upgrade 2025c -> 2026a
Date: Sun, 29 Mar 2026 13:29:02 +0530
Message-ID: <20260329075902.2412935-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 07:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234139

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 217ede26d64901d9a38fc119efa684487714c08a)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index b9323432b8..00bb704e36 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025c"
+PV = "2026a"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
-SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
+SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
+SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"
-- 
2.43.0


