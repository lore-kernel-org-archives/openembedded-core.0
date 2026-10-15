Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FE7CC6B3B
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32838.1792040645299275780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FBhUSjdZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so40831595e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040643; x=1792645443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=guC4wuT0x14EZMykszn96l0oupYraMnCG6Fw+jREhaI=;
        b=FBhUSjdZt9cDSYKWUboLPeyFEzRLXd1492np+NXB/9BA+PG/XTfaPgzOHharn3x3cJ
         k53ZVEPR9DEWegq8U12HZmNKxsf6idjVTdTGnlGIp7BfWRFSpXtT4Lj0NZ0DKD6zxOzO
         k2rUVIEydFDLlksOUQfUHAo6dftK8j+1DvjGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040643; x=1792645443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=guC4wuT0x14EZMykszn96l0oupYraMnCG6Fw+jREhaI=;
        b=fGKasUgX2GvXvrFNxDnj/aT995tBUtMSaVQ3s0WvvZhaxgBQgnD+z+sARVRU8JzRt+
         LclCVB76s8HwagZqLKxuu8EDeUD244yujCSf5FuarR3TVIUt2e6Sg4KA3gZFmtpIwxgY
         6TLhnpZkDVaYDuk4q6LqL0kfFhSHXBChG6ywgMb+ALNyR2KWU2nJQxnX9TKf1P9to3fS
         CgjZcha0LFRqgGLlVbymqkrpv9cUOlTKOsJaEDmVCcz08M/MT1aurqg4ZVnCi/bYkk66
         49wRjKYz848w3+S4NhQG1jwmj4RY+e3zPj06zpskbqHpGBcVXZlfm6k8R2Ls1PObbkS8
         FkLw==
X-Gm-Message-State: AFq9FYLw1u+M1QF8wrdEgi96WcGInD4pDnsvfUtoXXowQFBs3PNnGEQP
	xSIcliDGlNjjg1Z7SGecNfw27WfujuOoA9e3ldp0y7mwGjPHgkLQlN0dLeJdseNy3tvsUDI+THM
	sggiW4ns=
X-Gm-Gg: AYBFou2iM/WgnnLTQIbbJIPhm1wY6BT0sHyxT+27799SKny/8/vbk8IFGzPHhRrxOtu
	SfdOTnNfX4oC4xQ/BhNHcBBnTC/zmM1OBeEgVqPDU6T0V++CVOv1yQsWK+bw6QlxLjlyVkZa9IP
	EtmTjK6XH1VHUiiBn5CNkcVp04humBXqhO8ToUDfNYPIscJtRrqQsW1RQiBcJ2a38YDYchVUb7s
	LPVJecdIlhYDclxnkogpJxRZIMpBa3kXPJTKHXqNeTOwfaLL0bfzwzYnF727vsYZbxWyIucSwFH
	hiin2OKhR0UOoEe3JinRA2wksqSsbtZAirRSVmcQj4HCrqFjXqA0si1sHPXaqzh5i+X7sAqzhhD
	QAl5XcbuksYkIxsevVyxxtw6l+AbG5/sqZI0g4uLs6Xw1K5mmKpIZl0tsXCnvpjpZ7OTgYWTul3
	ifNsiPTis8OKypHfxVgPInBW32z7uDZMYzUncAcWDreBzwEuGRfMSrdY/KasiBWwUCtnFfrcUFV
	wJArgNr4xplmGEkEO8qcJ3loR06g5962n8IrnLgD18f3+BPG5sMdMeKHZkMmwXdBLlSSZjQNtCa
	QaNujZ7s
X-Received: by 2002:a05:600c:8519:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-4a18e4a16femr341636625e9.10.1792040642002;
        Wed, 14 Oct 2026 22:04:02 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 37/55] openssh: set status for CVE-2026-55653
Date: Thu, 15 Oct 2026 07:03:00 +0200
Message-ID: <8c6f092cd98deb49db7c6ee8db18a3c679705786.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247835

From: Peter Marko <peter.marko@siemens.com>

Per [1] "Only an issue with FIPS patch which is not in Debian/upstream".

[1] https://security-tracker.debian.org/tracker/CVE-2026-55653

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: aabb2b44eba6cbf658eec7850e1ca3a806e0ad9a)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 572a614380d..06d28d8a40a 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -61,6 +61,7 @@ CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distr
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
+CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
 
 PAM_SRC_URI = "file://sshd"
 

