Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CC110D14A9
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 12:12:03 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49845.1774872720554719982
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 05:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Q4ruvPLo;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c73ba417c6eso1652862a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 05:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774872719; x=1775477519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E/LfcDyiLSOlA6qiXlPiNgRHFfxn/Zx1Bj8UE4tOWS4=;
        b=Q4ruvPLo30IbbpR/xr48dp0pfphNDnlK8rskmANfwzkJNQn5n1A9/VXWTB/Y0ymSWC
         tXBlfZ9QNmeQvCLO3it9v5/YA8UTKovHNhE3kyPlouGdbW4sI5BTCcxe8kQ4tO3Us9ZX
         XUGNHEpbA0ZfHuFXbImFr+qwyJmp4iEsLSZg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774872719; x=1775477519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/LfcDyiLSOlA6qiXlPiNgRHFfxn/Zx1Bj8UE4tOWS4=;
        b=DBt1kh6oJ6UjuiXeW62plZWf18AXdzsUD0XhxBOwgYhQQc3TExdep0woOcEsaJG56J
         rh15Sy/zV4SRuY8ezyJxHRNSAe4t9T8Oaz7ge10YLh22UCYOwSxwLOOS7Mem20lVyFZl
         KsSrO7tWSRtHUJctH2GCW7gjFFo1VfxVtsWl0XaJd1AVqtef7KGVKi8xmyDd8GuIXtJ4
         bycwPZobTHhBHY7/KMtPBfiBua7WKl9ks91teafV2muIp92sP+01WkW3ps/onxcLLkpB
         +mLlONEHgzEypVCv46IyTZBhegoGkOKyt+jkjv1NbY8cH85ZhiiI8/V27rDOw908iaLR
         1ZXQ==
X-Gm-Message-State: AOJu0Yzay/z3JSjZVJPvkrf2vEJ/LwpSp0hIXI9O6AGVlawQ5OjJh05F
	XfOsnRET2VJd3S6x9DgE85U4q0GyvuLaJUpKkRy+dDctwJl+E+8ZHbCf1A8hecuZ/EVRd65etZ6
	OIFN0Xtc=
X-Gm-Gg: ATEYQzyGcXgRiAqpNJsY/0waqeuutEdjuktUuY83sLc3CYEh/MoXasiV0ZKCB+pQ6d3
	v7emVIqAK+BK6kIdGeXt7NJB+hqefZpUx16mTmDI26rXGfBHplcgoJWRI/OE1BIbarzKxjaTS37
	cXx69zw3v9SB7umJiYf0Ibdxl0Q98uBxiUJiTUNt+buBIUgc8R1VBkkKL08N2OYpQV7cyJp/xxm
	5zKnIS+3KdAYQ76UVd4dWWgMIwuezZ6Z0F2pkqlesGXmHkAI4oDQ6m4oeUt0Epmej7t+noL6SZl
	+cV4dJ8ZdaXpa/IXoU5NVbnRlg2uw9eoQ1hxUPkOPD7SD6ObnalChSXEBOWOqKnn32Z7VZepYV8
	97232ckQdpf4SfI8O6SdYGAQ0ZnFVp+9970B+J743NlbK1+i4iiUWXzkmrKito/Ng+3Ji59kgVe
	XbD6bdgcp1hRUtiSOch4Ba4iyUVjPMXTpGOGig
X-Received: by 2002:a05:6a20:914b:b0:39c:cdb:5d78 with SMTP id adf61e73a8af0-39c87b60034mr12057873637.36.1774872719330;
        Mon, 30 Mar 2026 05:11:59 -0700 (PDT)
Received: from MVIN00016.local ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d019dsm8566501b3a.29.2026.03.30.05.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:11:58 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Jinfeng Wang <jinfeng.wang.cn@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] tzdata/tzcode-native: upgrade 2025c -> 2026a
Date: Mon, 30 Mar 2026 17:41:50 +0530
Message-Id: <20260330121150.1290439-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 12:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234232

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 217ede26d64901d9a38fc119efa684487714c08a)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 1c08d4b102..c498c0c9ff 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025c"
+PV = "2026a"
 
 SRC_URI =" https://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            https://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "https://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
-SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
+SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
+SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"
-- 
2.25.1


