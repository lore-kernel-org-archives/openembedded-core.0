Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034EFC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:27 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2709.1785277336704357967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=O1SkbSAi;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954d29264cso1320635e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277335; x=1785882135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RvDMqt6Vo0CCYf3BY+a/MyIX53jeROmtsYWAxrv91hU=;
        b=O1SkbSAi7tVcZWGhqTI5kClhXElhTGfL6C1GzLJPcdG/E/ZL8lSC1RAW6xWEWWLOnq
         tTLSeGfNlx3Cb/GibUeVXru1q/+esHaCivGyaztPhC8WxslG6BRlU2Qo3urLXWOXNHUS
         QJVzoRg2ib0NosvIAMPwEXy0JXvyFh6jW4XNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277335; x=1785882135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RvDMqt6Vo0CCYf3BY+a/MyIX53jeROmtsYWAxrv91hU=;
        b=XNrWzT6GtFfERAaZxsgGYe+QS4iQ8OP43BGBAfFmMq/74o9pydV0v0D/gMT4z5FUy5
         z0FuoPGI07/XmKmEaQbEmLt0PTRHGBmkWc0WefWRf7mcooLTv/9ZFMPLBM3CN46bd8MI
         vJWxkj2C7xzscDrS5eIqbMHORZpaQjiWRrZYGWBxu8nJ1miuLruVxcazbSHARa0BcL08
         /vxj8nvjCk/V7V8y8DtKdKxT7IsICpQXzmNqwllvEZ+XbVaO1BjY2iNfZxeDUVpEQapm
         ThBXCsw9PSQL9swHDntqAdN++g39zuOoN8RZLAk2r/XwZ5HMbBGrHa+P6lbNOt5dowre
         J8ow==
X-Gm-Message-State: AOJu0Ywrej4epc/cAFzH6GeeCouGxYVlNNgDXFJYu10SAjhdZkGgBUdi
	Q5I9igwL4vlkD8ArmdmXX7qeCvaPGw1R/xdVywrPj5lXs4SJovutVQurNLEtvnTRcuanHk+0KQt
	R3p9jUHE=
X-Gm-Gg: AR+sD11k98kmFCwGnfscHDxqidcGoXiBS7hufjr6x+8lndLF7U8/772BT0PV4P5Qj//
	0OAdGXYNhtFFVHIBUe7jfjmDn3exoJ4jdMWtoVbXDAGsWeqRcIX5rIDH1GqkGqhHwrTs6vCWHnK
	VBALXXzcJHCsn3lBt1wdSQiLnxcZoJZnCKBjHthArUnuY9/lXXPrbU8v8J7zzG4zH0zGVKeVuBK
	AiDZgrmMjoSnPkJBA7EqFUwFDy6vmtwepA0TaP74/NvZLuF0c/g6cuhtNwLJy8EFNuNqB5Xn/m6
	cEqMNBXRTi8x8bsKmSp3p7bzqoZZUyDhWK+VBqXfpJAI7jFirEbtD+OLD+WgFraLN4nzqKuvT3C
	5rxyhvtiyQyjyLm2qmFENP6NHPpZhdy60kmC4nv9EDUKl/VsbskknSCVRUfO0M+NNtJX5+I33qB
	thBa+pmzGgUZIbMO/iUWgreKMjdaOQxYZ+ZbqEhuWHSv//sh9Ik8kLx0ujCQk6Xpj8KPP9115+j
	bH+znVyL7NARSis8O+XIaBo49bkEjrb/1PXgRFVuolQFbx28Jrl+HWUgyjH1aOC
X-Received: by 2002:a05:600c:4f86:b0:496:c933:c276 with SMTP id 5b1f17b1804b1-496c933c2afmr33747345e9.25.1785277334930;
        Tue, 28 Jul 2026 15:22:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/19] openssh: set status for CVE-2026-59998
Date: Wed, 29 Jul 2026 00:21:54 +0200
Message-ID: <543550522f831479f07d332a40ba343c53ae1065.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242222

From: Devansh Patel <devanshp@cisco.com>

Analysis:
- CVE-2026-59998 concerns an undocumented limitation of
  GSSAPIStrictAcceptorCheck in Windows Active Directory
  environments [1].
- Upstream OpenSSH 10.4 only documents the existing behavior and
  provides no code remediation [2].
- The recipe disables Kerberos/GSSAPI by default. Mark the CVE
  not-applicable-config when PACKAGECONFIG lacks kerberos, and
  unpatched when kerberos is enabled.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-59998
[2] https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b79ec926221fbe6fcc296d432

Signed-off-by: Devansh Patel <devanshp@cisco.com>
[YC: See previous version of this patch for context about ignoring vs
this CVE vs patching:
https://patchwork.yoctoproject.org/project/oe-core/patch/20260720175518.3546447-3-devanshp@cisco.com/#40497 ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index ba8aaad9bbb..b48e262c725 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -57,6 +57,7 @@ Red Hat Enterprise Linux 7 and when running in a Kerberos environment"
 CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distributed RHEL binaries."
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
+CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
 
 PAM_SRC_URI = "file://sshd"
 

