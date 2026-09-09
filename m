Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AF8C88E41
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:24 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6450.1788939023119422494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cVAO9bSO;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48436251906so6135869f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939021; x=1789543821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Xmc90mmiqmDMSEaarGy6Bwv+gkxAvH8v8Z+5Gxr1HM=;
        b=cVAO9bSOJzWLzf/96rR6IaA9q9aCe8AMT3VgnRspJXy9uiEY3Y83rOsCQ/ekuiXZrf
         uLhi+b4UdwtRePYXXfGz/thAwtU87Hbk271eRUy+XzT7vuoWGHbX+DXVJmmu5ITnk/eE
         uTrFJTiUttsr3G4oDofoJbCea5vWMG194sI6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939021; x=1789543821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6Xmc90mmiqmDMSEaarGy6Bwv+gkxAvH8v8Z+5Gxr1HM=;
        b=pGLoCmRkJOfQhkru4AeF3bof+5yZh88xeWJSLwWVgSaVMaH5lhk+ZTiCGGPaPcpZR8
         YIZdkSQqapd+9b6e4KR2SDJZ8yhShGid3MBdRomXlCUVbX9Bc4VoNN6aodWq40ysD7fg
         jVIyY5U8CovzwzqhvUlfsPnXWPk2JNEyO/v9S3VEgBXk7PJ/B1DkW7hPsIcV2f5KWs36
         H6355hBpDZBseRfi6yYi7uJ7jC+ucTQLXnhTp5J7RFBh+wx6l7HXhOHdWzorxarznRp4
         Kx25sfenyvvuVic91G7DXuyN2flV1pDCvOnufZCaSv2qPG2afy5P61cDnn8hFWLrvsap
         VvuA==
X-Gm-Message-State: AFuF++kLhsauZbBYeuNaNsDmA2gv0Ny6zN8Qdc0prhnqmpv7Ux+3jLRf
	RLmVm+Rb55UNOAA2PSvdAfgUkuYCXg/h3puXaXkQg0/OxD73Gfp7u3EOHRp3qob07DwSTMY+cQe
	5isHGgKE=
X-Gm-Gg: AYBFou0o0DqaHIWCWGz/Zz7KKI+Hk1n0CR4Kqvsb2bknlPOS0ruYGHNA3tIFBfl9Dj+
	GWMNAtT9ZbGISC1R6+GACbzeSs3pmR3OrVMryKFRa3wPGh/I6JfPDB5Y61k5vbeLS99Yuh9LKKN
	7rssBq+oGVmj3tPHJ5pZ6UKDoCiB3z545WKFqBvf78Et0GGoXeDfoRD4o4QUWDTVkooWUpOKoog
	XISknZNsL0wgGRfsUF5OTLHs04d6pAV/WRR1Gt1wt0LwK7Q26z6Rdq3y8B/ar5TYyIUF1anFWQk
	uZSXMB76YDkgKNdAGPpFWbfWfNuL1EDadswR8jkqLaJamEz5X42ChpfsPA6bdoaGOWvZB0CsvU3
	5lDRqSM6LOgIbCWXVt1KcVyNo8o5jqQrMwMnYMtRk/oQ53D5dk+GmMv4jcn1lz6Mjg8N0sclp0h
	9tqVRbJyaw6x6dzE2obPuIW1vJZ+N3CYgiD711tEm8ErXUs6+DAtO7XFP8tC14lHI4fjbWHjPEg
	PjZ4xhJJaKdqXtypujw94L8mWMsVsyYkiHtIP27pZEKZvVNWFIplL1S9kIL
X-Received: by 2002:a05:6000:41cb:b0:482:f61c:7cdd with SMTP id ffacd0b85a97d-48586e4a6bbmr73222619f8f.4.1788939021249;
        Wed, 09 Sep 2026 00:30:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 38/38] gawk: skip randtest in ptest suite
Date: Wed,  9 Sep 2026 09:29:37 +0200
Message-ID: <4ce10a99a44924dd629fbd79268207b145ccfc62.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245447

From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>

randtest performs autocorrelation analysis on random number sequences
and fails intermittently on overloaded CI/autobuilder systems where
CPU scheduling and floating point conditions vary between runs.

An upstream fix was previously merged (ccabae3036a7) to improve sigma
threshold handling, but the test failed again on qemux86-64-musl-ptest
on 2026-07-21 with 'Tau= 162, Autocorr= 5.15181 sigma'.

The test is inherently unsuitable for shared overloaded build
infrastructure. Skip it, consistent with how 'time' and 'timeout'
are already handled.

[YOCTO #16254]

Signed-off-by: Himani Barde <HimaniRamesh.Barde@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5266eed8f8c2096462da720093aa1556df726098)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/gawk/gawk_5.4.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extended/gawk/gawk_5.4.0.bb
index f44d82b37c5..5be7efad452 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -85,7 +85,10 @@ do_install_ptest() {
 	# https://bugzilla.yoctoproject.org/show_bug.cgi?id=14371
 	rm -f ${D}${PTEST_PATH}/test/time.*
 	rm -f ${D}${PTEST_PATH}/test/timeout.*
-	for t in time timeout; do
+	# randtest is a statistical test that intermittently fails on overloaded systems
+	# https://bugzilla.yoctoproject.org/show_bug.cgi?id=16254
+	rm -f ${D}${PTEST_PATH}/test/randtest.*
+	for t in time timeout randtest; do
 		echo $t >> ${D}${PTEST_PATH}/test/skipped.txt
 	done
 }

