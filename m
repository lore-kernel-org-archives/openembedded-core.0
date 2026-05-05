Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBBCCD3444
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:59:14 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1060.1778000345341717226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FANY5y6f;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso48867045e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000343; x=1778605143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCOj0WtVixgjiYF5bDtxjgcWkZvl/aGLb2gTh7ph3Tg=;
        b=FANY5y6fZ0nxwHnWpC3B9o1YQWBAIch0s1Z9al7zbcjMCdyMqe4Yq/i+1OrltUxk/B
         ZLbaDy8Xi+/0xJbG2ZoKQwmvgfucW8Nqe2mplQ5+nuoWSkjhCLvUYalqAxl6zofGu+SA
         G6uoeCd53UJEN+NsFuSWbV+xZeb8A37QoCia8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000343; x=1778605143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VCOj0WtVixgjiYF5bDtxjgcWkZvl/aGLb2gTh7ph3Tg=;
        b=D+BsAHJeDC4S9k3SkgtNeGikxl32rs8v5e+xw1LD8xgydnqvcDEqd5dEqPPJVG4C8y
         xU1hYZ4AI1dAq2Gk0Zwo1zngYSincbISvMvXPIqxlCpxLaeylKbicNu5y8RsQic3mP79
         yElBi+Zd9EOmNlmDkMa3a0D+EaktgLNN1ukW8qnBcXIMRvVqiBMS/kVI+MGspGzLElR2
         9XpqA4mGTGKYZqOWvM2egI5NdkKb9tqBk1njrFop4kebIJVDskWyyf1ithmNNM7TPUw8
         +q0e9iVB9tuSW9QwgyZOb7i6JV2lkM6HT9znduvooI0qEKjoqz22VPkParmQDl1COpm4
         dAdw==
X-Gm-Message-State: AOJu0YyEc9a/+Qro6EKY4HvRVXSr9GeA81D7ioukdjNEWTv/NDzSsLJ9
	5NBUFCWDYgxNBse/AfFCCps9cI6cfNPxe3nVWvbW8Z8Q8NzfN9C0JSCRXzpBvENqymEb4K0122A
	p/60OWGs=
X-Gm-Gg: AeBDiesFCoL7YWztLQvEEN7mNx4he8Xb3ig+eEg+nRK2u4wDoeo1v5w7Ezv9rCKb63M
	dwzGjUokqKiBB6bI6qNLP7XjCkK2f+cmwwtJ7R2EaWdhXHARxOF8n3tuX9xjucmoPvdQ9bCnCmI
	Rnyc83cTMBgyq41+4z2DTNyaHHvvJDynwAs40Oa2hmQUhd6QLoWp9eWErWdrZw2vBYUx/XTicvN
	4OxD970ec0oS/hDawJSaFzPjXqBG9Td12rfAi7WEZCZWDS7L6MxRlGMG5XUcWy8F9HgbbEP+jmC
	gxzEIyJNoB352Q8QOugwOijrMu6pWCE0CpB/ddfuZNI49s41bZOXWkQnxKWT5Xeg43QWRO616Xk
	y4NOwKhT4MF/oT4IinWmRSx8F6aewouJF7J4h4Q0fUj+M70kZg972YqwNO6pjj36o8f3/JIBOVV
	ncz8B6+s0ziCrhH3/GOUId1c2SGzID7zZjvr2IqfdP79OR9sdqFQVZfHbUFpuY1TxT2owBC/sZu
	baA1aMebDxA/SFk+6FWrj4nQg==
X-Received: by 2002:a05:600c:5020:b0:488:b99b:4177 with SMTP id 5b1f17b1804b1-48e51f48345mr1012855e9.25.1778000343349;
        Tue, 05 May 2026 09:59:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.59.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:59:02 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/23] ghostscript: Pin to C17 std
Date: Tue,  5 May 2026 18:57:35 +0200
Message-ID: <0647201fb4729be3b10b3da2b19645c59147b40a.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236509

The code defines a custom 'bool' type (as an 'int'), which is incompatible
with C23 in which bool is a keyword, and trying to use <stdbool.h> fails
because 'int' and 'bool' are used interchangeably in the code.

Add the flag to CC variable, since CFLAGS is used by both c and c++ compilers
and clang++ is less forgiving when C compiler only option is used on its
cmdline so it complains about -std=gnu17 and bails out.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 49657089ef215824f8f79a81deb7baf4f27d0030)
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index a48ad671c7..57a1098521 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -50,6 +50,8 @@ EXTRA_OECONF:append:mipsarcho32 = " --with-large_color_index=0"
 EXTRA_OECONF:append:armv7a = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 EXTRA_OECONF:append:armv7ve = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 
+CC += "-std=gnu17"
+
 # Uses autoconf but not automake, can't do out-of-tree
 inherit autotools-brokensep pkgconfig
 

