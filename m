Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC1ECC6B3E
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:14 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32449.1792040646589126224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0cAOmY0n;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a02718da81so38470285e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040645; x=1792645445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DzBfJhzV12qzBJNcaQXx4J70RNRhN7KKoyzLtvNtC0o=;
        b=0cAOmY0nepr5GVs4eKg+moWmtt8R2ff4LTilbi+Y6qz5C/nR+wNt+hUFKuhdP6hlAo
         Aqxs6WLeoZWJU97LMdWUDpwj8oxH6tCMo1JfDc9BFa7OP1V2yDQnnL/u1+Fz2KmoOps0
         rl1sWV29HM6Tpypuda5TIxRWVi2CmPnNtBqCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040645; x=1792645445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DzBfJhzV12qzBJNcaQXx4J70RNRhN7KKoyzLtvNtC0o=;
        b=bVP0tq4/40l9157KDuWQHpL6PRqVMTLnlXkJesUTBOV6+4BU4GIB33Goz5Afvnd8BO
         0Edt76xJpWXxKR8w6XJ9juOcnMC7GagV7TBzbMoE53Qwd5/ON6s0PEEw3LgOnDd7tdv1
         5xvevo1tHhsX83glNOwjztlNM1dK+uGTl1pnfkGqVAogxtpT4WMRZPGYv90JFKPBNUkU
         WEMiu42ubbyUzlMbrZO78BiFLR/flw68ijPe+qTW4P1pE5XecT91bTfj1/KMeNoAf9UM
         SJNbDliKUGupMb7pKmiW5HJe6WvTx3CE7X7dbzQ927GXfuNqCerch3Vt8O+59xPU9zGB
         tyBQ==
X-Gm-Message-State: AFq9FYKmbURXYzzOibTQmNhawSZXCiUZwjtLmOCYoHDimxGvJcR71/5j
	HhoXyd+c6CqBw5Mn4Ila2sUZemhI17lTbgm3ZldfdP7zfsycpQl8Xx1LwnfXqIT7Dc24Sj/pV2R
	zap527u4=
X-Gm-Gg: AYBFou3Axqx9xPJd1n6ByZTnOy8IAgOfNge0vhuLnCry3snEubqYAebpbK6ntZQm3rB
	bzkssUUum9BCxenrxQmgH/GKKjTEJgvgE4z0Y7MIO//XXQ/4anf4hk0VAdQmX2zfH/eJcXwuy9x
	ztToEy9AVusFqWmUPmHWrIF91GtAAT8svvqxfjglpePkBzIVFnJtAPkGpkdV314bncKb2S/A5EB
	RDACDy3i4OKypDLBEVZNtI7EO97QSRgqRdRuSvf/Y3NnQaBO3OQUoIFib5u8dL2tKf9sZXp1jaB
	HBbQbbTlzAkmij8YYnno15tqWndV4922zq95Cn4KVWJl6ehhbGnQ2sMCPiRqPTBQTI2+D+z1faF
	0iBu3dRFYmUKmXMQqNAOo+8j3vZxjhAvQdMabOuyYDgpYTwDaUBqbz5GPLZHciZounWloxKu0M+
	mxXrYt12yGBOBDkAf5XjZCrIvTbg0o6F/tey3AK30n84HcfeOxXFq16t10K4bhKLGcKdyRjGPdd
	+pKM0+9o2HLDEWBnVUxZc3iZYybu6flGMWSKPcPaMlhl4lcm7t7auqKEJnhdzIV8nybo2zdgg==
X-Received: by 2002:a05:600c:548e:b0:49f:f9d1:e618 with SMTP id 5b1f17b1804b1-4a18e4aa057mr361590205e9.17.1792040644846;
        Wed, 14 Oct 2026 22:04:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 39/55] openssh: set status for CVE-2026-55654
Date: Thu, 15 Oct 2026 07:03:02 +0200
Message-ID: <31ef209e08556e37ca3706da4508c66a60b5e94e.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247837

From: Peter Marko <peter.marko@siemens.com>

Per desctiption in [1] (which is different than description in [2]),
this is RedHat patches.
Also [3] suggests this.

[1] https://github.com/CVEProject/cvelistV5/blob/main/cves/2026/55xxx/CVE-2026-55654.json
[2] https://security-tracker.debian.org/tracker/CVE-2026-55654
[3] https://ubuntu.com/security/CVE-2026-55654

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 389919ea7927962a61a5aaa7b641c5b60af560e0)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 3c74e3ef4c2..6c8138ddd8a 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -62,6 +62,7 @@ CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
 CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
+CVE_STATUS[CVE-2026-55654] = "not-applicable-platform: Only applies to RHEL patches."
 CVE_STATUS[CVE-2026-55655] = "not-applicable-platform: Only applies to RHEL patches."
 
 PAM_SRC_URI = "file://sshd"

