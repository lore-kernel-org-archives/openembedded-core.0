Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185CCC44506
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:25:04 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1268.1783747496864306615
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=VP5HhDev;
 spf=pass (domain: underview.tech, ip: 74.125.224.50, mailfrom: vince@underview.tech)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664d35b4777so2276657d50.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747496; x=1784352296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ry9iuts2WT/+bbz807fD38JfSE8hTwcNecX54bIKtoI=;
        b=VP5HhDevshesAAygHi76+FxaCaazVwCj4Ut4t+2/7hF5tuL60yBBaW6aJnTdbRzJq8
         l1jYT31ie5CVtEivdnlTcSFs1+PTIUBuJFLQSmOJde2cUTKEiDUHqm29WQyo/8m46iY8
         bcSXTBhd/IjSRWp0nZ/t66msfoPfsiCQhK9D3w6cCIk+r8ZBjj2YhH4jw0QayE8g3uVj
         eq4krpgfpuyEajGO6mmN46dBur1ej1YHSD8fxCGhY0ysJ3U9L3k9r61YgcoNkfldFsM8
         JE5kG6DQQ2cEWgSh/U30hErYRei0nlGW/btK9YVMRJqNSlqZf7u0rEWT87SIjUcFvHY7
         Mlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747496; x=1784352296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ry9iuts2WT/+bbz807fD38JfSE8hTwcNecX54bIKtoI=;
        b=ktyoOqgxxsijXtsgIxy+Nc0QM7RF5kXCwXK1YgaFGUUbfrXkxoNL4J4VG+UxIA6buz
         AEgQVGrBcflIgU6zGqFLQaie6+2lsK6w0nQbm/x72fnfJGbwQTxYbC0FY5NjS0IFs1h3
         cbwtPYMfXglleeIo/sP99AGNANv3v3OU9WfC/ZFp68f4aW5jA/eKFKwIl0xJE9GBMT6F
         qudDCE6XAFYrLcPmcXoLxKCwZsvo5CgkYK//qAeJY+NrrtDtdscfrEbRiC8HDRf/wmAt
         87mhGMqFAi/VV/wFEF5kRJkHY347FWwP6ermh25r7uScQiZdSkpuDwi2bwt+sJokZs1I
         ftvw==
X-Gm-Message-State: AOJu0YyvcUFtiFdlTQ9KTC2fb7pqhnt5wldnp6kK+ulFdC4ES2s8oDeq
	idhrT5PE2CCfd7nxM94m1xJdBzNSNoqdtDLDYKDsHlGOm4YPDkohjf+Yq14I+IobKXovv+YpwqG
	Bt4Nu6p4=
X-Gm-Gg: AfdE7cm/F0Fyt1NoLbO9AHitknUQL/hJwgAvwmsUHg73RsG8u7GfV1H3t0c5DZMPaM6
	xcfiWCzwD/mpybHOwsPYdgb7cozp+hayeB0FmdX6SZZAVUaQrICfjDI6l+hTgNa1WZL/YzTHzvk
	tjYXpFRKVyG/PltLCgCkmGBHvwp3Bu07ph2ckhF0MeKeGeFsuYL7klx2FEKqWoc5iBuXoCJCuTz
	3ZAHBIx1zXECGvE3zi8vQj7NyJKWsdbZJXkE35w93Ody7HgPxXSsGwC37UhhPWK5htYxugZrDQF
	uV1Y3s9cyJMft/aPbFptCZu8UJ5C9m7zaoR9LKBNZXJUz2J5PvZ78IuPrt5kEsjlw9R1vbeNXpk
	tu4InHVAxEZaPbhzBo3bFe1HK/kZS0uFrgb0m1Rn2x4nqCreBBpYZ/o5IXTb1a9G26Iz4R2wDPj
	rNrIunAluFScdYww==
X-Received: by 2002:a05:690e:418b:b0:664:d7c2:43d2 with SMTP id 956f58d0204a3-667d7c93662mr1190825d50.80.1783747495968;
        Fri, 10 Jul 2026 22:24:55 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:55 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 19/19] libnl: rename kernel prefix
Date: Sat, 11 Jul 2026 01:24:03 -0400
Message-ID: <20260711052403.1292286-19-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240700

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-support/libnl/libnl_3.12.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libnl/libnl_3.12.0.bb b/meta/recipes-support/libnl/libnl_3.12.0.bb
index 2b46fb69d9..be2b4e0dfa 100644
--- a/meta/recipes-support/libnl/libnl_3.12.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.12.0.bb
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "fc51ca7196f1a3f5fdf6ffd3864b50f4f9c02333be28be4eeca057e103
 GITHUB_BASE_URI = "https://github.com/thom311/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/libnl(?P<pver>.+)"
 
-inherit autotools pkgconfig ptest github-releases
+inherit autotools pkgconfig ptest github-releases kernel-vars
 
 FILES:${PN} = "${libdir}/libnl-3.so.* \
                ${libdir}/libnl.so.* \
@@ -54,7 +54,7 @@ RREPLACES:${PN}-genl = "libnl-genl2"
 RCONFLICTS:${PN}-genl = "libnl-genl2"
 
 DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'libcheck', '', d)}"
-RRECOMMENDS:${PN}-ptest += "kernel-module-dummy kernel-module-bonding"
+RRECOMMENDS:${PN}-ptest += "${KERNEL_PACKAGE_NAME}-module-dummy ${KERNEL_PACKAGE_NAME}-module-bonding"
 RDEPENDS:${PN}-ptest += "iproute2-ip"
 
 do_compile_ptest() {
-- 
2.43.0


