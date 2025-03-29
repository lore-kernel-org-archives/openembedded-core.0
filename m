Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFACC3600C
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 15:21:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.12751.1743261707321081284
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 08:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W/fqcFy6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso20064155e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 08:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743261705; x=1743866505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4yqNi8brsHx+G1JijcePFQ3jRKMzpio9uhAjefU/Nhg=;
        b=W/fqcFy6FU77QOFr1J3qYqb7gak+QQ/xy5WAd1OLrT+yrz1scjv2F+K9QW6qc8HOCN
         beRZrpyI5r40XPh+zTO6z2DE5DMMTrpBq91XKO46LhxeEgqHm9Ic1aGEIz1OGVTBilcE
         mmIO80IRchHbfm0/er0GHvRtxKNXQmPbJaqIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743261705; x=1743866505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4yqNi8brsHx+G1JijcePFQ3jRKMzpio9uhAjefU/Nhg=;
        b=K9IdlDuL0uJGaGwdAswDDg0G4Xjv3f/hPp42M1ujWrOOqYe+OCpx58gYv/qn0eZxRw
         5679Goy57fCh8/Q6UnF/5KUracA59gInfepsdBaBT3w5dIxPSG3SOS1hbvt5WKhDujOd
         Mgdr8+h0EKA/lImXRSUYi5u69P+aPGB2WJDkxqcPcYJBaqsIjw0c2en79byIztdTEEs7
         WG272zQGTYZqjOmQg91MUMboTF5VWlSsKY9D7W19wkT4ovY/99PwmydIg5QAXO/TzjIA
         9Lvp7anX/wWhtZ5qOU8BSQaV3H9LEofD2fnnWqr4CCpO2u+WhlHFbEyWPLZbPnKxS7qd
         8fQQ==
X-Gm-Message-State: AOJu0YzmntIWgphxG41GG+Ks86tH4UkaHapjbwHYkYRri/XdzPgTnvjF
	vpRHqR3W6+Wxysd4Wt91XvaAQxEf7qVJh+6acoIya5KGSboRJO8EkRlCrpDiWgjq/9AROxoEW+3
	w
X-Gm-Gg: ASbGnctbe8P3SFUHPpIJH7MGxaGA7lTlUjSQ24GsaOkmSxIg40K3wICKy1syEji6V7A
	EXdGOHgV/cG+xgT7mMSvtlD3wnR3lK3PNV1XvUbf9X4/3ZyuUazFe6BDow6ViLtZVnIPwHyLUKf
	3BvxDBGw1CEoaNoIpKqgfGHeRE7/0JFskpt43nDVJojLY+rPNI8k3MZ1cxtwJAuL15uvhHPOLDQ
	wU2SAggkt2brFSGIaAN3eOBCCIO0rXwvuvUYpMCLRlnltdHsBPRZTdikmj3HCmCI6fjShJ0IyIV
	/MxsKrp18sxEQ6iwfZ9AUpK4BDn/rU+mNjnXwaXAktHl7/B6900x+PYHDcOyHTsu/tHChhc=
X-Google-Smtp-Source: AGHT+IHYvAelQECFcKQF7tm4KI/filRcLFYNsJA1vEO1Wx+2OwQE2raZhQRR8srmAPozktWL4+9+Og==
X-Received: by 2002:a05:600c:1d9d:b0:43d:1bf6:15e1 with SMTP id 5b1f17b1804b1-43db61d894amr32599095e9.1.1743261705078;
        Sat, 29 Mar 2025 08:21:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aa52:226c:d1da:79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8314f5c6sm110738985e9.40.2025.03.29.08.21.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 08:21:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lttng-tools: Update patch status
Date: Sat, 29 Mar 2025 15:21:40 +0000
Message-ID: <20250329152143.1609731-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 15:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213880

A couple of patches were merged upstream, mark as such.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch | 4 ++--
 .../0001-compat-Define-off64_t-as-off_t-on-linux.patch        | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
index 3286dfb5c19..8ddc5883541 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
@@ -24,8 +24,8 @@ environment variable any more.
 Fixes: 3a174400
 ("tests:add check_skip_kernel_test to check root user and lttng kernel modules")
 
-Upstream-Status: Submitted [https://review.lttng.org/c/lttng-tools/+/12155]
-
+Submitted [https://review.lttng.org/c/lttng-tools/+/12155]
+Upstream-Status: Backport [https://github.com/lttng/lttng-tools/commit/78f5b22de60c114c5c83410015a08bdd212edc0b]
 Change-Id: I371e9ba717613e2940186f710cf3cccd35baed6c
 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
 ---
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
index 4e21d1e9f10..25caccdef8f 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
@@ -14,7 +14,8 @@ As such, it is safe to assume off_t is 64-bit wide. This is checked by a
 static_assert to catch any platform where autoconf would let a 32-bit
 off_t slip.
 
-Upstream-Status: Submitted [https://review.lttng.org/c/lttng-tools/+/9268]
+Submitted [https://review.lttng.org/c/lttng-tools/+/9268]
+Upstream-Status: Backport [https://github.com/lttng/lttng-tools/commit/57fd993799a2b081c826f6fc8def32d28d526bfb]
 Reported-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
 Change-Id: If2c6007a8c85bc3f3065002af8a7538b882fb4a8

