Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE4AC44506
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:48 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.894.1783881819101996163
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=B7xeP0TO;
 spf=pass (domain: underview.tech, ip: 74.125.224.43, mailfrom: vince@underview.tech)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-667b76205f1so2010342d50.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881818; x=1784486618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLWL5x2mDYdbqL0rSx2NnIaYNFG8P+eNnoSQuaJgrtk=;
        b=B7xeP0TO9b6K6Et/JCvc2+E9cR2E4OYqtQAqCoCNrUpD2LbHgkt20s3WiI/HtuxJka
         KTzx3nG9HGrBJepR3oEnAVDxYD5DvRWe7lL3k2h/qYIkAwMJD5B7zxoV3p0H4hHcAhG2
         gDLNIFnh48RugrcfBIQqRwOU+M5sRum//nvu3sDfqRF4ybn8rz1dkcLzTUNi43YjNTk3
         Oxw3TkMVwdpodGuTJDzm2XfviiDPLZXVpeQUiaBBQeUdArh0/QmzfMAa1D7nmSgmlTDU
         EzLB9vsiEVN0pFqA/f7WOD9Q3L9ZJicBGY2hVjpm0ZnvWHCEADruOQE+PD4XwTa18oaP
         D5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881818; x=1784486618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLWL5x2mDYdbqL0rSx2NnIaYNFG8P+eNnoSQuaJgrtk=;
        b=aXSEpyHkTA0Y0UGUgNumHkR4N1zgfJ5DeQtssS2OQuEPFws/+jwxWkZWh/1lI2j0OX
         9ns5Si8Z+PbXh08CDx65yPKiu2sQm03ILe9lgCCGKEnPReSgs67fWVRpaL5V1tho6moF
         wId5/MfmFob5+G+XLKYzp+TuhQT4OUF17nG2o3SHT1kezGDWsi5aLhnu2AVdWtkf3i3r
         E4S4dAg7Q3TPQc/zx555qz5ath3goiccn/VSgghjCEuQ+nexoFpIYEB6S2qybBScwqvO
         EOutTJF5Asm5hvqahmSlifzUkHytD7orMZVFadqXJaBS5aM5WYrwSFOtlLkTvP+osAXi
         TVrw==
X-Gm-Message-State: AOJu0Yy1Ah1C0n20g87T1PF3XDOOO/mkaa6rGUD4PMcwjIzzxBz1e8BI
	y23a2RdHLUCbzZ+sFrTBnsaSFZBtq+qALN8inttvK+Bh2J/OYYlSjdq5WSyHfF4Ths/DBqzI+Px
	RM9PNuNI=
X-Gm-Gg: AfdE7cmJSKE93/qlekc7a8vOAAa7Gt4yR17W2GzDDoxGjYJLB3zLbho7oejT0JGlxkx
	hXQ5iWKu4SvdUpyTU1zvwoqUCIRv1ppw3Bd6prLyJ3G+Ak8ACZE9Eou0QeoOxLu0lbizlX85Fcl
	bVPEG2Uqkv/fX6Pmf4fxGjLPFMQTulZ4W1BzIRqVXXaxO8IUbbi5Kfd8g95EAEI9BjlfrcHpI+M
	6ZXtmzaNW8Nq+p85p+TcxmG39xtJbB8M28X6TsaHYEUhDhw2907iV1brMKThEiFKqyCwMlhgIh9
	sFjeMutqp0DiZ/BsK8Bcv0NxrCGbSg/a4047fGrxvRNu2hZpVxNxCIQB/xcqbLlXSIU9yUxkwk+
	lqav6m+h+tZvBhZy3F0cTR6IC2dpieDHcgSVJNwTn0a8zPabnr+S/AJ2VAgHBDVZmfU4ll+Q6i2
	Tq5TQQ/8qm+CIO1A==
X-Received: by 2002:a05:690e:1445:b0:667:dc6d:7353 with SMTP id 956f58d0204a3-667dc6d77a4mr3838015d50.44.1783881818174;
        Sun, 12 Jul 2026 11:43:38 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:37 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 24/27] perf: disable discarded-qualifiers checks
Date: Sun, 12 Jul 2026 14:43:04 -0400
Message-ID: <20260712184307.3259642-24-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240814

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-kernel/perf/perf.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index e3e5d55e39..03808e1d68 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -98,6 +98,15 @@ TARGET_CC_ARCH += "${SELECTED_OPTIMIZATION} ${DEBUG_PREFIX_MAP}"
 #| cc1: all warnings being treated as errors
 TARGET_CC_ARCH:append:toolchain-clang:arm = " -fno-error=maybe-uninitialized"
 
+#| libbpf.c: In function 'kallsyms_cb':
+#| libbpf.c:8120:13: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
+#|  8120 |         res = strstr(sym_name, ".llvm.");
+#|       |             ^
+#| libbpf.c: In function 'resolve_full_path':
+#| libbpf.c:11920:35: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
+#| 11920 |                         next_path = strchr(s, ':');
+TARGET_CC_ARCH:append = " -Wno-error=discarded-qualifiers"
+
 EXTRA_OEMAKE = '\
     V=1 \
     VF=1 \
-- 
2.43.0


