Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F55CC6B3F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:14 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32839.1792040646209823983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d+At2Y36;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48de72fc832so896150f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040644; x=1792645444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5PNZWwOQrCKU9n6Hh+EboSqLWRLZrsBp7aHVnQiKy2g=;
        b=d+At2Y36FWfsJikvvavDeRWM+GOTUf3BHewtf10BFipR3rw7MPRe0oAnaM/ebfzVtd
         IrLHxk3VCmWus4bsYTuRYFGSdgc+7THzkACYBpb8htaTD6bUMR6+EVbKNhVrqeElj08W
         NprCeJpFVXNS3+tgbNGtE5Ensraun5iH9A7+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040644; x=1792645444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5PNZWwOQrCKU9n6Hh+EboSqLWRLZrsBp7aHVnQiKy2g=;
        b=RufMeViyPtHuEsyMnhuDZs8i3W7zfcq7xuG9QEreXW2ROkTNHAPXlbm0z+OfcRRRTf
         EDk4MtXM+OCPd8XEm+7BOdDjuB5/zmSPzToM1r8g0MQ5gkN5KAkGnmxmd9GL3IAJC7CR
         X+kzYVWbeodXyrYBAeGXuTQj75rMAq5G7N2zyp2Lw6cVN+Sihxdt6wqHluFvfiXJ7DJr
         ZycnaYrBV8LELgUvLaSNgQpCEtn7nVGtUEVbXzWPYvi9chMCgy40m2KiULu9koec+Ol0
         9E8ACD9a5dvuxvcmz1hVxWuABB+6E4m0M8w1RYfCPco2fpPIc2a8/sWmvPOj3b5bOhLi
         K3Vg==
X-Gm-Message-State: AFq9FYIF1TaoAosuO5vb0B2vT4qpl7YAz3IxqWqimWowhriJQjL8Vpmd
	463gRcN0MZYUOTrSKC4MVinb/K4U1RBYbfJ4lkR0Ugki4vFhq7bUUCqx2usdbeMK5JpVS24OCDE
	CEWNuSaE=
X-Gm-Gg: AYBFou3byxuY2Hh0+gL9p3oDi+vdH6kpyncz35HcuDgmSEFWlbgQ4CmXDEh4sLnXz77
	9v90R8uwQJM51QuRYoo+Pr+hXEiyrVe5fseLmopsDs3SEGX433V+pndBS5uu/CGzYfCCXy+0IAP
	MU//uP1Fh9a1Lbm0kDNTVGPuk0UTBIg1K+nAgCtbtHs1m5JCK42hlxzU0dXpR/nizVqeKaJw6H7
	5N0hbhJgigkalzfJBiZ+1StRbqtguc3C2Ger5usCLuMVCDFtZmTNutqZN9O1OmxynTljX/ePQox
	MxuSuJcQdvsntQCXabnyxGSMFu0vJrsuTbpU8wyUEj0PkXmpaLnZaDeLnvw7vhY2n9GjZbOqraZ
	QbYdFjTk7CpAR17oWVm480Qs6uDOlrFxVXNEL2H+UoQe60CKfvkaNJxUVt+l8rl2dJegD4aAsej
	s7d7N7J+ln+6vJilCJSig2XvSvfZjeMVDX6wU8rvQ+uoigKtyhu8Bqftq9cKogzOAnopV+lU9Yk
	ZkqtF+PHumM/QwOLSRSCTg9ZqxuySBiI1ekX4FXChXQOUL5WrAHhmaWfe1wtQ2CBtdCsKZ2gA==
X-Received: by 2002:a05:600c:3b2a:b0:4a0:2540:b46 with SMTP id 5b1f17b1804b1-4a18e4aca94mr331666905e9.12.1792040644346;
        Wed, 14 Oct 2026 22:04:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 38/55] openssh: set status for CVE-2026-55655
Date: Thu, 15 Oct 2026 07:03:01 +0200
Message-ID: <fc47c0cfda2cf43c7317ce7a4d84fbbbc12ba22c.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247836

From: Peter Marko <peter.marko@siemens.com>

Per [1] and [2] this this is only problem in RedHet patches.

[1] https://security-tracker.debian.org/tracker/CVE-2026-55655
[2] https://ubuntu.com/security/CVE-2026-55655

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 9ea8649149e711668b85c7e35cb7c259437e8c0e)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 06d28d8a40a..3c74e3ef4c2 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -62,6 +62,7 @@ CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
 CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
+CVE_STATUS[CVE-2026-55655] = "not-applicable-platform: Only applies to RHEL patches."
 
 PAM_SRC_URI = "file://sshd"
 

