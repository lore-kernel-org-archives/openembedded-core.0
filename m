Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BC5CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:50 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32435.1792040627399696784
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YskNZ43q;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10416705e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040626; x=1792645426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KhHdKYQ6e/0UZy2uVR9Yi/BsARcOdaUXGuAROnVtaEU=;
        b=YskNZ43qJLFxGAJk+5ctnvM/goBJQdsGSo3An//v/83CmZK4Wi16mi/2LXWmBQCdEV
         Eyj0KR2n1ug5Kpk1RkcuS1e1SbrNMvDlRoVjj9ne2tTUU9/68U9cQ+4/G50VosQ84347
         rmTdTQzRb4EwBSjnmq90ZoYD84QejjzqwldZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040626; x=1792645426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KhHdKYQ6e/0UZy2uVR9Yi/BsARcOdaUXGuAROnVtaEU=;
        b=kNC6Kek5WKSM5P2AnovWLInr6goDDsJieZobLUp7UBfvtChwj9aPFLhrN560iDG63V
         mDBwEqWZmT4bIyiTtdUASGdmptVuUtur7El/NPDJHj/azLXZjg/X/Y5eLuTQpVtWna75
         YKlgdG7y9Zkv0BIEaisK/3qW1xJyH/Pbd1Wu148dYLnflu9MQj0C49Ad2U7YPE1cxpbc
         o8XrZOJXH1He+MPXfUpmpmXXQgaHLoAdeDwL1jRmOsO/0zlZbm1Ze4HOKoC6sPPlNrLd
         FdxXd+SScC8DzOdGoYYZMNvbkdN6sIRVDyd2Vv9KtcrvIkU3TslawKEZFpX4NG3fbPLW
         sebg==
X-Gm-Message-State: AFq9FYIfTYCCK/j2iD5od3VAETITLNVx6OjDsRCObHYN0iynq7XGFKjW
	mg0B0hCM+waxjFDkHsdp3+USQizv9cgBcsfu1Qs2J25KIYf3fMTd9vDisrDgm9H5yquV6u+ZkYH
	gsEaOt84=
X-Gm-Gg: AYBFou19tLAz5RjAdi9VpAKYVymJYWa4GziZGhOtoQru2Fq2v0MUNDi5GXyTvYnDC7P
	rE9vxWtA/8yooKyw+53VyBpm2TU0ngDM/wS9whsPAhxNC/IBG69xXuNq5+70qrNq+Fc/AW5Y+da
	8M8+R+30SDHNYknsQFmNiy50ixfogf3Lh3tyGo042PejV1IkSy0rdtfeMeCkSqjt/TDkOA5OBTB
	CoXvD0QAmN7W59v5YkcDT74NuxytcxYFBl/kqWzWknuyGOp1acZdzP+0FRbeP9qUS9oGQCYluAZ
	/fTq9jPMuFAN4kVmkMHjmsX+N+HtgywiikI6SD7eqJVWvopjjVi/NZ8qzXQZpK6M2ruUrCle6+r
	UcmjjrcgH4vRk/xdFd3TvEZDe6zS2HJ8FoVOAt24EAXDLQ7ao8rH763vbPVu10In2MwF+P4qtDs
	jSIgXo/AY1zX+kNWJ59sSDn4y7K69qI5G0M5MHNC8FuLI8940DA2GlzgTiiOYxJ83VNHLgLWfER
	A0WjwVFcTxhbx87u1yhmJJOrQHXXd4aAPJhCg/MGjIFhouGZGUxy5uz4eomtNeWi4lOwKTCtw==
X-Received: by 2002:a05:600c:4504:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-4a18e4a7839mr380565485e9.25.1792040625394;
        Wed, 14 Oct 2026 22:03:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/55] dhcpcd: set status for CVE-2026-56116
Date: Thu, 15 Oct 2026 07:02:34 +0200
Message-ID: <26acbf957a5aae69afadb40b05e99b26ff92b889.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247809

From: Peter Marko <peter.marko@siemens.com>

Patch [1] mentioned as commit fixing this CVE in NVD or Debian reports
is fixing code adding new feature (route advertisment processing) which
is also mentioned in the CVE descripiton.
That was introduced in commit [2] which is v10.0.7 (>10.0.6)

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/708b4a56bae080a5b18c2e0c4c6fbe103131a2b0
[2] https://github.com/NetworkConfiguration/dhcpcd/commit/f1cf924ad691bc1e6bf33013407fbf838fa40fbe

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
index e6854e1c7f2..c32db0adf5d 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -62,3 +62,5 @@ do_install:append () {
 }
 
 FILES:${PN}-dbg += "${libdir}/dhcpcd/dev/.debug"
+
+CVE_STATUS[CVE-2026-56116] = "fixed-version: vulnerability was only introduced in v10.0.7"

