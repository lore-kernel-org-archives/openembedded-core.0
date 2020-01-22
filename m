Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id CF9417FF33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 00:30:49 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d16so5431516wre.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 16:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=pEQfLp0T3RcRh9lSFc5MkxmD+PuUoPqGvOyzBiw+Thc=;
	b=Dq58ctp2iXhhj+BPFkIDYZU5IieM7aHzAiwcZQF72pe0TdIBg+rjmvWWpRt3w3kp5m
	t0D/7ue2BFjT7lB6inoVvXxwVZ3QLzNCoU/25UUAQX97DUtTwRjSblRjea73kSjTvi3f
	1eHH+tlMgy3YF+tRWh1b2tphjdkr5c9Raen0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pEQfLp0T3RcRh9lSFc5MkxmD+PuUoPqGvOyzBiw+Thc=;
	b=jANtnB20/kZ8zeZILorvXiYnba3ac+9IGOp3xXs0kVoA2LllInNQjqvaFNaeHLlcS3
	Wxtda4IJH2yJsYK5JiBc8tuOPtMjRbFy0irI+4nn1c9SGN1/ZWZwgG0f9GI19+WQncCY
	Quo2J+ckR+JI7gM5kWJa9e8NI7DqFDtNoRr+m2eVPUyZDIWL9L+Ql8MHVSOoPAuktW0s
	6Pweqt1CkZ/bzWimkqYz7d2TcWai0di9hyY/u3bUX46NIRy6//Y+3uJnemOrMNTLqfih
	x5Pvix/HZHY3cTLV+dhMNX2oW0Rxr9QKjQw2OCm6dXpJBocMj/uCiRKxe4jY1zxRdiyG
	1hxg==
X-Gm-Message-State: APjAAAXCMStEOJ4Aa40IogDa1nM0OHAIUotyMsGAOqZCVFvjBDxV7gUi
	lit+wfVU1Ui3U0b0j4cGJnbrhLWv1Co=
X-Google-Smtp-Source: APXvYqzRdLpdzvvu01ycLs7F0I2DWXQa4j3dXQrTy3oFViYHRWC8OPK86C5mEERzEIKB5fhVmkqvSA==
X-Received: by 2002:adf:ef0b:: with SMTP id e11mr8108275wro.128.1579653050258; 
	Tue, 21 Jan 2020 16:30:50 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x10sm53211685wrv.60.2020.01.21.16.30.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 16:30:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 00:30:46 +0000
Message-Id: <20200122003047.9889-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122003047.9889-1-richard.purdie@linuxfoundation.org>
References: <20200122003047.9889-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/3] binutils: Install non-alternatives links for nativesdk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jan 2020 00:30:50 -0000
Content-Transfer-Encoding: 8bit

In the SDK we need the plain symlinks and don't use alternative providers.
When these are missing the toolchain can work incorrectly so fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils_2.33.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.33.bb b/meta/recipes-devtools/binutils/binutils_2.33.bb
index c2833b84473..ecdab966581 100644
--- a/meta/recipes-devtools/binutils/binutils_2.33.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.33.bb
@@ -53,5 +53,8 @@ FILES_libbfd = "${libdir}/libbfd-*.so"
 
 SRC_URI_append_class-nativesdk =  "file://nativesdk-relocation.patch"
 
+USE_ALTERNATIVES_FOR_class-nativesdk = ""
+FILES_${PN}_append_class-nativesdk = " ${bindir}"
+
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.20.1


