Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A12EC61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 16:43:20 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.883.1788280991902528596
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 09:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=IULvyqKn;
 dkim=pass header.i=@valla.it header.s=default header.b=riVq+VJJ;
 spf=pass (domain: valla.it, ip: 185.56.87.5, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-8j3v.prod.antispam.mailspamprotection.com; s=arckey; t=1788280992;
	 b=k1oHay4vqOJhYFgoAzd+kAlR5WE+5tlQmI3/Fz1eb6EELuCuxnVsuU+alv5eISfHRyecRne678
	  /RB9dVLrE4To4Euhe5yCpKRZJPd39jZeFU+HiJPKcgnxIGXegnIEutzilW7PMhq+HNjhgujru6
	  iaxXieEh5Jw+seIyGRTptfVv4EeAwjWEnxzrWxKOmL9l6PxL21522vUSFlzMYVJNNrDXd7RE3m
	  zFQpfUmadK5E8sqtbiOLdTsps5HgFRX9SWmylegZFKR2ZSygppK809Kgfm5l5WHapRMx9uQmh2
	  hpRXRWCiei2FVO/LqknZDf43C1z2Pc9SmFS/TyuFjwShEA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-8j3v.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-8j3v.prod.antispam.mailspamprotection.com; s=arckey; t=1788280992;
	bh=8IG1oSIbxOK1hVOPx2gilJpohwg4d8JBPl6orDZkw0M=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=tgh03BXCk2SrAccoM+7hwJY17l4F/YZfbz5EZDnY4nrFBkRLd90iGO+FWUqbgCsrHkJLcx3D7B
	  gQJv+YgHocZIURwpe7tPp3TA2co0nHpQ3rtnPD+RVA2+1Jc2LrlXJfdQ+cRWif1+tJYuUs/gF4
	  f1oJ0u7j8Il4i33VUVT6DZHqiQZDR7qGTJWuLrm6JxqJl8J15SJ+4nlhwmv0xjP4FI7V5vt7yz
	  Tl/PfwjQz4KwhMTM7ZDBMhhT0722bKPwLXvzPM8KmMGKQi8dQJxcY/GXngVRtKLyuA4gVxP5eH
	  MMRKQ5l3Mm3kpgrHw6mY2TeSvIiq34PtZUsMt5gyXGT9nQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=8vIHfBPlFzSVsojgAySk6ZT5CKdNrMHqXm3X/1M1OKQ=; b=IULvyqKnHPzvjkYuXYZktWg16q
	AHBFAaApc869thn/MYx3e42wpEdjljM4qWQFeCG+Ar6TCcMgCggto7i0mcye5bqBHkhfKAqp42Nr+
	afF+zjDlc+wVhYAN9QJq7+Zez8VWe7WHKdKqdMkiI1dx82+6s0+sUX2Z8ekRcxK4a+oc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-8j3v.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x1RZj-0000000CwkK-3qpD
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Sep 2026 16:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=8vIHfBPlFzSVsojgAySk6ZT5CKdNrMHqXm3X/1M1OKQ=; b=riVq+VJJfeBik7nNNB7U0st9ef
	4RiHXoLSZGNy/avg6xn5w1CgnBa7rRyR1W8Eq7nVdQtY2NJ50OIBEo2k6QYIVOEHO+7vHo6JXCuzo
	QhqXlmyfQ5Cyc5kG/FAlirpHo5XE/2wj7df9WMAHEZ3lML0MMKtkk+IR17SHpavPAwF0=;
Received: from [87.5.139.196] (port=64545 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x1RZf-00000000NKz-1BjM;
	Tue, 01 Sep 2026 16:43:03 +0000
From: Francesco Valla <francesco@valla.it>
Date: Tue, 01 Sep 2026 18:42:43 +0200
Subject: [PATCH 2/2] oe-selftest: fitimage: update comments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-kernel-fitimage-cleanup-v1-2-0bbcacf4099c@valla.it>
References: <20260901-kernel-fitimage-cleanup-v1-0-0bbcacf4099c@valla.it>
In-Reply-To: <20260901-kernel-fitimage-cleanup-v1-0-0bbcacf4099c@valla.it>
To: openembedded-core@lists.openembedded.org
Cc: Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153; i=francesco@valla.it;
 h=from:subject:message-id; bh=8IG1oSIbxOK1hVOPx2gilJpohwg4d8JBPl6orDZkw0M=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnTGabNWWUcOuvZL3fNC9FXml3OMPxilj27jL+vzq51p
 Ymd2bpDHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBE6k4y/Pefv658ye9Pu/fP
 PD/h8c9ZB4VlEk233TBJEuVeE/7fdv05RoZzxk27xY9d/7RW9KaKtRizoq2BS66J2o6sDxeqHrQ
 9/88BAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 89dd633fc04670a901b2452a46acdb65
X-AntiAbuse: ID - 89dd633fc04670a901b2452a46acdb65
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x1RZj-0000000CwkK-3qpD-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-8j3v.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 16:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244835

The kenel-fitimage.bbclass has been renamed to kernel-fit-image.bbclass
with the recent changes on FIT image generation. Update the comments
accordingly.

No functional changes.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index ea5f1576d947..840ae0589c9e 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -36,7 +36,7 @@ class BbVarsMockGenKeys:
         return self.bb_vars[var]
 
 class FitImageTestCase(OESelftestTestCase):
-    """Test functions usable for testing kernel-fitimage.bbclass and uboot-sign.bbclass
+    """Test functions usable for testing kernel-fit-image.bbclass and uboot-sign.bbclass
 
     A brief summary showing the structure of a test case:
 
@@ -260,9 +260,7 @@ class FitImageTestCase(OESelftestTestCase):
         function generates only the keys which are really needed, not just two.
         """
 
-        # Define some variables which are usually defined by the kernel-fitimage.bbclass.
-        # But for testing purpose check if the uboot-sign.bbclass is independent from
-        # the kernel-fitimage.bbclass
+        # Define some variables which are usually defined by image-fitimage.conf
         fit_sign_numbits = bb_vars.get('FIT_SIGN_NUMBITS', "2048")
         fit_key_genrsa_args = bb_vars.get('FIT_KEY_GENRSA_ARGS', "-F4")
         fit_key_req_args =  bb_vars.get('FIT_KEY_REQ_ARGS', "-batch -new")
@@ -521,7 +519,7 @@ class FitImageTestCase(OESelftestTestCase):
                 elif line.endswith('{'):
                     its_path.append(line[:-1].strip())
                     its_paths.append(its_path[:])
-                # kernel-fitimage uses signature-1, uboot-sign uses signature
+                # kernel-fit-image uses signature-1, uboot-sign uses signature
                 elif its_path and (its_path[-1] == 'signature-1' or its_path[-1] == 'signature'):
                     itsdotpath = '.'.join(its_path)
                     if not itsdotpath in sigs:
@@ -1160,7 +1158,7 @@ class KernelFitImageBase(FitImageTestCase):
                              (num_signatures, a_comment))
 
 class KernelFitImageRecipeTests(KernelFitImageBase):
-    """Test cases for the kernel-fitimage bbclass"""
+    """Test cases for the kernel-fit-image bbclass"""
 
     def test_fit_image(self):
         """
@@ -2181,7 +2179,7 @@ UBOOT_FIT_HASH_ALG = "sha256"
         """
         Summary:     Check if the device-tree from U-Boot has two public keys
                      for verifying the kernel FIT image created by the
-                     kernel-fitimage.bbclass included.
+                     kernel-fit-image.bbclass included.
                      This test sets: FIT_SIGN_INDIVIDUAL = "1"
         Expected:    There must be two signature nodes. One is required for
                      the individual image nodes, the other is required for the

-- 
2.55.0


