Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53532CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 06:26:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7705.1778221608837526789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 23:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tdc3C9Pf;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso17547575e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 23:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778221607; x=1778826407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WT3HkSSu7vqj//UjkgG5lhICEiNqfBVVRUAYL1at7uY=;
        b=tdc3C9Pf9Mx3eF5jriCnlVZ3mmOo0WJdVjum0MAy/IZDP/bI/9kt6Hrlw6ef7J5F26
         CJehP6M9JRSNQ+cdKvq/EiUxxV9XhxSS3fzhpiiV/4x/Z39rb8SWz0q42jffCwUVTcJE
         iiMYB30fK3mcg7oygU0hff/z74XugHOB27AZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221607; x=1778826407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WT3HkSSu7vqj//UjkgG5lhICEiNqfBVVRUAYL1at7uY=;
        b=odyJT/iwqsqi1hnXdWVSqeM0ZCmF+S+5mJMIhh3e1ZE9ZTimQD/+hx2Ka83Cpcm01S
         QsQ4YVl/yNyzSMN1/zBd3TNFNeB6JCpL3bIdjQw3qpO6cR3Y1/B749Y5HnbRA2GvSZMm
         Jz5X5HQRWP4vjXm4f+z87a5U8n8poWnoLIcURJg16EYofBpRv4ZaIZsARKI4K+xqB0lE
         xDA3DZW6p9s/sEMOhoF/vvhJhRJ2gZVLsWlNuhETLoFkZx4JQ1j7G1zwRSWkbH1RjL6R
         epYS3L9I9zsImgYHidcXAYPVWDGBiVOPjkf/K+8rxYlYapZkmsda1a6vQc5hk0fLmrsk
         k5dg==
X-Gm-Message-State: AOJu0YzHR1JfL6L7hcIm4pWLQWejr/gO02ChXXbqPlTCTD+IdAkGfCel
	RLTTTvZAFInhKYW24jrjb+SY/4zTlmv5YwOXi5qyNBtYScvNdbVb9OCdta04K69M9+hx/B/9Bkr
	2TqSYhnw=
X-Gm-Gg: AeBDiet4e4O4wEpIKL/sxnZJVWWTluRmTMDg4S5ULUEETv9AHKzywtrUeKi+d/NaUIr
	rtXvOQSpnfiz3qFB7J96OLI245U/9pd6zsSY1S7U277Gsi4kyJiRnCx0Wd8fZS3UY8DpF8cENcM
	GlbPfbsW0I3Y11ZDwJc/FuLX8Kaz6mEYlc9yFjDNCeFYttde7otDvvlIpIR+Ymkg7MFmdYVFdZk
	pQWg4pqwXeMUjQISOUFTZe71WRu5peoIsN4uI8nXRY3dEolLb4X/DLXrkw+h2SBJdl5hqHWs3Lh
	+DZacTR5l3gFOI8BG+o6Cmjt/8yXj4aDQz4gvnxoYmmGzCyWfJhf/nsb68zPMFZ9t35WQvOllo1
	Rru9SC7/lL8mF6MNw9hvNcBDFsrkng/fiM3uKrqaGSYrPEQBQ7d+q3OC7xw8KSJOC79Rt6w5May
	HtJMWYQfesu3o2SXOWxFxsVlAa4I4wNxE3nBKcamaIylQJHBSBd9tZn/jPmFQI3jFHAKK9HagKy
	mvExhI4ZPFHAxloy4E/ibTfWPC1HvNANTNQii9jBKEccK3p
X-Received: by 2002:a05:600c:c11c:b0:489:1e8a:90b4 with SMTP id 5b1f17b1804b1-48e51f37212mr126787015e9.21.1778221606923;
        Thu, 07 May 2026 23:26:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68ec5c49sm15202695e9.11.2026.05.07.23.26.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:26:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 8/8] glibc: Fix recipe bug that disabled stack protector
Date: Fri,  8 May 2026 08:26:00 +0200
Message-ID: <7952d214393b6c5230ba115f63b6f6d245a728bc.1778198884.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198884.git.yoann.congal@smile.fr>
References: <cover.1778198884.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 06:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236640

From: Ivan Nestlerode <ivan.nestlerode@sonos.com>

Fixes [YOCTO #16265]

The glibc recipe is supposed to be building with
--enable-stack-protector=strong, but some CACHED_CONFIGVARS values are
actually breaking this, causing glibc to be built with no stack
protector at all.

Remove these CACHED_CONFIGVARS values so that stack protector support is
detected properly in do_configure and then enabled properly during
do_compile.

Full details are here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16265

Signed-off-by: Ivan Nestlerode <ivan.nestlerode@sonos.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43f0602ede37428f3c35cf665bba934b84355240)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index b08a70aa46a..225d0539a01 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -17,9 +17,6 @@ CACHED_CONFIGUREVARS += " \
   libc_cv_slibdir=${base_libdir} \
   libc_cv_rootsbindir=${base_sbindir} \
   libc_cv_localedir=${localedir} \
-  libc_cv_ssp_strong=no \
-  libc_cv_ssp_all=no \
-  libc_cv_ssp=no \
   libc_cv_include_x86_isa_level=no \
 "
 

