Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id F3AAC71BFC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 00:08:02 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b7so10810224pfi.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2018 16:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GM8x1Wx2/tjCXiRPfSyY7d2ckvSE9m7FfC9sbhLMTsk=;
	b=Fl/1XUZR2Qezgw5F4sRkVrxaFRs+UTPHyQB5kbzgbmQGHh42p3eWZ/lzKDF4997n+L
	Zmh2Ugqr5Cl+JBUJN5W/cOOjhtct5Kj6BqXUVX0vXDsYnyqh8SlVkLSn47uITU6xoKk0
	TwEgN8e8W8m8NyEFusIyKRsTlYPLeCLzsgU0OtcFYRnwGwKJRqpD9aiY/zsQbMIFW6H6
	N9HzEccSkA9h3MdktcHBMe36iVTZs3uyPse2q85ehekuENAmuwpfMg1zczkw2glbVy4h
	ihxri4QmRN9VDocN9lF1riIMJCz1xm0biDEA1WzmC1hFU3Q2AeD/LL3bYrN0NDc+LdJV
	JJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GM8x1Wx2/tjCXiRPfSyY7d2ckvSE9m7FfC9sbhLMTsk=;
	b=CerRRAP1WJPrytgunyYtpSdvXERXpSZZTPouQ1CGz2UhtI9+MK2sQaLyJxhmuSgtLL
	81BU3VzvKHniIVd3LGyYs6C2Qk27UEMwyFqE1u3oILzt2PJNjrfXFAevyTR6Ovz4CwHD
	ufjqNE7LsU7pcfLrPMogqKhXEhuXrRk3eNd4gF0zauLfVym6DFSMT7kBSxwGkOp7X744
	FXvUUm71+o4iLtlYK4+gpNsD0uOY0zZ41rabaKw/i9BLZAS8uUk6Vh8ILqUwgX/JWyuR
	clAONSI7dQdQ50QgP7yzo+vZjPLjN8RM5upuwlpl01Oa5LYimw1SMxSgIdu5otEtk1oW
	YmpA==
X-Gm-Message-State: AA+aEWal72FQ1LyyXqPA1ij8Sq5HelLLAKNavbG8CSz16BKpNaHe6IXJ
	aEtNAdPLOz/g08Dhq/zI0JpG0Yv+fKc=
X-Google-Smtp-Source: AFSGD/UC9mtZFpBSNXDQziSn32NDoDSqMxVHnciXkCUIpE2RY1keUcc0T6Y2HC8loHp6b8AmfHhRHg==
X-Received: by 2002:a63:4b25:: with SMTP id y37mr22948323pga.181.1544054883643;
	Wed, 05 Dec 2018 16:08:03 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5f84])
	by smtp.gmail.com with ESMTPSA id
	t12sm31010641pfi.45.2018.12.05.16.08.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Dec 2018 16:08:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2018 16:07:49 -0800
Message-Id: <20181206000749.28731-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH] libunwind: Enable building static archive on musl
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
X-List-Received-Date: Thu, 06 Dec 2018 00:08:03 -0000
Content-Transfer-Encoding: 8bit

This ensures that we have .a for libunwind on musl targets, this is used
for stack unwinding infra e.g. in rust

Help compiling rust compiler and standard library from meta-rust

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind_1.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libunwind/libunwind_1.2.1.bb b/meta/recipes-support/libunwind/libunwind_1.2.1.bb
index e7fb2b2190..c9239b695e 100644
--- a/meta/recipes-support/libunwind/libunwind_1.2.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.2.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
            "
 
 SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
-EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests "
+EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests --enable-static"
 
 # http://errors.yoctoproject.org/Errors/Details/20487/
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.19.2


