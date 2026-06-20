Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA550CDB475
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:15 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5948.1781960413525840748
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xHRiiJGx;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so31206445e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960412; x=1782565212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8kAyLo2awYZ64tUJWaMVBK7qNmNvOsd7udpYMvw41Y=;
        b=xHRiiJGxx+nXw4kSH2gqiUe0s2MCKrhly3ulfEyfCRhTk0zgSdoWmmOim1WWpW4++U
         OfGbse7KiLoT3z7S1HtwLOzwlUbJMyH72SIQrzYJdNAyvaAYn+8FFkF+tPCJWNgzbiLn
         9V33ZtNEDU9kfTUF2tkOIUi8FhSYgOlCS0G60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960412; x=1782565212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B8kAyLo2awYZ64tUJWaMVBK7qNmNvOsd7udpYMvw41Y=;
        b=scZc68EhmFmU9BuNm+T1q9aUNWEOC+XIgVKKbtu7sv9yeL7i//7c8WZXGMyJDBgiLD
         OSFgVMr/gLYKtrQwRjU3vT4AOrfaxdpcixxK1C1s2rQnEjSYyPkwfLpAtMpIxNzJ980d
         GjSfc5U5tj2QW2EbjMJhlaweQ/sb4v5XQCAQblm1UJt3DIZrshO5kz/TLV+ufUl+2Rbl
         9qzjZAyehlc0RnPimDRELaRenEL+JMu4van9GEYDrNIvKZwY9UdEU77ivFyjRMhmBd6A
         LtNkYpaCRBiAycML/iy1CfXKs9AG/5zKWKmJU28H6dT2PkVRyb0WCXjyu+RNx48TyfvZ
         D6jA==
X-Gm-Message-State: AOJu0Yw0alP5Gsv6xnuckr6sLhPxjUHi6m13+NqnELss+42mKkNXB/x5
	HqOsKcRd3tI0260L2mLJMtz3Y7bjG94prswaLKAKMhRCt9RCtz/f60EuOq1GIc7+QsCAFi/Fuo4
	D4y6Y
X-Gm-Gg: AfdE7ckDEADP3JZpzvVIuGcSRLQTLcwBJAhmRwp9VxhrKD0D+mQeQC95JK2PTPjhfuy
	4C7B2E5obrKaPsAhTlPldDbEo1XuxsE2WJdJRYMjxaWJkA7KPikEXQ/gVR2+YXiqEcWANA0Lqem
	Z/dqpd+gCki6iNHHxwXhOpELxRtLce/jjsWAFz4FXZiZY+e8b3/Spsg2bJryctkYuuG7qp3Obsg
	0tJvIeSHudJarRrTp2lJgH5DpBP8Sj3ZmJc2IYMAlExIGL8wBZdI5dGLmcS+BZ9sn3Pz7Ciy4hS
	ThRE6tt+bsNmYEUicDoF6XVRUOg+P4luG42Uz4jY2xQ2IjiHlLmACEdzGJtSVKcSMJyPo7pVcVL
	R4IVkl+iN0wMhGe5txi7VuwlZJ4sMYbdoi3+3YwVQABFp0AxXMCcZemw/2gTPUnu7TOx46zy9Un
	EGnXQ6Gm5MOMfm6kTUCiA6rYeZ6k4PQZIqUr6+Cv1gMxlGb/BO9JF2a1LtKVeBCCCzulfHGvNPI
	UfEy0pdxfRAXTb5
X-Received: by 2002:a05:600c:c4b7:b0:492:418b:b5e1 with SMTP id 5b1f17b1804b1-49242591d68mr90503585e9.37.1781960411559;
        Sat, 20 Jun 2026 06:00:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/36] binutils: Upgrade to 2.46.1 release
Date: Sat, 20 Jun 2026 14:59:22 +0200
Message-ID: <7ede58c238bd8f150f1966bff16727fab6cea014.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239216

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

This release contains bug fixes for:
* PR34028
* PR34088
* PR34125

Release notes: https://lists.gnu.org/archive/html/info-gnu/2026-06/msg00003.html

git log --oneline 49d4d3fafa4ec4ff5a3460d91d5b1ed5286487db..5e56594815854de5eca35c7c04b11705d0f19c02

5e565948158 This is the 2.46.1 release
a195046618e gprof: fix testsuite with older glibc
4bcbe5932ae sim: fix a few -Wdiscarded-qualifiers errors
66bf5c4dd9a Fix even more -Wdiscarded-qualifers issues
3e4fd1a57ec bfd: fix 2 more -Wdiscarded-qualifiers errors
e7b4e8eb10a check sframe version in _bfd_elf_parse_sframe
e6336a0b1c4 Correct calls to sframe_encoder_free
09a510d7e3f Correct calls to sframe_decoder_free
1f5796eedaf Fix discarded-qualifiers problems in ldlang.c
1d74be61a50 ld: Fix calls to strchr that discard or use wrong const qualifiers
922d530f0aa binutils: fix C23 -Wdiscarded-qualifiers errors
b88558ce1a1 Fix the strrchr error for DOS based filesystem
36ced277bcc gprof: Fix strchr discarded qualifier call
c27aa8783da ld: Limit PR ld/34088 test to Linux/x86-64 and Linux/aarch64
2cd5360f35a ld: Maintain the input file order
155188ea10a x86: refine special casing of insns with MSR as immediate

Testing Results:

1) qemux86-64
+-------------------------------+--------+--------+------+
| Metric                        | Before | After  | Diff |
+-------------------------------+--------+--------+------+
| Expected passes               | 327    | 327    | 0    |
| Untested testcases            | 5      | 5      | 0    |
| Unsupported tests             | 9      | 9      | 0    |
+-------------------------------+--------+--------+------+

2) qemuarm64
+-------------------------------+--------+--------+------+
| Metric                        | Before | After  | Diff |
+-------------------------------+--------+--------+------+
| Expected passes               | 267    | 267    | 0    |
| Expected failures             | 1      | 1      | 0    |
| Untested testcases            | 1      | 1      | 0    |
| Unsupported tests             | 11     | 11     | 0    |
+-------------------------------+--------+--------+------+

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/binutils/binutils-2.46.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
index 4948e9b5769..13d2a02108a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "\
 
 # When upgrading to next major release, ensure that there is no trailing .0, so
 # that upstream version check can work correctly.
-PV = "2.46"
-CVE_VERSION = "2.46"
+PV = "2.46.1"
+CVE_VERSION = "2.46.1"
 SRCBRANCH ?= "binutils-2_46-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
@@ -23,7 +23,7 @@ CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release co
 CVE_STATUS[CVE-2025-69649] = "fixed-version: Fixed from version 2.46"
 CVE_STATUS[CVE-2025-69652] = "fixed-version: Fixed from version 2.46"
 
-SRCREV ?= "49d4d3fafa4ec4ff5a3460d91d5b1ed5286487db"
+SRCREV ?= "5e56594815854de5eca35c7c04b11705d0f19c02"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \

