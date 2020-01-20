Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id E20817FC00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:18:27 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id b22so105694pls.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2DTz/inAYMOBOhPjHZfs6uTpopSlKFHIPiUrZ3hAELY=;
	b=maBzyAwo8tn/pRgojpDiyNhie0YT6bnXjKdLFSJq3ReqLANQYZwnTc1macqjRX9g13
	HilBW1TuFe47ljdqD0rj80K6haIvolNYi1D0JHMDyU3bTGIwHLvivS3fw9ARkfckS3qf
	uKC8gIR3Gi6rkb9lLEaX4VkElxJ70+++rli2Wpcsldo9NAjxxztg4ed19nwxlES9+JbX
	pHCIPXdCA2oOxVkUrANTG3lOY7lvU2hz/opH5a2vFw66uK1A0dZ3v/7P17uQ8Co7izjt
	nD/9V3qZYFC+bk2HTqOoATKFAphqZgtea38vpDrYy7bWm5H5Rj5YObVXRc2l/TKIa5jm
	dKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2DTz/inAYMOBOhPjHZfs6uTpopSlKFHIPiUrZ3hAELY=;
	b=UWGlKi2r6xsnafT7pBDIrzCsa9b4bCkWnTRkVhSZnObZI5PYjBZteAO9wybIt3YXXO
	ufpNMVVOxpffrDfA7MxTSUUMgvX6aIxgcWLfPIKFZYFnpVviKdKnXn0PoVlXSVoeq42R
	fHVB9zXcMdX8TZ+TYboF646qbkUSHec2MBGcJRXf3YthDXNWAI01VwHJdaYU4rT9ABO+
	ChhopcZ/o5Zxs69AOCpzpNV8lHev80/lNfL/VHWFMXOif9dQfg6ydNhrOAcUb06VvCp8
	+kX5hpl0UTXNwTbe8Rgy1ss5VUbgMWADgecI9cwFh24n4wpVV80ed7d4hhXIoFBLr9DO
	AGBg==
X-Gm-Message-State: APjAAAWwF27kXoR+sjxrRl7jRJcFae83cCP7iOh9ztXXo6yg6BO4l4NZ
	2MAOQhm5t/CRTir0rbkEE+7dHpCgl3g=
X-Google-Smtp-Source: APXvYqxr74/JM3ACMDNg6HRK9OIq8dPqmnLF/3gzHDgegJjx1XBx3pRKSMSBXWUvVszqSIgdit6qZw==
X-Received: by 2002:a17:90a:cf07:: with SMTP id h7mr709092pju.66.1579540708518;
	Mon, 20 Jan 2020 09:18:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	a69sm41344630pfa.129.2020.01.20.09.18.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:18:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 09:18:26 -0800
Message-Id: <20200120171826.2897762-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] goarch.bbclass: Disable dynamic linking on PPC64 LE
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
X-List-Received-Date: Mon, 20 Jan 2020 17:18:28 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/goarch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 33d1a13acb..1099b95769 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -37,6 +37,7 @@ GO_DYNLINK_aarch64 = "1"
 GO_DYNLINK_x86 = "1"
 GO_DYNLINK_x86-64 = "1"
 GO_DYNLINK_powerpc64 = "1"
+GO_DYNLINK_powerpc64le = "1"
 GO_DYNLINK_class-native = ""
 GO_DYNLINK_class-nativesdk = ""
 
@@ -46,6 +47,7 @@ COMPATIBLE_HOST_linux-gnux32 = "null"
 COMPATIBLE_HOST_linux-muslx32 = "null"
 COMPATIBLE_HOST_powerpc = "null"
 COMPATIBLE_HOST_powerpc64 = "null"
+COMPATIBLE_HOST_powerpc64le = "null"
 COMPATIBLE_HOST_mipsarchn32 = "null"
 
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.25.0


