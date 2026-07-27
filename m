Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CD2C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:30 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43806.1785192988826720393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qWPrHkfD;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso22037555e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192987; x=1785797787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JZv3fIQ6X3aaQ5JyI9oMn4ebZH+CE+tRB2J5FCShdJ8=;
        b=qWPrHkfDoeXmKxk/nRMkg7pUq5lMKP0fvpK94Pfdz7AJyFprIJDOgQgOr2ZS+b97XL
         61Bcei5PZ/Q+IDPH/BhvzCiwgT3yyzwQBG7R+PE/dp9BIznemOp9kiqAocf3JA2ZW8wp
         xwpmB19YkMo34uJdmuUV5feuy5J3kU+f4DTyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192987; x=1785797787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JZv3fIQ6X3aaQ5JyI9oMn4ebZH+CE+tRB2J5FCShdJ8=;
        b=fIf/8OEoi6A4en5P97BSay14RIMWJcDuTxThckmh+irFEPM61fT02EG7YnL9UeOf6W
         1iqY2VydCxEmXCnmCZqKxOy9RH5z4kScfvMkfEsu66Y1xN3HuSjR8abI+d/cOE2sUjDC
         dMRMeQyFV1UlRTdCNPgZzhgycF5O+3wQ8Vzh7Uflf2WvEN8iY+2b8cf8tCy5YBupdlU/
         FxfRmQirpDy3ZWaKvJoLn//XoG6VhW6Z0wY7VcPmAQxQeTC3U9Ukdq4OEvI+O0rXAhl6
         KrGc0SDmY3SzdK0m7vB/aesBRR7ySG++sHicGJ7yyULR7VQ/qTS/VRD5ZvCnQRMUnJXa
         D4mQ==
X-Gm-Message-State: AOJu0YxMTJvsa42lKFLS3P2TnUa1uJ/qiz/1jSi8Hl0siv6ShWUNWMZT
	LfWmSP3xJgYI4yoQdLgkBWLVwfLYGyCGUKNDyydXHgfn3fhY1YO0zoNOCoFaiDF+M9D4mSN0R2i
	wBtKb0Ng=
X-Gm-Gg: AR+sD13baCJWK8Jl4jLY4bO8Y7JIbyccYUQsKuTe8L95Iiav9DGdKYVQolJLoedxXOm
	iU5ZMGdJbB4vV3pYfNYrGOHLco23mEGyZvIzO0oZfq1+9G71pGKWRwx3WfJ/qJTrHQYE2qB2bf5
	Sve0zo2mbBzoyRIvjvfNETLkKmfJEgr+HRBpq1ivSFrLDPF9DE0pXziMZ65VYPEfm33YmXWrwhs
	7O2GrjJsww8/Jf8sweq0xwio+DEDRE+r/MthvaY/cUmIW5rbiH6zrLe9/Z5Jbr32jPNcwsdiYS7
	9tJFijpAB1a9US2z5wzP5Vmocu0TjLDosXLypsacWjeR8jqbpEDZvBAU2pAOu3WT4kKjgo8I0t8
	12hd67Ykueojxc15U1j7z7eRtuZjChPJFjsMeGDvJbN/2MJvX9DXjHeHSiNAWr3J+X1/D9otbWm
	/p4yP8rQjHXhZR43OFBsd3zJjbkg3uPlPPXZLnNvWTXrRKVJahgIX5/uJZrhzjvvbF/q27p+C9f
	Av4eg==
X-Received: by 2002:a05:600c:2192:b0:493:b56b:c45c with SMTP id 5b1f17b1804b1-496c4fd94ebmr6385555e9.30.1785192987016;
        Mon, 27 Jul 2026 15:56:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 18/36] openssh: set status for CVE-2026-59998
Date: Tue, 28 Jul 2026 00:55:32 +0200
Message-ID: <5bdde909a864cb73f795224ee5f06c5c89dab85b.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242135

From: Devansh Patel <devanshp@cisco.com>

Analysis:
- CVE-2026-59998 concerns an undocumented limitation of
  GSSAPIStrictAcceptorCheck in Windows Active Directory environments [1].
- Upstream OpenSSH 10.4 only documents the existing behavior and provides no
  code remediation [2].
- The recipe disables Kerberos/GSSAPI by default. Mark the CVE
  not-applicable-config when PACKAGECONFIG lacks kerberos, and unpatched when
  kerberos is enabled.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-59998
[2] https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b79ec926221fbe6fcc296d432

Signed-off-by: Devansh Patel <devanshp@cisco.com>
[YC: See previous version of this patch for context about ignoring vs
this CVE vs patching:
https://patchwork.yoctoproject.org/project/oe-core/patch/20260720175518.3546447-3-devanshp@cisco.com/#40497 ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index f5184b1fce3..b13488e2652 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -44,6 +44,7 @@ Red Hat Enterprise Linux 7 and when running in a Kerberos environment"
 CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distributed RHEL binaries."
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
+CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
 
 PAM_SRC_URI = "file://sshd"
 

