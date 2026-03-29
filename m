Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C678BF3D605
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 13:08:06 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29194.1774789684150653933
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 06:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DBQy2EXp;
 spf=pass (domain: mvista.com, ip: 74.125.82.172, mailfrom: vanusuri@mvista.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b6b0500e06so4778203eec.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 06:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774789683; x=1775394483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jpy1OIhdBkpM/CqmUyVYx5ktHjSRMjqhVl7C7zeaQws=;
        b=DBQy2EXp7EuDQTXK0nAufy3WluwQqOO9gEuI9lxcG5Vnujdlp4KuZSsOIk99OMCpwu
         EF8kJVaFGmQaCbEbx4OhX5WFtFhqxON06tplZKD6z8EwVYkRfufkECG3v2kECO5rxtEQ
         F0LtbHhFAgebqgaKaYgGOtLSsuLxDpoadWcgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774789683; x=1775394483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpy1OIhdBkpM/CqmUyVYx5ktHjSRMjqhVl7C7zeaQws=;
        b=alnKemun2uqTN+oTAabqHOA3cTxiX8U0izww+t0br7VhhhDGrwGLGC8VHaEn0rhwkl
         XAknP5JNt2Owmjwr5A9dQEpjoYWDIs5RD+jyqKOZhVZ+j+3wOMpd79ekQ8B+QUb+tCPt
         mGu/o5f5laPe3NruKvOSPMJM4Zdhh5xpEvV9DCJaSoF3lPxVOfGhIDw0naqoYsZAtuVK
         bVbL6LiIIpYu83BGo3PzoGnx7O9HnamBlpUJtIBpTcDoVmu9cMstdjPB4nFEnIDVWvHL
         by/uO+lCQCqDMsbEVt5xsxSPXvBFBBlcTXfb1HQRGQTfFWS26lu6CBoJ3L8EDQb5MyTG
         IeKw==
X-Gm-Message-State: AOJu0YyKyFVFMDDLSiJYefvLcP1jVFB6I/PmT+/wrX+cy831zTQNCHQw
	mGMDaf1Qevy/CuIYaMYp3Ux8eBEaBsnpfHiWeLzmuU1RR+8tQVc4hrBWAFnvdnYyyyb8GITJt4d
	S4eF3Gpk=
X-Gm-Gg: ATEYQzwZ0e/0c2nLU4I99fuAAjPaSL8nKhJ7w7BII7eoPGfzOhIoXczrGDuXFWjmju4
	4/M+Z8RB5fVNFtqYX4hcK3mdtUJE/3/83IxQ9MJivVPmMUfZ6HwrbT8nZan5hQekpaLszmUX3eo
	ucyj+yZhw+AZvTiKZk0vUmqedrkGRkkqjPHR+xnJD2jmySFDLqGaoTfLg+dif+v39k/+yRnZjlx
	AdKObPSz3hYNL1Av691pA1gI7Pg5KVv8Ashix1ShNS2n4PQJSuJp4O0IktjBX71GQL0u3BzYJMd
	0V+ToTjgJrPW75H8OTD5hTBlbFD0wh4jCxTHwyIF6kZSI7AXCwslBsP+26jGUwxtqJ2POKxmX5H
	YmhTPi5kbonQYMv15nl6KxC78pHa49bSWu/YIR3NWtgMM4v2HXmvwnH45mBynwZWPuoTQKrjBeE
	KDPaI7FU0YohVVYo52FWaVPPCZTot/YXcOMeGq
X-Received: by 2002:a05:7022:f8a:b0:128:d786:8ac8 with SMTP id a92af1059eb24-12ab27609ccmr5004983c88.0.1774789682805;
        Sun, 29 Mar 2026 06:08:02 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2406:7400:54:2bec:35cd:b317:264f:767e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab970da7fsm4896094c88.0.2026.03.29.06.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 06:08:01 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jinfeng Wang <jinfeng.wang.cn@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] tzdata/tzcode-native: upgrade 2025c -> 2026a
Date: Sun, 29 Mar 2026 18:37:46 +0530
Message-ID: <20260329130746.836584-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 13:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234142

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 217ede26d64901d9a38fc119efa684487714c08a)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 35f22d5a15..71b034d158 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025c"
+PV = "2026a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
-SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
+SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
+SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"
-- 
2.43.0


