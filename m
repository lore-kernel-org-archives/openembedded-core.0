Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C71C4450A
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:59 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9346.1783835516266021492
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=C6R2iedE;
 spf=pass (domain: underview.tech, ip: 74.125.224.50, mailfrom: vince@underview.tech)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-667971437d6so3414228d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835515; x=1784440315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCGeypl+aeNBpyCM31M7t1NjRmBOBEQ1sbwumQM/N+Y=;
        b=C6R2iedENU5trMQrD4h1119MdBBzRKljHeJBSumKUoP5RwTN9dVyHzOjkmHKIC5L2j
         qmJfURiQLr8FykWg/LREPnOD9pdXR34hD706lKAp++lLKFUqeMs+ZZj8frKncwBezGbe
         sdMmlbfJc66ofHkBhlkN7F+jPv0E+hnx+GxBx9dfqw4TJlYbSbx9+/tniF0xen3NLeE8
         tYTSWzPEcke7jf4yiB95+LBHDlfFcRoP9Xr1lXF7zxVwSw/fzaSF37HNF682ePw10HcN
         exUfoWIDRAcoA3xgTvLtiRdzjqFD14j9HjIOVgI3rmDc1wKwFzc3etUZbNybqpPloVcA
         Cn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835515; x=1784440315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xCGeypl+aeNBpyCM31M7t1NjRmBOBEQ1sbwumQM/N+Y=;
        b=CBJC7G17n02g7+HQwqnfA9dgOYA5UgxgkFPG7nUd5CRjhX/gzVNS1cSqZdGO5CyIEj
         JrJWqllzEV3LvrPLPJcQZyDHjDS4/2WKMXykp7WdpiRN+PgAqPNNdXx1yMM+kT0JZ7hi
         fsvpefBbbv9TTwOwiQ+yKaOmmemTY6Bkr7i5Ipwf6Ksvy04sPH337klmC/veD5FI6uLa
         KuxqdwUnsTQukeVbIeWNfU6ZvM/4mPufgiXR8tWyNrtrs1Wuy3LY7A9w10K7T0h8XbVY
         6YVaCi+bDtemiZZLGDUpVQu3zn6+OBrRLC4QO21NSpY9OP2i+wPkr0MrMjWNlB7idOtf
         9m3A==
X-Gm-Message-State: AOJu0Yy/oKMheWMQE75RZy5goeLFludeSA4fXfWv4bZkfJbH77PCi6XM
	m1H4OaoGJD/Q6EUpGwDilS89rHSdOIsCF5H1lu9tMft0Oohg4lY/kXvZSDyKuJBZl/z4am8icOM
	NvBkya28=
X-Gm-Gg: AfdE7clVHJqCaZETq168uKTP82KLdV76uVHeeBauFhwAM6gC82p2+nRpY4Mv0Su2lxC
	HIYCNPQy03157IIGp0WMbFjp5kXFU9AS5RcRK8gYifadpofADN1Bxlfqd+BbZs+jNuFMNJw1vuR
	8wCntDCqqzx9IeXH45ZuWhbqfda5ovGtPj3MhrKOMpvSerQPyBrBpCz4pAfZGpGhz1YrVNy5Gc1
	460A0oTIv552ovNnaJCwElMm+o87S2si4MdGREgkTqBgNNEmph+TuTea2cqZePdPRulavQVpK+I
	eqIJrmYLkXLTDEJ0kIXx/ZMRAyPzqv722AB3/+nxo9rsFF1JPhCuZ/5H40J6NivBDBDuC2GtBaX
	GrU7mJFvOIVSKCEIutVlyKjhndc97qWZjG+ocwUXjUFL5gDeqRobgv93Pqpm8BwnuhFwprpx9c9
	DNKtbjslFtLXLzsc31/t7qkUee
X-Received: by 2002:a05:690e:159a:20b0:667:bb38:d979 with SMTP id 956f58d0204a3-667d7b02800mr2944536d50.11.1783835515446;
        Sat, 11 Jul 2026 22:51:55 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:54 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 24/26] perf: preset STAGING_KERNEL_DIR
Date: Sun, 12 Jul 2026 01:49:52 -0400
Message-ID: <20260712054954.4063745-24-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240749

STAGING_KERNEL_DIR changes if KERNEL_PACKAGE_NAME
is not set to default string "kernel". Add workaround
to find virtual/kernel WORKDIR.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-kernel/perf/perf.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index e3e5d55e39..c8d8891793 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -204,8 +204,11 @@ do_install() {
 
 do_configure[prefuncs] += "copy_perf_source_from_kernel"
 python copy_perf_source_from_kernel() {
-    sources = (d.getVar("PERF_SRC") or "").split()
+    set_kernel_staging_vars(d)
+
     src_dir = d.getVar("STAGING_KERNEL_DIR")
+    sources = (d.getVar("PERF_SRC") or "").split()
+
     dest_dir = d.getVar("S")
     bb.utils.mkdirhier(dest_dir)
     bb.utils.prunedir(dest_dir)
-- 
2.43.0


