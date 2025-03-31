Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4484AC3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 08:49:00 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.47298.1743410929826299194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 01:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eksotC+h;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: pdoshi@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-227a8cdd241so45439395ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 01:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1743410929; x=1744015729; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMdI50Q5ypItQu3ozWPXoYMkLsdt71zvX1u+fKInAPE=;
        b=eksotC+hDWt84peUPWwKz/pKJ8Ik8uRjVVdgIfrfTiz0uQgz0SpFlC71cEebOqnjXo
         rCA85D/enOhRgpje/s9KWrZuhVwJc8y+cbHfPGyI7GImGIuumn3p8FThIjMeUhLH30Zz
         1ZWxTxIGjHbhPAAIqgeKTZfwc1puQOhkoHKUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743410929; x=1744015729;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMdI50Q5ypItQu3ozWPXoYMkLsdt71zvX1u+fKInAPE=;
        b=q1gkTyzBU8C1cSA60dAN+4Hl1oWAu4iCmhAtNwzLtqVijQk2c5hOtSRTinP0noEOah
         wqGi8XvQ8OZC/G1g/A2QYTDtdTOcIXg8FVwn9bxe2pAe/09hIAhoW4yjpwX0vy0TOK+0
         Eh9/lCC6+rJn8da39FU0FHyWXVYfXjTN5o9fpY9uHxVM53L8AUJ6FjjS+IybaB1Iuq54
         ise0XVT0nYwPyXB9qfLpBxYlQoeFIWYPPAjd0Rm6qfVjjClLa4imc0atsKVTybibHR9m
         TBRFQmGQErTvOrg7mwUGlJt/5CmkjbGNJJRRshymHxt3talRFSWAeviOm7MK6m0KehD8
         S0rA==
X-Gm-Message-State: AOJu0Yyf+jOXG8dTRYiRulmWsdALkeIRskBzlSaQttTpgaRqU9172WBm
	WbUHz68kZhcGjLdZMOom8IWshBDj1cBkJ3vCGd0/eSFGNqxVeDGWGiSoVrL5Al/RVEfA9ddn4Aw
	S
X-Gm-Gg: ASbGncsEDfTHPE+i7WPMYvTtSpg8Wi06JaTPu1z99aztNhIjBjoWZQuosg9LdZSIuf1
	VSkZi2fId6jdw2R+frrfAeGh8XRhXoE2aQaqS3+wz1mPHAOo0m0mj9U2udr/R2XfmtDw68ZA45X
	oSNT6EiD7Q0tSkGY38VLTS+glbjC9ZkQ1fQuxxOjhDjHcrBnL0H9NdOjDU/77Ls0xe795ot7tnT
	Td8YFgTgo+2/qB9cOjEeZQDXxtEhpul1BI3c02sBMuShooiGMT84HNVUZ+nii65Up9vQUY0byuH
	sg2VX8ZInZQusTLRwdxW1v6FGMj2I+czVhWD02Gb5qDfiynUWPC4zQ==
X-Google-Smtp-Source: AGHT+IE0CwN2UR2CvaKLn/qtJYZgo8uhJpJKkhYCvHIYoNipB33GB1HjMSK+54RWyiatiZb59+/HQw==
X-Received: by 2002:a05:6a20:9f89:b0:1f5:8b9b:ab54 with SMTP id adf61e73a8af0-2009f644873mr12221249637.23.1743410928633;
        Mon, 31 Mar 2025 01:48:48 -0700 (PDT)
Received: from localhost.localdomain ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b67f48fsm6032140a12.9.2025.03.31.01.48.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Mar 2025 01:48:48 -0700 (PDT)
From: pdoshi@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>
Subject: [OE-core][master][PATCH] tzdata/tzcode-native: upgrade 2025a -> 2025b
Date: Mon, 31 Mar 2025 14:18:34 +0530
Message-Id: <1743410914-16137-1-git-send-email-pdoshi@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 08:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213951

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index ca9e29f..8f7868f 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025a"
+PV = "2025b"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "119679d59f76481eb5e03d3d2a47d7870d592f3999549af189dbd31f2ebf5061"
-SRC_URI[tzdata.sha256sum] = "4d5fcbc72c7c450ebfe0b659bd0f1c02fbf52fd7f517a9ea13fe71c21eb5f0d0"
+SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
+SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
-- 
2.7.4


