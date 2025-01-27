Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAADCC02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 10:40:39 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.48751.1737974424481052742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jan 2025 02:40:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FXej4KGk;
 spf=pass (domain: mvista.com, ip: 209.85.216.47, mailfrom: pdoshi@mvista.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ef748105deso5534848a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 02:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1737974423; x=1738579223; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrGe9UrZF46G09cSo1XFPXQxL7d3jf5mZB+J6TC+jeM=;
        b=FXej4KGkgwy3wVna47Fs9WG5s3aTdrypnWED6X0dZKb+3q/fabGV9siHG/pBxWOyzE
         AtiwCRN84/4pCtclKlNS5xZx2aLz6qKqoULHyfqrrlrVGjxil+JXeQbqc8UKArIon1fU
         qzn4u8D72z1mJAahJblQrIXltPd4MWM6E8CDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737974423; x=1738579223;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrGe9UrZF46G09cSo1XFPXQxL7d3jf5mZB+J6TC+jeM=;
        b=EXluvM9WxNgyZni/+bKYZHn60VJLGlSiC8RNe5qP16grgYNJMXyEXQ+azOZWKF4Amx
         cwmlZ1Ss7G2hWhckgovQTlyHZMPPeELPCCxqEL04ahGRV8rAcQz6Nvw4Y/Cgpx5pjuq7
         SYzunXqmyzpYpSJS1ZgAOa+Om3qxthn/8XPxlGw927A2CGF6Hmhln/2Pnl0rvE15Yeh6
         vBz7tFKiGXgKYQUjgg5ZWyIv8eCRBmtZK2kIWRtNJJoJ1rmKaQZUcQV2ySoK3aa8S4uU
         GGQW1ryD9PeFc+7f5LjufhOEkmB+uOERQ42jeYrTQbxxFBfUmzkS5EWmo/FSZVk0gd1e
         AmCQ==
X-Gm-Message-State: AOJu0YzF8nbWuvVlUUy9L0Z3RqLG46riMSrkf6gfa4XGsmWOUTP4A3JO
	s7xAklLLlxzKjXgByW/rUiLhRNohx/ZD55ak7q5kztbuKDW6b43ICxQFDWKDuuzsW3y1TKHtSM0
	A
X-Gm-Gg: ASbGncv2/MDjvaY9nX1PNaJ8OYoQ9veWqiCABiMtoRXTgMg4/VkZ/XuvsR768hmKlPW
	6hFk3TUlqRhTFwWcxFLJKeFYvK4t915vhvc9RdgecVj0GQ+f/xTbTx+TxEPK1dD4GrbEYUCYvsW
	da0cBERgrjB31HEosdAAivx+DpWivhNk3aJtHU7xCAo9htRCSN+jU4m7tWF2h7ljhZgnnibu/Px
	tbTDTuodFlt31eSmFZj1l2f03s6wGtIS59uPFoPXdi2Ygmzx8bBaWPvL7dkC9BpovzazleaNVT1
	XnMOjEyrDN+K9Q==
X-Google-Smtp-Source: AGHT+IHWJKYLcbJV+XHzvTdgcIf2cXeTcIMO3hc0K2sM6EafsIZVEV1lW5znAtDcJL9fiN3tDPOkAA==
X-Received: by 2002:a17:90b:37ce:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-2f782d6f0b9mr62173876a91.33.1737974422944;
        Mon, 27 Jan 2025 02:40:22 -0800 (PST)
Received: from localhost.localdomain ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffb193e1sm6868171a91.42.2025.01.27.02.40.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2025 02:40:22 -0800 (PST)
From: pdoshi@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>
Subject: [OE-core][master][PATCH] tzdata/tzcode-native: upgrade 2024b -> 2025a
Date: Mon, 27 Jan 2025 16:10:16 +0530
Message-Id: <1737974416-5882-1-git-send-email-pdoshi@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 10:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210298

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index adf0952..f1dbd7b 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2024b"
+PV = "2025a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
-SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
+SRC_URI[tzcode.sha256sum] = "119679d59f76481eb5e03d3d2a47d7870d592f3999549af189dbd31f2ebf5061"
+SRC_URI[tzdata.sha256sum] = "4d5fcbc72c7c450ebfe0b659bd0f1c02fbf52fd7f517a9ea13fe71c21eb5f0d0"
-- 
2.7.4


