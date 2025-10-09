Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C7BCCD194
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:39 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.9202.1760038298428216458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FbuOtnrI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-781001e3846so1304104b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038298; x=1760643098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8M1rihOzb7WeFO74iM8MIIQeT3WMKHWfm0cdjZmfDU=;
        b=FbuOtnrISTx0pIXcQRg1nEiFu6pgm4CD/5sPIzO2dV7P+Qh/M2eLjkmaFz17+rrk+L
         3m4yMwExorbQQPiWCF63H73iX8To/ZlNobqH6iIVoxe9nO/LpiTse1zILd+oDGCzKHCg
         DSb/StuuvDlOd7mr/O3v2xk3abc1pacIrS9XMxEGHxVoSXDde4Fm+wWy5IR9v1xdsbCY
         LFAE5UAFaIzNSk/To4eXcUWevNNUrZykTW4r1Zyn3h84Rz2cas9IhF3BA7XcIo+g+Pp7
         czp5SDm1cuiZnBEVFnoxrDv1NwwaZ2yb1CDk8H+1NmdRUDxn73fUE78zPs0ovmHQpGEi
         uYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038298; x=1760643098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8M1rihOzb7WeFO74iM8MIIQeT3WMKHWfm0cdjZmfDU=;
        b=DR/NHK2yRpqnq3h6GD7RB5qMsLtAHzs0+2sSxA+Zce74496yG3VnRSj4phgrbu+ZZ2
         rzlOBMtmzcQOpyd4mWIHMZsCZ/U0fEnY0wtHGoEo7MoNTZUnLIh/fP5QOTLhMvw4hiA9
         TKIgV53ugGZnrOD89pw3+SUIzvsQWALfGKR2mUuKwG44XuetKx3DTkbeqUFhWLXI1L5C
         yrDD88HjNodSGmAnQswh54i7GDO+TXUwR4AY/kz7k4ru3UYbc0LDiMOYof1aGVnYkaCp
         +EZ3VFXtCgsgGdj0ouMKHy9aVFt75BGeVQO0opZCIfvn13UeY4mr/T/OF2wj5XYCIXRI
         TRMw==
X-Gm-Message-State: AOJu0YyV43lH1g9N8NnFW9Ss4tG8GwgFNaciWFvJW+/octjpscLCp/It
	U0//DF7He4WhyVLSMy741QaPlxPdk+wEuPxD2ORg1H6t63DFQp2Vt6Of1jNlACTZEJZQPBkfkvu
	MZ+wQ
X-Gm-Gg: ASbGncu5UmM5qjhLTZDm2yKyKz8tuL3S7/vgY/HhDD6S9vrQLUCzXQFtwY3dqMkASj0
	e+PlRqoqAcLxQ9CefP64WD+39dnJ5ciNDA65x/JCwy5JgvmfdZUQa9D+7FomtCt9FKG6k2XuU85
	qKgDe6eCN8Vrpp1MiPo80yQakZI/cinS4+rZosQFRU8kiJIevW6taTeSllVCsxJW83XguBpoPSH
	QG9D26czsR5gAVVLzQ14bqDmMzr3SV0lYzS45NgZRHL+WGOCU5nMTWhj+ik/cpH2SGZPTbD+8XW
	m3gboh5qW6n0iOascBdF0OB0+ZQt5xWWHTA2Tbnc8RmF5nf+XGY5ZL6OqbboxJON/47FOr322iG
	jdA2lFmZ31mHOZGydyqgGi3EI0aKa2Jl8glnWZw==
X-Google-Smtp-Source: AGHT+IG1DLLDlov+O6rPvHYIEr9rg9G7mI1UZBq7m39sdTUPapXKLCEH/WWANcS0l8i0zZ5nZqnq7A==
X-Received: by 2002:a05:6a20:9389:b0:2e5:655c:7f93 with SMTP id adf61e73a8af0-32da83dbb59mr11511323637.33.1760038297542;
        Thu, 09 Oct 2025 12:31:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/24] pulseaudio: ignore CVE-2024-11586
Date: Thu,  9 Oct 2025 12:30:57 -0700
Message-ID: <66e45229a9614d33f64167f0259ae1d719839d83.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224632

From: Peter Marko <peter.marko@siemens.com>

As per the linked ticket, this issue is related to an Ubuntu-specific
patch that we don't have.

(From OE-Core rev: dc81fdc6bdf8ab39b7f2fd994d50256430c36558)

(From OE-Core rev: 72e63e44a0c6ad5a408c4dc59a24288c36463439)

Rewritten CVE_STATUS to CVE_CHECK_IGNORE.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 7b9d245c07..58d0040459 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -281,3 +281,6 @@ RDEPENDS:pulseaudio-server += "\
 RDEPENDS:pulseaudio-server += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', \
                                   bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-kit', d), \
                                   '', d)}"
+
+# not-applicable-platform: specific to Ubuntu 16.04
+CVE_CHECK_IGNORE += "CVE-2024-11586"
-- 
2.43.0


