Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F37C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:11:47 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9164.1788343901079502554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=azVik5xa;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf452def93so19716085ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 03:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788343900; x=1788948700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nlff0SSVulKQaPo4etiI9Cx38KWayIzKIW4eowctrKc=;
        b=azVik5xa5AqVLAO14P7BM3+9dMF9F5G/vX7ohFnB4rALWk0ybSbUG9reGwmgekqbOf
         X5/3xIYwu6rtSez9sY/y46pSztu6+PwBdD4Gg10x9lJrxeuzKbwFzBbpY09LDlpJb/6x
         8nGtwpD63XqfkQzaBGDBC2wQZlAG7tk49gfZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343900; x=1788948700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nlff0SSVulKQaPo4etiI9Cx38KWayIzKIW4eowctrKc=;
        b=a8f9QEkqV7yT1lAne+wujhWBb18S+VY5ZcIJB2ivQwWQtGCQJbKhGyflFpKa9tXJPA
         aeGx/cl4irLYJG9P+i7jtxByaqJIFwKUFCca+w0iGz16RpKGmeeauqRO6f5aKljfU1MZ
         qQGVLFPRAM2EIzhN4E4axyMHOJKj7Oojvwas18fOQrRPo12BUo2jVOPvafvQ9SVUydmM
         WVtSXb5B0+MVWNCJCpkL5FIxEcu4H7D3eI41X6gDgJxvkbjult5VJyQynUPbHd49LiC5
         Vl7tclGIBr+r/jZ5QiiEXBT2pCYmX4xTyjqSlITbRoEPZKWATpUW+hAUXFgtpCYxTjRK
         D5Ww==
X-Gm-Message-State: AFuF++k9ZfgCx7BIPFiU+CeAlus0CFKTt86sX/1c25wctCsf2krz6XnN
	VPHyR2UVFg7wBPhmrr/a6UvC1khIBP2YZY9qoweHFdlQF5rlDAG0O6KqjpuUwGJP0LTHY7LSfsn
	0/QaJ
X-Gm-Gg: AYBFou0dJTQf8sP4sNGgoSJv6a7JHlQ9O5srgAjZvU7c8KOcRxA3mOhJXPUboVJ81fR
	RI1tH6/2op7lkJYa/sR3u3DgDl1pd5D+G/QJP4cM5KV9fQNAHJrxmeD6lTOmCAq1fM4nZnvhmWe
	QLxo3+wyu2BsALEpp8O7LHU02B8orSvxXK3PX1fwQu86M6pDVhG5NFLKYZHOILc0fBtI5DSLNJV
	bfn2z421j2ao5WvtPKdqQZivzBh5HirYBaBaN+BePX2Oc+5nBDY7g8GR0m+xw3aU2X5rwaodh7m
	IqwI2A9SKB/zwWC/W3K7eRtLVz6Alt9cXAchJcCVnclZcTgDAqQKgeyJU6fyHyUB/LallD+Mp7b
	d4RnxZl2Hv6pyDF7tsC2iDO0Syy5fsBzd5nU1dYFnPNjbQTp9wpK9cbgK20PH+wXyeiM1EwrUS5
	kspxSy9pJKAAH7MK8rCOOhIEmZivh+ru6k5KghyG0rTsCssiAzUG4SrORF56NE9PD9P/zt0ck9O
	728
X-Received: by 2002:a17:90b:5890:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39af64db294mr2289212a91.24.1788343900482;
        Wed, 02 Sep 2026 03:11:40 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:5585:cd12:5596:e9f6:a1d0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea2e175sm4867062c88.7.2026.09.02.03.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:11:39 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][wrynose][patch v2] p11-kit: upgrade 0.26.4 -> 0.26.5
Date: Wed,  2 Sep 2026 15:41:28 +0530
Message-ID: <20260902101128.435991-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 10:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244930

ChangeLog: https://github.com/p11-glue/p11-kit/releases/tag/0.26.5

0.26.5 (stable)
* rpc: guard against overflow when decoding nested attributes (CVE-2026-18938) [PR#777]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 21a2c91ccca5257ede8994d30460b0dcda617c3a)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../p11-kit/{p11-kit_0.26.4.bb => p11-kit_0.26.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.4.bb => p11-kit_0.26.5.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
index fde122d3ca..423c751307 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
@@ -12,7 +12,7 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=${PV} \
            "
-SRCREV = "a14788849d1ef44422d679534a13821eab5bb5f4"
+SRCREV = "120050e353e8f43d7c40bbcc047f667f903f4de5"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
-- 
2.43.0


