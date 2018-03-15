Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4EC784E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 01:48:54 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id w15-v6so2807110plq.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 18:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zSvYliKnNC1wFmpamWkKWTIYKex2DPVdGqBfT2yTnzw=;
	b=jYIc8wxuUvijDWHZsPK25vGTASw4LN0LHcJukJs2gw/dQCXz4DyllrZ1Z9ilFtzVjB
	XFowhurA5UGntOR2pxhG1uCvuQoWBqOLDdaL+rfZ1yaKn+n6aT5LyWWaRd4QeVsFEi1/
	8nUpnFpsjOiJWR7QOdHQyfIthZTVrFw2vyQCq2tV3Rh2cAW1Bk/9pKf8Tql/v55o6L7M
	iU55P/pc7NBNFgnx5xnVB2mkNvWLk/o1Qrf9N6DBBvuREZkDmYXEkyQSrczINIHAb0v/
	gF/sH+0HGf2YTSYqfdSRgLE+tHZkuj69wkAahcaWQShD2/LdfoEAnF0keeTGn7OBgbaN
	H8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zSvYliKnNC1wFmpamWkKWTIYKex2DPVdGqBfT2yTnzw=;
	b=WEQ6sbPTWfrY9zFDEKiAzRUXZuqYuRqjUMVm457rvNYh0P0TCy93CGN6qB8rmcZFNc
	Ovnfi6CrtJ+N2bpQ5XB1M4EUz/nmnrzpdZBf3b2cqAY514XWtCLuLKYb2Fsp+e9JrRb6
	9+jrn8bvptm3iIH2I52gudz/8YZkVBANlCBA+LD8b2syco0SIh454WRwYZjEbCft9SPN
	bxqtQouI64K4VcZWrx+Ningzs+nzgdnhbXilBPmfMjOOvmXrNeoqx5lHpz7mwKVkJaNE
	cHji11E3UFn4lKebkByiRlAu895NdScWm3vQozyMhMhaFBWs1IezqjVvS8EX4EdJ9/wa
	A+cg==
X-Gm-Message-State: AElRT7ERJWf9gNMOj0lj36KQhJGKvuRBrxX7CUTKUgkmf77fn/CfoKBx
	UxNUCtxHURpE73hG2HfoMAmIWw==
X-Google-Smtp-Source: AG47ELuvwGAefJOctwnGPoVBzEP3knoaClvEn/OTjwr6Ggdq2pc301g4A6NAu/mV7V9YiHCt5+/Byg==
X-Received: by 2002:a17:902:7088:: with SMTP id
	z8-v6mr6129598plk.174.1521078536195; 
	Wed, 14 Mar 2018 18:48:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	y23sm6416308pgv.4.2018.03.14.18.48.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Mar 2018 18:48:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2018 18:48:48 -0700
Message-Id: <20180315014848.14279-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] gcc: Do not use --with-linker-hash-style if LINKER_HASH_STYLE is empty
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
X-List-Received-Date: Thu, 15 Mar 2018 01:48:55 -0000

We allow to set LINKER_HASH_STYLE to be empty so this would fail
since --with-linker-hash-style needs an argument and cant be empty

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
index d56d2c5e06..cc428ad3ef 100644
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
@@ -100,7 +100,7 @@ EXTRA_OECONF_BASE = "\
     --disable-bootstrap \
     --disable-libmudflap \
     --with-system-zlib \
-    --with-linker-hash-style=${LINKER_HASH_STYLE} \
+    ${@['','--with-linker-hash-style=${LINKER_HASH_STYLE}'][d.getVar('LINKER_HASH_STYLE') != '']} \
     --enable-linker-build-id \
     --with-ppl=no \
     --with-cloog=no \
-- 
2.16.2


