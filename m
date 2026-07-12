Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112BDC43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:59 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9511.1783835517570258756
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=N52jz1Ja;
 spf=pass (domain: underview.tech, ip: 74.125.224.53, mailfrom: vince@underview.tech)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664d530fcfdso4244368d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835516; x=1784440316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLpBG+Vb+pTv6qzOMJdRx576uTGG0aQUooyLUcdvczI=;
        b=N52jz1JaR1EZOkUFOkxw9wg4Dx5OM42l6GVvdMa7h6u7uqAnXBCdhv6wUmjtAuWgxn
         qy/T4gO3o1kNEOAxIUd2GjPNKBbnjXh0iOJzWE93jboYIGPXXzxa4UAtpT2xv5+G26vw
         KnOCaXOR6IPKVZ9U/m1vdfbfhSs53M9U/uv7urbjscp7EpsrdYo7behXqXvJZHgkJN+v
         MfrO1V1wIEnw3N8wES+ayC8MUdvRdnRYRoGlZDEMwHuyBQwL4Nmzokq43SdossJ5bus1
         t708QFKB83dLw8l7HzPkhLAONr5adADA2RpvSTMgEvCzhJYIIZsMYWDftsAhVHIMiKXX
         NHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835516; x=1784440316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLpBG+Vb+pTv6qzOMJdRx576uTGG0aQUooyLUcdvczI=;
        b=TgqiOLLZtJ5x7rcH38FfKy1C0sAtfIbTaUOSrQT3Lv8IMJGiRsPg1mqfAWmQhrUKjd
         aChBrYp1pzJs6wEj7yEK/FbWNuaVLtPhXGr1Uz9aIYzaagTDlXcOofKodUnQQJGk9E6M
         wqO/5t998QffBGZJX0e/xlxBaL+lcGUFhB1rgvRUKajsBLAx5yR7FplxRodfMkbT4qxD
         by9wL2iiN+ndPlwYG6d1VCCw/+VHGw5A+7jLd1zIgk6w4riGOKk/YbMYLNqpK+zPEvSO
         VgbeY3HQvf45z+DU/hWW2DP4kYaDLzVk/YbNpU4AZm5bwNYzNjXIrYhqPqzuR5ezOMp3
         ViHw==
X-Gm-Message-State: AOJu0YzUjHI5M0VG+W7e/xdoOjY0BJVbDbUzWPEIAh6kO678I+GbyFsi
	reGPNFAtnq5hzy80T/Nk7c12yUHi1FCNWPd30EHaXDRefeGQ+kC7x+Bamdeqbuvg8nXPW8H+2vG
	MooKHME0=
X-Gm-Gg: AfdE7ckwGsvzTUS+++ULQpjBJLsnIW3C58LL4E5RtVD4gZsHEu6YJ88wUe/UaLQNEbX
	CMRB1B6hnkTKm+4+gzABZmzpi4RP9+YmQtKQDOW6JXDgAh1h5Dhf88jAC/8ZARKNb/NXZsGX7bk
	6RQoWHANpztbA3mzfLHaWQ5NTqss4vbOaqNru0eGTnCA2g1s2j14D/pTI5jJ1zmSJNhZ9UO4dVy
	YeSjlYt1N6zqGFInFeaT7ooEnHKOllpbcMfYc3hQNo+STm7BeM31xpvF9Y/giYiTXbTNP3TVvx4
	Y+TD+P12p1h1BFoheJoX5A9q6aami1gLihqn8xdEp9Re43ovZjgcMGKxOJfW8WeZTJ/e9JkMRT1
	7z8I39JDFrahkBTZ93FgS/JOJHMpswIgV7kV9dCdtRVAJSD53W+YZjwiIbDqGqzy8RcHJ98RcYB
	ltwUPGELSEIMCiJA==
X-Received: by 2002:a05:690e:12c4:b0:664:9d5f:c96f with SMTP id 956f58d0204a3-667d7b638bbmr3222482d50.32.1783835516574;
        Sat, 11 Jul 2026 22:51:56 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:55 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 25/26] perf: disable discarded-qualifiers checks
Date: Sun, 12 Jul 2026 01:49:53 -0400
Message-ID: <20260712054954.4063745-25-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240750

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-kernel/perf/perf.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index c8d8891793..e0d4337c68 100644
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


