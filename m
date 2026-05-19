Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB303CD5BAB
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.960.1779233436245007583
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=y1JKjMVs;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso44097805e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233435; x=1779838235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezcXUAgd3yypsXxRU0KXBXVe6zJ0PhpgRv7zqKFAc8s=;
        b=y1JKjMVsx0l1TNG8n3G041zchpBzfmE32GqwcZZKiMXDoFoyb1G1DS+UW78Sr0jtCe
         wLFcZqsm1tW2Irn3Ik7Hqjms6/d0BncAnK4CoQqqSmkbolkCYxbW+2pYDusMdmWk8Mi7
         jv3uQJ+Xaja1mVKg1bUcPFUVMFtybqNZ8/tQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233435; x=1779838235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ezcXUAgd3yypsXxRU0KXBXVe6zJ0PhpgRv7zqKFAc8s=;
        b=rKeHxko3ZuOu9iX57wXt1pc3RFKJ5cBGscYoDCaWFzHRouQEuP5LwLExn4Dblyrc1V
         L4/Y8ucL4IakoR7d9whPllLtC4jquvqfA3+8MjmQ9AwctHGKjfRWGkmZTZZ9b6Em8Cd4
         58uSbv47xv8suCEkXRjQ8p6obRXmdtRfoq2SC7sVOmFkfv4VR8OzzH8tY9eXhmYCNqTM
         2Uz78jUdfBCqxiYsEn5vOFaX3cBbj1Mpn2rZQwKQb1i+lEj48aXBABDh9RSZmpCRQgkK
         VCXlRS18zwZRIIprtVgTz/bj26LRQ0wYMrRzhQ+sMo9Gx85lcWGmc4QdYjzjlrLMgjwA
         MiKQ==
X-Gm-Message-State: AOJu0YyJbzhaNxxQDEohMLZ1cDZw/fakM43YRe0+/cc/Z4O0BamVg39M
	aVqMgCQfaZ1zzaCznGaDB/6hl/VtowxHPqcpr1PW+khHMNrO+9E8fdUwuP+NzOFns6COm5G9uBm
	0Ce3Q
X-Gm-Gg: Acq92OF4GqSLdnr2Z7L71gVYA0oEXcznp/YHbu0G7eT17xLneFEMhbNv1iZSHdIROOd
	2GpO0/wMpDnrlMxc9hhk7EHHtom17G9SA4NhZAG5R0taaA60kEZSKhxTSe8fmDEguww4Zo2hRw1
	hWLV6JMf2UWzXO+tWW5qPjgWqnXesamB6X3CqegTa2uVrysaKDZhj1SVKcqfGMBOGAKg3pBxdka
	USkRD35G/L60n/hlSSRX5oWFlzF+0PAjfwURZ5tck78OkJuXHOsQZ/lJUXFuA6NyE9RcM3fXKM+
	dXy/2hwEcxh1rcJ0kB0R51VRxGJ5WSvMUITh0zsiT/AsMN8Qs1QWUuveBdv2mW94pmKdjeuF4+4
	v/tfxQ5KD1903seFV2RFqLbeyLZM4rbo5n26LicE4pY7akIUcWjViM/UrPPGV2VXLV+ks5DHMQG
	ufp3a8L8k7o27tVjiAcFAmVysaT0wKHXDZyDs1fuv22975Jk2znOWhJ+ZX3KrKbiZ5yJ7weDlW3
	FUg6G4fQ4EwGvjwrGjU6CapYNM=
X-Received: by 2002:a05:600c:c10b:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-48fe60eb0f6mr233295985e9.9.1779233434666;
        Tue, 19 May 2026 16:30:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/28] libarchive: set status of CVE-2026-5745
Date: Wed, 20 May 2026 01:29:51 +0200
Message-ID: <df87bd725f83733abe72b61151f7cd86a6535a89.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237361

From: Peter Marko <peter.marko@siemens.com>

Debian security tracker [1] links Github issue [2] which points to PR
[3] which has been fixed on 3.8 branch with [4].

[1] https://security-tracker.debian.org/tracker/CVE-2026-5745
[2] https://github.com/libarchive/libarchive/issues/2904#issuecomment-4257068822
[3] https://github.com/libarchive/libarchive/pull/2905/changes
[4] https://github.com/libarchive/libarchive/commit/8c04ac3c91841cdf75dc9de4a405cd7c69

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a3f38d68bd58f2028f8097d2cb11486d8a8f75ad)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/libarchive/libarchive_3.8.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
index 577362ef8b0..e8c3a3bfe3d 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
@@ -91,3 +91,4 @@ RDEPENDS:${PN}-ptest += "bsdtar bsdcpio"
 
 CVE_STATUS[CVE-2026-4426] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5121] = "fixed-version: fixed since 3.8.7"
+CVE_STATUS[CVE-2026-5745] = "fixed-version: fixed since 3.8.6"

