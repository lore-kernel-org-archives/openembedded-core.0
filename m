Return-Path: <oo.hehir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80F1CCF2CC
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 11:24:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4645.1792236255054342599
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 04:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lFGgfpl3;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: oo.hehir@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so4302855e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 04:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792236253; x=1792841053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LL/5KO+A0v7ws7LJif5O2SK1+kZjEbYMlMBguWDN2NY=;
        b=lFGgfpl3d4WencVL26u31LS1OKRHFGZEHNzoIrgUUjSTMhvulUOivUqEBPgd/F0RD9
         J0+fSWxy0Yx1KvI1fWdBrlOH2uhzx/c9vgA7e1pVot+sThQiiwoAhLgHGIEqWTcX4PgC
         jBGXzgYE4FyYiBXcV0lGepVREAfkp+x2iiCow5vaI2BOKkb1Py+TE663l9BL4Nc7YQnf
         WQzu+Pr/lQco96GDb1Ma6Y3RqqkBwlfbLvLjf5+DLTYy5P+EgILJdTd7mDlke15diLUk
         auKM2hIAH98dzbe9V23pTL/zw9/VTvXrmxTLZovUyJZHJ6//zWFQSvYzwIXJB8mS/sTt
         ceKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792236253; x=1792841053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LL/5KO+A0v7ws7LJif5O2SK1+kZjEbYMlMBguWDN2NY=;
        b=hL22Y/5tZtdZVhICmewb5d9dA8SHFb+h6uPD/LVGTUsXh89QEfBwlqAK5n3BvL9eyy
         oq3bLDut2Oy8lANclViSOO053ll9aRX4H/aP08Zw3cX8xa0/yN6B5SMg5+yx+9Qr8qBo
         /oTJy/ciogarwbiSh5dQ9aPjLqT+BADEVWE3WYW80A9pMvwqthO2v2Co7UifabI62lNH
         o0hwULRWmtLUDwEm6Z3IJ1quOfPoeQZBA8PWOxdoF1FSgdnMMmcXiW9GrAE0gayK3OKr
         1MwbOGfzR6KJj1kQ8JWcz+AT9W2cqXZfIVEA0ExeJKCg0CH3dyeqPrwPND6G84lafVf+
         clKA==
X-Gm-Message-State: AFq9FYJYWE0NM/M+sp++iAsJ8pNiDASMReUPJBufxZP/er9r7CbOERjr
	7kKVqilSJTslTUK5yDf0Bclslk97ogwPxI+ci3lnpghbj+tuCaTfJBY4oeWIvQi/
X-Gm-Gg: AYBFou3IcSrNrEJxI6thdUq9iEK70ci+sHoe/WA8VYZiEYJAA72gM6jml2f75Xrhl2M
	eCyQNJMPtlIRwRgcNYdy5CckUn3XvyAZy941YUX/AvaeJOdGDp9OUJFuI3E8KFAMRbgJtqUL/on
	Uc6XiR8yeklgbuLOsrBzWnpOb9MlB4Uh4oTe5mNC+6agt9wERM7a0fe+wjbg7+uh2yJruzJxJAC
	eXlNcmkn2AYMflm0pLGm6LTuBvzTTHPLn0f3Cy0wBXhjgKbVDunC74lH5wwicGxTlxOoAGRZDOg
	k/8ka84pYDGp4nkuG6cmBqAZizv5YMHDkPcECrONrLHHzZcrWSxCUrDwchh3BPC+PtM2ky43CaP
	aeWIj6AoVwtMD1zVYzEZrBbd9YSeLylN+a50UI0r8i+KSRHHVg1zbJJeBb4Wq7ic/8Cag2I35io
	xRj+FPiSMMJvoTnBFzUTtXl5qrHFtU6RMmfiKuaI2YKKOvJzwg+Fdilja4wg/vlE+JB5Qv4IKb1
	Cli
X-Received: by 2002:a05:600c:c170:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4a1d76060a7mr46014475e9.20.1792236253195;
        Sat, 17 Oct 2026 04:24:13 -0700 (PDT)
Received: from hp-z640.fritz.box ([109.77.135.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm9140287f8f.1.2026.10.17.04.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:24:12 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	mathieu.dubois-briand@bootlin.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH v2 7/8] ptest-packagelists.inc: re-enable tcl8 for riscv64
Date: Sat, 17 Oct 2026 12:23:56 +0100
Message-ID: <20261017112358.77434-8-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017112358.77434-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
 <20261017112358.77434-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 11:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248086

The previous commit skips binary-40.3, its only failure on riscv64.
core-image-ptest-tcl8 on qemuriscv64: 152 pass, 0 fail, 607 s. On a
VisionFive 2 (JH7110), binary-40.3 was the only failure.

tcl stays parked: under TCG, unicodeNormalize.test prints nothing for more
than 450 s & ptest-runner kills it. The binary-40.3 skip still helps tcl on
hardware.

Signed-off-by: OOHehir <oo.hehir@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 97c6e35050..1b76023621 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -164,8 +164,8 @@ PTESTS_PROBLEMS:append:riscv32 = " lttng-tools strace"
 PTESTS_SLOW:append:libc-musl = " libc-test"
 
 # These tests don't yet pass for riscv64
-PTESTS_SLOW:remove:riscv64 = "tcl tcl8 python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
-PTESTS_PROBLEMS:append:riscv64 = " tcl tcl8 python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
+PTESTS_SLOW:remove:riscv64 = "tcl python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
+PTESTS_PROBLEMS:append:riscv64 = " tcl python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
 
 # These tests don't yet pass for musl qemuarm64
 PTESTS_SLOW:remove:libc-musl:qemuarm64 = "strace perl gnutls glib-2.0"
-- 
2.43.0


