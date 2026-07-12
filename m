Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B742C43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:51 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14879.1783866586830967733
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=K53vbjff;
 spf=pass (domain: underview.tech, ip: 209.85.128.170, mailfrom: vince@underview.tech)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81e8e83ff89so13715677b3.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866586; x=1784471386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLWL5x2mDYdbqL0rSx2NnIaYNFG8P+eNnoSQuaJgrtk=;
        b=K53vbjfflTEy6NHGdROIyeKr456G9vmaQN04mXcM4JLeHdP+MsXUlh5bWpeZiUHpRN
         rn5cOqXUhgrb+pDdApIp8yKbdhZUMShF9bQNq0nx38UpBTTiFo1m3GRpzpwmZzY+6JU9
         NS8kZKV79GW3T6O9P8HRU0DKg7Oq4c8uJvrrzwrFoMVE9RsVAX4XZI7r88vsdaqYtuMr
         aX7p5SKEl3W2uO6nRrHZthAEhkIQ4REIS0UBy9sYfGQwOg7NeLHKY+MuifOLjM1HGKIU
         5L2HMFOZvpB889x6pMvzfZqY0b7pNDpM80kaTyOUyjLTGcMK0S5tzuNTbCXpHRypEk6w
         R0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866586; x=1784471386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLWL5x2mDYdbqL0rSx2NnIaYNFG8P+eNnoSQuaJgrtk=;
        b=cSOx6oieMmHlT8Af569NZ4b4BYx8BgDASKXXxaLMnBizSArLd9S25t70U4otMYWsP8
         cyIy0XmMPXrD+N2yqe8d0W6ddnu86cjYE9Y7JV8cRW5hblE6zVSe9Gn3x5320bo8ckIz
         /NjMgRancTyrQf0GzoWgBxmLOz5EPQm/+VO/iuqD6Vj5ks5nkmJQlG/bScwM9x8OGKA4
         E+4l8TqXXQ718+kos3fFzezoB9UaYARavY9oc6CKwcnfjoiR26lbv2vEZaIhV9cXYRU2
         vPz1V19TJcP2fOaE0hd+4MrH5RB7mkJs8la0P82wjN6noxkpPFYjCPMp/sFULBJriM1Z
         StLw==
X-Gm-Message-State: AOJu0YynP9AuWPpjprd9qOezBOUSClbrFYZJsR2zVyVIXY+nkynjmdWr
	AxPxomamkF/aQ1CxUKUlT47OAa/sUp6eu/kOW6CgWErC36Cv1hjO/+aN+4xcndhf1Q/zmiKspF0
	xevIduZk=
X-Gm-Gg: AfdE7cnYYc3SR5cmJh17VJSkkeAyQF2oSRWx3qeGW2aykLbkkoU9JPtRd7fTGkNhm8O
	puPEgp6O7XEMEsYpzyA2kCB56r4o/Ofa9fuCV7wceB/oToXr9lSRNX5fwfoeRr3FczzrHjL4lVZ
	BVCXqyb7zkaO13WnwrnaIO/sBPzFYGtm68LEEx/Uigf9VBgarQKgwfDYF2WpzE8KfORqjGEAwD+
	wJizNYR2TKm5k1X+59ytD2N2a+egCEZ02NW19itFsyaKtQLaWjjLYtNqVAXOynPZp+lMgGvBMTh
	dBFma56ZwRUpQVlo3/lrw+D9z1yRzEMHoQ4MxRcXSNkQDny3xf2aYn6EAIT55hbhOD6Erzqpx4s
	wlbjAmLiEBbV7W2tcX5cjE/+rNKSqTTCCh/fMDvKL8JB+gTXBtYXcU+eiRaowypdfdVIrg6WSU7
	qykNwa74njpIZJag==
X-Received: by 2002:a05:690c:2604:b0:80d:5ddd:1989 with SMTP id 00721157ae682-81e9001a2femr42376837b3.10.1783866585934;
        Sun, 12 Jul 2026 07:29:45 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:45 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 24/24] perf: disable discarded-qualifiers checks
Date: Sun, 12 Jul 2026 10:29:16 -0400
Message-ID: <20260712142916.2573370-24-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240790

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


