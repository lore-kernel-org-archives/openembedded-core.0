Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B891DC4453F
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:21 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5471.1784741052214063493
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mvP5HjLz;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49558ce01afso32091135e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741050; x=1785345850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5iHMV6z+cX0dECL8KCeDCsatkSxLzMJHYGqcPuJJsZ0=;
        b=mvP5HjLzieovt7EYZmS5N/u+jzcNQYakQRNMK8pqf5Szu3t/jKoQ+TZSSI3+0m7hmv
         KbCfPfQ/AFrgGSvTmlEDTTVWf0rSsWLizFx/2s0nWhYLDvKSZVCTVF8712ubDHSC4sVu
         PNPm65AkmV9NZpHFpkPlkPqvscRE/eQfI4DWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741050; x=1785345850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5iHMV6z+cX0dECL8KCeDCsatkSxLzMJHYGqcPuJJsZ0=;
        b=Vg1aa6/1t0b1jq+pI+d63qDW3/1fAiBAcTB2pkKMZiTOUfT3zRG12o1sXweuNrfCTH
         KQKr3jiF6AJ3tWyaWHncvxzdt1ThwXLvobp3fln4a0Cm+248BTumQyHxhL90jf2OpaSM
         H1gQ6TvNjoJx68LVZSiZ2kPXybYWKw1XxJ1GlCxmx17YVslcrDKot9IiKUBnIuZBnQhx
         lOYI82muSET5nVK7eh2+IP4nkLtnet0/hY7IOOnxT/uyCLnfcfsftralSoXTuPX8PIVh
         A8NNZoEgcXANZriwtgm/9OpnkjNxJ7wbS9HyCA18MkQx7pnme2Y5r2Ax6fMbDXrHQcTj
         7zGw==
X-Gm-Message-State: AOJu0YzkJSwxawd+j0LN+n8emyMkGDIvIxpg86K4C7ly2JXmExQZpImn
	ObsE/S6iId8gv3Vc3WCu8pkdcpKrTxi1xszyECqmgGp9CtlvxkbADm303WwO69su/1kYUg3l6Uv
	VNbBMIkA=
X-Gm-Gg: AR+sD10gta1W3cNscyUh8hRH0sqM/IOJXn8T0cNLjVD/KAvkliu2Hm+SU126YGnVxFH
	FPIYIvXuhZRvNGgVOB8PL0LMKqZrZapOLWZISDbn5NS9BZzhwnOHtuwikErhMF12HKXaj1Rqtqi
	2kRimoRP2tWn52IVS72MfeyLChUS+Ix2H8/1TBI4HiGbGXoZ53cuTesb8vDjQdKxXv5z+ZPhKuH
	KfmAMcOhXG3xidMHfBeejXgIJQ+a60S1Nta5bSRiXreNzSn74ML/HUzA7U27L6G90uZnoQ8o/0g
	Q7qxJf/6Xz3d29RIncIsBzzUfn5lalpkIZMnUePK4sLjf98NkZdxWU3DRxEJtYCZwZB12yXdMsz
	mMPoSi3MMHI9HbcyREWvkdA13wGDrBoRze7GpdWTcne8mV4eOEFTJUF+2d3Cn0AFCr7Ul9X9qX9
	7TnLKz2LzrAbJ0IVqS9A0lLuBw+vghf1CNB/6Mx7oY2oB71STf4l0zHrt87majqH/BgqZonKAKW
	RBROvfc9njRPYKQjToizf8=
X-Received: by 2002:a05:600c:1384:b0:495:6840:9728 with SMTP id 5b1f17b1804b1-49568409783mr89783905e9.38.1784741050394;
        Wed, 22 Jul 2026 10:24:10 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 22/27] openssh: Fix CVE-2026-59996
Date: Wed, 22 Jul 2026 19:23:35 +0200
Message-ID: <4c87dbf8523cfd8dd603e77ed2dc1c4b2c9dfde1.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241732

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4p1 backport for
CVE-2026-59996. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/36480181fa22f98e180b4f9e10203480c0346c78
[2] https://www.cve.org/CVERecord?id=CVE-2026-59996

Signed-off-by: Devansh Patel <devanshp@cisco.com>
[YC: patch referenced in https://ubuntu.com/security/CVE-2026-59996]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-59996.patch      | 39 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch
new file mode 100644
index 00000000000..9db9988690b
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch
@@ -0,0 +1,39 @@
+From f479595f7498e8c83d3df9d3eddb6e555497ff5b Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Sun, 28 Jun 2026 23:47:16 +0000
+Subject: [PATCH] upstream: resist that return ".." via remote glob during
+
+remote/remote copies, similar to fixes for bz3871 for remote/local copies.
+From Swival scanner
+
+OpenBSD-Commit-ID: c0c20a1b746db55c08e53658bf21ea9405b300a5
+
+CVE: CVE-2026-59996
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/36480181fa22f98e180b4f9e10203480c0346c78]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision-only hunk in scp.c and retained
+  the Wrynose OpenSSH 10.3p1 revision because this stable backport carries
+  only the functional security change.
+
+(cherry picked from commit 36480181fa22f98e180b4f9e10203480c0346c78)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ scp.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/scp.c b/scp.c
+index 1faa9a555..bd01ebffd 100644
+--- a/scp.c
++++ b/scp.c
+@@ -2039,6 +2039,10 @@ throughlocal_sftp(struct sftp_conn *from, struct sftp_conn *to,
+ 			goto out;
+ 		}
+ 
++		/* Special handling for source of '..' */
++		if (strcmp(filename, "..") == 0)
++			filename = "."; /* Download to dest, not dest/.. */
++
+ 		if (targetisdir)
+ 			abs_dst = sftp_path_append(target, filename);
+ 		else
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index e611db65ff8..0f4839f7675 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://CVE-2026-59999.patch \
            file://CVE-2026-59997.patch \
+           file://CVE-2026-59996.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 

