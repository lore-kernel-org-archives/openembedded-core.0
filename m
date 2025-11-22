Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D78CFC531
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 12:20:40 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8060.1763814029893326751
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 04:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D9KFdrs8;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b72bf7e703fso472765866b.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 04:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763814028; x=1764418828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fx4q/yHGvLUh1GfmQv0qmYYO/ro3Sx3APmPJ466kUC0=;
        b=D9KFdrs8F7Y3lbEfXHjFrERDcgJ8o5oDEFKnfkn04SlLaIEW9qKh/LPtGc+oOpniOL
         GFrMdINnj8BfLJ9K++3ptgXu4fVYy43Asm+zFY94AJJ/T4VC0I3/7y9rql4jsxWjQdWe
         iKJLwnB3sLAzGsQV8SKfC7DNxUFBcJo7YsO6dMT0nVq/YtgD2cYbzoSvgvPHuLk8iAFB
         z/f4Z06S9sH8V3urLVIkDRLrWLkpDlg+HPCe1mXCobYIBY2FDohkR8A9PfbUm2mTh9No
         lu6v7j3bIBUypRCDf7xKBAtR3jrl26bRykGRQ6oEUIU0pQQBGunt1HAFuiEjyPYEOMzQ
         bbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763814028; x=1764418828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fx4q/yHGvLUh1GfmQv0qmYYO/ro3Sx3APmPJ466kUC0=;
        b=lGVHgVq267wv/+hQ3IPsaLsaq9GEu+gqgBcAmEyPMBtNacokjcDKykByNfORVUHN3T
         5FTX72abvIv4+UytvaxBFruRFmoNoI8udEb9pyxupb518H7UoZ9YpgKgDsQZR3KIipQV
         ZgY1GckoV44GpYP0tIKJw/HtakJ4U4LlnxV5KtlFtEXdDVMHi0G6F4W8kCegzP1SmJqo
         Ny4iXs6GC2MaaXi9UnIncM1kVFw2UG3cUCE2omxUAo+CY446aTeRER4TtXIg9ffHwjy2
         ILAXUwZ286Fd+3tR5JOIRrSmzSgUU34WmZwvcDmnfDSt1ymHQRv+FtxWtNZULpfxAb/U
         edkA==
X-Gm-Message-State: AOJu0Ywa/KLqiWpPevSyfW4637pmzcc6uHh0rw7t0yKoydeELzw8HSgj
	+MbkBCuMtnUYr8gVxTw4B47b/XF+4hF8na52/lAXvQF/tWHVOwL22C0/falXSA==
X-Gm-Gg: ASbGncullCiaC7TzXOCeBL6FuVVABdRfkmqZ3La7CYiYDaSTtLHMFV/8NsohT9JvPZB
	Xp0pYTeDbvIaL5P5KI2D4P7NbeVTS+42JQ8mgdVq11FlcSIwaOdrvI3/KcZS/f7z1HzFBDlc+az
	o3eZQt1JmXOwthmi+zrBya0Fl+o4MP1GS3gLH9guS9lTNr1clJKm0E5ChJdhyCsEUHNRJkaDb63
	mAUO2O+dNKqC/rv/Q6KtDYKDetwrVpDmnQruB6tynOfq7r6wYpym73x0AVb7tY6g3b9/UHg4vJq
	QLKrAiEJTr15nI8lygAxplW6Rzbe0M07/hTHoLHUCb03mv0+fWIQNGdUpidW8MVTs5PMzs/4pjF
	9D9wfMOy4V8lS/4ZDPk7jPXytDutdMGG4r3gQV4PNICI1h+6aEQY6U4hXPy19/DjnManCWvtscz
	SHlm3on1F1foi1gNd0GGdC3lWwDviYaiADT5ZhjysEEWvgIqLrNNFhyI/HGZwUxqKpYz6yj3PWx
	oeJ22yegwd5D+/2ONm3YBMiVMo634/7nY/uHeHE3l5fk6rIGao=
X-Google-Smtp-Source: AGHT+IHPmcLKrW9t0wkwS7cLlzXuzIp+GQH+Q/Pf0vjfxxnT6bSep+uh301eXtMmHvK8KTDsjOWeJA==
X-Received: by 2002:a17:907:72c9:b0:b72:9d0b:def4 with SMTP id a640c23a62f3a-b76716fcbaemr636257566b.18.1763814027848;
        Sat, 22 Nov 2025 04:20:27 -0800 (PST)
Received: from peterliu-Precision-5680.atlascopco.group (static-212-247-106-195.cust.tele2.se. [212.247.106.195])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b765504828esm708694066b.64.2025.11.22.04.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 04:20:27 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org,
	peter.kjellerstedt@axis.com,
	Ross.Burton@arm.com,
	richard.purdie@linuxfoundation.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V3 3/3] bash-completion.bbclass: put bash-completion package to PACKAGE_BEFORE_PN
Date: Sat, 22 Nov 2025 13:20:13 +0100
Message-ID: <20251122122013.1960798-4-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122122013.1960798-1-liu.ming50@gmail.com>
References: <20251122122013.1960798-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 12:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226693

It was observed when FILES:${PN} contains "${sysconfdir}" or
"${datadir}", the bash-completion files wont be installed to
bash-completion package.

Fix it by putting bash-completion package to PACKAGE_BEFORE_PN, this
ensures bash-completion package get the files packaged before PN.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes-recipe/bash-completion.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/bash-completion.bbclass b/meta/classes-recipe/bash-completion.bbclass
index b656e76c09..5371d3e625 100644
--- a/meta/classes-recipe/bash-completion.bbclass
+++ b/meta/classes-recipe/bash-completion.bbclass
@@ -6,7 +6,7 @@
 
 DEPENDS:append:class-target = " bash-completion"
 
-PACKAGES += "${PN}-bash-completion"
+PACKAGE_BEFORE_PN += "${PN}-bash-completion"
 
 FILES:${PN}-bash-completion = "${datadir}/bash-completion ${sysconfdir}/bash_completion.d"
 
-- 
2.43.0


