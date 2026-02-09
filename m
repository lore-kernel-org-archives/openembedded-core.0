Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DD8EE6B6F
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:37 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43993.1770629373308402085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WyaTJKLb;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so680522f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629371; x=1771234171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNnIEYLIJEJ5PvKTOiEgwU4Yh0nnrlwrSUVHm9oin5M=;
        b=WyaTJKLbgz2o+9T+bvlzUguGR/Csh7sgAUoi8fUDiI/hehb+hN3C8VSG8oXgyf5l/U
         HIZ8FZ2gxPRYm1+njfarc+R7/19FfWWPy0JXg5Y6NldSrPaW0jLt9D2cM10MNrylN+I7
         tixhd43mi/5hAEDM0B9w4ulEV/M2tQtYEsZJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629371; x=1771234171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JNnIEYLIJEJ5PvKTOiEgwU4Yh0nnrlwrSUVHm9oin5M=;
        b=bZgbyCVju39vxNMC7+hduLRo0MCbmLrdwgvDDhqjZCsNQmo4UoiRRO7mpKmTxyDjCC
         aLmAkAwND2l+XZGrOD4zG4xiEJvnsPHPSxvOqLVLgnxmJshRrDRxK5PxqaklopSDj48j
         8+iBkRTA2BFocVyTNn4b0H3GUL+m+dmG3ECi6YlawfoRNZTh45rXwGXo+WjOGNmmCPVX
         U0tfl3lPq8F5ovMFL2FP6eh8ub4GBCgQh2h1wJmCaU3alKoZ0On5GtMOlKqX9QxCHxUz
         lAcvFmShWDzv4wSfs5Y2bRcj819xsIKLw4xuluRWxH1rWZNNyaWIOqRvXlKmnVz+rPVM
         aoPg==
X-Gm-Message-State: AOJu0YxGtNZD2FdFX/6MFW5W93rbzUY4s0X8SK769Qfeoxq4Ko7uUMUS
	/6C0YxhoHtg0u4HyHHin6I+RpzCuQWdj8gqQ2tpZENoJGQx19QoVJ21PFMylh1ccsTWNxaptZe5
	gjKIDT6I=
X-Gm-Gg: AZuq6aKdjheYXcdm0Qn24NwU6ii8FdzFg3ORvLRPCrRrsLwoCb59KmyfAk5IKxJFy1u
	Lwonvwc1F+UBZnS3puHZwtXuctPvX0Sqn/1pgadUU4agC4XaWv7+BQk/u+ib8HjCRtSRBCKCwZn
	E6hGjFaCJagprdVWawW98B5z73BRjZA+p/KFQFGglJaGbWfzRD8aV8/TXHhTOXgfROeqQq8yfyv
	/0NY2cjM9mF026PLQpOu422Cv2wnvNuQCO/F3Pbw+sUzzdGeuIRkMLe6w38RAUsWz7lkdOX4aI9
	5AFLodoY1hiZtyCSnQodIq39kSqtxEQCBnlzd2445NPhEhbsRNvF2Vm9ocG02C4Y3t7qP3a9yWE
	sUfsDuN2TcgTStHFfjrsTmaNj94MMy62Zxo7p2AafYdytnwYrDaNUW7myCdKvys7jA7hNxXes3t
	PwypsYafGHc58u/S1KO/wKgCQ7lqE7cLZpboxUu5MEiHxyFWM/aY5CHemZQFSTAtt9FVpIK4uyo
	4K9btqN2v65vvU=
X-Received: by 2002:a05:6000:2909:b0:435:8d80:1b7e with SMTP id ffacd0b85a97d-43629692057mr14478951f8f.60.1770629371410;
        Mon, 09 Feb 2026 01:29:31 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:30 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/25] zlib: ignore CVE-2026-22184
Date: Mon,  9 Feb 2026 10:28:59 +0100
Message-ID: <52cbace519c5d490a83550d7baa1c0fa200eafcb.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230767

From: Peter Marko <peter.marko@siemens.com>

This is CVE for example tool contrib/untgz.
This is not compiled in Yocto zlib recipe.

This CVE has controversial CVSS3 score of 9.8.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/zlib/zlib_1.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index e6a81ef7898..8ebc6befc2b 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -48,3 +48,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2023-45853] = "not-applicable-config: we don't build minizip"
 CVE_STATUS[CVE-2023-6992] = "cpe-incorrect: this CVE is for cloudflare zlib"
+CVE_STATUS[CVE-2026-22184] = "not-applicable-config: vulnerable file is not compiled"

