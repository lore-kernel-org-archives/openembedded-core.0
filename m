Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B005CD37B6
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:29 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8159.1778224339611942826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cx7q9kqz;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b150559bso12670125e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224338; x=1778829138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/kHa/Mi5DBZ1pp+SAt+xhR2nMDD0M0OqaNRWTgfYdE=;
        b=cx7q9kqzHZ2ve2pr1gc9KI0L5eopQfH1CneazgqYhM+ZCp6qcKcm6mTOhAFdrf5SMZ
         O03vbKQ3H3Y3zIgRZp4VHyHFLq3h4pVa1lgVvqKNmqeaS50QYHB2nk1O2bTNy+eqviJ7
         hsCnm6ST4yaWva0EYzoU7qKpauGTDr+hj1SMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224338; x=1778829138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u/kHa/Mi5DBZ1pp+SAt+xhR2nMDD0M0OqaNRWTgfYdE=;
        b=J+8a9RqwntamvzqrlOXtxZ14C2hu0eiaOCq8urgCfc+AnyCPADiyq/FAlvBlPY4GlM
         fZ7RBoAhy1dMSFMClKVzuRRE5ddvX2uEiv6gLcu1lIqelQZHaQY3ElYkRwJ3sZSwLkuw
         moDIT3DspslG6+/ebgufzl/TSbK1NrScwhU9DryDbljBnKEPGne8bmaP3z2GujwZ6RC4
         m0ftKnq1dTBLylpYJQMexK/sVJy720Jdhejvk0zKkflSyCUgl4IetZ+PHXV0JuYL5mao
         acLlG3PUHDcqeunv64YL9MXxiuU7/AeVaJLe9xhgwTp7JJk3s9VHEc/udGbbMyM93Djk
         Podg==
X-Gm-Message-State: AOJu0YykwUsrQBq7vE85e3g9VfhfMOcpqE+LsPKgdgW37A/PKgke01Po
	GJxhgd6iVlpahkRwElBkC1+fsl0AULXY44QroxlMhBY5psmbbzxq/KqKw9pvvs/GMaQEvlstbI4
	UrkTxUMI=
X-Gm-Gg: AeBDieulensuuhwFztqQ047DJRedfhkrqjexMN1NBe/THSES55lIBtgXBOi3Ata0dEp
	K+nUN2C76zae1Jd6vBP4byALnmrS94rY3ZggaybIN/e1ownp9LcezJuHUy7KLoi9hBXjGaksDoN
	Ku4jNXu11OnhSjZIEKZuKBziV0zgV1F3v3WgfCtTXE0YEB2QvR1Uflb/tm61GKqkYuuzlI7LosO
	gumcJ444J8yD7OXXQs7VuR/hK86L2rzxCCGmpPI+d/cKJTQZAMijqsaBH45DdL2w9m+0+ODlRFX
	s5+Wfz9rzdN3/3DJ9v7MX+b9L4xJWMj8aTVQNtdIz5OXKb9KhGC5uwnIYwCJId03TZFMcRrIalV
	ocw7YR9H81J50OxVg3AIO8GE8A6rFe6+MoaUd1KZYtM1oVmO7uLZUbN2MiIIRgARQ8EKAKb6dkK
	+bA0eg87sXZT3n7cmBaZ3aWu3tkggaGnhiNb0WOysWPLXFC03rpW3MCWc0e4GqkkDMGH236HHOW
	JuHO4D8jKUQED3k0mJfeYan6BM=
X-Received: by 2002:a05:600c:a110:b0:48a:5c23:cab with SMTP id 5b1f17b1804b1-48e51f3c363mr139109625e9.19.1778224337642;
        Fri, 08 May 2026 00:12:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/52] python3-requests: set status for CVE-2024-35195
Date: Fri,  8 May 2026 09:11:05 +0200
Message-ID: <8e6c1d6aa752e5064b7ea8e3818ddcf52a735458.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236654

From: Peter Marko <peter.marko@siemens.com>

NVD [1] does not have CPE set.
Debian [2] shows comit from v2.32.0 as fix.

cvelistV5 [3] also says "< 2.32.0", posibly "defaultStatus": "unknown"
is causing it to appear in CVE metrics...

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-35195
[2] https://security-tracker.debian.org/tracker/CVE-2024-35195
[3] https://github.com/CVEProject/cvelistV5/blob/main/cves/2024/35xxx/CVE-2024-35195.json

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7cef5ee0b5ce16c7dfbb836c95f41a0b7c5a82eb)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-requests_2.32.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.5.bb b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
index 0eb9765b633..afcf1a99b36 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
@@ -32,3 +32,5 @@ FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/pyth
 CVE_PRODUCT = "requests"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2024-35195] = "fixed-version: fixed since 2.32.0"

