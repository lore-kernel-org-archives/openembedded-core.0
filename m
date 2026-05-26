Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4A0CD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 12:27:18 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35843.1779798430253042227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 05:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Laqsc4DX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so33123865e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779798429; x=1780403229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Or/Pz20YAi8GByR815C1M0temL/9RWgLSG7pqytAi40=;
        b=Laqsc4DXIcxXUvCV0MIiTHxamqWaPA8tklHkq9qqbJNGTSukeXqoBn+KCZQRy6VmQm
         VqJ7ynWEu+WQ+PH8RnmDJ2N8hlpNWytBvNb6QcMixSx8ZPoKr38LRZCz30balHEoWV2p
         xue599Xp+eQRAO5Kb1JlrA2S4K8gHpUV+KTZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798429; x=1780403229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Or/Pz20YAi8GByR815C1M0temL/9RWgLSG7pqytAi40=;
        b=euVXJQH3nt+4Ol/H3cd513URlySXYqxds8gWa2hhjD8Kbb/IsT9InKkZBYm3xoEqnF
         42XyGzNYeY7oRf679Ue3kuDt6UdsPJlDPqgOfNj9RbxnqjtL9vKnOy9bOn4HpVqGJMdn
         XJpg/Ohm7xKedJleeE4h4FSRGRF5ZvaSndVlGQHiuQQ0CoNzp4SKmHhrFJRy9Wy1sj/h
         sPubmwU2AG2ETd0dp3KiVb1UXiwDRg3Qvh51ZBJdBJ+ZGsTGBQi9bOxdTiAxsJkYrrW0
         xsbiIDebfimWRoYqT5DMrzEJOJFAJtpYf/Oyf34S4NiEBVChqiTknQqERhFj/cbL890j
         WI/A==
X-Gm-Message-State: AOJu0Yz6kqloUW354c88AzFLo4zXedblTFdorSlGKsY4KL9AJsjPSf1F
	3wqflxS2kQeA1myDHBwR6df1L/2IvQ/qAp2EJfFJjtPVJWCiBmPrKpFxk3cWAaZo5Glj/QfpeCr
	GJS9A
X-Gm-Gg: Acq92OH+5YXm8Cxow1TZPbhOFzKJ6jIhfqnhUScWq4rR59Ll2lRkn0N+VLWkPpopJEZ
	FTDvgSbjESRyxpsTSzVQe14S+lC2NoL9nlBsT58K5FDVcNGbe8RAw4Hz+xULr8E1xFqSQxa1aGh
	vK2e+JsVL4YYFjS02x8YjPWET/3masYOqLjGr9ISRBldFyzlAD0bxHBne/47ifZpkAdfT3hZW5a
	krA2OmjSO8J2lZDe8jCN5RVCpVgaHc/OA68KvV8rVMisOXMhRffgpqm/x/twhr6A8974cXEJTgk
	cQslZzIIW4RnbSgtlnpOC/RjAfeX9y3OY5tmSG9UhA5LmFLNb9QryHlzPMO3q0jzs1/SBC/eUMj
	fZH4wXVjEyEeNNNXMfmdGALbf6KLRbeWZNRo2yYVxAvb04zqn+55hciT9DRt4GgujjJvVjP4ANy
	wqHvdp1Pp1NfcvGFB/OG0IQ1K38IADuLwY4gR0peWv4qZM02WrLtuT
X-Received: by 2002:a05:600c:45ce:b0:490:5cd8:d20a with SMTP id 5b1f17b1804b1-4905cd8d2b2mr153017605e9.11.1779798428588;
        Tue, 26 May 2026 05:27:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2e34:2d9a:782f:4147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904527526dsm356759945e9.4.2026.05.26.05.27.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:27:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] xwayland: upgrade 24.1.9 -> 24.1.11
Date: Tue, 26 May 2026 13:27:05 +0100
Message-ID: <20260526122705.4171028-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526122705.4171028-1-richard.purdie@linuxfoundation.org>
References: <20260526122705.4171028-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237599

License-Update: The change was only to add a missing author, licenses
are unchanged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xwayland/{xwayland_24.1.9.bb => xwayland_24.1.11.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.9.bb => xwayland_24.1.11.bb} (93%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
similarity index 93%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
index b12b0d0cc70..477db6f8c43 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
@@ -7,10 +7,10 @@ a way to run unported applications in the meantime."
 HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 
 LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND & HPND-Netrek & HPND-sell-MIT-disclaimer-xserver & HPND-sell-variant & HPND-UC & ICU & ISC & MIT-open-group & NTP & SGI-B-2.0 & SMLNJ & X11 & X11-no-permit-persons & X11-swapped"
-LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f297af27a84508db9b80d1cbbcc69c3801da38eb64c72f3b5b50f582459afdd0"
+SRC_URI[sha256sum] = "27115a1a8819078409bf6fecfeb7724e8137bd36426de7005a5b3aae0a2138ff"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 

