Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECD27FF82
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 07:19:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d16so6044484wre.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 23:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AbTnN+ImbjEWbC2W1+X3+gLXFitvr0/IVe1vTLmL6WA=;
	b=OldWp8E19cY34lry5sMR4MZRRZ6G2yb3dua4bSUu1OJQhu1ELEjK7ZhgY3qGNIRQy2
	3UACXhdYl+hTXlj4wmha3nxOrLvI4N4m2DNZjBepIilJvh8+XoWtFNGS5Bv5qstWzPrC
	NnHuKXmftZ2eeLbsbsqe4NucQVEiTlsg3LqZ9J+++mpadnG+uWyPEL1pvqjxUtFFg1cT
	PP5kUDKclkEhG56XsfktyyAP2nx0igkZCoodmAr8obaMVA1XuFxLuSoVYfJjuuVYpZUq
	02B8vZBhhFmOsuwdkiapYrKvCXrmtcxM/apm0/9Ap4evhWrNFW69ADxz99GmRBPvKKgl
	yYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AbTnN+ImbjEWbC2W1+X3+gLXFitvr0/IVe1vTLmL6WA=;
	b=It1aBYjP/KZZqaxinuKtUBl0ObUwS8YECiscHqRcV3MgKuIRv19HskHDe60RrOXl3i
	zLsN7B6Q7hgKlZXOA176imbUnufjW/h0Y+akbxLiGsaxYkiKymzb6+8IlZQNs65mirYG
	odFmrvutQ2TRCX97AVUiNHpSW+cvckOCdHtmcyMOGh/HPLkHKhLJU4qLHtApe4xHu8c/
	FkgRNN6CtnZ7A0Q0+8ZQUjOEH3HW7PETMH5pJaS+3xq3YTTTztTLOBDhV8wMGytnFyDM
	GhWfYpM8hBP+NiYCH2CW+QaQ8YmVFJsTiESc1Z1F+9vnXJCGnVOSPo8cJ2Y5QMBTgDa8
	8Vaw==
X-Gm-Message-State: APjAAAXNKg4C4AbLWzznhds4a4D1GpNSMlXEfOW86LeWPDBOscn/v8xj
	QRN5FETdh1lwcYWzsg7S8+MsI/em
X-Google-Smtp-Source: APXvYqyB9/9o4CGdzmhH8oMxRxpJxBItQomW3VrOk1dol/5+OaOkZDz8eGY6BFXaXBu8wjxKK/yqOA==
X-Received: by 2002:adf:b60f:: with SMTP id f15mr9824046wre.372.1579677577537; 
	Tue, 21 Jan 2020 23:19:37 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	v3sm55513980wru.32.2020.01.21.23.19.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 23:19:37 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 07:19:34 +0000
Message-Id: <20200122071934.60789-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libxcrypt: Enable static builds
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
X-List-Received-Date: Wed, 22 Jan 2020 07:19:37 -0000

Whilst glibc builds static binaries libxcrypt doesn't, without which we
can't build, for example, a static busybox. Enable static libraries here
so that anyone who needs a static binary using just basic libraries has
one fewer dependencies to track down post libxcrypt being split out of
glibc.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/libxcrypt/libxcrypt.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index accbdd636152..e98d8084470c 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -32,4 +32,6 @@ CFLAGS += "-fcommon"
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
 
+DISABLE_STATIC = ""
+
 BBCLASSEXTEND = "nativesdk"
-- 
2.17.1


