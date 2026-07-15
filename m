Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87348C44511
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:00 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12674.1784134071102700254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=buIv0Gw5;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-44aeefa1c00so3216254fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134070; x=1784738870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAxoTOlb6J/TqJBMSDiqpNZCBSPZ/ATNUtknjN0pHbI=;
        b=buIv0Gw5OEzPFecqSd9OcDVyU7TmB4FEje54OZ7QXsrTwTts7waHMhnaHCl2e0AloQ
         gbkbxD5u9XoTUCDlOOP6xE6KO8MWXUrSuYqfSt7aXCFYLV+YU+8Cf0Vrxtg0/s/Ygj9Z
         CWfpBtJwg4EkAcdkw99sfJHr/oZC1dhGRf3NFw8Ga5WxLKru7fdMPIrCB8FPYr+8sC1T
         7ubj6ReEZN1T/h3AqhaAeUki1WrJ7MTDkuBJ7vR54M7JVX8489FOAIsH2oYKlYqAyZEH
         Vwk+xHKT+zrlrUSJkcjcor9F8Uy9Y5mEPT1b2RmKYNPH9YPt2TwYdHGofNcBV1Hqhit7
         3jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134070; x=1784738870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cAxoTOlb6J/TqJBMSDiqpNZCBSPZ/ATNUtknjN0pHbI=;
        b=PvG8kVhBlI/t/t5n0fk11HH1eFcW6DLJjP2ZQwtnZ1KDAmEzOn3yeDnDOfsTYHLcBK
         w07PvRX9rJ7lOUET8jYKiw4LPNrtW0Ex8TDeIhCCP4PmNSXPaML/HI1/lbBRlPiv1kj5
         PsvkqBz+MdW/DWeOLaXotMkDPfBAnfkH2gFDQZ7YZonDnefPDqRadplNmyRHZ/ebLUR2
         pOnr9ItlQyvyvpRg/KFjliwEtWDryDUWo8lmtrHxh29bypzDRKSvnL5fPyvG0I4uQ6pJ
         SZ04xKwvwqozCDNba5bJTG5vpA4cXHU88xgeV5e7jXMq33PPeqWQnnv+Ynn3xRmxI4YX
         XVAQ==
X-Gm-Message-State: AOJu0YwuPSbEaTUUQoM2VpQRyfF6APHCx48NA1Rk5c5fdfsVwqDqR/r8
	fGpdwK2lnZnAW08Q4nx0738JxM4Pfn/lZ9pDQKL35NefO5j2P7eMCY3Z2Yzr2A==
X-Gm-Gg: AfdE7cmpULGsAHu88sWZ5e5Lc/FvbABjpJhDrUDzm7652yuxhCigBJhQS3V8wotfIgf
	DEnYVWjlqYIvJXQuDnn8tRQo6JBS4FW1vPKfGoUZ/1S207CkHj5Enc9V/0yukJQQWiNDZmmr4Un
	KR0Q4LfmsuGRiNF9D2hINrJm0v/HVFWXoJwyrJy1ByMhGflX3IfdLfRDPS4Hlin/XQ38jeFSGZi
	cZhJ3Xhpn7S1eYVJFEsIUPmmPaXv5ICRh4nfnixVnQNvxsuiRKfyDsfj0HZOjsWRBphdt3+kvLG
	zieSusTRHGZXg8GCfgoFOrMp8e4TBkSAuFFrmH5bVSEk7EcY9YTOUJ9xl5ZHhZTNepUONJ8LvtY
	Re22DCxq/dDMtbskQx+A/1o87DO7O86ipI0AewAMfImJlV0+E4Gua423e84rQ7wlyCWXUWGRRP3
	ZPYhcO89de
X-Received: by 2002:a05:6870:2498:b0:456:4c6b:773a with SMTP id 586e51a60fabf-4565592b26dmr78134fac.9.1784134070251;
        Wed, 15 Jul 2026 09:47:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:49 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 11/25] autoconf-archive: Replace deprecated SPDX identifier
Date: Wed, 15 Jul 2026 10:45:07 -0600
Message-ID: <20260715164739.364323-12-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241004

GPL-3.0-with-autoconf-exception is deprecated. Replace it with
"GPL-3.0-or-later WITH Autoconf-exception-3.0"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../autoconf-archive/autoconf-archive_2024.10.16.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb
index 46d1b91d65..c243d632c3 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb
@@ -1,7 +1,7 @@
 SUMMARY = "a collection of freely re-usable Autoconf macros"
 HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
 SECTION = "devel"
-LICENSE = "GPL-3.0-with-autoconf-exception"
+LICENSE = "GPL-3.0-or-later WITH Autoconf-exception-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
     file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
 
-- 
2.54.0


