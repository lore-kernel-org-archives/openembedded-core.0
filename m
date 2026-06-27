Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04B6C43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 18:07:16 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60218.1782583632536659521
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 11:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=azv7OKHJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-920d6e3963fso262541385a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 11:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782583631; x=1783188431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vNUKKRy6yF00HXY4B9wzPaK+NoqcWtWacmhn/dhLCsQ=;
        b=azv7OKHJY3YjCJ96jFpVvjET8bwl8gvQ4Dw4kGfR7oKYZc46+qKiceeDZsjVaGxH12
         s6gLJQ3JesL1GrRi0x1KYzB3N6KQ3dkQZwSJL8I2FQsluhF5xrxJ9N8Ae6VvwhDPfJVx
         syNpOmAXJBYhJ/MAUuLy2eGDisp08UoU5R9X1CVHa/1wDkcrD+AZ66AqJYZQYbzaAVSM
         QAUMpnGRuqTixyGh5z50ILnX8viGlkX9+xlDVOn7TjEEYBQo1sI3rMBSz3jb2L0Rc2no
         woxxoWOPfRQEO1sBjujhASE8PUFsFydSO38TSBdfhrGwBZ1TlRzzV/C6TusscTVRfocN
         894A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782583631; x=1783188431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNUKKRy6yF00HXY4B9wzPaK+NoqcWtWacmhn/dhLCsQ=;
        b=VThpKfwvrl4T3OTL3SzPejV7af0kLLV2WQya4JIYsnRILJxYSuoxAAkYgUxad+9Yvn
         QKSLjxu/UhdsM/eX3ZcyrXV99EhN54yLOkBigd01rh9MMT89TscpV8R/oJb7cQb9MGV0
         J9wN1YOX2CuJGkUCwr9/SCwrl1YSJpHE9S8veyjrr7CkMzDiENA75ZKwnj+OckmAJe7Q
         hu/sLX1PHsisuesw9iGXeHe1uGzuD+SobaOx+sIO79VG1XCf1da/klXmsYITVKizEveV
         EWQav6gkQI4DcCun1mv4fejEeQOruKXeJWaBOd7W2COAvyzTNf9G07/PJlogbHTgHxhJ
         l0xw==
X-Gm-Message-State: AOJu0Ywu1ESjJ7N6EThtoPFVCAsn6fyhIomriPBFIYl2ICdnyQ7DQFYm
	Hsvy+6/30wEjllL5OcOWSloK/3RX0DU9Xr1i51FA/hYFq3G25oHTxwsr/ivFZw==
X-Gm-Gg: AfdE7clhFduxKuZvJ2EWKa4YYHtAiOQj4lSSrUNXSnlBoqDmMx7yZH73AWpRmsV76zM
	JFlEjkAxjat5saWnrJz3MGl7yyGw8W7WxW9b9jB5JDcyFPhXyMPO8goStPiszovvumvGztKTwFk
	mkTgOUINXNsZI6WJgrtMymFxBC+EMgZU4Ij6hTxM78oHDJGxC+i07FX+VWkZQ1dLaq0gEcK2ol8
	h067wOHUTdN9q3waVkHbaFzznEHH/fDKQfBZz4yq7zGM/QP09jeANSZd1H+RGWdi69bmrw2axQV
	+xuTJqsJHVqp85FVPzXZOV/dPZ9nVJY9qFJJCJtFuAtPmbEOqDIjcqjIpBszCsrHdWLjUfPlyVf
	f8VgU0KBvy0hO8vbhpdeClMm401dLpKwCJ7TH+eyfy7aT+hHXwNF4SHvtXNegoVEA2m0gCkImjj
	15WAwio88p4dbPS7M0/rMwqNndmkQPFO11PN++ogF6sZjRDoDYaz4xpd8ISOB+Q+wiBg==
X-Received: by 2002:a05:620a:4154:b0:92b:6805:918d with SMTP id af79cd13be357-92b6805970dmr678120585a.69.1782583631224;
        Sat, 27 Jun 2026 11:07:11 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-925fda626b9sm1550494485a.14.2026.06.27.11.07.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 11:07:10 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: upgrade 0.3.0 -> 0.3.1
Date: Sat, 27 Jun 2026 14:06:58 -0400
Message-ID: <20260627180658.558372-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 18:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239701

Pick up nine commits since the v0.3.0 tagged release.

git log --oneline 5974ade11032f218841d9f449ef0efeee3f9a2ca..5137f70fb43189d98e5738b7734f69f214516b97
5137f70fb431 wic: Update after plugin name changes once again
bb768b12b733 bootimg_pcbios: fix typo in comment
85067dd89492 README.md: literal cleanups
9c75ddc60d06 README.md: add Trevor (the maintainer)'s mail as Cc recipients
0cbe5b9d2934 README.md: add example instruction for sending patches
1f9e8c77c049 add basic b4 config file
0a8ddac66dc1 wic/plugins: gate root= with rootdev check for efi, pcbios and partition
f20cda73b495 wic: Fix updating fstab for nvme devices
bc0a8d88f6cd src: rename top-level bb imports to avoid oe-core/bitbake collision

AI-Generated: codex/claude-sonnet 4.6 (high)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-support/wic/{wic_0.3.0.bb => wic_0.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/wic/{wic_0.3.0.bb => wic_0.3.1.bb} (90%)

diff --git a/meta/recipes-support/wic/wic_0.3.0.bb b/meta/recipes-support/wic/wic_0.3.1.bb
similarity index 90%
rename from meta/recipes-support/wic/wic_0.3.0.bb
rename to meta/recipes-support/wic/wic_0.3.1.bb
index 7dbf84b039a6..bfd34374a14c 100644
--- a/meta/recipes-support/wic/wic_0.3.0.bb
+++ b/meta/recipes-support/wic/wic_0.3.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ee23c52855c222cba72583d301d2338"
 
 SRC_URI = "git://git.yoctoproject.org/wic.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "5974ade11032f218841d9f449ef0efeee3f9a2ca"
+SRCREV = "5137f70fb43189d98e5738b7734f69f214516b97"
 
 CVE_PRODUCT = "yoctoproject:wic"
 
-- 
2.50.0.173.g8b6f19ccfc3a


